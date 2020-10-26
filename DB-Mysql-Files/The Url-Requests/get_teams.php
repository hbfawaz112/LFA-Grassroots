
   <?php

   if($dbc=@mysqli_connect('localhost','root','')){
    if(mysqli_select_db($dbc,'flutter_football'))
    {    

         
	
        //echo "Connected and seelcted db";
       
        $res=array();
        
        $query="SELECT * FROM profil_team ";
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