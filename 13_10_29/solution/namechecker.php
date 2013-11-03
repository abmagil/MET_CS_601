<?php
	require_once "pdo_connect.php";
	
	$name = strtolower($_GET['fullName']);
	$sql = "select * from registration where full_name = '" . $name . "'";
  	$pdoStmnt = $db->query($sql);
	
	if ($pdoStmnt->rowCount() == 0) {
		echo "NAME_DOES_NOT_EXIST";
	} 
	else {
		echo "NAME_EXISTS";
	} 
?>
