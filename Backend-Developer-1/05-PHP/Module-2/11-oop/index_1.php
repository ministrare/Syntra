<?php

require_once 'db_connect.class.php';


$conn = new db_connect_alternative;


$conn->host = 'localhost';
$conn->setDB('tasks');

echo $conn->host."<br>";
echo $conn->getDB();