<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<body>
<?php
if ($dbc = @mysqli_connect('localhost','root', ''))
 {
		print '<p>Successfully connected to MySQL!</p>';
		if (@mysqli_query($dbc,'CREATE DATABASE flutter_football'))
		{
			print '<p>The database flutter_football has been created!</p>';
		}
		else
		{ // Could not create it.
			print '<p style="color: red;">Could not create the database because:
						<br />' . mysqli_error($dbc) . '.</p>';
		}
		if (@mysqli_select_db($dbc,'flutter_football'))
		{
			print '<p>The database flutter_football has been selected.</p>';
		}
		else
		{
			print '<p style="color: red;">Could not select the database flutter_football
						because:<br/>' . mysqli_error($dbc) . '.</p>';
		}
		mysqli_close($dbc); // Close the connection.
}
else
{
	print '<p style="color: red;">Could not connect to
	MySQL:<br />' . mysqli_error($dbc) . '.</p>';
}
?>
</body>
</html>
