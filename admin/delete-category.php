<?php
    //Include Constants File
    include('../config/constants.php');

    //echo "Delete Page";
    //Check whether the id and image_name value is set or not
    if(isset($_GET['id']) AND isset($_GET['image_name']))
    {
        //Get the value and Delete
        //echo "Get Value and Delete";
        $id = $_GET['id'];
        $image_name = $_GET['image_name'];

        //Remove the physical image file is available
        if($image_name != "")
        {
            //Image is available. So remove it
            $path = "../images/category/".$image_name;
            //Remove the Image
            $remove = unlink($path);
            //If failed to remove image then add an error message and stop the process
            if($remove==false)
            {
                //Set the session message
                $_SESSION['remove'] = "<div class ='error'>Fail to remove Category Image.</div>";
                //Redirect to manage category page
                header ('location:'.SITEURL.'admin/manage-category.php');
                //Stop the process
                die();
            }
        }
        //Delete Data from Database
        //SQL Query to delete data from Database
        $sql= "DELETE FROM tbl_category WHERE id = $id ";

        //Execute the query
        $res = mysqli_query($conn, $sql);

        //Check whether the data is delete from database or not
        if($res==true)
        {
            //Set Success message and Redirect
            $_SESSION['delete'] = "<div class='success'>Category Deleted Successfully.</div>";
            //Redirect to manage Category Page
            header ('location:'.SITEURL.'admin/manage-category.php');
        }
        else
        {
            //Set fail message and redirect
            $_SESSION['delete'] = "<div class='error'>Failed to Delete Category.</div>";
            //Redirect to manage Category Page
            header ('location:'.SITEURL.'admin/manage-category.php');

        }
    }
    else
    {
        //Redirect to manage Category Page
        header ('location:'.SITEURL.'admin/manage-category.php');
    }
?>