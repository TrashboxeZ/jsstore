<?php
header('Content-Type: application/json');
require '../connection.php';

$id = filter_input(INPUT_POST, 'id');
$title = filter_input(INPUT_POST, 'title');
$price = filter_input(INPUT_POST, 'price');
$description = filter_input(INPUT_POST, 'description');

$id = mysqli_escape_string($link, $id);
$title = mysqli_escape_string($link, $title);
$price = mysqli_escape_string($link, $price);
$description = mysqli_escape_string($link, $description);


if(!empty($title) && !empty($price) && !empty($description)){

    if($query = mysqli_query($link, "UPDATE products SET title='{$title}', description = '{$description}', price = '{$price}' WHERE id = {$id}")){

        echo json_encode([ "status" => "ok", "msg" => "updated" ]);
    }
    
}else{
    echo json_encode([ "status" => "error", "msg" => "fill the field!" ]);
}

