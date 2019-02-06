<?php
    session_start();
?>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
    <link href="css/main.css">
    <title>Login</title>
  </head>
  <body>
    
    <div class="container">
        <div class="row">
            <div class="col-8 offset-2">
                <h1 class="text-center mt-2 pt-5 pb-2">Login</h1>

                <form action="handler.php" method="POST" class="mb-3 pl-2 pr-2">
                <div class="form-group">
                    <label for="Email">Email address</label>
                    <input type="email" class="form-control" id="Email" aria-describedby="emailHelp" placeholder="Enter email" name="email">
                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                </div>
                <div class="form-group">
                    <label for="Password">Password</label>
                    <input type="password" class="form-control" id="Password" placeholder="Password" name="password">
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>

            <?php
            if(isset($_SESSION['status'])){
                echo '<div class="col-8 offset-2 alert alert-danger mt-5">';
                if($_SESSION['status'][0] === 'failed'){
                    echo "<p>".$_SESSION['status'][1]."</p>";
                }
                echo '</div>';
            }
            ?>
        </div>
    </div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <script src="script/main.js"></script>
  </body>
</html>