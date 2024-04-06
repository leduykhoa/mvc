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
 *  Date: 2024/03/22
 *  Time: 06:19:08
 */

use App\Lib\Register;

?>
<header>
    <div class="container mx-auto">
        <nav class="w-full">
            <div class="flex flex-wrap items-center justify-between py-2 md:py-0 gap-0 relative">
                <div class="relative z-20 w-full flex justify-between lg:w-max md:px-0">
                    <a href="/" class="flex space-x-2 items-center">
                        <img class="m-3" src="/images/logo.png" alt="<?php echo Register::get('app.name'); ?>" width="60" />
                    </a>
                    <div class="relative flex items-center lg:hidden max-h-10">
                        <label role="button" for="toggle_nav" aria-label="humburger" id="hamburger" class="relative  p-6 -mr-6">
                            <div aria-hidden="true" id="line" class="m-auto h-0.5 w-5 rounded bg-sky-900 dark:bg-gray-300 transition duration-300"></div>
                            <div aria-hidden="true" id="line2" class="m-auto mt-2 h-0.5 w-5 rounded bg-sky-900 dark:bg-gray-300 transition duration-300"></div>
                        </label>
                    </div>
                </div>
                <div aria-hidden="true" class="fixed z-10 inset-0 h-screen w-screen bg-white/70 backdrop-blur-2xl origin-bottom scale-y-0 transition duration-500 peer-checked:origin-top peer-checked:scale-y-100 lg:hidden dark:bg-gray-900/70"></div>
                <div class="flex-col">
                    <div class="text-gray-600 dark:text-gray-300 lg:pr-4 lg:w-auto w-full lg:pt-0">
                        <ul class="tracking-wide font-medium lg:text-sm flex-col flex lg:flex-row gap-6 lg:gap-0">
                            <li>
                                <a href="/about" class="block md:px-4 transition hover:text-primary">
                                    <span><?php __e('About'); ?></span>
                                </a>
                            </li>
                            <li>
                                <a href="/contact" class="block md:px-4 transition hover:text-primary">
                                    <span><?php __e('Contact'); ?></span>
                                </a>
                            </li>
                            <li>
                                <a href="/posts" class="block md:px-4 transition hover:text-primary">
                                    <span><?php __e('Blog'); ?></span>
                                </a>
                            </li>
                            <li>
                                <a href="/register" class="block md:px-4 transition hover:text-primary">
                                    <span><?php __e('Register'); ?></span>
                                </a>
                            </li>
                            <li>
                                <a href="/login" class="block md:px-4 transition hover:text-primary">
                                    <span><?php __e('Login'); ?></span>
                                </a>
                            </li>
                            <li>
                                <div aria-hidden="true" class="flex space-x-1">
                                    <div class="h-4 w-4 rounded-full bg-gray-900 dark:bg-white"></div>
                                    <div class="h-6 w-2 bg-primary"></div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </div>
    <hr />
</header>