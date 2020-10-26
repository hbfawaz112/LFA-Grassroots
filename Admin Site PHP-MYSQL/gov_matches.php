
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
          Admin Page
          <button type="button" class="btn-danger" onclick="window.location.href='index.php'" >log out</button>
        </ul>
      </div>
    </nav>
    <div class="container-fluid">
     <div style="color:black; font-size:16px">
       
       
        <hr>
        <?php
         if(isset($_GET["gov"]))

            {
                $gove=$_GET['gov'];
             echo "<h3>All Matches(Future) $gove</h3>";
         }
         ?>
        <button type="button" class="btn btn-primary"
                  onclick="window.location.href='all_matches.php'">Go back .
                  </button>
         
       <?php
         
         if ($dbc = @mysqli_connect('localhost','root', ''))
	   { 
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
        {
            if(isset($_GET["gov"]))

            {
                $gover=$_GET['gov'];
              $query2="SELECT * FROM matches where region='$gover'";
            
             $r2=mysqli_query($dbc,$query2);
                         if($r2)
                         {
                          
                            echo "<table class=\"table\">
                                <thead>
                                  <tr>
                                    <th>First Team </th>
                                    <th>Secdon Team</th>
                                    <th>Match Date-Time</th>
                                    <th>Birth</th>
                                    <th>Region</th>
                                    <th>Option</th>
                                    
                                    

                                  </tr>
                                </thead>
                                <tbody>";
                             while($row2=mysqli_fetch_array($r2,MYSQLI_ASSOC))
                                {
                                 echo "
                                 <tr>
                                 <td>$row2[first_team]</td>
                                 <td>$row2[second_team]</td>
                                 <td>$row2[match_date]  $row2[match_time]</td>
                                 <td>$row2[birth]</td>
                                 <td>$row2[region]</td>
                                 <td>
                                       <button type=\"button\" class=\"btn btn-danger\"
                  onclick=\"window.location.href='delete_match.php?id=$row2[match_id]'\">Delete match
                  </button>
                                 </td>
                                 
                                 </tr>
                                 ";
                                }
                             echo"</tbody></table>";
                         }
            else{echo "probleemmmmm";}
                             
        }
    }
         }
         
         ?>
         
        
         
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