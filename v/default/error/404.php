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
 *  Date: 2024/03/16
 *  Time: 08:27:46
 */
?>
<style>
    #notfound .notfound {
        position: absolute;
        left: 50%;
        top: 50%;
        -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%)
    }

    .notfound {
        max-width: 520px;
        width: 100%;
        line-height: 1.4;
        text-align: center
    }

    .notfound .notfound-404 {
        position: relative;
        height: 240px
    }

    .notfound .notfound-404 h1 {
        font-family: montserrat, sans-serif;
        position: absolute;
        left: 50%;
        top: 50%;
        -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        font-size: 252px;
        font-weight: 900;
        margin: 0;
        color: #262626;
        text-transform: uppercase;
        letter-spacing: -40px;
        margin-left: -20px
    }

    .notfound .notfound-404 h1>span {
        text-shadow: -8px 0 0 #fff
    }

    .notfound .notfound-404 h3 {
        font-family: cabin, sans-serif;
        position: relative;
        font-size: 16px;
        font-weight: 700;
        text-transform: uppercase;
        color: #262626;
        margin: 0;
        letter-spacing: 3px;
        padding-left: 6px
    }

    .notfound h2 {
        font-family: cabin, sans-serif;
        font-size: 20px;
        font-weight: 400;
        text-transform: uppercase;
        color: #000;
        margin-top: 0;
        margin-bottom: 25px
    }

    @media only screen and (max-width: 767px) {
        .notfound .notfound-404 {
            height: 200px
        }

        .notfound .notfound-404 h1 {
            font-size: 200px
        }
    }

    @media only screen and (max-width: 480px) {
        .notfound .notfound-404 {
            height: 162px
        }

        .notfound .notfound-404 h1 {
            font-size: 162px;
            height: 150px;
            line-height: 162px
        }

        .notfound h2 {
            font-size: 16px
        }
    }
</style>
<div class="container py-2" style="min-height: 90vh">
    <div id="notfound">
        <div class="notfound">
            <div class="notfound-404">
                <h3><?php __e('Xin lỗi, trang bạn tìm không thấy') ?></h3>
                <h1><span>4</span><span>0</span><span>4</span></h1>
            </div>
            <h2><?php __e('Trang bạn đang tìm dường như đã được di chuyển, đã bị xóa hoặc không tồn tại.') ?></h2>

            <div class="text-center">
                <a class="btn btn-link" href="/">
                    <?php __e('Back to home page') ?>
                </a>
            </div>
        </div>
    </div>
</div>