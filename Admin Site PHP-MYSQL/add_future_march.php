<?php

if ($dbc = @mysqli_connect('localhost','root', ''))
	{
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
		{
            if(isset($_POST["fteam"]) && $_POST["fteam"]!=" ")
               {
                
                   $firstteam=$_POST['fteam'];
                   $secondteam=$_POST['steam'];
                   $datematch=$_POST['datematch'];
                   $matchtimee=$_POST['matchtime'];
                   $birthd=$_POST['birth'];
                   $staduim=$_POST['std'];
                   $reg=$_POST['region'];
                   
                   $que="INSERT INTO matches (first_team,second_team,match_date,match_time,birth,staduim,region) values 
                   ('$firstteam','$secondteam','$datematch','$matchtimee','$birthd','$staduim','$reg')";
                   
                   if(@mysqli_query($dbc,$que))
                   {
                       echo "
                       <div class=\"alert alert-success\">
  <strong>Success!</strong> Match added succufelly
</div>
                       ";
                       //header("location: first_page.php");
					
                   }
                   else{
                       echo "
                       <div class=\"alert alert-danger\">
  <strong>oops!</strong> error adding match !!
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
        <a href="add_team.php">
          <i class="zmdi zmdi-info-outline"></i> Add a new team
        </a>
      </li>
     <!-- <li>
        <a href="#">
          <i class="zmdi zmdi-settings"></i> Services
        </a>
      </li>
      <li>
        <a href="#">
          <i class="zmdi zmdi-comment-more"></i> Contact
        </a>
      </li>-->
    </ul>
  </div>
  <!-- Content -->
  <div id="content">
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <ul class="nav navbar-nav navbar-right">
          <li>
            <a href="#"><i class="zmdi zmdi-notifications text-danger"></i>
            </a>
          </li>
          <li><a href="#">Admin Page</li>
        </ul>
      </div>
    </nav>
    <div class="container-fluid">
      <h1>Add a future match </h1><hr>

    <div style="color: black;font-size: 16px;margin-left:160px ; margin-right: 160px" >
      <form action="add_future_march.php" method="post">
      
      
  <div class="form-group">
    <label for="email">First Team</label>
    <select name="fteam" class="form-control">
    <?php
      
      if ($dbc = @mysqli_connect('localhost','root', ''))
	{
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
		{
            $q1="SELECT * FROM profil_team ";
            $r=mysqli_query($dbc,$q1);
			if($r)
            {
                while($row=mysqli_fetch_array($r,MYSQLI_ASSOC))
                    {
                     echo  "<option value=\"$row[team_name]\" >$row[team_name]</option>"; 
                    }
            }
            else{echo"probleemm1!!";}
        }
      }
      
      ?>
      </select>
    
 <!--   <input type="text" name="fteam" class="form-control" id="fteam">-->
  </div>
  
  
  
  <div class="form-group">
    <label for="pwd">Second Team</label>
  <select name="steam" class="form-control">
    <?php
      
      if ($dbc = @mysqli_connect('localhost','root', ''))
	{
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
		{
            $q2="SELECT * FROM profil_team ";
            $r2=mysqli_query($dbc,$q2);
			if($r2)
            {
                while($row2=mysqli_fetch_array($r2,MYSQLI_ASSOC))
                    {
                     echo  "<option value=\"$row2[team_name]\" >$row2[team_name]</option>"; 
                    }
            }
            else{echo"probleemm1!!";}
        }
      }
      
      ?>
      </select>
  
          </div>

          
          
  <div class="form-group">
    <label for="pwd">Match date:</label>
    <input type="date" name="datematch" class="form-control" id="pwd">
  </div>
  <div class="form-group">
    <label for="pwd">Match Time </label>
    <input type="time" name="matchtime" class="form-control" id="pwd">
  </div>

<div class="form-group">
    <label for="pwd">Staduim </label>
    <input type="text" name="std" class="form-control" id="pwd">
  </div>
  
  <div class="form-group">
    <label for="pwd">Age (Birth) </label>
 <select name="birth" class="form-control">
<option><h4>2008</h4></option>
<option><h4>2009</h4></option>
<option><h4>2010</h4></option>
<option><h4>2011</h4></option>

</select>
  </div>

  <div class="form-group">
    <label for="pwd">Region(gouvernament) </label>
  <select name="region" class="form-control">
<option value="beirut" ><h4>Beiruth gov.</h4></option>
<option value="north"><h4>North Lebanon gov.</h4></option>
<option value="mont"><h4>Mont Lebanon gov.</h4></option>
<option value="south"><h4>South Lebanon gov.</h4></option>

</select>
  </div>
  
  
<div align="center">
<input type="submit" value="add match" class="btn-primary">
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