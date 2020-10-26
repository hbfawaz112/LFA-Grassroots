<?php

    if ($dbc = @mysqli_connect('localhost','root', ''))
	   { 
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
        {
          if(isset($_GET["id"]))
            {
            echo $_GET['id'];
            $val=$_GET['id'];

                $sql="SELECT * FROM new_pdf WHERE new_id='$val' ";
                                $r=mysqli_query($dbc,$sql);
                                if($r)
                                {
                                     while($row=mysqli_fetch_array($r,MYSQLI_ASSOC))
                                     {
                                         
                                         $pdfname=$row[new_name];
                                         
                                     }
                                }


    $qu="DELETE FROM new_pdf Where new_id=$val";
    
    if($r=mysqli_query($dbc,$qu))
    {
            echo("delete seccussefly!");
										 
                                        
                        
             $path="C:/xampp/htdocs/flutter_football/ta3amim/$pdfname.pdf";
                                        
											unlink($path);//this function delete a file 
											sleep(4);
											 header("location: first_page.php");
											 //echo $path;
		 
									 }
									 else{echo("not row");}
    
}

        }
    }
    


?>