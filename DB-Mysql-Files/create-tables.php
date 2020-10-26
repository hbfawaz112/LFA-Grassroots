<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=”http://www.w3.org/1999/ xhtml" xml:lang="en" lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>Create a Table</title>
</head>
<body>

<?php // Script 12.4 - create_table.php
	/* This script connects to the MySQL server, selects the database, and creates a table. */

	// Connect and select:
	if ($dbc = @mysqli_connect('localhost','root', ''))
	{
       
		// Handle the error if the database couldnot be selected:
		if (@mysqli_select_db($dbc,'flutter_football'))
		{

		
				   
			$TeamScores = 'CREATE TABLE TeamScores(
														match_id INT UNSIGNED NOT NULL  PRIMARY KEY AUTO_INCREMENT,
			                                           	team_name VARCHAR(100) NOT NULL,
                                                        win INT NOT NULL,
														draw INT NOT NULL,
													    lose INT NOT NULL,
														gf INT NOT NULL,
														ga INT NOT NULL,
														date_match DATE NOT NULL,
														birth INT NOT NULL,
                                                        region VARCHAR(100) NOT NULL
                                                        )';
			$ranking2 = 'CREATE TABLE ranking2(
														team_id INT UNSIGNED NOT NULL  PRIMARY KEY AUTO_INCREMENT,
			                                           	team_name VARCHAR(100) NOT NULL,
														points INT NOT NULL,
                                                        play VARCHAR(100) NOT NULL,
														gf INT NOT NULL,
														ga INT NOT NULL,
														di INT NOT NULL,
														birth INT NOT NULL,
                                                        region VARCHAR(100) NOT NULL
                                                        )';	
														
			$matches = 'CREATE TABLE matches(
														match_id INT UNSIGNED NOT NULL  PRIMARY KEY AUTO_INCREMENT,
														first_team VARCHAR(100) NOT NULL,
			                                           	second_team VARCHAR(100) NOT NULL,
														match_date DATE NOT NULL,
														match_time varchar(100) NOT NULL,
                                               			birth INT NOT NULL,
														staduim VARCHAR(100) NOT NULL ,
                                                        region VARCHAR(100) NOT NULL
														
                                                        )';												
														
						
            $results = 'CREATE TABLE results(
														match_id INT UNSIGNED NOT NULL  PRIMARY KEY AUTO_INCREMENT,
														first_team VARCHAR(100) NOT NULL,
														first_team_result  INT  NOT NULL,
			                                           	second_team VARCHAR(100) NOT NULL,
													    second_team_result  INT  NOT NULL,
														match_date DATE NOT NULL,
													
                                               			birth INT NOT NULL,
                                                        region VARCHAR(100) NOT NULL
                                                        )';	
														

            $profil_team = 'CREATE TABLE profil_team(   team_id INT UNSIGNED NOT NULL  PRIMARY KEY AUTO_INCREMENT,
														team_name VARCHAR(100) NOT NULL ,
														adminstrator VARCHAR(100) NOT NULL,
														phone VARCHAR(100) NOT NULL,
														location VARCHAR(100) NOT NULL,
														region VARCHAR(100) NOT NULL,
                                                        email VARCHAR(100) NOT NULL
                                                        )' ;
														
														
		    $player = 'CREATE TABLE player(   
														player_id INT UNSIGNED NOT NULL  PRIMARY KEY AUTO_INCREMENT,
														player_name VARCHAR(100) NOT NULL,
														team_name VARCHAR(100) NOT NULL, 
														birth INT NOT NULL
                                                        )' ; //team_name F_K
														
			$player_goals = 'CREATE TABLE player_goals(   
														player_id INT UNSIGNED NOT NULL  PRIMARY KEY AUTO_INCREMENT,
														number_goals INT NOT NULL,
                                                        )' ; //team_name F_K
														
	       $new_pdf = 'CREATE TABLE new_pdf(      		new_id INT UNSIGNED NOT NULL  PRIMARY KEY AUTO_INCREMENT,
														new_name VARCHAR(100) NOT NULL,
														new_date date not null 
                                                        )' ;					
														
            														
            // to create this view 
            //write this query in sql in phpmyadmin then press go														
													
			/*  
            CREATE VIEW each_team_score  
            as
            select  TeamScores.team_name as team_name , sum(TeamScores.win) as count_win ,sum(TeamScores.draw) as count_draw ,sum(TeamScores.lose) as count_lose , sum(TeamScores.gf) as gf , sum(TeamScores.ga) as ga , TeamScores.birth as birth , TeamScores.region as region 
            from TeamScores    
            group by TeamScores.team_name ,TeamScores.birth , TeamScores.region  /* */														
        
    // Execute the query:
	     if (@mysqli_query($dbc,$profil_team))
		{
			print '<p> The profile_team   has been created.</p>';
		}
            else{
                 @mysql_error;
            }

          
	    
		
	        
  

    mysqli_close($dbc); // Close the connection.

  }
	}
?>
 </body>
 </html>
