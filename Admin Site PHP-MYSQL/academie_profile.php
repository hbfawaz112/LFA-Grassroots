
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
                    echo "
                       <div class=\"alert alert-success\">
  <strong>Success!</strong> Match Result added succufelly!!
</div>
                       ";
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
            
          </li>
          <li><a href="#">Admin Page</li>
        </ul>
      </div>
    </nav>
    <div class="container-fluid">
       <div style="color:black; font-size:16px">
       <button type="button" class="btn btn-primary"
                  onclick="window.location.href='list_of_academies.php'">Go back .
                  </button>
                  <div class="jumbotron">
       <h3 align="center">Profile</h3>
       
      <?php
         if ($dbc = @mysqli_connect('localhost','root', ''))
	   { 
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
        {
           
                if(isset($_GET["id"]))
                {
                    $val=$_GET['id'];
                    $query="SELECT * FROM profil_team WHERE team_id='$val'";
                    
                    $r=mysqli_query($dbc,$query);
                         if($r)
                         {
                             while($row1=mysqli_fetch_array($r,MYSQLI_ASSOC))
                                {
                                 $url="http://192.168.1.108:8080/flutter_football/profile_pictures/$row1[team_name].jpg";
                                    echo " <div align=\"center\">
                                    <img src=\"$url\" width=\"100\" height=\"100\">
                                         <br>
                                        <b>Academie ID :</b>   $row1[team_id]
                                        <br><br>
                                        <b>Academie Name : </b> $row1[team_name]
                                        <br><br>
                                        <b>Adminstrator Name :</b>  $row1[adminstrator]
                                        <br><br>
                                        <b>Phone Number :</b>  $row1[phone]
                                        <br><br>
                                        <b>Location :</b>  $row1[location]
                                        <br><br>
                                        <b>Region (Gov.) :  </b>$row1[region]
                                        <br><br>
                                        <b>Email :  </b>$row1[email]
                                        <br>
                                        </div>
                                        
                                        
                                        
                                        
                                        
                                        
                                    ";
                                }
                         }
                    else{echo "probleemm1!!";}
                    
                   //echo $_GET['id'];
                }
        }
         }
        ?>
        
           </div>
        </div>
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