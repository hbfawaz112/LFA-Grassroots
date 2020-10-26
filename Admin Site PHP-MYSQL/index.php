

<?php
if ($dbc = @mysqli_connect('localhost','root', ''))
	{
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
		{
            
            if(isset($_POST["usernamee"]) && $_POST["usernamee"]!=" ")
            {
                $username=$_POST['usernamee'];
                
                $password=$_POST['password'];
                
                $query="SELECT * FROM admin where username = '$username' and password='$password' ";
                
                $result = mysqli_query($dbc,$query);
                
                $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
                
                
               
                $count = mysqli_num_rows($result);
                
                 if($count == 1) {
                
                     
                     header("location: first_page.php");
                  }
                else {
                    header("location: index.php?er=er");
                    
                        
                 }
      
                
                
                
            }
            
        }
    
    else{echo"can't connect to database ";}
    
}
else{echo " can't conncet to server";}


?>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

  <link rel="stylesheet" type="text/css" href="loginstyle.css">

</head>
<body>

<div class="container-fluid">
  <div class="row no-gutter">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading mb-4">Welcome back!</h3>
              <form method="post" action="index.php">
                <div class="form-label-group">
                  <input type="text" id="inputEmail" name="usernamee"class="form-control" placeholder="Email address" required autofocus>
                  <label for="inputEmail">Email address or username</label>
                </div>

                <div class="form-label-group">
                  <input type="password" id="inputPassword" name="password" class="form-control" placeholder="Password" required>
                  <label for="inputPassword">Password</label>
                </div>

                
                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" type="submit">Sign in</button>
                <div class="text-center">
                  <a class="small" href="#">Forgot password?</a></div>
              </form>
            </div>
          </div>
        </div>
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
