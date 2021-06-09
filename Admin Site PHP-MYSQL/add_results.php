
<?php

if ($dbc = @mysqli_connect('localhost','root', ''))
	{
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
		{
            if(isset($_POST["fteam"]) && $_POST["fteam"]!=" ")
            
            {
                $fteam=$_POST['fteam'];
                $fteamscore=$_POST['fteamscore'];
                $steam=$_POST['steam'];
                $steamscore=$_POST['steamscore'];
                $matchdatee=$_POST['matchdate'];
                $birthd=$_POST['birth'];
                $reg=$_POST['region'];
                
                $que="INSERT INTO results (first_team,first_team_result,second_team,second_team_result,match_date,birth,region) values
                ('$fteam','$fteamscore','$steam','$steamscore','$matchdatee','$birthd','$reg')";
                
                if(@mysqli_query($dbc,$que))
                {
                    
                    
                    
                    if($fteamscore > $steamscore)
                    {
                        
                        
                           echo "okkkk"; 
                        
                        $qq1="select * from ranking2 where team_name='$fteam' and birth='$birthd' and region='$reg' ";
                        if($rr=mysqli_query($dbc,$qq1))
                        {
                                while($roww = mysqli_fetch_array($rr, MYSQLI_ASSOC))
                                {
                                    $play=$roww[play]+1;
                                    $pointss=$roww[points]+3;
                                    $gff=$roww[gf]+$fteamscore;
                                    $gaa=$roww[ga]+$steamscore;
                                    $dif=$gff-$gaa;
                                    
                                    $q1update="update ranking2 set play='$play' , points='$pointss' , gf='$gff' , ga='$gaa' ,di='$dif' where team_name='$fteam' and birth='$birthd' and region='$reg' ";
                                     $r1update=mysqli_query($dbc,$q1update);
                                      if(mysqli_affected_rows($dbc)==1)
                                      {
                                           echo "
                                                donennnnnnnnnnnn!!!!
                                                   ";
                                      }
                                }
                        }
                        
                        $qq2="select * from ranking2 where team_name='$steam' and birth='$birthd' and region='$reg' ";
                        if($rr2=mysqli_query($dbc,$qq2))
                        {
                                while($roww2 = mysqli_fetch_array($rr2, MYSQLI_ASSOC))
                                {
                                    $play2=$roww2[play]+1;
                                    //$pointss2=$roww2[points]+3;
                                    $gff2=$roww2[gf]+$steamscore;
                                    $gaa2=$roww2[ga]+$fteamscore;
                                    $dif2=$gff2-$gaa2;
                                    
                                    $q1update2="update ranking2 set play='$play2' , gf='$gff2' , ga='$gaa2' ,di='$dif2' where team_name='$steam' and birth='$birthd' and region='$reg' ";
                                     $r1update2=mysqli_query($dbc,$q1update2);
                                      if(mysqli_affected_rows($dbc)==1)
                                      {
                                           echo "
                                                ffghrhg;
                                                   ";
                                      }
                                }
                        }
                        
                        
                        
                        
                    }
                    
                    
                    if($fteamscore < $steamscore)
                    {
                        
                        
                        echo"5asarne 2wl fari2" ;
                        
                        
                        
                        
                         $qq1="select * from ranking2 where team_name='$steam' and birth='$birthd' and region='$reg' ";
                        if($rr=mysqli_query($dbc,$qq1))
                        {
                                while($roww = mysqli_fetch_array($rr, MYSQLI_ASSOC))
                                {
                                    $play=$roww[play]+1;
                                    $pointss=$roww[points]+3;
                                    $gff=$roww[gf]+$steamscore;
                                    $gaa=$roww[ga]+$fteamscore;
                                    $dif=$gff-$gaa;
                                    
                                    $q1update="update ranking2 set play='$play' , points='$pointss' , gf='$gff' , ga='$gaa' ,di='$dif' where team_name='$steam' and birth='$birthd' and region='$reg' ";
                                     $r1update=mysqli_query($dbc,$q1update);
                                      if(mysqli_affected_rows($dbc)==1)
                                      {
                                           echo "
                                                donennnnnnnnnnnn!!!!
                                                   ";
                                      }
                                }
                        }
                        
                        $qq2="select * from ranking2 where team_name='$fteam' and birth='$birthd' and region='$reg' ";
                        if($rr2=mysqli_query($dbc,$qq2))
                        {
                                while($roww2 = mysqli_fetch_array($rr2, MYSQLI_ASSOC))
                                {
                                    $play2=$roww2[play]+1;
                                    //$pointss2=$roww2[points]+3;
                                    $gff2=$roww2[gf]+$fteamscore;
                                    $gaa2=$roww2[ga]+$steamscore;
                                    $dif2=$gff2-$gaa2;
                                    
                                    $q1update2="update ranking2 set play='$play2' , gf='$gff2' , ga='$gaa2' ,di='$dif2' where team_name='$fteam' and birth='$birthd' and region='$reg' ";
                                     $r1update2=mysqli_query($dbc,$q1update2);
                                      if(mysqli_affected_rows($dbc)==1)
                                      {
                                           echo "
                                                ffghrhg;
                                                   ";
                                      }
                                }
                        }
                        
                  }
                    
                    if($fteamscore == $steamscore)
                    {
                        
                        
                         $qq1="select * from ranking2 where team_name='$fteam' and birth='$birthd' and region='$reg' ";
                        if($rr=mysqli_query($dbc,$qq1))
                        {
                                while($roww = mysqli_fetch_array($rr, MYSQLI_ASSOC))
                                {
                                    $play=$roww[play]+1;
                                    $pointss=$roww[points]+1;
                                    $gff=$roww[gf]+$fteamscore;
                                    $gaa=$roww[ga]+$steamscore;
                                    $dif=$gff-$gaa;
                                    
                                    $q1update="update ranking2 set play='$play' , points='$pointss' , gf='$gff' , ga='$gaa' ,di='$dif' where team_name='$fteam' and birth='$birthd' and region='$reg' ";
                                     $r1update=mysqli_query($dbc,$q1update);
                                      if(mysqli_affected_rows($dbc)==1)
                                      {
                                           echo "
                                                donennnnnnnnnnnn!!!!
                                                   ";
                                      }
                                }
                        }
                        
                        $qq2="select * from ranking2 where team_name='$steam' and birth='$birthd' and region='$reg' ";
                        if($rr2=mysqli_query($dbc,$qq2))
                        {
                                while($roww2 = mysqli_fetch_array($rr2, MYSQLI_ASSOC))
                                {
                                    $play2=$roww2[play]+1;
                                    $pointss2=$roww2[points]+1;
                                    $gff2=$roww2[gf]+$steamscore; 
                                    $gaa2=$roww2[ga]+$fteamscore;
                                    $dif2=$gff2-$gaa2;
                                    
                                    $q1update2="update ranking2 set play='$play2' ,points='$pointss2' , gf='$gff2' , ga='$gaa2' ,di='$dif2' where team_name='$steam' and birth='$birthd' and region='$reg' ";
                                     $r1update2=mysqli_query($dbc,$q1update2);
                                      if(mysqli_affected_rows($dbc)==1)
                                      {
                                           echo "
                                                ffghrhg;
                                                   ";
                                      }
                                }
                        }
                        
                        
                        
                    }
                    
                    
            
                    
                   header('Location: first_page.php');
                }
                
                
                else{
                    echo "<div class=\"alert alert-danger\">
  <strong>oops!</strong> error adding match result :(!!
</div>
                       ";
                }
                
                
                
                    
                }
                 
            }
        }




?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" type="text/css" href="side-bar.css">

</head>
<body>
<div id="viewport">
  <!-- Sidebar -->
  <div id="sidebar">
    <header>
      <a href="#">Menu</a>
    </header>
    <ul class="nav">
     <li>
        <a href="first_page.php">
          <i class="zmdi zmdi-view-dashboard"></i> Home
        </a>
      </li>
      <li>
        <a href="add_te3mim.php">
          <i class="zmdi zmdi-link"></i> Uplaod a new annoucement
        </a>
      </li>
      <li>
        <a href="add_future_march.php">
          <i class="zmdi zmdi-widgets"></i> Add a future match
        </a>
         
        
      </li>
      <li>
        <a href="add_results.php">
          <i class="zmdi zmdi-calendar"></i> Add results
        </a>
      </li>
      <li>
        <a href="See-rank.php">
          <i class="zmdi zmdi-calendar"></i> See rank tables
        </a>
      </li>
      
      <li>
        <a href="add_team.php">
          <i class="zmdi zmdi-info-outline"></i> Add a new team
        </a>
      </li>
      <li>
        <a href="list_of_academies.php">
          <i class="zmdi zmdi-info-outline"></i> List Of Academies
        </a>
      </li>
      
     </ul>
  </div>
  <!-- Content -->
  <div id="content">
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <ul class="nav navbar-nav navbar-right">
          <li>
            
          </li>
          <li><a href="#">Admin Page</li>
        </ul>
      </div>
    </nav>
    <div class="container-fluid">
      <h1>Add a result of match </h1><hr>

    <div style="color: black;font-size: 16px;margin-left:120px ; margin-right: 120px" >
      <form action="add_results.php" method="post">
  <div class="form-group">
    <label for="fteam">First Team</label>
    <select name="fteam" class="form-control" required>
    <?php
      
      if ($dbc = @mysqli_connect('localhost','root', ''))
	{
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
		{
            $q1="SELECT * FROM profil_team order by region ";
            $r=mysqli_query($dbc,$q1);
			if($r)
            {
                while($row=mysqli_fetch_array($r,MYSQLI_ASSOC))
                    {
                     echo  "<option value=\"$row[team_name]\" >$row[team_name] / $row[region]</option>"; 
                    }
            }
            else{echo"probleemm1!!";}
        }
      }
      
      ?>
      </select>
    
    
    
    <label for="email">First Team score</label>
    <input type="number" class="form-control" name="fteamscore" id="fteam">
    
  </div>
  <div class="form-group">
    <label for="pwd">Second Team</label>
    <select name="steam" class="form-control" required>
    <?php
      
      if ($dbc = @mysqli_connect('localhost','root', ''))
	{
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
		{
            $q2="SELECT * FROM profil_team order by region ";
            $r2=mysqli_query($dbc,$q2);
			if($r2)
            {
                while($row2=mysqli_fetch_array($r2,MYSQLI_ASSOC))
                    {
                     echo  "<option value=\"$row2[team_name]\" >$row2[team_name] / $row2[region]</option>"; 
                    }
            }
            else{echo"probleemm1!!";}
        }
      }
      
      ?>
      </select>
  
     <label for="email">Second Team score</label>
    <input type="number" class="form-control" name="steamscore" required>
    
  </div>
  
  <div class="form-group">
    <label for="pwd">Match date:</label>
    <input type="date" class="form-control" name="matchdate" required>
  </div>
  


  
  <div class="form-group">
    <label for="birth">Age (Birth) </label>
 <select name="birth" class="form-control" required>
<option><h4>2008</h4></option>
<option><h4>2009</h4></option>
<option><h4>2010</h4></option>
<option><h4>2011</h4></option>

</select>
  </div>

  <div class="form-group">
    <label for="regio">Region(gouvernament) </label>
  <select name="region" class="form-control" required>
<option value="beirut" ><h4>Beiruth gov.</h4></option>
<option value="north"><h4>North Lebanon gov.</h4></option>
<option value="mont"><h4>Mont Lebanon gov.</h4></option>
<option value="south"><h4>South Lebanon gov.</h4></option>

</select>
  </div>
  
  
<div align="center">
  <button type="submit" class="btn btn-primary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Submit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
</div>
</form>

    </div>
  </div>
</div>
<br><br>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
  </html>
