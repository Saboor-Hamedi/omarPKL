<?php

require_once "../../vendor/autoload.php";
require_once "../config/config.php";
use AIS\database\database;
$db = new database("localhost", "admin", "saboor123", "thesis");
$recommendationId = "";
$activeRecommendationLetter = "";
$recommendationOption  = "";
if (!empty($_POST)) {
    $recommendationId = mysqli_real_escape_string($db->link, $_POST['recommendationId']);
    $activeRecommendationLetter = mysqli_real_escape_string($db->link, $_POST['activeRecommendationLetter']);
    $recommendationOption = mysqli_real_escape_string($db->link, $_POST['recommendationOption']);
    $sql = 'INSERT INTO 
        recommendationletter (nim,description,lettertype) 
                             VALUES ("' . $recommendationId . '"
                            ,"' . $activeRecommendationLetter . '"
                            ,"' . $recommendationOption . '"
                            )';
    if (mysqli_query($db->link, $sql)) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "" . mysqli_error($db->link);
    }
}
