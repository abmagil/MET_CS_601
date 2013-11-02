<?php
session_start();
$keys = array_keys($_POST);
foreach($keys as $key) {
	unset($_SESSION[$key]);
	print $key;
}

?>
