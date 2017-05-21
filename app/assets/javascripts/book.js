$(function(e) {

  // #本棚に追加した後のhtml
  function afterAdd(addParent) {
    addParent.append('\
      <td class="after-add-book-area">\
        <ul class="edit-tab">\
          <li class="edit-tab-basic">登録情報</li>\
          <li class="edit-tab-review">レビュ ｜</li>\
        </ul>\
        <div id="edit-area">\
          <div class="edit-basic-wrapper">\
            <div id="edit-status-area">\
            </div>\
          </div>\
        </div>\
      </td>');
    var addSiblings = addParent.siblings('.td-item');
    addSiblings.find('.delete-btn-area').append('<span class="book-delete-btn">✕</span>');
  }

  function afterDelete(registrationArea) {
    registrationArea.find('.after-add-book-area').remove();
      registrationArea.append('\
        <td class="desc">\
          <div class="add-book-area">\
          <span class="add-book-btn">+ 本棚に登録</span>\
          </div>\
        </td>');
  }

  // 本棚へ追加
  $(".book-registration").on("click", ".add-book-area",function() {
    var bookId = $(this).parents('table').data('id');
    var addParent = $(this).parents('.book-registration')
    var desc =$(this).parents('.desc')
    desc.append('\
      <div class="after-area">\
        <span class="after-add-book">登録しました</span>\
      </div>');;
     $(this).remove();
     setTimeout(function(){
      desc.remove();
      afterAdd(addParent);
    },1000);

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
      window.alert("本棚へ追加できませんでした。");
    });
  });

  // 本棚から削除
  $(".book-prof").on("click", ".book-delete-btn",function() {
    var bookId = $(this).parents('table').data('id');
    var bookTitle = $(this).parents('table').data('title');

    if(window.confirm('「' + bookTitle + '」を本棚から削除してもよろしいですか？')) {
      var registrationArea = $(this).parents('#book-information-area').find('.book-registration');
      $(this).remove();

      $.ajax({
        type: 'DELETE',
        url: '/book_shelves/:id',
        dataType: 'json',
        data: {
          book_id: bookId
        }
      })
      .done(function() {
        afterDelete(registrationArea)
        var flashMessage = ('\
                <div class="flash-message-area-text">\
                  本棚から削除しました。\
                <div>');
        $('.flash-message-area').append(flashMessage);
        setTimeout(function(){
          $('.flash-message-area-text').remove();
        },3000);
      })
      .fail(function() {
        window.alert("更新に失敗");
      });
    }
    else {
      console.log("中止");
    }
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

  $("#book-search--header").on("click", function() {
    $("#book-search-btn-header").click();
  });

  $("#book-search--body").on("click", function() {
    $("#book-search-btn-body").click();
  });

});
