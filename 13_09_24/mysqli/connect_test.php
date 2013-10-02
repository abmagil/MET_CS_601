<?php
	$mysqli = new mysqli("127.0.0.1", "root", "joe81", "mysql");
	
	if ( $mysqli->errno ) {
		
		echo "Unable to connect to the database.";
		die();
		
	} else {
		
		$mysqli->close();
		echo "Connection Test Succeeded";
		
	}
?>