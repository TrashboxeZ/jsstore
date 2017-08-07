<?php

require './connection.php' ;


    $num = 6;
    $page = filter_input(INPUT_GET, 'page');
    $page = mysqli_escape_string($link, $page);
    $activePage = $page;
    

    if($query = mysqli_query($link,"SELECT count(id) FROM products")){
        $count = mysqli_fetch_row($query);
        ///колво страниц
        $count = $count[0];
        $total = intval(($count-1) / $num)+1;
        echo $total;
        $page = ($page - 1) * $num;
//       var_dump($page);
        if($total > 1){
          
            $left = $activePage - 1;
            $right = $activePage + 1;
            
            if($left < 1){
                $left = 1;
            };
            if((right - 1) == $total || $right > $total){
                $right = $total;
            };
        
    
?>
   <!DOCTYPE html>
   <html lang="en">
   <head>
       <meta charset="UTF-8">
       <title>Document</title>
   </head>
   <body>
       
           <div>
           
           <span><a href="test.php?page=<?php echo $left; ?>">PREV</a></span>
           <?php for($i == 1; $i <= $total; $i++){ ?>
            
              <span><a href="test.php?page=<?php echo $i; ?>"><?php echo $i; ?></a></span>   
            <?php } ?>
           <span><a href="test.php?page=<?php echo $right; ?>">NEXT</a></span>
               
           </div>
           
         <?php };?>
     <?php };?>
   </body>
   </html>