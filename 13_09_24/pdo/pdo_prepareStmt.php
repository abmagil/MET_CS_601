<!doctype html>
<html>
 <head>
  <title>PDO Example</title>
 </head>
 <body>
   <?php

$host = "127.0.0.1";
$dbname = "metcs";
$user = "root";
$pass = "joe81";

try {      
  $db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);   

  $statement = $db->prepare("insert into users(email, password) values (aes_encrypt(?, 'key'), aes_encrypt(?, 'key'))");

  $email = "test2@test.edu";
  $pswd = "test";

  $statement->bindParam(1, $email);
  $statement->bindParam(2, $pswd);

  $affected = $statement->execute();

  echo "Affected count: " . $affected;

}  
catch(PDOException $e) {  
    echo "error: " + $e->getMessage();  
}
?>
</body>
</html>
