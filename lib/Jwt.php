<?php
/*
 *  ............(¯''•.
 *  ..............(¯'•(¯'•............_/)/)
 *  ...............(¯'•.(¯'•.......((.....((
 *  ................(¯''•(¯'•...((.)..(. ' /)
 *  .................(¯''•.(¯'((.)....|\_/
 *  .....,,,~”¯¯¯''¯(_,'(_.)......|
 *  ...(((./...........................)__
 *  ..((((.\......),,...........(...../__'\
 *  ..))))..\ . .//...¯¯¯¯¯¯¯' \.../... / /
 *  .(((...../ .// .............. | ./...../
 *  .))).....| ||.................| |...........♥♥♥
 *  ((........) \.................) \...........\|/
 *  .^^^^.""'"'.^^^^^^^..""".^^^^.""""
 *  ( ͡° ͜ʖ ͡°( ಠ ͜ʖ ಠ ) ͡° ͜ʖ ͡°) ( ͡° ͜ʖ ͡°( ಠ ͜ʖ ಠ ) ͡° ͜ʖ ͡°) ( ͡° ͜ʖ ͡°( ಠ ͜ʖ ಠ ) ͡° ͜ʖ ͡°)
 *  ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦
 *  
 *  Copyright © 2009-2024 Lê Duy Khoa. All rights reserved.
 *  Mail: leduykhoa060690@gmail.com
 *  Skype: leduykhoa060690
 *  Mobile: +84973421508
 *  Website: https://web-fast.com
 *  Telegram: https://t.me/leduykhoa
 *  GitHub: https://github.com/leduykhoa
 *  Date: 2024/05/09
 *  Time: 16:40:25
 */

namespace App\Lib;

class Jwt
{

    const ALGORITHM_DEFAULT = 'HS256';

    private static $instance;

    /**
     * When checking nbf, iat or expiration times,
     * we want to provide some extra leeway time to
     * account for clock skew.
     *
     * @var int
     */
    public static $leeway = 0;

    /**
     * Allow the current timestamp to be specified.
     * Useful for fixing a value within unit testing.
     * Will default to PHP time() value if NULL.
     *
     * @var ?int
     */
    public static $timestamp = NULL;

    /**
     * @var array<string, string[]>
     */
    public static $supportedAlgorithms = [
        'ES384' => ['openssl', 'SHA384'],
        'ES256' => ['openssl', 'SHA256'],
        'ES256K' => ['openssl', 'SHA256'],
        'HS256' => ['hash_hmac', 'SHA256'],
        'HS384' => ['hash_hmac', 'SHA384'],
        'HS512' => ['hash_hmac', 'SHA512'],
        'RS256' => ['openssl', 'SHA256'],
        'RS384' => ['openssl', 'SHA384'],
        'RS512' => ['openssl', 'SHA512'],
        'EdDSA' => ['sodium_crypto', 'EdDSA'],
    ];

    public function __construct()
    {
        try {
            self::getInstance();
        } catch (\Exception $ex) {
            die($ex->getMessage());
        }
    }

    public static function getInstance()
    {
        if (!isset(self::$instance)) {
            try {
                self::$instance = true;
            } catch (\Exception $ex) {
                die($ex->getMessage());
            }
        }
        return self::$instance;
    }

