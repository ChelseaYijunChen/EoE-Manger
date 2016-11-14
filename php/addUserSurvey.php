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
		$steroid = $_REQUEST["steroid"];
		$dietary = $_REQUEST["dietary"];
		$foodElimination = $_REQUEST["foodElimination"];
		$allergy_syptoms = $_REQUEST["allergy_syptoms"];
		$allergy_syptoms_food = $_REQUEST["allergy_syptoms_food"];
		$sixFood = $_REQUEST["sixFood"];
		$sixFood_food = $_REQUEST["sixFood_food"];
		$elementalDiet = $_REQUEST["elementalDiet"];
    	$exclElemental = $_REQUEST["exclElemental"];
    	$formula = $_REQUEST["formula"];
    	$foodTrial = $_REQUEST["foodTrial"];
    	$foodTrial_food = $_REQUEST["foodTrial_food"];


    
 $sql = " INSERT INTO userSurvey ( patientID, time, steroid, dietary, foodElimination, allergy_syptoms, allergy_syptoms_food, sixFood, sixFood_food, elementalDiet, 
    exclElemental, formula, foodTrial, foodTrial_food)  
    VALUES( '$patientID', '$time', '$steroid', '$dietary', '$foodElimination', '$allergy_syptoms', '$allergy_syptoms_food', '$sixFood', '$sixFood_food', '$elementalDiet', 
    '$exclElemental', '$formula', '$foodTrial', '$foodTrial_food')";



if ($conn->query($sql) === TRUE) {
    echo "New record created successfully";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
