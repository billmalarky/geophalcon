<?php
/**
 * This creates the geophalcon user and related database
 */

$db = new PDO('mysql:host=127.0.0.1;', 'root', '');

//Create user
$query = $db->prepare("CREATE USER 'geophalcon'@'localhost' IDENTIFIED BY 'geophalcon'");
$result = $query->execute();

//Give all permissions
$query = $db->prepare("GRANT ALL PRIVILEGES ON * . * TO 'geophalcon'@'localhost'");
$result = $query->execute();


//Create DB
$query = $db->prepare("CREATE DATABASE geophalcon");
$result = $query->execute();
