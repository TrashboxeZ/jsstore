<?php
    header('Content-Type: application/json');
    require '../connection.php';

$num = 2;
$limit = filter_input(INPUT_GET, 'limit');
$limit = mysqli_escape_string($link, $limit);

if($query = mysqli_query($link,"SELECT count(id) FROM products")){
    $count = mysqli_fetch_row($query);
     ///колво страниц
     $count = $count[0];
     $total = intval(($count-1) / $num)+1;
     echo $total;
     
 } 




//
//    $id = filter_input(INPUT_GET, 'id');
//    $id = mysqli_escape_string($link, $id);
//    $sql = "SELECT id, title, description, price FROM products";
//    
//    $limit = filter_input(INPUT_GET, 'limit');
//    $limit = mysqli_escape_string($link, $limit);
//
//    if(!empty($id)){
//        $sql .= " WHERE id = $id LIMIT {$limit}";
//    }
//    if(!empty($limit)){
//        $sql.= " LIMIT {$limit}";
//    }    
//
//    if($query = mysqli_query($link,$sql)){
//        $products = [];
//        $count = mysqli_num_rows($query);
//        echo $count;
//        
//        while ($row = mysqli_fetch_assoc($query))
//        {
//            
//            $products[] = $row;
//            
//        };
//    };
//    echo json_encode($products);
//
