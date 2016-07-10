<!-- This script is used to Connect to Database-->
<?php
	//server name
	$servername="ec2-54-169-122-182.ap-southeast-1.compute.amazonaws.com";
	//Database Name
	$dbname = "cfg";
	//mysql username
	$username = "root";
	//mysql password
	$password = "";
	$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
?>
