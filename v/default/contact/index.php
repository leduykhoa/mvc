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
 *  Date: 2024/03/25
 *  Time: 10:29:59
 */
?>
<section class="overflow-hidden pt-[26px] pb-16 md:pb-20 lg:pt-[48px] lg:pb-28">
    <div class="container mx-auto">
        <div class="flex flex-wrap justify-center">
            <div class="w-full px-4 lg:w-7/12 xl:w-8/12">
                <h2 class="mb-3 text-2xl font-bold text-black dark:text-white sm:text-3xl lg:text-2xl xl:text-3xl">
                    <?php __e('Need Help? Open a Ticket'); ?>
                </h2>
                <p class="mb-12 text-base font-medium ">
                    <?php __e('Our support team will get back to you ASAP via email.'); ?>
                </p>
                <?php @__more('layouts.include.validate-alert', ['validate' => $validate]); ?>
                <form action="/contact" method="POST">
                    <div class="-mx-4 flex flex-wrap">
                        <div class="w-full px-4 md:w-1/2">
                            <div class="mb-5">
                                <label htmlFor="name" class="label">
                                    <?php __e('Your Name'); ?>
                                </label>
                                <input type="text" name="name" placeholder="<?php __e('Enter your name'); ?>" class="form-control w-full" />
                            </div>
                        </div>
                        <div class="w-full px-4 md:w-1/2">
                            <div class="mb-5">
                                <label htmlFor="email" class="label">
                                    <?php __e('Your Email'); ?>
                                </label>
                                <input type="email" name="email" placeholder="<?php __e('Enter your email'); ?>" class="form-control w-full" />
                            </div>
                        </div>
                        <div class="w-full px-4">
                            <div class="mb-5">
                                <label htmlFor="message" class="label">
                                    <?php __e('Your Message'); ?>
                                </label>
                                <textarea name="content" rows={15} placeholder="<?php __e('Enter your message'); ?>" class="form-control w-full"></textarea>
                            </div>
                        </div>
                        <div class="w-full px-4 text-white">
                            <button type="submit" class="btn w-full">
                                <?php __e('Submit Ticket'); ?>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>