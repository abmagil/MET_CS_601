<?php

$host = "127.0.0.1";
$dbname = "bank";
$user = "root";
$pass = "";

try {    
  # MySQL with PDO_MYSQL  
  $db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);   

  $affectedRowCount = $db->exec("insert into users(email, password) values (aes_encrypt('andrew.asheehan@gmail.com', 'key'), aes_encrypt('test', 'key'));"); 

  echo "Affected Row Count: " . $affectedRowCount;

}  
catch(PDOException $e) {  
    echo $e->getMessage();  
}

?>