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

  $statement = $db->prepare("insert into users(email, password) values (aes_encrypt(:email, 'key'), aes_encrypt(:pswd, 'key'))");

  $email = "test@test.edu";
  $pswd = "test";

  $statement->bindParam(":email", $email, PDO::PARAM_STR);
  $statement->bindParam(":pswd", $pswd, PDO::PARAM_STR);

  $affected = $statement->execute();

  echo "Affected count: " . $affected;

}  
catch(PDOException $e) {  
    echo "error: " + $e->getMessage();  
}
?>
</body>
</html>
