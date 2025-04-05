<?php

    //Include contents.php file here
    include('../config/constants.php');
    //1. Get the id of admin to be deleted
    $id = $_GET['id'];

    //2.Create SQL query to delete admin
    $sql = "DELETE FROM tbl_admin WHERE id= $id";

    //Execute the query
    $res = mysqli_query($conn, $sql);

    //check whether the query executed successfully or not
    if($res==true)
    {
        //Query executed successfully and Admin Deleted
        //echo "Admin Deleted";
        //create session variable to display message
        $_SESSION['delete']= "<div class = 'success'>Admin Deleted Successfully.</div>";
        //Redirect to manage admin page
        header('location:' .SITEURL.'admin/manage-admin.php');
    }
    else{
        //Failes to delete Admin
        //echo "Failed to delete Admin";
        $_SESSION['delete']= "<div class ='error'>Failed to Delete Admin. Try Again Later.</div>";
        header('location:' .SITEURL.'admin/manage-admin.php');
    }

    //3.Redirect to manage admin page with message(success/error)


?>