<?php

var_dump($_POST);
include_once 'functions.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST')
{
    session_start();

    $postEmail = isset($_POST['email']) ? $_POST['email'] : "";
    $postPassword = isset($_POST['password']) ? $_POST['password'] : "";

    $username = "admin@site.be";
    $password = "password";

    $user = array(
        array('admin@site.be', 'password'),
        array('admin@site.be', 'password'),
        array('admin@site.be', 'password')
    );

    $result = checkUserExcists($user, $postEmail, $postPassword);

    if($result[0]){
        relocator("welcome.php");
    }
/*
    if($postEmail === $username && $postPassword === $password){
        relocator("welcome.php");
    }elseif($postEmail !== $username){
        $_SESSION['status'] = array("failed","Username incorrect!");
        relocator("index.php");
    }else{
        $_SESSION['status'] = array("failed","Password incorrect!");
        relocator("index.php");
    }

*/



}
    

relocator("index.php");


function checkUserExcists($userData, $userInputEmail, $userInputPass){

    $excists = array(false, 'no value found!');

    foreach ($userData as $key => $value) {
        if($value[0] === $userInputEmail && $value[1] === $userInputPass){
            $excists = array(true, 'Found a record!');
            break;
        }

        if($value[0] === $userInputEmail && $value[1] !== $userInputPass){
            $excists = array(false, 'Password unknown!');
            break;
        }

        if($value[0] !== $userInputEmail && $value[1] === $userInputPass){
            $excists = array(false, 'User unknown!');
            break;
        }
    }

    return $excists;
}