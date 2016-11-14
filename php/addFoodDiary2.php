<?php
$servername = "mysql1.cs.clemson.edu";
$username = 'EoE_bihc';
$password = '563300jun@119';
$dbname = "EoE_1vku";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 

		$patientID = $_REQUEST["patientID"];
		$time = $_REQUEST["time"];
		$inputPerson = $_REQUEST["inputPerson"]; 
		$image = $_REQUEST["image"];
		$location = $_REQUEST["location"];
		$meal = $_REQUEST["meal"]; 
		$partner = $_REQUEST["partner"]; 
		$feelBefore = $_REQUEST["feelBefore"]; 
		$feelAfter = $_REQUEST["feelAfter"];
		$worry = $_REQUEST["worry"];



$sql = "INSERT INTO foodDiary (patientID,time, inputPerson,image,location,meal,partner,feelBefore,feelAfter,worry)
 VALUES('$patientID','$time', '$inputPerson', '$image', '$location', '$meal', '$partner', '$feelBefore', '$feelAfter', '$worry')";


if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
