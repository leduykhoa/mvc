<?php
/*
 *  ............(¯''•.
 *  ..............(¯'•(¯'•............_/)/)
 *  ...............(¯'•.(¯'•.......((.....((
 *  ................(¯''•(¯'•...((.)..(. ' /)
 *  .................(¯''•.(¯'((.)....|\_/
 *  .....,,,~”¯¯¯''¯(_.'(_.)......|
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
 *  Date: 2024/03/28
 *  Time: 08:59:51
 */

//  https://github.com/doctrine/inflector/blob/2.0.x/lib/Doctrine/Inflector/Rules/English/Inflectible.php

class Pluralize
{
    private static $instance;

    private static $pluralRules = [];
    private static $singularRules = [];
    private static $uncountables = [];
    private static $irregularPlurals = [];
    private static $irregularSingles = [];

    public function __construct()
    {
        self::getInstance();
    }

    public static function getInstance()
    {
        if (!isset(self::$instance)) {
            try {
                self::buildIrregularRules();
                self::buildPluralizationRules();
                self::buildSingularizationRules();
                self::buildUncountableRules();
                // echo '<pre>';
                // print_r([self::$uncountables, self::$pluralRules, self::$irregularSingles, self::$irregularPlurals]);
            } catch (\Exception $ex) {
                die($ex->getMessage());
            }
        }
        return self::$instance;
    }

    /**
     * Sanitize a pluralization rule to a usable regular expression.
     *
     * @param  {(RegExp|string)} rule
     * @return {RegExp}
     */
    public static function sanitizeRule($rule)
    {
        if (gettype($rule) === 'string') {
            return $rule;
        }

        return $rule;
    }

    /**
     * Pass in a word token to produce a function that can replicate the case on
     * another word.
     *
     * @param  {string}   word
     * @param  {string}   token
     * @return {Function}
     */
    public static function restoreCase($word, $token)
    {
        // Tokens are an exact match.
        if ($word === $token) return $token;

        // Lower cased words. E.g. "hello".
        if ($word === strtolower($word)) return strtolower($token);

        // Upper cased words. E.g. "WHISKY".
        if ($word === strtoupper($word)) return strtoupper($token);

        // Title cased words. E.g. "Title".
        if (substr($word, 0, 1) === strtoupper(substr($word, 0, 1))) {
            return strtoupper(substr($token, 0, 1)) . strtolower(substr($token, 1, 1));
        }
        // Lower cased words. E.g. "test".
        return strtolower($token);
    }

    /**
     * Todo:
     * Interpolate a regexp string.
     *
     * @param  {string} str
     * @param  {Array}  args
     * @return {string}
     */
    public static function interpolate($str, $args)
    {
        preg_match('/\$(\d{1,2})/g', $str, $matches);
        if (count($matches)) {
        }
        return '';
    }

    /**
     * Todo:
     * Replace a word using a rule.
     *
     * @param  {string} word
     * @param  {Array}  rule
     * @return {string}
     */
    public static function replace($word, $rule)
    {
        return preg_replace($rule[0], $rule[1], $word);
    }

    /**
     * Sanitize a word by passing in the word and sanitization rules.
     *
     * @param  {string}   token
     * @param  {string}   word
     * @param  {Array}    rules
     * @return {string}
     */
    public static function sanitizeWord($token, $word, $rules)
    {
        // Empty string or doesn't need fixing.
        if (!strlen($token) || in_array($token, self::$uncountables)) {
            return $word;
        }

        $len = count($rules);
        // Iterate over the sanitization rules and use the first one to match.
        while ($len--) {
            $rule = $rules[$len];
            preg_match($rule[0], $word, $matches);
            if (count($matches)) {
                return self::replace($word, $rule);
            }
        }

        return $word;
    }


