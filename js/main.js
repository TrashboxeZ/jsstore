function appendProduct(obj) {
    $('.product-list > .row').append("<div class='col-md-4' data-id = '" + obj.id + "'><h2>" + obj.title + "</h2><p>" + obj.price + "</p><p>" + obj.description + "</p><button class='btn btn-success editProduct' data-toggle='modal' data-target='#myModal'>Edit</button>&nbsp; &nbsp;<button class='btn btn-danger removeProduct'>Delete</button></div></div>");
}

function selectProduct(iId) {

    $.post('db_proc/selectproduct.php', iId, function (res) {
        var productList = res;
        for (var product in productList) {
            var item = JSON.stringify(productList[product]);
            item = JSON.parse(item);
            console.log(item);
        }

        $('#title').val(item.title);
        $('#price').val(item.price);
        $('#description').val(item.description);
    });
};

$.post('db_proc/selectproducts.php', function (res) {

    var productList = res;

    for (var product in productList) {
        var item = JSON.stringify(productList[product]);
        item = JSON.parse(item);
        appendProduct(item);
    }
});

$('.newproduct').click(function () {
    var itemId = $(this).attr('data-id');
    var product = {
        id: itemId,
        title: $('#title').val(),
        price: $('#price').val(),
        description: $('#description').val()
    };
    
    if (itemId !== undefined) {
          $.post('db_proc/updateproduct.php', product, function (res) {
            if (res.status == "ok") {
                location.reload();
            }
        });
    }
    else{
        product.id=null;
        $.post('db_proc/addnewproduct.php', product, function (res) {

            if (res.status == "ok") {
                appendProduct(product);
            }
        });
    }
    

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

    var iId = {
        id: itemId
    }
    selectProduct(iId);
    
    $('.newproduct').attr('data-id', itemId);
});