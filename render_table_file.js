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
 *  Time: 14:27:25
 */


// node ./render_table_file.js

const fs = require(`fs`);
const pluralize = require(`./pluralize.js`);
const schemaTableFile = `./database/migrations/render_table_file.sql`;
const dateRunTime = new Date();

let data = fs.readFileSync(`./render_table_file.json`);
let tableNumber = 0;
let tableListData = [];
// ===================================================================================================================================
function getZeroForNumber(number, length = 2) {
    return String(number).padStart(length, `0`);
}
function ucFirst(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}
function strToCode(str) {
    str = str.replace(/_/g, ``);
    str = str.split(``).map((item, index) => {
        if (index === 0) {
            return item.toLowerCase();
        } else if (item.charCodeAt() < 91) {
            return `_${item.toLowerCase()}`;
        }
        return item;
    });
    return str.join(``);
}

function pluralNouns(str, type = `table`) {
    let tableNameArray = str.split(`_`);
    tableNameArray[tableNameArray.length - 1] =
        pluralize.plural(tableNameArray[tableNameArray.length - 1]);
    if (type == `table`) {
        return tableNameArray.join(`_`);
    }
    return tableNameArray
        .map((item) => {
            return ucFirst(`${item}`);
        })
        .join(``);
}
// ===================================================================================================================================
let alters = [];
tableListData = JSON.parse(data.toString()).map((item) => {
    const classNameTemp = item.shift().split(`\/\/\/`);
    const tableName = pluralNouns(`${classNameTemp[0]}`);
    const eav = `${classNameTemp[1] ? `${classNameTemp[1]}` : ``}`;
    const type = `${classNameTemp[2] ? `${classNameTemp[2]}` : `__`}`;
    const tableDesc = `${classNameTemp[3] ? `${classNameTemp[3]}` : ``}`;
    let tableFields = item.map((field) => {
        let table;
        field = field.split(`\/\/\/`);
        let fieldName = ((field[0]) ? `${field[0]}` : ``);
        let fieldType = ((field[1]) ? `${field[1]}` : ``);
        let fieldParam = ((field[2] && field[2] != `__`) ? `${field[2]}` : ``);
        let fieldNullable = ((field[3] && (field[3] == `__` || field[3] == `NOT_NULL`)) ? `NOT NULL` : `NULL`);
        let fieldDefaultValue = ((field[4] && field[4] == `__`) ? `` : `DEFAULT ${field[4]}`);
        let fieldMore = ((field[5] && field[5] == `__`) ? `` : `${field[5]}`);
        let fieldDesc = ((field[6] && field[6] == `__`) ? `` : `COMMENT '${field[6]}' `);
        let fieldDescText = ((field[6] && field[6] == `__`) ? `` : `${field[6]}`);
        let fieldMoreText = ``;
        let fieldParamText = `${fieldParam}`;


        if (fieldName == `id` && fieldType == `primary`) {
            return ``;
        } else if (fieldType == `string`) {
            fieldType = `varchar`;
        } else if (fieldType == `uuid`) {
            fieldType = `char`;
            fieldParamText = `(36)`;
        } else if (fieldType == `tinyInteger`) {
            fieldType = `tinyint`;
            fieldParamText = `(1)`;
        } else if (fieldType == `smallInteger`) {
            fieldType = `tinyint`;
            fieldParamText = ``;
        } else if (fieldType == `bigInteger`) {
            fieldType = `bigint`;
            fieldParamText = ``;
        } else if (fieldType == `smallIncrements`) {
            fieldType = `smallint`;
            fieldParamText = ``;
            // fieldMoreText = `${fieldMoreText} PRIMARY AUTO_INCREMENT`;
            alters.push(`ALTER TABLE\`${tableName}\`\n                ADD PRIMARY KEY (\`${fieldName}\`);`);
            alters.push(`ALTER TABLE\`${tableName}\`\n                MODIFY \`${fieldName}\` smallint UNSIGNED NOT NULL AUTO_INCREMENT;`);
        } else if (fieldType == `bigIncrements`) {
            fieldType = `bigint`;
            fieldParamText = ``;
            // fieldMoreText = `${fieldMoreText} PRIMARY AUTO_INCREMENT`;
            alters.push(`ALTER TABLE\`${tableName}\`\n                ADD PRIMARY KEY (\`${fieldName}\`);`);
            alters.push(`ALTER TABLE\`${tableName}\`\n                MODIFY \`${fieldName}\` bigint UNSIGNED NOT NULL AUTO_INCREMENT;`);
        } else if (fieldType == `increments`) {
            fieldType = `int`;
            fieldParamText = ``;
            // fieldMoreText = `${fieldMoreText} PRIMARY AUTO_INCREMENT`;
            alters.push(`ALTER TABLE\`${tableName}\`\n                ADD PRIMARY KEY (\`${fieldName}\`);`);
            alters.push(`ALTER TABLE\`${tableName}\`\n                MODIFY \`${fieldName}\` int UNSIGNED NOT NULL AUTO_INCREMENT;`);
        } else if (fieldType == `enum`) {
            fieldParamText = fieldParam.replace(`[`, `(`).replace(`]`, `)`);
        };

        if (fieldMore.indexOf(`unsigned`) >= 0) {
            fieldParamText = `${fieldParamText} UNSIGNED`;
        };

        if (fieldMore.indexOf(`unique`) >= 0) {
            // fieldParamText = `${fieldParamText} UNIQUE`;
            alters.push(`ALTER TABLE\`${tableName}\`\n                ADD UNIQUE KEY\`${tableName}_${fieldName}_unique\`(\`${fieldName}\`);`);
        };

        return `      \`${fieldName}\` ${fieldType}${fieldParamText} ${fieldNullable} ${fieldDefaultValue} ${fieldMoreText} ${fieldDesc}`;
    });
    tableFields.push(`      \`deleted_at\` timestamp NULL DEFAULT NULL`);
    tableFields.push(`      \`created_at\` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time create'`);
    tableFields.push(`      \`updated_at\` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Time update'`);


    return `CREATE TABLE \`${tableName}\` (\n${tableFields
        .filter((item) => item != ``)
        .join(`,\n`)}\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci  COMMENT='${tableDesc}';`;
});
let dataSave = `
SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";\n\n`;

let dataSaveEnd = `\n\nSET FOREIGN_KEY_CHECKS=1;
COMMIT;`;
// ===================================================================================================================================
fs.writeFile(
    `${schemaTableFile}`,
    `${dataSave} ${tableListData.join(`\n\n`)} \n\n ${alters.join(`\n`)} ${dataSaveEnd}`,
    (err) => {
        if (err) {
            console.log(``);
            console.error(err);
            console.log(``);
        }
    },
);

console.log(`Table: `, tableListData.length);
