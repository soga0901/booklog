$(function() {
  function buildNewBtn(review) {
    var newBtn = (`<a href="/reviews/${ review.id }/edit"><span class="write-review-btn">レビューを書く</span></a>`);
    return newBtn;
  }
  $(".add-shelf-btn").on('click', function() {
    var bookId = $(this).data('id');
    var btnParent = $(this).parents('.review-add-shelf');
    $(this).remove();
    $.ajax({
      type: 'POST',
      url: '/book_shelves',
      dataType: 'json',
      data: {
        book_id: bookId
      }
    })
    .done(function() {
      $.ajax({
      type: 'POST',
      url: '/reviews',
      dataType: 'json',
      data: {
        book_id: bookId
        }
      })
      .done(function(data) {
        var newBtn = buildNewBtn(data.review);
        btnParent.append(newBtn);
      })
      .fail(function() {
      });
    })
    .fail(function() {
      window.alert("本棚へ追加できませんでした。");
    });
  });
});