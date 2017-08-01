<?php 
    header('Content-Type: application/json');
    require '../connection.php';
   
    $id = filter_input(INPUT_POST, 'id');
    $id = mysqli_escape_string($link, $id);

    if($query = mysqli_query($link, "SELECT title, description, price FROM products WHERE id = {$id}")){

        $products = [];
        
        while ($row = mysqli_fetch_assoc($query))
        {
            
            $products[] = $row;
            
        };
    };
echo json_encode($products);
