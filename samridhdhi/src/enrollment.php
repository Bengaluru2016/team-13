<!-- Script used to enroll a student into schools -->
<?php
	try
	{
		// including the connection script
		include "connection.php";
		//Receiving values from the enrollment form
		$name = $_POST['sname'];
		$dob = $_POST['DOB'];
		$gender = "M";
		$student_mobile = $_POST['student_mobile'];
		$relative_mobile = $_POST['relative_mobile'];
		$pincode = $_POST['pincode'];
		$city = $_POST['city'];
		$state = $_POST['state'];
		$family_income = $_POST['family_income'];
		$relative_name = $_POST['relative_name'];
        $sql = "INSERT INTO student (name, dob, gender) VALUES (:name, :dob, :gender)";
        // prepare query statement and bind the parameters
    	$stmt = $conn->prepare($sql);
    	$stmt->bindParam(':name', $name);
	    $stmt->bindParam(':dob', $dob);
	    $stmt->bindParam(':gender', $gender);
	    //execute the statement
	    $stmt->execute();
	    $sql = "INSERT INTO relative_details (name,family_income,mobile) VALUES (:name,:family_income,:mobile)";
	    // prepare query statement and bind the parameters
	    $stmt = $conn->prepare($sql);
	    $stmt->bindParam(':name', $relative_name);
	    $stmt->bindParam(':family_income',$family_income);
	    $stmt->bindParam(':mobile',$relative_mobile);
	    //execute the statement
	    $stmt->execute();
	    $sql = "INSERT INTO student_contact_details (mobile,pincode,city,state) VALUES (:mobile,:pincode,:city,:state)";
	    // prepare query statement and bind the parameters
	    $stmt = $conn->prepare($sql);
	    $stmt->bindParam(':mobile', $student_mobile);
	    $stmt->bindParam(':pincode',$pincode);
	    $stmt->bindParam(':city',$city);
	    $stmt->bindParam(':state',$state);
	    //execute the statement
	    $stmt->execute();
	}
	catch(PDOException $e)
	{
		echo "Error: " . $e->getMessage();
	}
?>