<?php
/**
 * Created by PhpStorm.
 * User: minis
 * Date: 8-2-2019
 * Time: 19:14
 */

require_once 'inc/functions.php';

// Check if post is send
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    
    $task = empty($_POST['task']) ? '' : escape($_POST['task']);
    
    // Check if name !emtpy
    if(!empty($task)){
        // connect to DB
        require 'inc/db_connect.php';

        $sql = "
            INSERT INTO tasks (task, completed)
            VALUES ('$task', 0);
        ";

        // Push data into new row
        if($conn->query($sql) === true){
            // Redirect to index.php
            header('Location: index.php');
        }else{
            die('Oeps, Something went wrong!');
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
                    <input type="text" class="form-control" id="task" placeholder="Enter task" name="task">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>

<?php 
include_once 'inc/footer.php';