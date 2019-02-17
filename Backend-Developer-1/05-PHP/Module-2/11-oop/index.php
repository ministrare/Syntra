<?php

require_once 'HTML5template.class.php';
require_once 'db.class.php';

$oHomepage = new HTML5template('Welkom op onze homepage!');
$db = new db();

$db->getAllData('tasks');
$db->getDataById('tasks', 1);

?>


<div class="container">
    <div class="row">
        <div class="col-12">
            Hier komt mijn main text te staan
        </div>
    </div>
</div>

