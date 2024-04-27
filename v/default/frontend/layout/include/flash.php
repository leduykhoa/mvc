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
 *  Date: 2024/04/03
 *  Time: 08:16:36
 */

use App\Lib\Session;

$flashInfo = Session::flash(Session::INFO);
$flashSuccess = Session::flash(Session::SUCCESS);
$flashWarning = Session::flash(Session::WARNING);
$flashError = Session::flash(Session::ERROR);
?>
<?php if (isset($flashInfo) && is_array($flashInfo) && count($flashInfo)) : ?>
    <div class="alert alert-info">
        <?php foreach ($flashInfo as $item) : ?>
            <?php __e($item); ?><br />
        <?php endforeach; ?>
    </div>
<?php endif; ?>
<?php if (isset($flashSuccess) && is_array($flashSuccess) && count($flashSuccess)) : ?>
    <div class="alert alert-success">
        <?php foreach ($flashSuccess as $item) : ?>
            <?php __e($item); ?><br />
        <?php endforeach; ?>
    </div>
<?php endif; ?>
<?php if (isset($flashWarning) && is_array($flashWarning) && count($flashWarning)) : ?>
    <div class="alert alert-warning">
        <?php foreach ($flashWarning as $item) : ?>
            <?php __e($item); ?><br />
        <?php endforeach; ?>
    </div>
<?php endif; ?>
<?php if (isset($flashError) && is_array($flashError) && count($flashError)) : ?>
    <div class="alert alert-error">
        <?php foreach ($flashError as $item) : ?>
            <?php __e($item); ?><br />
        <?php endforeach; ?>
    </div>
<?php endif; ?>