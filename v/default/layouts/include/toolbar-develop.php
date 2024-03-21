<?php
/*
 *  ............(¯''•.
 *  ..............(¯'•(¯'•............_/)/)
 *  ...............(¯'•.(¯'•.......((.....((
 *  ................(¯''•(¯'•...((.)..(. ‘ /)
 *  .................(¯''•.(¯'((.)....|\_/
 *  .....,,,~”¯¯¯''¯(_¸´(_.)......|
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
 *  Website: http://web-fast.com
 *  Telegram: https://t.me/leduykhoa
 *  GitHub: https://github.com/leduykhoa
 *  Date: 2024/03/20
 *  Time: 10:03:27
 */

// ===================================================================================================================================
$memory = memory_get_usage(true);
$unit = ['b', 'kb', 'mb', 'gb', 'tb', 'pb'];
$memory =  @round($memory / pow(1024, ($i = floor(log($memory, 1024)))), 2) . ' ' . $unit[$i];
// ===================================================================================================================================
$startTime = Register::get('system_time_start');
$endTime = microtime(true);
$execution = ($endTime - $startTime);
// ===================================================================================================================================
$unit = ['nano', 'micro', 'milli', 'second', 'minute'];
$execution = $execution * 1000;
$execution =  @round($execution / pow(1000, ($i = floor(log($execution, 1000)))), 3) . ' ' . $unit[$i];

?>
<div class="absolute bottom-0 left-0 w-full ">
    <div class="flex w-full flex-nowrap bg-gray-700 text-orange-500">
        <div><label>&nbsp; <?php __e('Memory'); ?></label>: <?php echo $memory; ?></div>
        <div class="ps-2"><label>&nbsp;|&nbsp; <?php __e('Executions'); ?></label>: <?php echo $execution; ?></div>
    </div>
</div>