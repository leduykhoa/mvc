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


?>
<!doctype html>
<html class="light" lang="<?php echo PageViewer::get('language.code'); ?>">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <?php @__more('layouts.include.title'); ?>
    <?php @__more('layouts.include.meta'); ?>
    <?php @__more('layouts.include.layouts.include.font'); ?>
    <?php @__more('layouts.include.favicon'); ?>
    <?php @__more('layouts.include.const'); ?>
    <?php @__more('layouts.include.seo'); ?>
    <!--   style   -->
    <?php @__more('layouts.include.style-pre'); ?>
    <?php @__more('layouts.include.style-common'); ?>
    <?php @__more('layouts.include.style'); ?>
    <?php @__more('layouts.include.style-end'); ?>
</head>

<!-- <body class="min-h-screen min-w-full <?php echo PageViewer::get('body.class'); ?> bg-white text-black dark:bg-black dark:text-white"> -->
<body class="min-h-screen min-w-full <?php echo PageViewer::get('body.class'); ?> bg-white text-black dark:bg-black dark:text-white">
    <?php @__more('layouts.include.header'); ?>
    <?= @$content ?>
    <?php @__more('layouts.include.footer'); ?>
    <?php @__more('layouts.include.toolbar-develop'); ?>
    <!--   script   -->
    <?php @__more('layouts.include.script-pre'); ?>
    <?php @__more('layouts.include.script-common'); ?>
    <?php @__more('layouts.include.script'); ?>
    <?php @__more('layouts.include.script-end'); ?>
</body>

</html>