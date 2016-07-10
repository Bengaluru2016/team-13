<?php
	//if(isset($_SESSION['role']) && $_SESSION['role'] == "teacher"){
		include("connection.php");
		$password = "root";
		echo $password."<br>";
		$teacherID = $_GET['teacherID'];
		/*$conn = mysqli_connect($servername, $username, $password, $dbname) or die("Could not connect to database");
		$query = "SELECT Student.Student_ID, Student.Name FROM Student JOIN Teacher_Ref ON Student.Student_ID = Teacher_Ref.Student_ID WHERE Teacher_Ref.Teacher_ID = $teacherID";
		$result = mysqli_query($conn, $query);*/
		if($result){
			$count = 1;
			while($row = mysqli_fetch_row($result)){
				echo "<tr>
						<td>$row[0]</td>
						<td>$row[1]</td>
						<td><select name='$count'>
								<option value='1'>Present</value>
								<option value='0'>Absent</value>
							</select>
						</td>
					</tr>
					<input type='hidden' name=";
					$count++;
					echo $count++;
					echo " value='$row[0]'>";
			}
		}
		echo "<input type='hidden' name='count' value=\"".$count."\">";
	/*}
	else{
		header("Location: login.php");
	}*/
?>