<?php
header('Content-Type: application/json');
require '../connection.php';

$title = filter_input(INPUT_POST, 'title');
$price = filter_input(INPUT_POST, 'price');
$description = filter_input(INPUT_POST, 'description');
$title = mysqli_escape_string($link, $title);
$price = mysqli_escape_string($link, $price);
$description = mysqli_escape_string($link, $description);

#SELECT id, title, description, price FROM products WHERE id = LAST_INSERT_ID();

if(!empty($title) && !empty($price) && !empty($description)){

    if($insQuery = mysqli_query($link, "INSERT INTO products VALUES (LAST_INSERT_ID(), '{$title}', '{$description}', '{$price}')")){
        if($selQuery = mysqli_query($link, "SELECT id, title, description, price FROM products WHERE id = LAST_INSERT_ID()")){
        
        $products = [];  
            
        while ($row = mysqli_fetch_assoc($selQuery)){
            $products[] = $row;
        };
            
        echo json_encode($products);
        }
      
    };
    
}else{
    echo json_encode([ "status" => "error", "msg" => "fill the field!" ]);
}
