<?php

$config = parse_ini_file('configs/db.ini');
if(is_array($config)){
    $link = mysqli_connect($config['host'], $config['username'], $config['password'], $config['dbname']);
    
    if(mysqli_connect_errno()){
        echo 'connection failed' . mysqli_connect_error();
        exit();
    }
    
}