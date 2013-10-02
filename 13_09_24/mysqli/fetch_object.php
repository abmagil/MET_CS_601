<!doctype html>
<html>
 <head>
  <title>MySQLi Example (querying)</title>
  <style>
     table {
	  border: 1px solid black;
	  width: 33%;
     }
     td, th {
	   border: 1px solid black;  
	   text-align: center;
     }
  </style>
 </head>
 <body>
	
<h3>fetch_object example</h3>
	
<?php

$mysqli = new mysqli("127.0.0.1", "root", "joe81", "metcs");

if ( $mysqli->errno ) {
	echo "Unable to connect to the database.";
	die();
} 
      
$records = $mysqli->query("select class_id, name, professor from class");

echo '<table><tr><th>Class ID</th><th>Name</th><th>Professor</th></tr>';

  while ($rec = $records->fetch_object()) { 
    echo '<tr><td>' . $rec->class_id . '</td>';
    echo '<td>' . $rec->name . '</td><td>' . $rec->professor . '</td></tr>';
  }

echo '</table>';
?>
</body>
</html>