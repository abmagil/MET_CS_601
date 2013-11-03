<?php
session_start();

$keys = array_keys($_POST);
//NOTE: This might be vulnerable, as there isn't any sort of whitelist
foreach ($keys as $key) {
	$keystripped = str_replace('"', '', $key);
	$keystripped = str_replace('_', ' ', $keystripped);
	$_SESSION[$keystripped] = str_replace('"', '', $_POST[$key]);
}
?>