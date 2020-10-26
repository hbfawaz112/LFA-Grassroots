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

                


    $qu="DELETE FROM matches Where match_id=$val";
    
    if($r=mysqli_query($dbc,$qu))
    {
        echo("delete seccussefly!");
					
         
         sleep(2);
    header("location: first_page.php");
											                                     
                        
              }
              
              else{echo("not row");}
    
}

        }
    }
    


?>