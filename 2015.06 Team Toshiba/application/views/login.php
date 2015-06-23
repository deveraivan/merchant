<html>
    <title></title>
    <body>
        <div id="container">
            <div id="login">
               <form action= "<?php echo url::base() ?>login/process_login" method="get">
                <fieldset>
                <p><input type="text" id="username" placeholder="Username"></p>
                <p><input type="password" id="password" placeholder="Password"></p>
                <p><input type="submit" id="login" value="Login"></p>
                </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>