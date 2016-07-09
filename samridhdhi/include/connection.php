<!-- This script is used to Connect to Database-->
<?php
	//server name
	$servername="localhost";
	//Database Name
	$dbname = "cfg";
	//mysql username
	$username = "root";
	//mysql password
	$password = "password";
	$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>
