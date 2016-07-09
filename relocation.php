<?php
	function connectDatabse(){
		//server name
		$servername="localhost";
		//Database Name
		$dbname = "myDB";
		//mysql username
		$username = "root";
		//mysql password
		$password = "password";

		$conn = mysql_connect($servername, $username, $password, $dbname);
		if(!$conn){
			echo "Error Connection!!";
			return false;
		}
		return true;
	}
	function relocate(){
		
	}

?>