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
		$q1f = $_REQUEST["q1f"]; 
		$q1s = $_REQUEST["q1s"]; 
		$q2f = $_REQUEST["q2f"]; 
		$q2s = $_REQUEST["q2s"]; 
		$q3f = $_REQUEST["q3f"];
		$q3s = $_REQUEST["q3s"]; 
		$q4f = $_REQUEST["q4f"]; 
		$q4s = $_REQUEST["q4s"];
		$q5f = $_REQUEST["q5f"]; 
		$q5s = $_REQUEST["q5s"]; 
		$q6f = $_REQUEST["q6f"]; 
		$q6s = $_REQUEST["q6s"]; 
		$q7f = $_REQUEST["q7f"]; 
		$q7s = $_REQUEST["q7s"]; 
		$q8f = $_REQUEST["q8f"]; 
		$q8s = $_REQUEST["q8s"]; 
		$q9f = $_REQUEST["q9f"]; 
		$q9s = $_REQUEST["q9s"]; 
		$q10f = $_REQUEST["q10f"]; 
		$q11f = $_REQUEST["q11f"];


$sql = "INSERT INTO peess ( patientID, time, q1f, q1s, q2f, q2s, q3f, q3s, q4f, q4s, q5f, q5s, q6f, q6s, q7f, q7s, q8f, q8s, q9f, q9s, q10f, q11f)
VALUES('$patientID', '$time', '$q1f', '$q1s', '$q2f', '$q2s', '$q3f', '$q3s', '$q4f', '$q4s','$q5f', '$q5s', '$q6f', '$q6s', '$q7f', '$q7s', '$q8f',
	'$q8s', '$q9f', '$q9s', '$q10f', '$q11f')";


if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
