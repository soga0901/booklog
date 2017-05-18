$(function(e) {
  $("#book-search--header").on("click", function() {
    $("#book-search-btn-header").click();
  });

  $("#book-search--body").on("click", function() {
    $("#book-search-btn-body").click();
  });

  // 本棚追加後のタブ切り替え
  $(".edit-tab-review").on("click", function() {
    $(this).css('background-color', '#000000');
    $(this).siblings('.edit-tab-basic').css('background-color', '#FFFFFF')
  });

  $(".edit-tab-basic").on("click", function() {
    $(this).css('background-color', '#000000');
    $(this).siblings('.edit-tab-review').css('background-color', '#FFFFFF')
  });

  // 本棚に追加した後
  $(".add-book-area").on("click", function() {
    $(this).find('.add-book-btn').hide();
    $(this).find('.after-add-book').show();
    var beforeArea = $(this).parents('.desc')
    beforeArea.hide(1000);
    beforeArea.next('.after-add-book-area').show(1000);
    var bookId = $(this).parents('table').data('id');
    console.log(bookId);


    $.ajax({
      type: 'POST',
      url: '/book_shelves',
      dataType: 'json',
      data: {
        book_id: bookId
      }
    })
    .done(function() {
    })
    .fail(function() {
      window.alert("失敗");
    });

  });
});
