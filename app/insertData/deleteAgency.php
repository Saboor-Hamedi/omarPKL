<?php
require_once "../../vendor/autoload.php";
require_once "../config/config.php";

use AIS\database\database;

$db = new database("localhost", "admin", "saboor123", "thesis");
$id = $_POST['id'];
$sql = "DELETE FROM agency WHERE id = " . $id;
if ($db->link->query($sql) === TRUE) {
  echo "Record deleted successfully";
  echo "deleted";
} else {
  echo "Error deleting record: " . $db->error;
}
