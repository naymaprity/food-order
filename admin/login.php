<?php include ('../config/constants.php');?>

<html>
    <head>
        <title>Login-The Dining Bell</title>
        <link rel="stylesheet" href="../css/admin.css">
    </head>

    <body>

        <div class="login">
            <h1 class="text-center">Login</h1>
            <br>

            <?php
                if(isset($_SESSION['login']))
                {
                    echo $_SESSION['login'];
                    unset ($_SESSION['login']);
                }

                if(isset($_SESSION['no-login-message']))
                {
                    echo $_SESSION['no-login-message'];
                    unset($_SESSION['no-login-message']);
                }
            
            ?>
            <br><br>

            <!--Login Form starts here-->
            <form action="" method="POST" class="text-center">
                Username:
                <input type="text" name="username" placeholder="Enter Username"><br><br>
                
                Password:
                <input type="password" name="password" placeholder="Enter Password"><br><br>

                <input type="submit" name="submit" value="Login" class="btn-primary"><br><br>


            </form>
            <!--Login Form starts here-->


            <p class="text-center">Created By - <a href="www.naymajahanchowdhury.com">Nayma Jahan Chowdhury</a></p>
        </div>

    </body>
</html>

<?php
    //Check whether the submit button is clicked or not
    if(isset($_POST['submit']))
    {
        //Process for login
        //1. Get the Data from Login Form
        $username = $_POST['username'];
        $password = md5($_POST['password']);

        //2.SQL to check whether the user esists or not
        $sql = "SELECT * FROM tbl_admin WHERE username= '$username' AND password= '$password'";

        //3. Execute the query
        $res = mysqli_query($conn, $sql);

        //4. Count rows to check whether the user esists or not
        $count = mysqli_num_rows($res);

        if($count==1)
        {
            //User Available and Login Success
            $_SESSION['login']= "<div class= 'success'>Login Successful.</div>";
            $_SESSION['user'] = $username; //To check the user is logged in or not and logout will unset

            //redirect to home page/dashboard
            header('location:' .SITEURL. 'admin/');
        }
        else{
            //User not Available and Login Failed
            $_SESSION['login']= "<div class= 'error text-center'>Login Failed.<br>Invalid Username or Password</div>";
            //redirect to home page/dashboard
            header('location:' .SITEURL. 'admin/login.php');
        }
    }






?>