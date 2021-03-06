<?php
header('Content-Type: application/json');
require '../connection.php';

$title = filter_input(INPUT_POST, 'title');
$price = filter_input(INPUT_POST, 'price');
$description = filter_input(INPUT_POST, 'description');
$title = mysqli_escape_string($link, $title);
$price = mysqli_escape_string($link, $price);
$description = mysqli_escape_string($link, $description);

$id = filter_input(INPUT_POST, 'id');
$id = mysqli_escape_string($link, $id);

if(!empty($title) && !empty($price) && !empty($description)){
    
    # Обновление БД
    if(!empty($id)){
        
         if($query = mysqli_query($link, "UPDATE products SET title='{$title}', description = '{$description}', price = '{$price}' WHERE id = {$id}")){

            echo json_encode([[ "id" => "{$id}", "title" => "{$title}", "description" => "{$description}", "price" => "{$price}"]]);
        }
    }else{
    # Вставка в БД
        if($insQuery = mysqli_query($link, "INSERT INTO products VALUES (LAST_INSERT_ID(), '{$title}', '{$description}', '{$price}')")){
            if($selQuery = mysqli_query($link, "SELECT id, title, description, price FROM products WHERE id = LAST_INSERT_ID()")){

            $products = [];  

            while ($row = mysqli_fetch_assoc($selQuery)){
                $products[] = $row;
            };

            echo json_encode($products);
            }

        };

    };
}
else{
    echo json_encode([ "status" => "error", "msg" => "fill the field!" ]);
}
