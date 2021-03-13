<?php
require_once 'app/config/config.php';
use AIS\database\database;
use AIS\login\login;
require_once realpath('vendor/autoload.php');
$db = new database("localhost", "admin", "saboor123", "thesis");
$login = new login($db);

?>

<!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        



        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="public/style/style.css">
        <title>AIS</title>
    </head>
    <body>
    <script>
        if(window.history.replaceState){
            window.history.replaceState(null, null, window.location.href);
        }
    </script>