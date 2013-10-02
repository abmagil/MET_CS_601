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
 
    $db = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);   
    $all_users = $db->query("select aes_decrypt(email, 'key') email, aes_decrypt(password, 'key') password from users");

  ?>

  <table cellspacing='0' cellpadding='0' border='1'>
   <tr>
	 <th>Account</th>
	 <th>Password</th>
   </tr>
   <?php foreach ($all_users as $user)  : ?>
      <tr>
	   <td><?php echo $user['email']    ?> </td>
	   <td><?php echo $user['password'] ?> </td>
	  </tr>
   <?php endforeach; ?>
  
  </table>
</body>
</html>
