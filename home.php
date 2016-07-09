<?php
	session_start();
	if(!isset($_SESSION['role']) || $_SESSION['role'] != "teacher"){
		header("Location: login.php");
	}
	$teacherID = $_POST["teacherID"];
	//$teacherID= 1000;
?>
<html>
	<head>
		<title>Home</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script type="text/javascript">
			(function showStudents(){
				var xhttp = new XMLHttpRequest();
	  			xhttp.onreadystatechange = function() {
	   	 			if (xhttp.readyState == 4 && xhttp.status == 200) {
	     				document.getElementById("students").innerHTML = xhttp.responseText;
	   		 		}	
	  			};
	  			xhttp.open("GET", "getStudents.php?teacherID="+<?php echo $teacherID ?>, true);
	  			xhttp.send();
	  		})();
		</script>
	</head>
	<body>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<ul class="nav navbar-nav">
					<!--<li><a href="#" class="active">Home</a></li>-->
					<li class="active"><a href="#" onclick="showStudents()">Attendance</a></li>
					<li><a href="MarksAndBehaviour.php">Marks and Behaviour</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="logout.php">Logout</a></li>
				</ul>
			</div>
		</nav>
		<form action="postAttendance.php" method="POST">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>Student Name</th>
							<th>Attendance</th>
						</tr>
					</thead>
					<tbody id="students">
						
					</tbody>
				</table>
			</div>
			<div class="container-fluid" class="align-center">
				<input type="submit" class="btn" value="Post">
			</div>
		</form>
	</body>
</html>
