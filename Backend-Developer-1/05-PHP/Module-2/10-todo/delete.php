<?php

// checks if GET variable has any value, 
// Ifso use value in $id, ifnot, set with empty string
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : "" ;

// checks if id is not empty
if($id !== ""){
    // Connects to DB
    include "inc/db_connect.php";

    // Create query for the database to excute and use ID from the URL parameters
    $sql = "
        DELETE FROM tasks
        WHERE task_id = $id;
    ";

    // Execute the query in the database
    $result = $conn->query($sql);    
}

// returns user to the index.php
header('Location: index.php');