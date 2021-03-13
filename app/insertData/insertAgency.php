<?php

require_once "../../vendor/autoload.php";
require_once "../config/config.php";

use AIS\database\database;

$db = new database("localhost", "admin", "saboor123", "thesis");
$agencyTitle = "";
$agencyID = "";
$agencryDescription  = "";
$lengthOmonth = "";
$datepicker1 = "";
$typesofAgencyLetter = "";
if (!empty($_POST)) {
    $agencyTitle = mysqli_real_escape_string($db->link, $_POST['agencyTitle']);
    $agencyID = mysqli_real_escape_string($db->link, $_POST['agencyID']);
    $agencryDescription = mysqli_real_escape_string($db->link, $_POST['agencryDescription']);
    $lengthOmonth = mysqli_real_escape_string($db->link, $_POST['lengthOmonth']);
    $datepicker1 = mysqli_real_escape_string($db->link, $_POST['datepicker1']);
    $datepicker2 = mysqli_real_escape_string($db->link, $_POST['datepicker2']);
    $typesofAgencyLetter = mysqli_real_escape_string($db->link, $_POST['typesofAgencyLetter']);
    $sql = 'INSERT INTO 
        agency (agencytitle,student_id,agencydescription,duration, start_time,end_time,lettertype) 
                             VALUES ("' . $agencyTitle . '"
                            ,"' . $agencyID . '"
                            ,"' . $agencryDescription . '"
                            ,"' . $lengthOmonth . '"
                            , "' . $datepicker1 . '"
                            , "' . $datepicker2 . '"
                            , "' . $typesofAgencyLetter . '"  )';
    if (mysqli_query($db->link, $sql)) {
        echo "New record created successfully";
    } else {
        echo "Error: " . $sql . "" . mysqli_error($db->link);
    }
}
