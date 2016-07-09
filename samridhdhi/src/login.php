<!--User Enters the next page after he Clicks on Login Button-->
<?php
    // begin our session 
    session_start();
    // check if the users is already logged in 
    if(isset( $_SESSION['user_id'] ))
    {
        echo 'User is already logged in';
    }
    // check that both the username, password have been submitted 
    if(!isset( $_POST['username'], $_POST['password']))
    {
        echo 'Please enter a valid email and password';
    }
    // check the username is the correct length 
    elseif (strlen( $_POST['username']) > 50 || strlen($_POST['username']) < 3)
    {
        echo 'Incorrect Length for Username';
    }
    // check the password is the correct length 
    elseif (strlen( $_POST['password']) > 20 || strlen($_POST['password']) < 4)
    {
       echo 'Incorrect Length for Password';
    }
    // check the password has only alpha numeric characters 
    elseif (ctype_alnum($_POST['password']) != true)
    {
            // if there is no match 
            echo "Password must be alpha numeric";
    }
    else
    {
        // if we are here the data is valid and we can insert it into database 
        $user = filter_var($_POST['username'], FILTER_SANITIZE_STRING);
        $pwd = filter_var($_POST['password'], FILTER_SANITIZE_STRING);
        // encrypt the password 
        $pwd = sha1( $pwd );
        // connect to database 
        include './include/connection.php';
        try
        {
            $dbh = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
            // set the error mode to excptions 
            $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            // prepare the select statement 
            $sql = "SELECT username,password,role_id FROM user WHERE username = :username AND password = :pwd";
            $stmt = $dbh->prepare($sql);
            // bind the parameters 
            $stmt->bindParam(':username', $user, PDO::PARAM_STR);
            $stmt->bindParam(':pwd', $pwd, PDO::PARAM_STR, 40);
            // execute the prepared statement 
            $stmt->execute();
            // login id is stored in $user_id 
            $user_id = $stmt->fetchColumn(0);
            // role is stored in $rolew 
            $role = $stmt->fetchColumn(1);
            // if we have no result then login Failed 
            if($user_id == false)
            {
                echo 'Login Failed';
            }
            // if we do have a result, all is well         
            else 
            {
                // set the session user_id variable 
                $_SESSION['user_id'] = $user_id;
                if($role == 1)
                {
                    header('Location: localhost:8080/');
                }
                elseif($role == 2)
                {
                    header('Location: localhost:8080/');
                }
                else if($role == 3)
                {
                    header('Location: localhost:8080/');
                }
                else($role == 4)
                {
                    header('Location: localhost:8080/');
                }
            }
        }
        catch(Exception $e)
        {
            // if we are here, something has gone wrong with the database 
            echo "Please try again later";
        }
    }
?>