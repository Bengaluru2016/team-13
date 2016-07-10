<?php
	/*if(!isset($_SESSION['role']) || $_SESSION['role'] != "teacher"){
		header("Location: login.php");
	}
	$teacherID = $_POST["teacherID"];*/
	$teacherID= 1000;
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
	<nav class="navbar navbar-inverse">
        <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span> 
            </button>
            <a class="navbar-brand" href="http://samridhdhi.org/">Samridhdhi</a>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#" onclick="showStudents()">Attendance</a></li>
                <li><a href="MarksAndBehaviour.php">Marks and Behaviour</a></li>
                <li><a href="#">Success Stories</a></li> 
                <li><a href="#">Partners</a></li> 
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span> Welcome, Teacher</a></li>
                <li><a href="logout.php"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
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