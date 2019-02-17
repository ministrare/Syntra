<?php

require_once 'inc/functions.php';

// Check if post is send
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $task = empty($_POST['task']) ? '' : escape($_POST['task']);
    $id = empty($_POST['id']) ? '' : escape($_POST['id']);
    
    // Check if name !emtpy
    if(!empty($task)){
        // connect to DB
        require 'inc/db_connect.php';

        $sql = "
            UPDATE tasks 
            SET task = '$task', completed = 0
            WHERE task_id = $id;
        ";

        //die($sql);

        // Push data into new row
        if($conn->query($sql)){
            // Redirect to index.php
            header('Location: index.php');
        }else{
            die('Oeps, Something went wrong!');
        }
    }
}


// checks if GET variable has any value, 
// Ifso use value in $id, ifnot, set with empty string
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : "" ;

$oldTask = '';

// checks if id is not empty
if($id !== ""){
    // Connects to DB
    include "inc/db_connect.php";

    // Create query for the database to execute and use ID from the URL parameters
    $sql = "
        SELECT * FROM tasks
        WHERE task_id = $id;
    ";

    // Execute the query in the database
    $result = $conn->query($sql);  
    
    // Check if result has more then 1 row
    if($result->num_rows > 0){
        // Loop over the data (row) and store data in variable
        while($row = $result->fetch_assoc()){
            $oldTask = $row['task'];
        }
    }
}


include_once 'inc/header.php';
?>

<div class="container">
    <div class="row">
        <div class="col-8 offset-2">
        <h1 class="text-center">Add a new task</h1>
            <form action="" method="POST">
                <div class="form-group">
                    <label for="task">To do Task</label>
                    <input type="text" class="form-control" id="task" placeholder="Enter task" name="task" value="<?php echo $oldTask; ?>">
                    <input type="hidden" name="id" value="<?php echo $id; ?>">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>

<?php 
include_once 'inc/footer.php';