<?php
/**
 * Created by PhpStorm.
 * User: minis
 * Date: 8-2-2019
 * Time: 19:14
 */


// connect to DB
require 'inc/db_connect.php';

// Pull all data from the table
$sql = "SELECT * FROM tasks";
$result = $conn->query($sql);

$counter = 1;

include_once 'inc/header.php';
?>

<div class="container">
    <div class="row">
        <div class="col-8 offset-2">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Task</th>
                    <th scope="col">Completed</th>
                    <th></th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <?php if($result->num_rows > 0): ?>
                    <?php while($row = $result->fetch_assoc()): ?>
                        <tr>
                            <th scope="row"><?php echo $row['task_id']; ?></th>
                            <td><?php echo $row['task']; ?></td>
                            <td><?php echo $row['completed']; ?></td>
                            <td><a href="edit.php?id=<?php echo $row['task_id']; ?>" class="btn btn-success" type="button">Edit</a></td>
                            <td><a href="delete.php?id=<?php echo $row['task_id']; ?>" class="btn btn-danger" type="button">Delete</a></td>
                        </tr>
                    <?php endwhile; ?>

                <?php endif; ?>
                </tbody>
            </table>
            <a href="add.php">Voeg een nieuwe toe</a>
        </div>
    </div>
</div>

<?php
include_once 'inc/footer.php';
