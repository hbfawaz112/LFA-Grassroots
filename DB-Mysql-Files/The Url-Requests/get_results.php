
   <?php

   if($dbc=@mysqli_connect('localhost','root','')){
    if(mysqli_select_db($dbc,'flutter_football'))
    {    

           $region = $_GET['region'];
		   $birth = $_GET['birth'];
        //echo "Connected and seelcted db";
       
        $res=array();
        
        $query="SELECT * FROM results where region = '".$region."' && birth = '".$birth."'";
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
?>