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

		$name = $_REQUEST["name"]; 
		$birthDate = $_REQUEST["birthDate"];
		$race = $_REQUEST["race"];
		$ethnicity = $_REQUEST["ethnicity"];
		$gender = $_REQUEST["gender"];
		$grade = $_REQUEST["grade"];
		$lengthOfDisease = $_REQUEST["lengthOfDisease"];
		$motherEducation = $_REQUEST["motherEducation"];
		$fatherEducation = $_REQUEST["fatherEducation"];
		$familyIncome = $_REQUEST["familyIncome"];

$sql = "INSERT INTO userInfo (name, birthDate, race,ethnicity, gender, grade,lengthOfDisease,motherEducation,fatherEducation,familyIncome)
 VALUES('$name', '$birthDate', '$race','$ethnicity','$gender', '$grade','$lengthOfDisease','$motherEducation','$fatherEducation','$familyIncome') ";


if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
