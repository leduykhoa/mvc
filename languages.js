/**
 *  ............(¯`'•.
 *  ..............(¯'•(¯'•............_/)/)
 *  ...............(¯'•.(¯'•.......((.....((
 *  ................(¯`'•(¯'•...((.)..(. ‘ /)
 *  .................(¯`'•.(¯'((.)....|\_/
 *  .....,,,~”¯¯¯`'¯(_¸´(_.)......|
 *  ...(((./...........................)__
 *  ..((((.\......),,...........(...../__`\
 *  ..))))..\ . .//...¯¯¯¯¯¯¯' \.../... / /
 *  .(((...../ .// .............. | ./...../
 *  .))).....| ||.................| |...........♥♥♥
 *  ((........) \.................) \...........\|/
 *  .^^^^.""'"'.^^^^^^^..""".^^^^.""""
 *  ( ͡° ͜ʖ ͡°( ಠ ͜ʖ ಠ ) ͡° ͜ʖ ͡°) ( ͡° ͜ʖ ͡°( ಠ ͜ʖ ಠ ) ͡° ͜ʖ ͡°) ( ͡° ͜ʖ ͡°( ಠ ͜ʖ ಠ ) ͡° ͜ʖ ͡°)
 *  ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦ ≧◔◡◔≦
 *  
 *  Copyright © 2009-2019 Lê Duy Khoa. All rights reserved.
 *  Mail: leduykhoa060690@gmail.com
 *  Skype: leduykhoa060690
 *  Website: http://web-fast.com
 *  Mobile: +84973421508
 *  Date: 2019/04/07
 *  Time: 05:28
 */

`use strict`;
const fs = require('fs');

new Promise((resolve, reject) => {
  const fileContent = fs.readFileSync(
    `./v/default/languages/languages.csv`,
    { encoding: 'utf8' }
  );
  resolve(fileContent);
})
  .then((result) => {

    try {
      let data = result.split(`\n`).map((item) => {
        return item.split(`,`)
          .map((itemKey, index) => {
            itemKey = itemKey.trim();
            if (itemKey === ``) {
              return ``
            }
            return `"${index}":${itemKey}`;
          })
          .join(`,`);
      })
        .map(item => Object.values(JSON.parse(`{${item.replace(/""/g, `___duplicate_special___`)}}`)));
      //================================================================================================================
      let head;
      let languages = [];
      data.forEach((item, index) => {
        if (index === 0) {
          head = item;
        } else {
          head.forEach((itemKey, indexKey) => {
            if (itemKey !== `key` && item[indexKey] && item[indexKey] !== ``) {
              let languageCurrent = languages.find(itemKeyLanguage => (itemKeyLanguage.language === itemKey));
              let isExist = true;
              if (!languageCurrent) {
                languageCurrent = {
                  language: itemKey,
                  keys: []
                };
                isExist = false;
              }
              languageCurrent.keys.push(`"${item[0].replace(/___duplicate_special___/g, `\\\"`)}":"${item[indexKey].replace(/___duplicate_special___/g, `\\\"`)}"`);

              if (!isExist) {
                languages.push(languageCurrent);
              }
            }
          });
        }
      });
      //================================================================================================================
      languages.forEach((item) => {
        fs.writeFile(`./v/default/languages/${item.language}.json`, `{${item.keys.join(`,`)}}`, (err) => {
          if (err) {
            console.log(``);
            console.error(err);
            console.log(``);
          }
        });
      });
    } catch (err) {
      console.log(``);
      console.log(err);
      console.log(``);
    } finally {
      console.log(``);
      console.log(`Smile :)`);
      console.log(``);
    }
  });