    /**
     * Replace a word with the updated word.
     *
     * @param  {Object}   replaceMap
     * @param  {Object}   keepMap
     * @param  {Array}    rules
     * @return {Function}
     */
    public static function replaceWord($word, $replaceMap, $keepMap, $rules)
    {
        // Get the correct token and case restoration functions.
        $token = strtolower($word);

        // Check against the keep object map.
        if (in_array($token, $keepMap)) {
            return self::restoreCase($word, $token);
        }

        // Check against the replacement map for a direct word replacement.
        if (in_array($token, $replaceMap)) {
            return self::restoreCase($word, $replaceMap[$token]);
        }

        // Run all the rules against the word.
        return self::sanitizeWord($token, $word, $rules);
    }

    /**
     * Pluralize a word.
     *
     * @type {Function}
     */
    public static function plural($word)
    {
        // self::getInstance();
        return self::replaceWord($word, self::$irregularSingles, self::$irregularPlurals, self::$pluralRules);
    }


    /**
     * Add a pluralization rule to the collection.
     *
     * @param {(string|RegExp)} rule
     * @param {string}          replacement
     */
    public static function addPluralRule($rule, $replacement)
    {
        array_push(self::$pluralRules, [self::sanitizeRule($rule), $replacement]);
    }

    /**
     * Add a singularization rule to the collection.
     *
     * @param {(string|RegExp)} rule
     * @param {string}          replacement
     */
    public static function addSingularRule($rule, $replacement)
    {
        array_push(self::$singularRules, [self::sanitizeRule($rule), $replacement]);
    }

    /**
     * Add an uncountable word rule.
     *
     * @param {(string|RegExp)} word
     */
    public static function addUncountableRule($word)
    {
        if (gettype($word) === 'string') {
            self::$uncountables[strtolower($word)] = strtolower($word);
            return;
        }

        // Set singular and plural references for the word.
        self::addPluralRule($word, '$0');
        self::addSingularRule($word, '$0');
    }

    /**
     * Add an irregular word definition.
     *
     * @param {string} single
     * @param {string} plural
     */
    public static function addIrregularRule($single, $plural)
    {
        $plural = strtolower($plural);
        $single = strtolower($single);

        self::$irregularSingles[$single] = $plural;
        self::$irregularPlurals[$plural] = $single;
    }

    public static function buildIrregularRules()
    {
        /**
         * Irregular rules.
         */
        $irregularRules = [
            // Pronouns.
            ['I', 'we'],
            ['me', 'us'],
            ['he', 'they'],
            ['she', 'they'],
            ['them', 'them'],
            ['myself', 'ourselves'],
            ['yourself', 'yourselves'],
            ['itself', 'themselves'],
            ['herself', 'themselves'],
            ['himself', 'themselves'],
            ['themself', 'themselves'],
            ['is', 'are'],
            ['was', 'were'],
            ['has', 'have'],
            ['this', 'these'],
            ['that', 'those'],
            ['my', 'our'],
            ['its', 'their'],
            ['his', 'their'],
            ['her', 'their'],
            // Words ending in with a consonant and `o`.
            ['echo', 'echoes'],
            ['dingo', 'dingoes'],
            ['volcano', 'volcanoes'],
            ['tornado', 'tornadoes'],
            ['torpedo', 'torpedoes'],
            // Ends with `us`.
            ['genus', 'genera'],
            ['viscus', 'viscera'],
            // Ends with `ma`.
            ['stigma', 'stigmata'],
            ['stoma', 'stomata'],
            ['dogma', 'dogmata'],
            ['lemma', 'lemmata'],
            ['schema', 'schemata'],
            ['anathema', 'anathemata'],
            // Other irregular rules.
            ['ox', 'oxen'],
            ['axe', 'axes'],
            ['die', 'dice'],
            ['yes', 'yeses'],
            ['foot', 'feet'],
            ['eave', 'eaves'],
            ['goose', 'geese'],
            ['tooth', 'teeth'],
            ['quiz', 'quizzes'],
            ['human', 'humans'],
            ['proof', 'proofs'],
            ['carve', 'carves'],
            ['valve', 'valves'],
            ['looey', 'looies'],
            ['thief', 'thieves'],
            ['groove', 'grooves'],
            ['pickaxe', 'pickaxes'],
            ['passerby', 'passersby'],
            ['canvas', 'canvases']
        ];

        foreach ($irregularRules as $rule) {
            self::addIrregularRule($rule[0], $rule[1]);
        }
    }

