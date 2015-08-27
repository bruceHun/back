<?php
$dbhost_name = "localhost";
$database = "Shopping";
$username = "root";
$password = "123456";

try {
	$dbo = new PDO('mysql:host=localhost;dbname='.$database, $username, $password);
}catch (PDOException $e) {
	print "Error!: " . $e->getMessage() . "<br/>";
	die();
}
?>