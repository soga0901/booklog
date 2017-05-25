$(function(e) {

  // #本棚に追加した後のhtml
  function afterAdd(addParent, review) {
    addParent.append(`
      <td class="after-add-book-area">
        <ul class="edit-tab">
          <li class="edit-tab-basic">登録情報</li>
          <li class="edit-tab-review">レビュー</li>
        </ul>
        <div class="edit-review-wapper">
          <form id="js-review-form" class="edit-review-form" action=/reviews/${review.id} accept-charset="UTF-8" method="post">
          <textarea class="edit-review-textarea" placeholder="レビューや感想を書く" rows="10" cols="50" name="review[text]"></textarea>
          <div class="edit-review-btn-area" data-id=${review.id}>
            <span class="edit-review-btn" id="js-review-btn">投稿</span>
          </div>
        </div>
      </td>`);
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
    var desc = $(this).parents('.desc')
    $.ajax({
      type: 'POST',
      url: '/book_shelves',
      dataType: 'json',
      data: {
        book_id: bookId
      }
    })
    .done(function(data) {
      $.ajax({
        type: 'POST',
        url: '/reviews',
        dataType: 'json',
        data: {
          book_id: bookId
        }
      })
      .done(function(data) {
        desc.append('\
        <div class="after-area">\
          <span class="after-add-book">登録しました</span>\
        </div>');
        $(this).remove();
        setTimeout(function(){
          desc.remove();
          afterAdd(addParent, data.review);
        },1000);
      })
      .fail(function() {
      });
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
        $.ajax({
          type: 'DELETE',
          url: '/reviews/:id',
          dataType: 'json',
          data: {
            book_id: bookId
          }
        })
      })
      .fail(function() {
        window.alert("更新に失敗");
      });
    }
    else {
      console.log("中止");
    }
  });

  // レビュー投稿
  $('.book-registration').on("click", ".edit-review-btn-area", function(e) {
    var textField = $(this).siblings(".edit-review-textarea");
    var reviewText = textField.val();
    var reviewId = $(this).data('id');
    var reviewUrl = '/reviews/' + reviewId

    $.ajax({
      type: 'PATCH',
      url: reviewUrl,
      dataType: 'json',
      data: {
        review: {
          text: reviewText
        }
      }
    })
    .done(function() {
      var addReviewMessage = ('\
                <div class="flash-message-area-text">\
                  レビューを編集しました。\
                <div>');
      $('.flash-message-area').append(addReviewMessage);
      setTimeout(function(){
        $('.flash-message-area-text').remove();
      },3000);
    })
    .fail(function() {
      window.alert("更新できませんでした");
    });
  });

  $("#book-search--header").on("click", function() {
    $("#book-search-btn-header").click();
    $("#book-search-btn-header").prop('disabled', false);
  });

  $("#book-search--body").on("click", function() {
    $("#book-search-btn-body").click();
    $("#book-search-btn-body").prop('disabled', false);
  });

});
