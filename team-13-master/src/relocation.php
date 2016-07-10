<?php
	if(isset($_SESSION['role'])){
		function connectDatabse(){
			//server name
			$servername="localhost";
			//Database Name
			$dbname = "CFG";
			//mysql username
			$username = "root";
			//mysql password
			$password = "saurabh@3295";

			$conn = mysqli_connect($servername, $username, $password, $dbname);
			if(!$conn){
				echo "Error Connection!!";
				return false;
			}
			return $conn;
		}
		
		$conn = connectDatabse();

		if($conn){
			$mobile = $_GET['mobile'];
			$pincode = $_GET['pincode'];
			$state = $_GET['state'];
			$city = $_GET['city'];
			$schoolId = $_GET['schoolId'];
			$query = "UPDATE TABLE Student_Contact_Details SET Mobile = $mobile, Pin_Code = $pincode, State = $state, $City = $city";
			echo $query;
			//mysqli_query($conn, $query) or die("Could not execute query1");
			$query = "UPDATE TABLE Student School_ID = $schoolId";
			echo $query;
			//mysqli_query($conn, $query) or die("Could not execute query2");
			$query = "UPDATE TABLE Location_History End_Date = $date = date('Y-m-d H:i:s') WHERE End_Date GT = '30-12-9999'";
			echo $query;
			//mysqli_query($conn, $query);
		}
	}
	else{
		header("Location: home.html");
	}
?>