    public static function decode(
        $jwt,
        $key = NULL,
        $headers = NULL
    ) {
        // Validate JWT
        $timestamp = \is_null(self::$timestamp) ? \time() : self::$timestamp;

        if (is_null($key) || $key == '') {
            $key = self::getAppKey();
        }
        if (empty($key)) {
            throw new \Exception('Key may not be empty');
        }
        $tks = \explode('.', $jwt);
        if (\count($tks) !== 3) {
            throw new \Exception('Wrong number of segments');
        }
        list($headB64, $bodyB64, $cryptoB64) = $tks;
        $headerRaw = self::urlSafeB64Decode($headB64);
        if (NULL === ($header = self::jsonDecode($headerRaw))) {
            throw new \Exception('Invalid header encoding');
        }
        if ($headers !== NULL) {
            $headers = $header;
        }
        $payloadRaw = self::urlSafeB64Decode($bodyB64);
        if (NULL === ($payload = self::jsonDecode($payloadRaw))) {
            throw new \Exception('Invalid claims encoding');
        }
        if (\is_array($payload)) {
            // prevent PHP Fatal Error in edge-cases when payload is empty array
            $payload = (object) $payload;
        }
        if (!$payload instanceof \stdClass) {
            throw new \Exception('Payload must be a JSON object');
        }
        $sig = self::urlSafeB64Decode($cryptoB64);
        if (empty($header->alg)) {
            throw new \Exception('Empty algorithm');
        }
        // // Just support hash_hmac type algorithm
        // if ($header->alg != 'hash_hmac') {
        //     throw new \Exception('Algorithm not supported');
        // }
        if (empty(self::$supportedAlgorithms[$header->alg])) {
            throw new \Exception('Algorithm not supported');
        }

        $key = self::getAppKey();

        // // Check the algorithm
        // if (!self::constantTimeEquals(self::$supportedAlgorithms[$header->alg], $header->alg)) {
        //     // See issue #351
        //     throw new \Exception('Incorrect key for this algorithm');
        // }

        if (!self::verify("{$headB64}.{$bodyB64}", $sig, $key, $header->alg)) {
            throw new \Exception('Signature verification failed');
        }

        // Check the nbf if it is defined. This is the time that the
        // token can actually be used. If it's not yet that time, abort.
        if (isset($payload->nbf) && floor($payload->nbf) > ($timestamp + self::$leeway)) {
            throw new \Exception('Cannot handle token with nbf prior to ' . \date(\DateTime::ISO8601, (int) $payload->nbf));
        }

        // Check that this token has been created before 'now'. This prevents
        // using tokens that have been created for later use (and haven't
        // correctly used the nbf claim).
        if (!isset($payload->nbf) && isset($payload->iat) && floor($payload->iat) > ($timestamp + self::$leeway)) {
            throw new \Exception('Cannot handle token with iat prior to ' . \date(\DateTime::ISO8601, (int) $payload->iat));
        }

        // Check if this token has expired.
        if (isset($payload->exp) && ($timestamp - self::$leeway) >= $payload->exp) {
            throw new \Exception('Expired token');
        }

        return $payload;
    }
    public static function encode(
        $payload,
        $key = NULL,
        $alg = NULL,
        $keyId = NULL,
        $header = NULL
    ) {
        if (is_null($payload) || !is_array($payload)) {
            throw new \Exception('Payload not empty');
        }
        if (is_null($key) || $key == '') {
            $key = self::getAppKey();
        }
        if (is_null($alg) || $alg == '') {
            $alg = self::ALGORITHM_DEFAULT;
        }
        if (is_null($header) || !is_array($header)) {
            $header = [];
        }
        $header['typ'] = 'JWT';
        $header['alg'] = $alg;
        if ($keyId !== NULL) {
            $header['kid'] = $keyId;
        }
        $segments = [];
        $segments[] = self::urlSafeB64Encode((string) self::jsonEncode($header));
        $segments[] = self::urlSafeB64Encode((string) self::jsonEncode($payload));
        $signature = \implode('.', $segments);
        $signature = self::signature($signature, $key, $alg);
        $segments[] = self::urlSafeB64Encode((string) $signature);
        return \implode('.', $segments);
    }

    public static function signature(
        $msg,
        $key,
        $alg
    ) {
        if (is_null($key) || $key == '') {
            $key = self::getAppKey();
        }
        if (is_null($alg) || $alg == '') {
            $alg = self::ALGORITHM_DEFAULT;
        }

        if (empty(self::$supportedAlgorithms[$alg])) {
            throw new \Exception('Algorithm not supported');
        }
        list($type, $algorithm) = self::$supportedAlgorithms[$alg];
        // Just support hash_hmac type algorithm
        if ($type != 'hash_hmac') {
            throw new \Exception('Algorithm not supported');
        }
        switch ($type) {
            case 'hash_hmac':
                if (!\is_string($key)) {
                    throw new \Exception('key must be a string when using hmac');
                }
                return \hash_hmac($algorithm, $msg, $key, true);
        }
        throw new \Exception('Algorithm not supported');
    }

    public static function getAppKey()
    {
        return Env::__env('APP_KEY');
    }

