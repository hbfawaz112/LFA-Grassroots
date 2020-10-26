

   <?php
    /*  get the specific  data */
   if($dbc=@mysqli_connect('localhost','root','')){
    if(mysqli_select_db($dbc,'flutter_football'))
    {    

           $region = $_GET['region'];
		   $birth = $_GET['birth'];
        //echo "Connected and seelcted db";
       
        $res=array();
        
        $query="SELECT * FROM ranking2 where region = '".$region."' && birth = '".$birth."' order by points desc";
        $r=mysqli_query($dbc,$query);
			if($r){
             while($row=mysqli_fetch_array($r,MYSQLI_ASSOC))
             {
                 $res[]=$row;
             }
            }
        echo json_encode($res), "\n";
    }
    else{echo"error selected db";}
 
}
else{
    echo"error conected to server :(";
}





/* update the ranking before get the data 
<?php
 $points=0 ;
 $di=0 ;
 $play=0 ; 
 $count_win = 0;
 $count_draw = 0;
 $count_lose = 0;
if ($dbc = @mysqli_connect('localhost','root', ''))
 {
		if (@mysqli_select_db($dbc,'flutter_football'))
		{
			print '<p>The database flutter_football has been selected.</p>';
			$delete="delete from ranking2";
			if(mysqli_query($dbc,$delete))
				echo "deleted ";
			else
				echo "not deleted ";
			
			
			$query = 'select * from each_team_score ' ;
			if($r=mysqli_query($dbc,$query))
			{     
  				while($row=mysqli_fetch_array($r,MYSQLI_ASSOC))
				{    
					 $points =$row['count_win']*3 + $row['count_draw']*1 ;
					 $di = $row['gf']-$row['ga'] ;
					 $play = $row['count_win'] + $row['count_draw'] + $row['count_lose'] ;
					
                     $query2="INSERT INTO ranking2(team_name,points,play,gf,ga,di,birth,region) values('$row[team_name]',$points,$play,$row[gf],$row[ga],$di,$row[birth],'$row[region]') ";  
					if(mysqli_query($dbc,$query2))	
					  echo "inserted ";
	     		}
					
			}
			else
			{
				echo 'query not excuted ';
			}
			
		}
		else
		{
			print '<p style="color: red;">Could not select the database project_ta5
						because:<br/>' . mysqli_error($dbc) . '.</p>';
		}
		mysqli_close($dbc); // Close the connection.
}
else
{
	print '<p style="color: red;">Could not connect to
	MySQL:<br />' . mysqli_error($dbc) . '.</p>';
}
?>
*/
?>



