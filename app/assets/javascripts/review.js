$(function() {
  $('.edit-tab-delete').on('click', function() {
    $(this).addClass('active');
    $(this).removeClass('edit-tab');
    var changeTab = $(this).siblings('.active');
    changeTab.addClass('edit-tab');
    changeTab.removeClass('active')
    $('#tab1').hide();
    $('#tab4').show();
  });

  $('.edit-tab-review').on('click', function() {
    $(this).addClass('active');
    $(this).removeClass('edit-tab');
    var changeTab = $(this).siblings('.active');
    changeTab.addClass('edit-tab');
    changeTab.removeClass('active')
    $('#tab4').hide();
    $('#tab1').show();
  });
});
