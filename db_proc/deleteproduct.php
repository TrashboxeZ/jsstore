<?php
    header('Content-Type: application/json');
    require '../connection.php';

    $id = filter_input(INPUT_POST, 'id');
    $id = mysqli_escape_string($link, $id);

    if($query = mysqli_query($link,"DELETE FROM products WHERE id = {$id} ")){
         
        echo json_encode([ "status" => "delete", "msg" => "delete" ]);
        
    }    
    else{

        echo json_encode([ "status" => "error", "msg" => "not delete!" ]);

    };
