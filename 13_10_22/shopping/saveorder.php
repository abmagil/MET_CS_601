<?php
session_start();

foreach ($_SESSION as $key => $value) {
	echo var_dump($value).'<br/>';	#Tell me what you want me to do here and I'll do it.  For instance, could easily print out "you ordered N of the X bouquet"
}

foreach ($_GET as $key => $value) {
	echo $key." saved as ".$value."<br/>"; # Similarly, could easily respond with "Thank you for ordering, NAME"
}

?>