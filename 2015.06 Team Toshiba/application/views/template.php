<html>
    <title><?=$title?></title>
    <body>
       <!--<script type="text/javascript"><?=$scripts?></script>-->
        <div id="container">
            <div id="login">
               <form action= "http://localhost/MerchantSite/index.php/login/index/process_login" method="post">
                <fieldset>
                <p><input type="text" id="username" placeholder="Username"></p>
                <p><input type="password" id="password" action= "" placeholder="Password"></p>
                <p><input type="submit" id="login" value="Login"></p>
                <?=$message?>
                </fieldset>
                </form>
            </div>
        </div>
    </body>
</html>