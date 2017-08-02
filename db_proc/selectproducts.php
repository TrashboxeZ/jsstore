<?php
    header('Content-Type: application/json');
    require '../connection.php';

    $id = filter_input(INPUT_GET, 'id');
    $id = mysqli_escape_string($link, $id);
    $sql = "SELECT id, title, description, price FROM products";

    if(!empty($id)){
        $sql .= "WHERE id = $id";
    }

    if($query = mysqli_query($link,$sql)){
        
        $products = [];
        
        while ($row = mysqli_fetch_assoc($query))
        {
            
            $products[] = $row;
            
        };
    };

    echo json_encode($products);

