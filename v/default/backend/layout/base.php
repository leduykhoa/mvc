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
 *  Date: 2024/03/16
 *  Time: 08:34:14
 */

use App\Lib\PageViewer;
use App\Lib\Register;

?>
<!doctype html>
<html class="" lang="<?php echo Register::get('language.code'); ?>">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <?php @__more('backend.layout.include.title'); ?>
    <?php @__more('backend.layout.include.meta'); ?>
    <?php @__more('backend.layout.include.layout.include.font'); ?>
    <?php @__more('backend.layout.include.favicon'); ?>
    <?php @__more('backend.layout.include.const'); ?>
    <?php @__more('backend.layout.include.seo'); ?>
    <!--   style   -->
    <?php @__more('backend.layout.include.style-pre'); ?>
    <?php @__more('backend.layout.include.style-common'); ?>
    <?php @__more('backend.layout.include.style'); ?>
    <?php @__more('backend.layout.include.style-end'); ?>
</head>

<body class="min-h-screen min-w-full <?php echo PageViewer::get('body.class'); ?>">
    <?= @$content ?>
    <?php @__more('backend.layout.include.toolbar-develop'); ?>
    <!--   script   -->
    <?php @__more('backend.layout.include.script-pre'); ?>
    <?php @__more('backend.layout.include.script-common'); ?>
    <?php @__more('backend.layout.include.script'); ?>
    <?php @__more('backend.layout.include.script-end'); ?>
</body>

</html>