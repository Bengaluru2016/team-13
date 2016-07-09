<?php
	include "connection.php";
	try
	{
		$name = $_POST['name'];
		$dob = $_POST['DOB'];
		$gender = $_POST['gender'];
		$student_mobile = $_POST['student_mobile'];
		$relative_mobile = $_POST['relative_mobile'];
		$pincode = $_POST['pincode'];
		$city = $_POST['city'];
		$state = $_POST['state'];
		$family_income = $_POST['family_income'];
		$relative_name = $_POST['relative_name'];
		$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        // prepare sql and bind parameters
        $sql = "INSERT INTO student (name, dob, gender) VALUES (:name, :dob, :gender)";
    	$stmt = $conn->prepare($sql);
    	$stmt->bindParam(':name', $name);
	    $stmt->bindParam(':dob', $dob);
	    $stmt->bindParam(':gender', $gender);
	    $stmt->execute();
	    $sql = "INSERT INTO relative_details (name,family_income,mobile) VALUES (:name,:family_income,:mobile)";
	    $stmt = $conn->prepare($sql);
	    $stmt->bindParam(':name', $relative_name);
	    $stmt->bindParam(':family_income',$family_income);
	    $stmt->bindParam(':mobile',$relative_mobile);
	    $stmt->execute();
	    $sql = "INSERT INTO student_contact_details (mobile,pincode,city,state) VALUES (:mobile,:pincode,:city,:state)";
	    $stmt = $conn->prepare($sql);
	    $stmt->bindParam(':mobile', $student_mobile);
	    $stmt->bindParam(':pincode',$pincode);
	    $stmt->bindParam(':city',$city);
	    $stmt->bindParam(':state',$state);
	    $stmt->execute();
	}
	catch(PDOException $e)
	{
		echo "Error: " . $e->getMessage();
	}
?>