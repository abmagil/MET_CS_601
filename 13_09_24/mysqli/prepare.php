<!doctype html>
<html>
 <head>
  <title>MySQLi Example (insert with binding)</title>
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

$stmt = $mysqli->prepare("insert into class(name, professor) values (?, ?)"); 
$stmt->bind_param('ss', $user, $professor);
$stmt->execute();

echo "Inserted count: $mysqli->affected_rows";
?>
</body>
</html>