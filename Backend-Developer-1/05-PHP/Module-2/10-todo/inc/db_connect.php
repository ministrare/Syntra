<?php
/**
 * Created by PhpStorm.
 * User: minis
 * Date: 8-2-2019
 * Time: 19:17
 */

// connect to DB
$host = "localhost";
$dbname = "todo2";
$username = "root";
$password = "";

$conn = new mysqli($host, $username, $password, $dbname);

if($conn->connect_error){
    die("Connection failed: " . $conn->connect_error);
}