<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title><?php echo html::specialchars($title) ?></title>
    <?=$styles?>
    <?=$scripts?>   
</head>
<body>
    <?=View::factory("includes/header")->render(true)?>
    <?=View::factory("includes/menu")->render(true)?>
    <?=View::factory("includes/left-navigation")->render(true)?>
    <?php echo $content ?>
    <?=View::factory("includes/footer")->render(true)?>
</body>
</html>