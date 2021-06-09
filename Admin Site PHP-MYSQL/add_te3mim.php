<?php

if ($dbc = @mysqli_connect('localhost','root', ''))
	{
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
		{
            if(isset($_POST["ann"]) && $_POST["ann"]!=" ")
            {
                $annoucemnt_name=$_POST['ann'];
                
             
                $file=$_FILES["pdffile"];
                
                
                $dateofupload = date("Y-m-d");
                
                $query="INSERT INTO new_pdf (new_name,new_date) values ('$annoucemnt_name','$dateofupload')";
                
                if(@mysqli_query($dbc,$query))
                    {
                         move_uploaded_file($file["tmp_name"], "C:/xampp/htdocs/flutter_football/ta3amim/" . $file["name"]);
                      
                    echo "
                                       <div class=\"alert alert-success\">
                  <strong>Success!</strong> Annoucement added succufelly!!
                </div>
                                       ";
                    
                    }
                else{
                    echo "<div class=\"alert alert-danger\">
                      <strong>oops!</strong> error adding ann  :(!!
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
      <h1>Add a new Annoucment - اخبار و تعاميم 
        <hr>
        <div style="color: black; font-size: 16px; margin:120px">

        <form action="add_te3mim.php" method="post" enctype="multipart/form-data">
  <div class="form-group" align="center">
    <label for="anname"><h3>Annoucement Name -  اسم التعميم </h3></label><br>
    <input type="text" class="form-control" name="ann" required>
  </div>
<br>
  <div align="center" class="form-group">
  
<input type="file" name="pdffile" class="file-upload" required>
  </div>
  <br>
<div align="center">
  <input type="submit" value="Submit" class="btn-primary">
</div>
</form>
        </div>
    </div>
  </div>
</div>


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</body>
  </html>
