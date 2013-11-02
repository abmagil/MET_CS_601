<?php
session_start();

$keys = array_keys($_POST);
//NOTE: This is vulnerable, as there isn't any sort of whitelist, so theoretically, it's vulnerable to attack from client side
foreach ($keys as $key) {
	$_SESSION[$key] = $_POST[$key];
}
?>