<?php
/**
 * Created by PhpStorm.
 * User: minis
 * Date: 9-1-2019
 * Time: 20:03
 */

$file = "playlist.txt";

if($_SERVER['REQUEST_METHOD'] == 'POST'){

    $name = $_POST['inp_name'];
    $email = $_POST['inp_email'];

    $song_artist_1 = $_POST['song_artist_1'];
    $song_title_1 = $_POST['song_title_1'];

    $song_artist_2 = $_POST['song_artist_2'];
    $song_title_2 = $_POST['song_title_2'];

    $song_artist_3 = $_POST['song_artist_3'];
    $song_title_3 = $_POST['song_title_3'];


    $song1 = array(
        "artist" => $song_artist_1,
        "title" => $song_title_1
    );

    $song2 = array(
        "artist" => $song_artist_2,
        "title" => $song_title_2
    );

    $song3 = array(
        "artist" => $song_artist_3,
        "title" => $song_title_3
    );

    $array = array(
        "name" => $name,
        "email" => $email,
        "songs" => array(
            1 => $song1,
            2 => $song2,
            3 => $song3
        ),
    );

    file_put_contents($file, serialize($array), FILE_APPEND | LOCK_EX);
}

$recoveredData = file_get_contents($file);
$recoveredArray = unserialize($recoveredData);

var_dump($recoveredArray);