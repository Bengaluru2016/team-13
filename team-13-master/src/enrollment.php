<!-- Script used to enroll a student into schools -->
<?php
	try
	{
		// including the connection script
		include "./include/connection.php";
		//Receiving values from the enrollment form
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
		$document_type = $_POST['document_type'];
		$document_id = $_POST['document_id'];
        $sql = "INSERT INTO student (name, dob, gender) VALUES (:name, :dob, :gender)";
        // prepare query statement and bind the parameters
    	$stmt = $conn->prepare($sql);
    	$stmt->bindParam(':name', $name);
	    $stmt->bindParam(':dob', $dob);
	    $stmt->bindParam(':gender', $gender);
	    //execute the statement
	    $stmt->execute();
	    $sql = "SELECT student_id FROM student WHERE name=:name and dob = :dob and gender = :gender";
	    $stmt = $conn->prepare($sql);
    	$stmt->bindParam(':name', $name);
	    $stmt->bindParam(':dob', $dob);
	    $stmt->bindParam(':gender', $gender);
	    $stmt->execute();
	    $student_id = $stmt->fetchColumn();
	    $sql = "INSERT INTO relative_details (student_id,name,family_income,mobile) VALUES (:student_id,:name,:family_income,:mobile)";
	    // prepare query statement and bind the parameters
	    $stmt = $conn->prepare($sql);
	    $stmt->bindParam(':student_id',$student_id);
	    $stmt->bindParam(':name', $relative_name);
	    $stmt->bindParam(':family_income',$family_income);
	    $stmt->bindParam(':mobile',$relative_mobile);
	    //execute the statement
	    $stmt->execute();
	    $sql = "INSERT INTO student_contact_details (student_id,mobile,pincode,city,state) VALUES (:mobile,:pincode,:city,:state)";
	    // prepare query statement and bind the parameters
	    $stmt = $conn->prepare($sql);
	    $stmt->bindParam(':student_id',$student_id)
	    $stmt->bindParam(':mobile', $student_mobile);
	    $stmt->bindParam(':pincode',$pincode);
	    $stmt->bindParam(':city',$city);
	    $stmt->bindParam(':state',$state);
	    //execute the statement
	    $stmt->execute();
	    $sql = "INSERT INTO documents_collected (student_id,document_type,document_id) VALUES (:student_id,:document_type,:document_id)";
	    // prepare query statement and bind the parameters
	    $stmt = $conn->prepare($sql);
	    $stmt->bindParam(':student_id',$student_id);
	    $stmt->bindParam(':document_type', $document_type);
	    $stmt->bindParam(':document_id',$document_id);
	    //execute the statement
	    $stmt->execute();
	}
	catch(PDOException $e)
	{
		echo "Error: " . $e->getMessage();
	}
?>