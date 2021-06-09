
<?php

if ($dbc = @mysqli_connect('localhost','root', ''))
	{
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
		{
            if(isset($_POST["tname"]) && $_POST["tname"]!=" " )
            {
                $tname=$_POST['tname'];
                $admin=$_POST['admins'];
                $phnumb=$_POST['phnumber'];
                $loc=$_POST['location'];
                $urlmaps=$_POST['mapurl'];
                $email=$_POST['email'];
                $reg=$_POST['region'];
                
                
                $file=$_FILES["profile_pic"];
                
                
                $query="INSERT INTO profil_team (team_name,adminstrator,phone,location,map_url,region,email) values 
                ('$tname','$admin','$phnumb','$loc','$urlmaps','$reg','$email')";
                
                if(@mysqli_query($dbc,$query))
                    {
                    
                        move_uploaded_file($file["tmp_name"], "C:/xampp/htdocs/flutter_football/profile_pictures/" . $file["name"]);
                      
                    
                       echo "
                                       <div class=\"alert alert-success\">
                  <strong>Success!</strong> team added succufelly!!
                </div>
                                       ";
                    
                    $query2="INSERT INTO ranking2 (team_name,points,play,gf,ga,di,birth,region) values
                    ('$tname',0,0,0,0,0,2008,'$reg')";
                        if(@mysqli_query($dbc,$query2))
                        {echo " ";}
                    
                    $query3="INSERT INTO ranking2 (team_name,points,play,gf,ga,di,birth,region) values
                    ('$tname',0,0,0,0,0,2009,'$reg')";
                        if(@mysqli_query($dbc,$query3))
                        {echo " ";}
                    
                        $query4="INSERT INTO ranking2 (team_name,points,play,gf,ga,di,birth,region) values
                    ('$tname',0,0,0,0,0,2010,'$reg')";
                        if(@mysqli_query($dbc,$query4))
                        {echo " ";}
                    
                        $query5="INSERT INTO ranking2 (team_name,points,play,gf,ga,di,birth,region) values
                    ('$tname',0,0,0,0,0,2011,'$reg')";
                        if(@mysqli_query($dbc,$query5))
                        {echo " ";}
                            
                    
                    
                    }
                else{
                     echo "<div class=\"alert alert-danger\">
                      <strong>oops!</strong> error adding team  :(!!
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
            <a href="#"><i class="zmdi zmdi-notifications text-danger"></i>
            </a>
          </li>
          <li><a href="#">Admin Page</li>
        </ul>
      </div>
    </nav>
    <div class="container-fluid">
      <h1>Add a new Team </h1><hr>

    <div style="color: black;font-size: 16px;margin-left:120px ; margin-right: 120px" >
      <form action="add_team.php" method="post" enctype="multipart/form-data">
      
      <div class="form-group">
      <label for="profilepic">Picture of the academie (profile)</label>
      <input type="file" name="profile_pic" required> 
  </div>
  <div class="form-group">
    <label for="email">Team name</label>
    <input type="text" class="form-control" name="tname" required>
  </div>
  <div class="form-group">
    <label for="pwd">Team adminstrator</label>
    <input type="text" class="form-control" name="admins" required>
  </div>
  
  <div class="form-group">
    <label for="pwd">Phone Number</label>
    <input type="number" class="form-control" name="phnumber" required>
  </div>
  <div class="form-group">
    <label for="pwd">location</label>
    <input type="text" class="form-control" name="location" required>
  </div>
  
  <div class="form-group">
    <label for="pwd">URL-MAP : (For Google Maps) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <i>(Not Obligatory)</i></label>
    <input type="text" class="form-control" name="mapurl" >
  </div>
  

<div class="form-group">
    <label for="pwd">Email </label>
    <input type="text" class="form-control" name="email" required>
  </div>
  
  

  <div class="form-group">
    <label for="pwd">Region(gouvernament) </label>
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
