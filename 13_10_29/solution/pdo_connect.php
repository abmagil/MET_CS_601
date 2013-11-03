<?php

$host = "127.0.0.1";
$dbname = "metcs";
$user = "root";
$pass = "";

try {    
  # MySQL with PDO_MYSQL  
  $db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);   
}  
catch(PDOException $e) {  
    echo $e->getMessage();  
}

?>