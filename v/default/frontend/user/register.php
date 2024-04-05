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
 *  Time: 10:28:12
 */
?>
<section class="overflow-hidden pt-[26px] pb-16 md:pb-20 lg:pt-[48px] lg:pb-28">
    <div class="container mx-auto">
        <div class="flex flex-wrap justify-center">
            <div class="w-full px-4">
                <div class="mx-auto max-w-[666px] py-10 px-6 dark:bg-dark sm:p-[30px] border rounded-md bg-dark">
                    <form action="/register-post" method="POST">
                        <h3 class="h3 text-center">
                            <?php __e('Create your account'); ?>
                        </h3>
                        <p class="mb-6 text-center text-base font-medium ">
                            <?php __e('It\'s totally free and super easy'); ?>
                        </p>

                        <?php @__more('frontend.layouts.include.validate-alert', ['validate' => $validate]); ?>
                        <button class="mb-6 flex w-full items-center justify-center rounded-md bg-white p-3 text-base font-medium shadow-one hover:text-primary">
                            <span class="mr-3">
                                <svg width="20" height="20" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g clip-path="url(#clip0_95:967)">
                                        <path d="M20.0001 10.2216C20.0122 9.53416 19.9397 8.84776 19.7844 8.17725H10.2042V11.8883H15.8277C15.7211 12.539 15.4814 13.1618 15.1229 13.7194C14.7644 14.2769 14.2946 14.7577 13.7416 15.1327L13.722 15.257L16.7512 17.5567L16.961 17.5772C18.8883 15.8328 19.9997 13.266 19.9997 10.2216" fill="#4285F4" />
                                        <path d="M10.2042 20.0001C12.9592 20.0001 15.2721 19.1111 16.9616 17.5778L13.7416 15.1332C12.88 15.7223 11.7235 16.1334 10.2042 16.1334C8.91385 16.126 7.65863 15.7206 6.61663 14.9747C5.57464 14.2287 4.79879 13.1802 4.39915 11.9778L4.27957 11.9878L1.12973 14.3766L1.08856 14.4888C1.93689 16.1457 3.23879 17.5387 4.84869 18.512C6.45859 19.4852 8.31301 20.0005 10.2046 20.0001" fill="#34A853" />
                                        <path d="M4.39911 11.9777C4.17592 11.3411 4.06075 10.673 4.05819 9.99996C4.0623 9.32799 4.17322 8.66075 4.38696 8.02225L4.38127 7.88968L1.19282 5.4624L1.08852 5.51101C0.372885 6.90343 0.00012207 8.4408 0.00012207 9.99987C0.00012207 11.5589 0.372885 13.0963 1.08852 14.4887L4.39911 11.9777Z" fill="#FBBC05" />
                                        <path d="M10.2042 3.86663C11.6663 3.84438 13.0804 4.37803 14.1498 5.35558L17.0296 2.59996C15.1826 0.901848 12.7366 -0.0298855 10.2042 -3.6784e-05C8.3126 -0.000477834 6.45819 0.514732 4.8483 1.48798C3.2384 2.46124 1.93649 3.85416 1.08813 5.51101L4.38775 8.02225C4.79132 6.82005 5.56974 5.77231 6.61327 5.02675C7.6568 4.28118 8.91279 3.87541 10.2042 3.86663Z" fill="#EB4335" />
                                    </g>
                                    <defs>
                                        <clipPath id="clip0_95:967">
                                            <rect width="20" height="20" fill="white" />
                                        </clipPath>
                                    </defs>
                                </svg>
                            </span>
                            <?php __e('Sign up with Google'); ?>
                        </button>
                        <div class="mb-5 flex items-center justify-center">
                            <span class="hidden h-[1px] w-full max-w-[60px] sm:block"></span>
                            <p class="w-full px-5 text-center text-base font-medium ">
                                <?php __e('Or, register with your email'); ?>
                            </p>
                            <span class="hidden h-[1px] w-full max-w-[60px] bg-body-color sm:block"></span>
                        </div>
                        <div class="mb-5">
                            <label htmlFor="full_name" class="label">
                                <?php __e('Full name'); ?>
                            </label>
                            <input type="text" name="full_name" placeholder="<?php __e('Enter your full name'); ?>" class="form-control w-full" oninput="this.value=this.value.toLowerCase().split(` `).map((item)=>{console.log(item); return `${item.slice(0,1).toUpperCase()}${item.slice(1)}`}).join(` `)" />
                        </div>
                        <div class="mb-5">
                            <label htmlFor="email" class="label">
                                <?php __e('Email'); ?>
                            </label>
                            <input type="email" name="email" placeholder="<?php __e('Enter your Email'); ?>" class="form-control w-full" />
                        </div>
                        <div class="mb-5 input-password">
                            <label htmlFor="password" class="label">
                                <?php __e('Your password'); ?>
                            </label>

                            <div class="relative">
                                <input type="password" name="password" placeholder="<?php __e('Enter your password'); ?>" class="form-control w-full password" />
                                <div class="absolute inset-y-0 right-0 pr-3 flex items-center text-sm leading-5">
                                    <svg class="h-6 text-gray-700 cursor-pointer eye" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 576 512">
                                        <path fill="currentColor" d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z">
                                        </path>
                                    </svg>

                                    <svg class="h-6 text-gray-700 cursor-pointer eye-slash hidden" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 640 512">
                                        <path fill="currentColor" d="M320 400c-75.85 0-137.25-58.71-142.9-133.11L72.2 185.82c-13.79 17.3-26.48 35.59-36.72 55.59a32.35 32.35 0 0 0 0 29.19C89.71 376.41 197.07 448 320 448c26.91 0 52.87-4 77.89-10.46L346 397.39a144.13 144.13 0 0 1-26 2.61zm313.82 58.1l-110.55-85.44a331.25 331.25 0 0 0 81.25-102.07 32.35 32.35 0 0 0 0-29.19C550.29 135.59 442.93 64 320 64a308.15 308.15 0 0 0-147.32 37.7L45.46 3.37A16 16 0 0 0 23 6.18L3.37 31.45A16 16 0 0 0 6.18 53.9l588.36 454.73a16 16 0 0 0 22.46-2.81l19.64-25.27a16 16 0 0 0-2.82-22.45zm-183.72-142l-39.3-30.38A94.75 94.75 0 0 0 416 256a94.76 94.76 0 0 0-121.31-92.21A47.65 47.65 0 0 1 304 192a46.64 46.64 0 0 1-1.54 10l-73.61-56.89A142.31 142.31 0 0 1 320 112a143.92 143.92 0 0 1 144 144c0 21.63-5.29 41.79-13.9 60.11z">
                                        </path>
                                    </svg>
                                </div>
                            </div>
                        </div>
                        <div class="mb-5 input-password">
                            <label htmlFor="repassword" class="label">
                                <?php __e('Repeat password'); ?>
                            </label>
                            <div class="relative">
                                <input type="password" name="repassword" placeholder="<?php __e('Enter repeat password'); ?>" class="form-control w-full password" />
                                <div class="absolute inset-y-0 right-0 pr-3 flex items-center text-sm leading-5">
                                    <svg class="h-6 text-gray-700 cursor-pointer eye" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 576 512">
                                        <path fill="currentColor" d="M572.52 241.4C518.29 135.59 410.93 64 288 64S57.68 135.64 3.48 241.41a32.35 32.35 0 0 0 0 29.19C57.71 376.41 165.07 448 288 448s230.32-71.64 284.52-177.41a32.35 32.35 0 0 0 0-29.19zM288 400a144 144 0 1 1 144-144 143.93 143.93 0 0 1-144 144zm0-240a95.31 95.31 0 0 0-25.31 3.79 47.85 47.85 0 0 1-66.9 66.9A95.78 95.78 0 1 0 288 160z">
                                        </path>
                                    </svg>

                                    <svg class="h-6 text-gray-700 cursor-pointer eye-slash hidden" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 640 512">
                                        <path fill="currentColor" d="M320 400c-75.85 0-137.25-58.71-142.9-133.11L72.2 185.82c-13.79 17.3-26.48 35.59-36.72 55.59a32.35 32.35 0 0 0 0 29.19C89.71 376.41 197.07 448 320 448c26.91 0 52.87-4 77.89-10.46L346 397.39a144.13 144.13 0 0 1-26 2.61zm313.82 58.1l-110.55-85.44a331.25 331.25 0 0 0 81.25-102.07 32.35 32.35 0 0 0 0-29.19C550.29 135.59 442.93 64 320 64a308.15 308.15 0 0 0-147.32 37.7L45.46 3.37A16 16 0 0 0 23 6.18L3.37 31.45A16 16 0 0 0 6.18 53.9l588.36 454.73a16 16 0 0 0 22.46-2.81l19.64-25.27a16 16 0 0 0-2.82-22.45zm-183.72-142l-39.3-30.38A94.75 94.75 0 0 0 416 256a94.76 94.76 0 0 0-121.31-92.21A47.65 47.65 0 0 1 304 192a46.64 46.64 0 0 1-1.54 10l-73.61-56.89A142.31 142.31 0 0 1 320 112a143.92 143.92 0 0 1 144 144c0 21.63-5.29 41.79-13.9 60.11z">
                                        </path>
                                    </svg>
                                </div>
                            </div>
                        </div>
                        <div class="mb-5 flex">
                            <label htmlFor="checkboxLabel" class="label">
                                <div class="relative">
                                    <input type="checkbox" id="checkboxLabel" class="sr-only" />
                                    <div class="box mr-4 mt-1 flex h-5 w-5 items-center justify-center rounded border dark:border-white dark:border-opacity-10">
                                        <span class="opacity-0">
                                            <svg width="11" height="8" viewBox="0 0 11 8" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M10.0915 0.951972L10.0867 0.946075L10.0813 0.940568C9.90076 0.753564 9.61034 0.753146 9.42927 0.939309L4.16201 6.22962L1.58507 3.63469C1.40401 3.44841 1.11351 3.44879 0.932892 3.63584C0.755703 3.81933 0.755703 4.10875 0.932892 4.29224L0.932878 4.29225L0.934851 4.29424L3.58046 6.95832C3.73676 7.11955 3.94983 7.2 4.1473 7.2C4.36196 7.2 4.55963 7.11773 4.71406 6.9584L10.0468 1.60234C10.2436 1.4199 10.2421 1.1339 10.0915 0.951972ZM4.2327 6.30081L4.2317 6.2998C4.23206 6.30015 4.23237 6.30049 4.23269 6.30082L4.2327 6.30081Z" fill="#3056D3" stroke="#3056D3" strokeWidth="0.4" />
                                            </svg>
                                        </span>
                                    </div>
                                </div>
                                <span>
                                    <?php __e('By creating account means you agree to the'); ?>
                                    <a href="#0" class="hover:underline">
                                        <?php __e('Terms and Conditions'); ?>
                                    </a>
                                    <?php __e(', and our'); ?>
                                    <a href="#0" class="hover:underline">
                                        <?php __e('Privacy Policy'); ?>
                                    </a>
                                </span>
                            </label>
                        </div>
                        <div class="mb-6 text-white">
                            <button type="submit" class="btn w-full">
                                <?php __e('Register'); ?>
                            </button>
                        </div>
                        <p class="text-center text-base font-medium">
                            <?php __e('Already using Startup?'); ?>
                            <a href="/login" class="hover:underline">
                                <?php __e('Login'); ?>
                            </a>
                        </p>
                        <p class="text-center text-base font-medium pt-5">
                            <a href="/" class="hover:underline">
                                <?php __e('Back to home page') ?>
                            </a>
                        </p>
                    </form>
                    <script type="text/javascript">
                        document.addEventListener(`DOMContentLoaded`, () => {
                            if (document.querySelectorAll(`div.input-password`).length) {
                                document.querySelectorAll(`div.input-password`).forEach((input) => {
                                    function eyeClick(item, input, type = `eye`) {
                                        item.onclick = (event) => {
                                            if (type == `eye`) {
                                                input.querySelector(`svg.eye-slash`).classList.remove(`hidden`);
                                                input.querySelector(`svg.eye`).classList.add(`hidden`);
                                                input.querySelector(`input`).setAttribute(`type`, `text`);
                                            } else {
                                                input.querySelector(`svg.eye-slash`).classList.add(`hidden`);
                                                input.querySelector(`svg.eye`).classList.remove(`hidden`);
                                                input.querySelector(`input`).setAttribute(`type`, `password`);
                                            }
                                        }
                                    }
                                    input.querySelectorAll(`svg.eye`).forEach((event) => {
                                        if (event.classList.contains(`eye`)) {
                                            eyeClick(event, input, type = `eye`);
                                        }
                                    });
                                    input.querySelectorAll(`svg.eye-slash`).forEach((event) => {
                                        if (event.classList.contains(`eye-slash`)) {
                                            eyeClick(event, input, type = `eye-slash`);
                                        }
                                    });
                                });
                            }
                        });
                    </script>
                </div>
            </div>
        </div>
    </div>
</section>