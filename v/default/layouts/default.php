<DOCTYPE html>
  <html>

  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="/css/styles.css" rel="stylesheet">
    <title>PHP MVC Skeleton</title>
  </head>

  <body>
    <?= @$content ?>
    <?php

    function convert($size)
    {
      $unit = array('b', 'kb', 'mb', 'gb', 'tb', 'pb');
      return @round($size / pow(1024, ($i = floor(log($size, 1024)))), 2) . ' ' . $unit[$i];
    }
    echo convert(memory_get_usage(true)); // 123 kb
    ?>
  </body>

  </html>