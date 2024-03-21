<!doctype html>
<html class="" lang="<?php echo PageViewer::get('language.code'); ?>">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <?php @__more('layouts.include.title'); ?>
    <?php @__more('layouts.include.meta'); ?>
    <?php @__more('layouts.include.layouts.include.font'); ?>
    <?php @__more('layouts.include.favicon'); ?>
    <?php @__more('layouts.include.const'); ?>
    <?php @__more('layouts.include.seo'); ?>
    <!--   style   -->
    <?php @__more('layouts.include.style-pre'); ?>
    <?php @__more('layouts.include.style-common'); ?>
    <?php @__more('layouts.include.style'); ?>
    <?php @__more('layouts.include.style-end'); ?>
</head>

<body class="min-h-screen min-w-full <?php echo PageViewer::get('body.class'); ?>">
    <?= @$content ?>
    <?php @__more('layouts.include.toolbar-develop'); ?>
    <!--   script   -->
    <?php @__more('layouts.include.script-pre'); ?>
    <?php @__more('layouts.include.script-common'); ?>
    <?php @__more('layouts.include.script'); ?>
    <?php @__more('layouts.include.script-end'); ?>
</body>

</html>