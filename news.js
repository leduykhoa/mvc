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
 *  Date: 2024/04/04
 *  Time: 08:29:10
 */

// node ./news.js

`use strict`;
const fs = require('fs');
const mysql = require('mysql');

function toSlug(str) {
    let from = `ªºÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿØĀāĂăĄąĆćĈĉĊċČčĎďĐđĒēĔĕĖėĘęĚěĜĝĞğĠġĢģĤĥĦħĨĩĪīĬĭĮįİıĲĳĴĵĶķĸĹĺĻļĽľĿŀŁłŃńŅņŇňŉŊŋŌōŎŏŐőŒœŔŕŖŗŘřŚśŜŝŞşŠšŢţŤťŦŧŨũŪūŬŭŮůŰűŲųŴŵŶŷŸŹźŻżŽžſȘșȚț€£OơƯưẦầẰằỀềỒồỜờỪừỲỳẢảẨẩẲẳẺẻỂểỈỉỎỏỔổỞởỦủỬửỶỷẪẫẴẵẼẽỄễỖỗỠỡỮữỸỹẤấẮắẾếỐốỚớỨứẠạẬậẶặẸẹỆệỊịỌọỘộỢợỤụỰựỴỵɑǕǖǗǘǍǎǏǐǑǒǓǔǙǚǛǜ·/_,:;`.split(``);
    let to = `aoAAAAAAACEEEEIIIIDNOOOOOUUUUYTsaaaaaaaceeeeiiiidnoooooouuuuytyOAaAaAaCcCcCcCcDdDdEeEeEeEeEeGgGgGgGgHhHhIiIiIiIiIiIiJjKkkLlLlLlLlLlNnNnNnnNnOoOoOoOoRrRrRrSsSsSsSsTtTtTtUuUuUuUuUuUuWwYyYZzZzZzsSsTtE--oUuAaAaEeOoOoUuYyAaAaAaEeEeIiOoOoOoUuUuYyAaAaEeEeOoOoUuYyAaAaEeOoOoUuAaAaAaEeEeIiOoOoOoUuUuYyaUuUuAaIiOoUuUuUu------`.split(``);

    str = str.toLowerCase();
    // remove simple HTML tags
    str = str.replace(/(<[a-z0-9\-]{1,15}[\s]*>)/gi, ``);
    str = str.replace(/(<\/[a-z0-9\-]{1,15}[\s]*>)/gi, ``);
    str = str.replace(/(<[a-z0-9\-]{1,15}[\s]*\/>)/gi, ``);

    str = str.replace(/^\s+|\s+$/gm, ``); // trim spaces

    for (i = 0; i < from.length; ++i)
        str = str.split(from[i]).join(to[i]);

    // Replace different kind of spaces with dashes
    let spaces = [/(&nbsp;|&#160;|&#32;)/gi, /(&mdash;|&ndash;|&#8209;)/gi,
        /[(_|=|\\|\,|\.|!)]+/gi, /\s/gi];

    for (i = 0; i < from.length; ++i)
        str = str.replace(spaces[i], '-');
    str = str.replace(/-{2,}/g, `-`);

    // remove special chars like &amp;
    str = str.replace(/&[a-z]{2,7};/gi, ``);
    str = str.replace(/&#[0-9]{1,6};/gi, ``);
    str = str.replace(/&#x[0-9a-f]{1,6};/gi, ``);

    str = str.replace(/[^a-z0-9\-]+/gmi, ``); // remove all other stuff
    str = str.replace(/^\-+|\-+$/gm, ``); // trim edges

    return str;
}

const con = mysql.createConnection({
    host: `mvc-docker-mysql`,
    user: `root`,
    password: `1234567`,
    database: `mvc`
});
let fileContent = JSON.parse(fs.readFileSync(
    `./news.json`,
    { encoding: 'utf8' }
))
    .map((item) => {
        return [
            toSlug(item.title),
            item.title,
            item.description,
            item.description,
            item.description,
            item.image || ``,
            item.url || ``
        ]
    })
    ;

console.log(fileContent);
con.connect((err) => {
    if (err) throw err;
    console.log(`Connected`);
    let sql = `INSERT INTO blog_posts (slug, name, description_short, description, content, image, notes) VALUES ?`;

    let dataSave = [];
    fileContent.forEach((item, i) => {
        dataSave.push(item);
        if (i % 1000 === 0 || i == fileContent.length - 1) {
            con.query(sql, [dataSave], (err, result) => {
                if (err) throw err;
            });
            dataSave = [];
        }
        console.log(`process: ${i}`)
    });
    setTimeout(() => {
        process.exit();
    }, 1000);
});