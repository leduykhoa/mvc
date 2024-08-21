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
 *  Date: 2024/08/12
 *  Time: 09:34:06
 */

?>
<div>
  <?php foreach ($enterprises as $enterprise) : ?>
    <div class="py-2 mt-2 border border-b flex">
      <div class="flex-none w-14">
        <?php if (isset($enterprise->image) && $enterprise->image != '') : ?>
          <a href="/enterprise/detail/<?php echo $enterprise->id; ?>">
            <img class="px-2" src="<?php echo $enterprise->image; ?>" alt="<?php echo $enterprise->name; ?>" />
          </a>
        <?php endif ?>
      </div>
      <div class="flex-1">
        <a class="font-bold" href="/enterprise/detail/<?php echo $enterprise->id; ?>">
          <?php echo $enterprise->name; ?>
        </a>
        <br />
        <?php $items = explode("\n=====\n", $enterprise->description); ?>
        <?php foreach ($items as $item): ?>
          <?php $lines = explode("///", $item); ?>
          <?php if (count($lines) > 1): ?>
            <strong><?php __e($lines[0]); ?></strong>
            <?php __e($lines[1]); ?>
          <?php else: ?>
            <?php __e($lines[0]); ?>
          <?php endif ?>
          <br />
          <br />
        <?php endforeach ?>
      </div>
    </div>
  <?php endforeach ?>
</div>