    public static function buildPluralizationRules()
    {
        /**
         * Pluralization rules.
         */
        $pluralizationRules = [
            ['/[^\u0000-\u007F]$/i', '$0'],
            ['/([^aeiou]ese)$/i', '$1'],
            ['/(ax|test)is$/i', '$1es'],
            ['/(alias|[^aou]us|t[lm]as|gas|ris)$/i', '$1es'],
            ['/(e[mn]u)s?$/i', '$1s'],
            ['/([^l]ias|[aeiou]las|[ejzr]as|[iu]am)$/i', '$1'],
            ['/(alumn|syllab|vir|radi|nucle|fung|cact|stimul|termin|bacill|foc|uter|loc|strat)(?:us|i)$/i', '$1i'],
            ['/(alumn|alg|vertebr)(?:a|ae)$/i', '$1ae'],
            ['/(seraph|cherub)(?:im)?$/i', '$1im'],
            ['/(her|at|gr)o$/i', '$1oes'],
            ['/(agend|addend|millenni|dat|extrem|bacteri|desiderat|strat|candelabr|errat|ov|symposi|curricul|automat|quor)(?:a|um)$/i', '$1a'],
            ['/(apheli|hyperbat|periheli|asyndet|noumen|phenomen|criteri|organ|prolegomen|hedr|automat)(?:a|on)$/i', '$1a'],
            ['/sis$/i', 'ses'],
            ['/(?:(kni|wi|li)fe|(ar|l|ea|eo|oa|hoo)f)$/i', '$1$2ves'],
            ['/([^aeiouy]|qu)y$/i', '$1ies'],
            ['/([^ch][ieo][ln])ey$/i', '$1ies'],
            ['/(x|ch|ss|sh|zz)$/i', '$1es'],
            ['/(matr|cod|mur|sil|vert|ind|append)(?:ix|ex)$/i', '$1ices'],
            ['/\b((?:tit)?m|l)(?:ice|ouse)$/i', '$1ice'],
            ['/(pe)(?:rson|ople)$/i', '$1ople'],
            ['/(child)(?:ren)?$/i', '$1ren'],
            ['/eaux$/i', '$0'],
            ['/m[ae]n$/i', 'men'],
            ['/thou/i', 'you'],
            ['/s$/i', 's'],
            ['/^$/i', ''],
            ['/s?$/i', 's'],
        ];

        foreach ($pluralizationRules as $rule) {
            self::addPluralRule($rule[0], $rule[1]);
        }
    }

