<?php
  $host = "127.0.0.1";
  $password = "";
  $user = "root";
  $database = "bank";
  $connection = null;

  try {
	$connection = mysql_connect($host, $user, $password);
	
	if ( !$connection ) {
	  throw new Exception('MySQL Connection Database Error: ' . mysql_error());
    }

  } catch (Exception $e) {
    echo $e->getMessage();
    include 'system_error.php';
    exit();
  }
  /* Your database interactions here...*/
  mysql_close($connection);
?>