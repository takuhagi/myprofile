$(function(){
  $('.nav_toggle').on('click', function () {
      $('.nav_toggle, .nav').toggleClass('show');
      $('.mobile_profile').toggleClass('slide');
  });
})

$(function() {
  $('#all').on('click', function() {
    $("[name='check_ids[]']").prop('checked', this.checked);
  });
  
});