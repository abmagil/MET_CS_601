<!doctype html>
<html>
 <head>
  <title>MySQLi Example (insertion)</title>
 </head>
 <body>
	
<h3>MySQL insert</h3>
	
<?php

$mysqli = new mysqli("127.0.0.1", "root", "joe81", "metcs");

if ( $mysqli->errno ) {
	echo "Unable to connect to the database.";
	die();
} 
     
$user =  $_GET['u'];
$professor = $_GET['p'];

$result = $mysqli->query("insert into class(name, professor) values ('$user', '$professor')"); 

echo "Inserted count: $mysqli->affected_rows";
?>
</body>
</html>