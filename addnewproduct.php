<?php
header('Content-Type: application/json');
require 'connection.php';

$title = filter_input(INPUT_POST, 'title');
$price = filter_input(INPUT_POST, 'price');
$description = filter_input(INPUT_POST, 'description');


$title = mysqli_escape_string($link, $title);
$price = mysqli_escape_string($link, $price);
$description = mysqli_escape_string($link, $description);

if(!empty($title) && !empty($price) && !empty($description)){

    if($query = mysqli_query($link, "INSERT INTO products VALUES (null, '{$title}', '{$description}', '{$price}')")){

        echo json_encode([ "status" => "ok", "msg" => "ok" ]);
    }
    
}else{
    echo json_encode([ "status" => "error", "msg" => "fill the field!" ]);
}
