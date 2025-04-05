<?php
    //Include constants page
    include('../config/constants.php');
    //echo "Delete Food page";
    if(isset($_GET['id']) && isset($_GET['image_name']))
    {
        //Process to delete
        //echo "Process to delete";
        //1. Get id and image name
        $id=$_GET['id'];
        $image_name=$_GET['image_name'];

        //2.Remove the image if available
        //Check whether the image is available or not and delete only if available
        if($image_name !="")
        {
            //It has image and need to remove from folder
            //Get the image path
            $path= "../images/food/".$image_name;

            //remove image file from folder
            $remove=unlink($path);

            //Check whether the image is removed or not
            if($remove==false)
            {
                //Failed to remove image
                $_SESSION['upload']= "<div class ='error'>Failed to Remove image file.</div>";
                //Redirect to manage food
                header('location:' .SITEURL. 'admin/manage-food.php');
                //Stop the process 
                die();
            }
            
        }
        //3.Delete food from database
        $sql="DELETE FROM tbl_food WHERE id=$id";
        //Execute the query
        $res=mysqli_query($conn, $sql);

        //Check whether the query execute or not and set the session message respectively
        //Redirect to manage food with session message
        if($res==true)
        {
            //Food deleted
            $_SESSION['delete']= "<div class ='success'>Food Deleted Successfully.</div>";
            header('location:'.SITEURL. 'admin/manage-food.php');
        }
        else
        {
            //Failed to delete food
            $_SESSION['delete']= "<div class ='error'>Failed to delete food.</div>";
            header('location:'.SITEURL. 'admin/manage-food.php');
        }
        
    }
    else
    {
        //Reedirect to manage food page
        //echo "Redirect";
        $_SESSION['unauthorize']="<div class='error'>Unauthorized Access.</div>";
        header('location:'.SITEURL.'admin/manage-food.php');
    }


?>