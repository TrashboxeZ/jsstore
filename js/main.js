function appendProduct (obj) {
    $('.product-list > .row').append("<div class='col-md-4' data-id='" + obj.id + "'><h2>" + obj.title + "</h2><p>" + obj.price + "</p><p>" + obj.description + "</p><button class='btn btn-success editProduct' data-toggle='modal' data-target='#myModal'>Edit</button>&nbsp; &nbsp;<button class='btn btn-danger removeProduct'>Delete</button></div></div>" );
}

var productsList = sessionStorage;

for(var product in productsList){
    var item = JSON.parse(productsList[product]);
    appendProduct(item);
}

$('.newproduct').click(function () {
    
    var product = {
        title: $('#title').val(),
        price: $('#price').val(),
        description: $('#description').val()
    };
    
    $.post('/addnewproduct.php', product, function (res) {
        console.log(res);
        if(res.status == "ok"){
            appendProduct(product);
        }
        
    });
    
    $('#title').val('');
    $('#price').val('');
    $('#description').val('');
    
    $('#myModal').modal('hide');
});

$('.addProduct').click(function () {
    $('#title').val('');
    $('#price').val('');
    $('#description').val('');
    
    $('.newproduct').removeAttr('data-id');
});


$(document).on('click', '.removeProduct' ,function () {
    var itemId = $(this).parent().attr('data-id');
    if(confirm("Вы действительно хотите удалить?")){
        sessionStorage.removeItem(itemId);
        $(this).parent().remove();
    }
});

$(document).on('click', '.editProduct' ,function () {
    var itemId = $(this).parent().attr('data-id');
    var item = JSON.parse(sessionStorage.getItem(itemId));
    
    $('#title').val(item.title);
    $('#price').val(item.price);
    $('#description').val(item.description);
    
    $('.newproduct').attr('data-id', itemId);
});