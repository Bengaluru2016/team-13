<?php
	include("connection.php");
	$conn = mysqli_connect();
	$conn = mysqli_connect($servername, $username, $password, $dbname) or die("Could not connect to database");
	$size = $_POST["count"];
	for($i = 1; $i < $size;){
		$query = "INSERT INTO Attendance VALUES(".$_POST[$i + 1].", '".date('Y-m-d')."',".$_POST[$i].")";
		mysqli_query($conn,$query) or die("Could not execute query");
		$i += 2;
	}
?>