    /**
     * Verify a signature with the message, key and method. Not all methods
     * are symmetric, so we must have a separate verify and sign method.
     *
     * @param string $msg         The original message (header and body)
     * @param string $signature   The original signature
     * @param string $key  
     * @param string $alg         The algorithm
     *
     * @return bool
     *
     * @throws \Exception Invalid Algorithm, bad key, or OpenSSL failure
     */
    private static function verify(
        $msg,
        $signature,
        $key,
        $alg
    ) {
        if (is_null($key) || $key == '') {
            $key = self::getAppKey();
        }
        if (is_null($alg) || $alg == '') {
            $alg = self::ALGORITHM_DEFAULT;
        }
        if (empty(self::$supportedAlgorithms[$alg])) {
            throw new \Exception('Algorithm not supported');
        }

        list($type, $algorithm) = self::$supportedAlgorithms[$alg];
        // Just support hash_hmac type algorithm
        if ($type != 'hash_hmac') {
            throw new \Exception('Algorithm not supported');
        }
        switch ($type) {
            case 'hash_hmac':
            default:
                if (!\is_string($key)) {
                    throw new \Exception('key must be a string when using hmac');
                }
                $hash = \hash_hmac($algorithm, $msg, $key, true);
                return self::constantTimeEquals($hash, $signature);
        }
    }

    /**
     * @param string $left  The string of known length to compare against
     * @param string $right The user-supplied string
     * @return bool
     */
    public static function constantTimeEquals($left, $right)
    {
        if (\function_exists('hash_equals')) {
            return \hash_equals($left, $right);
        }
        $len = \min(self::safeStrlen($left), self::safeStrlen($right));

        $status = 0;
        for ($i = 0; $i < $len; $i++) {
            $status |= (\ord($left[$i]) ^ \ord($right[$i]));
        }
        $status |= (self::safeStrlen($left) ^ self::safeStrlen($right));

        return ($status === 0);
    }

    /**
     * Get the number of bytes in cryptographic strings.
     *
     * @param string $str
     * @return int
     */
    private static function safeStrlen($str)
    {
        if (\function_exists('mb_strlen')) {
            return \mb_strlen($str, '8bit');
        }
        return \strlen($str);
    }

    /**
     * Decode a JSON string into a PHP object.
     *
     * @param string $input JSON string
     * @return mixed The decoded JSON string
     * @throws Exception Provided string was invalid JSON
     */
    public static function jsonDecode($input)
    {
        $obj = \json_decode($input, false, 512, \JSON_BIGINT_AS_STRING);

        if ($errno = \json_last_error()) {
            throw new \Exception('jsonDecode error with: ' . $errno);
        } elseif ($obj === NULL && $input !== 'null') {
            throw new \Exception('Null result with non-null input');
        }
        return $obj;
    }

    /**
     * Encode a PHP array into a JSON string.
     *
     * @param array<mixed> $input A PHP array
     * @return string JSON representation of the PHP array
     * @throws Exception Provided object could not be encoded to valid JSON
     */
    public static function jsonEncode($input)
    {
        if (PHP_VERSION_ID >= 50400) {
            $json = \json_encode($input, \JSON_UNESCAPED_SLASHES);
        } else {
            // PHP 5.3 only
            $json = \json_encode($input);
        }
        if ($errno = \json_last_error()) {
            throw new \Exception('jsonEncode error with: ' . $errno);
        } elseif ($json === 'null') {
            throw new \Exception('Null result with non-null input');
        }
        if ($json === false) {
            throw new \Exception('Provided object could not be encoded to valid JSON');
        }
        return $json;
    }

    /**
     * Decode a string with URL-safe Base64.
     *
     * @param string $input A Base64 encoded string
     * @return string A decoded string
     * @throws InvalidArgumentException invalid base64 characters
     */
    public static function urlSafeB64Decode($input)
    {
        return \base64_decode(self::convertBase64UrlToBase64($input));
    }

    /**
     * Convert a string in the base64url (URL-safe Base64) encoding to standard base64.
     * 
     * @param string $input A Base64 encoded string with URL-safe characters (-_ and no padding)
     * @return string A Base64 encoded string with standard characters (+/) and padding (=), when
     * needed.
     *
     * @see https://www.rfc-editor.org/rfc/rfc4648
     */
    public static function convertBase64UrlToBase64($input)
    {
        $remainder = \strlen($input) % 4;
        if ($remainder) {
            $padLen = 4 - $remainder;
            $input .= \str_repeat('=', $padLen);
        }
        return \strtr($input, '-_', '+/');
    }

    /**
     * Encode a string with URL-safe Base64.
     *
     * @param string $input The string you want encoded
     * @return string The base64 encode of what you passed in
     */
    public static function urlSafeB64Encode($input)
    {
        return \str_replace('=', '', \strtr(\base64_encode($input), '+/', '-_'));
    }
}
