function appendProduct(obj) {
    $('.product-list > .row').append("<div class='col-md-3' data-id = '" + obj.id + "'><h2>" + obj.title + "</h2><p>" + obj.price + "</p><p>" + obj.description + "</p><button class='btn btn-success editProduct' data-toggle='modal' data-target='#myModal'>Edit</button>&nbsp; &nbsp;<button class='btn btn-danger removeProduct'>Delete</button></div></div>");
}

function appendPagination(obj){
    $('ul.pagination').append("<li class=><a class='page-link' href='#' data-id='"+ obj +"'>"+ obj +"</a></li>");    
}


$.get('db_proc/selectproducts.php?page=1', function (res) {
    $.each(res, function (id, obj) {
        appendProduct(obj);
    });
});

$.get('db_proc/pagination.php', function(res){
    console.log(res, typeof res);
    for(var i = 1; i <= res; i++){
        appendPagination(i);
    };
});

$('.newproduct').click(function () {
    var itemId = $(this).attr('data-id');
    var product = {
        id: itemId
        , title: $('#title').val()
        , price: $('#price').val()
        , description: $('#description').val()
    };
    $.post('db_proc/addnewproduct.php', product, function (res) {
        console.log(res);
        $.each(res, function (id, obj) {
            appendProduct(obj);
        });
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
$(document).on('click', '.removeProduct', function () {
    var itemId = $(this).parent().attr('data-id');
    var iId = {
        id: itemId
    }
    if (confirm("Вы действительно хотите удалить?")) {
        var point = this;
        $.post('db_proc/deleteproduct.php', iId, function (res) {
            if (res.status == "delete") {}
            $(point).parent().remove();
        });
    }
});
$(document).on('click', '.editProduct', function () {
    var itemId = $(this).parent().attr('data-id');
    var point = this;
    var iId = {
        id: itemId,
    }
    $.get('db_proc/selectproducts.php', iId, function (res) {
        $.each(res, function (id, obj) {
            $('#title').val(obj.title);
            $('#price').val(obj.price);
            $('#description').val(obj.description);
        });
    });
    $('.newproduct').attr('data-id', itemId);
    $('.newproduct').click(function () {
        $(point).parent().remove();
    });
});

$(document).on('click', '.page-link', function () {
  $('.product-list > .row > div').remove();
    var page = $(this).attr('data-id');
//    $(document).find('ul.pagination > li').removeClass('active');
    
    $.get('db_proc/selectproducts.php?page='+ page +"'", function (res) {
        $.each(res, function (id, obj) {
            appendProduct(obj);
        });
    });
  
    
    
    
});