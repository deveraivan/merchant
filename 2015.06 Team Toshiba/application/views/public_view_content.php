<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

  </head>
  
  <?php echo html::stylesheet(array
        (
        'media/css/signin',
        'media/bootstrap/dist/css/bootstrap.min',
        'media/scripts/jquery-1.11.3.min',
        'media/scripts/script',
        ),
        array
        (
        'screen',
        ));
     ?>
<body>
	<?php echo $body;?>
</body>
</html>