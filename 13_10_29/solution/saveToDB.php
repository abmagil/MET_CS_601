<?php
	session_start();
	require_once "pdo_connect.php";
	
	$name = $_SESSION['fullName'];
	$state = $_SESSION['state'];
	$email = $_SESSION['address'];
	
	$sql = "Insert into registration2(full_name, email, state) VALUES('$name','$email', '$state')"; #had to rename because my mysql was broken.
  	try{
  		$pdoStmnt = $db->query($sql);
	} catch (PDOException $e) {
		echo "FAIL";
		return;
	}
	echo "PASS"; 
?>