    public static function buildSingularizationRules()
    {
        /**
         * Singularization rules.
         */
        $singularizationRules = [
            ['/(ss)$/i', '$1'],
            ['/(wi|kni|(?:after|half|high|low|mid|non|night|[^\w]|^)li)ves$/i', '$1fe'],
            ['/(ar|(?:wo|[ae])l|[eo][ao])ves$/i', '$1f'],
            ['/ies$/i', 'y'],
            ['/(dg|ss|ois|lk|ok|wn|mb|th|ch|ec|oal|is|ck|ix|sser|ts|wb)ies$/i', '$1ie'],
            ['/\b(l|(?:neck|cross|hog|aun)?t|coll|faer|food|gen|goon|group|hipp|junk|vegg|(?:pork)?p|charl|calor|cut)ies$/i', '$1ie'],
            ['/\b(mon|smil)ies$/i', '$1ey'],
            ['/\b((?:tit)?m|l)ice$/i', '$1ouse'],
            ['/(seraph|cherub)im$/i', '$1'],
            ['/(x|ch|ss|sh|zz|tto|go|cho|alias|[^aou]us|t[lm]as|gas|(?:her|at|gr)o|[aeiou]ris)(?:es)?$/i', '$1'],
            ['/(analy|diagno|parenthe|progno|synop|the|empha|cri|ne)(?:sis|ses)$/i', '$1sis'],
            ['/(movie|twelve|abuse|e[mn]u)s$/i', '$1'],
            ['/(test)(?:is|es)$/i', '$1is'],
            ['/(alumn|syllab|vir|radi|nucle|fung|cact|stimul|termin|bacill|foc|uter|loc|strat)(?:us|i)$/i', '$1us'],
            ['/(agend|addend|millenni|dat|extrem|bacteri|desiderat|strat|candelabr|errat|ov|symposi|curricul|quor)a$/i', '$1um'],
            ['/(apheli|hyperbat|periheli|asyndet|noumen|phenomen|criteri|organ|prolegomen|hedr|automat)a$/i', '$1on'],
            ['/(alumn|alg|vertebr)ae$/i', '$1a'],
            ['/(cod|mur|sil|vert|ind)ices$/i', '$1ex'],
            ['/(matr|append)ices$/i', '$1ix'],
            ['/(pe)(rson|ople)$/i', '$1rson'],
            ['/(child)ren$/i', '$1'],
            ['/(eau)x?$/i', '$1'],
            ['/men$/i', 'man'],
            ['/s$/i', '']
        ];

        foreach ($singularizationRules as $rule) {
            self::addSingularRule($rule[0], $rule[1]);
        }
    }

    public static function buildUncountableRules()
    {
        /**
         * Uncountable rules.
         */
        $uncountableRules = [
            // Singular words with no plurals.
            'adulthood',
            'advice',
            'agenda',
            'aid',
            'aircraft',
            'alcohol',
            'ammo',
            'analytics',
            'anime',
            'athletics',
            'audio',
            'bison',
            'blood',
            'bream',
            'buffalo',
            'butter',
            'carp',
            'cash',
            'chassis',
            'chess',
            'clothing',
            'cod',
            'commerce',
            'cooperation',
            'corps',
            'debris',
            'diabetes',
            'digestion',
            'elk',
            'energy',
            'equipment',
            'excretion',
            'expertise',
            'firmware',
            'flounder',
            'fun',
            'gallows',
            'garbage',
            'graffiti',
            'hardware',
            'headquarters',
            'health',
            'herpes',
            'highjinks',
            'homework',
            'housework',
            'information',
            'jeans',
            'justice',
            'kudos',
            'labour',
            'literature',
            'machinery',
            'mackerel',
            'mail',
            'media',
            'mews',
            'moose',
            'music',
            'mud',
            'manga',
            'news',
            'only',
            'personnel',
            'pike',
            'plankton',
            'pliers',
            'police',
            'pollution',
            'premises',
            'rain',
            'research',
            'rice',
            'salmon',
            'scissors',
            'series',
            'sewage',
            'shambles',
            'shrimp',
            'software',
            'staff',
            'swine',
            'tennis',
            'traffic',
            'transportation',
            'trout',
            'tuna',
            'wealth',
            'welfare',
            'whiting',
            'wildebeest',
            'wildlife',
            'you',
            '/pok[eé]mon$/i',
            // Regexes.
            '/[^aeiou]ese$/i', // "chinese", "japanese"
            '/deer$/i', // "deer", "reindeer"
            '/fish$/i', // "fish", "blowfish", "angelfish"
            '/measles$/i',
            '/o[iu]s$/i', // "carnivorous"
            '/pox$/i', // "chickpox", "smallpox"
            '/sheep$/i'
        ];

        foreach ($uncountableRules as $rule) {
            self::addUncountableRule($rule);
        }
    }
}
