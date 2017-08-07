<?php
    header('Content-Type: application/json');
    require '../connection.php';

    $num = 8;
    $page = filter_input(INPUT_GET, 'page');
    $page = mysqli_escape_string($link, $page);

    


    if($query = mysqli_query($link,"SELECT count(id) FROM products")){
        $count = mysqli_fetch_row($query);
        ///колво страниц
        $count = $count[0];
        $total = intval(($count-1) / $num)+1;
        echo $total;
        $page = ($page - 1) * $num;
    }; 
