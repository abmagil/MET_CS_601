<?php

$taxes = array(

	"MA" => 0.05,
	"NY" => 0.05,
	"CT" => 0.07,
	"NH" => 0.00,
	"VT" => 0.07,
	"ME" => 0.10,

);

print $taxes[$_GET["stateselector"]];

?>
