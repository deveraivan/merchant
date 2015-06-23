<html>
    <body>
        <div id="container">
            <div id="login">
                <h1>Mercancia</h1>
                <?php
                    print form::open();
                    echo "<p>";
                    echo "<label>Username: </label>";
                    $data = array
                        (
                            'type'=>'text',
                            'id'=>'username',
                            'placeholder'=>'username'
                        );
                    print form::input($data);
                    echo "</p>";
                    echo "<p>";
                    echo "<label>Password: </label>";
                    $array = array
                        (
                            'type'=>'password',
                            'id'=>'pasword', 
                            'placeholder'=>'password'
                         );
                    print form::input($array);
                    echo "</p>";
                    echo "<p id='remember_me'>";
                    print form::checkbox('remember_me','remember_me_here');
                    print form::label('remember_me','Remember me on this site');
                    echo "</p>";
                    echo "<p id='submit'>";
                    $submit = array
                        (
                            'type'=>'button',
                            'name'=>'commit',
                            'value'=>'Log In'
                        );
                    print form::input($submit);
                    echo "</p>";
                    <?php echo $message?>
                ?>
            </div>
        </div>
    </body>
</html>