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

               $sql="SELECT * FROM profil_team WHERE team_id='$val' ";
                                $r=mysqli_query($dbc,$sql);
                                if($r)
                                {
                                     while($row=mysqli_fetch_array($r,MYSQLI_ASSOC))
                                     {
                                         
                                         $pic=$row[team_name];
                                         
                                     }
                                }

                


    $qu="DELETE FROM profil_team Where team_id=$val";
    
    if($r=mysqli_query($dbc,$qu))
    {
        
        
        $path="C:/xampp/htdocs/flutter_football/profile_pictures/$pic.jpg";
                                        
											unlink($path);//this function delete a file 
											
        echo("delete seccussefly!");
					
         
         sleep(2);
    header("location: list_of_academies.php");
											                                     
                        
              }
              
              else{echo("not row");}
    
}

        }
    }
    


?>