<?php /*error_reporting(E_ALL ^ E_NOTICE);*/?>

<?php

	$username = "root";
	$password = "root";
	$hostname = "localhost";
	$db = "agriext";

	try {
		$con = new PDO('mysql:host='.$hostname.';dbname='.$db, $username, $password);
	} catch (PDOException $e) {
		print "Error!: " . $e->getMessage() . "<br/>";
		die();
	}
 
?>
    