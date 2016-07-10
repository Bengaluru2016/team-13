<?php
	if(isset($_SESSION['role']) && $_SESSION['role'] == "communityMobilizer"){
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
			$studentID = $_GET['Student_ID'];
			$mobile = $_GET['mobile'];
			$pincode = $_GET['pincode'];
			$state = $_GET['state'];
			$city = $_GET['city'];
			$schoolId = $_GET['schoolId'];
			$query = "UPDATE Student_Contact_Details SET Mobile = $mobile, Pincode = $pincode, State = '$state', City = '$city' WHERE Student_ID = $studentID";
			mysqli_query($conn, $query) or die("Could not execute query1");
			$query = "UPDATE Student SET School_ID = $schoolId WHERE Student_ID = $studentID";
			mysqli_query($conn, $query) or die("Could not execute query2");
			$query = "UPDATE Location_History SET End_Date = '".date('Y-m-d')."' WHERE End_Date >= '9999-12-30'";
			mysqli_query($conn, $query) or die("Could not execute query 3");
			$query = "INSERT INTO Location_History VALUES ($studentID,'$city','".date('Y-m-d')."','9999-12-30')";
			mysqli_query($conn, $query) or die("Could not execute query 4");
		}
	}
	else{
		header("Location: home.html");
	}
?>