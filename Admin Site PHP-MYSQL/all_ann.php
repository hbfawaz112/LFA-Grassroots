
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
        
        <h3>All Annoucements</h3>
       <?php
         
         if ($dbc = @mysqli_connect('localhost','root', ''))
	   { 
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
        {
            $query="SELECT 
                            *
                        FROM
                            new_pdf
                        ORDER BY new_id DESC
                         ";
             $r=mysqli_query($dbc,$query);
                         if($r)
                         {
                          
                            echo "<table class=\"table\">
                                <thead>
                                  <tr>
                                    <th>Annoucement ID</th>
                                    <th>Annoucment Name</th>
                                    <th>Annoucment Date</th>
                                    <th>Option</th>
                                    
                                    

                                  </tr>
                                </thead>
                                <tbody>";
                             while($row1=mysqli_fetch_array($r,MYSQLI_ASSOC))
                                {
                                 echo "
                                 <tr>
                                 <td>$row1[new_id]</td>
                                 <td>$row1[new_name].pdf</td>
                                 <td>$row1[new_date]</td>
                                 <td>
                                 <button type=\"button\" class=\"btn btn-danger\"
                  onclick=\"window.location.href='delete_ann.php?id=$row1[new_id]'\">Delete File
                  </button>
                                <button type=\"button\" class=\"btn btn-primary\"
                  onclick=\"window.location.href='http://192.168.1.106:8080/flutter_football/ta3amim/$row1[new_name].pdf '\">See This File
                  </button>
                  
                                 <td>
                                 
                                 </tr>
                                 ";
                                }
                             echo"</tbody></table>";
                         }
            else{echo "probleemmmmm";}
                             
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