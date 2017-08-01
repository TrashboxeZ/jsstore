<?php
    header('Content-Type: application/json');
    require '../connection.php';

    if($query = mysqli_query($link,'SELECT id, title, description, price FROM products')){
        
        $products = [];
        
        while ($row = mysqli_fetch_assoc($query))
        {
            
            $products[] = $row;
            
        };
    };

    echo json_encode($products);

