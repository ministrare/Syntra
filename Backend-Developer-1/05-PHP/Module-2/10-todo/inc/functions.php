<?php

function escape($text){
    return htmlentities($text, ENT_QUOTES, "UTF-8");
}