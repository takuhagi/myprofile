$(function(){
  $('.nav_toggle').on('click', function () {
      $('.nav_toggle, .nav').toggleClass('show');
      $('.mobile_profile').toggleClass('slide');
  });
})
$(function () { 
  setTimeout(function () {
      $(".mobile_profile").css({
          visibility: "visible"
      });
  }, 500);
});

$(function() {
  $('#all').on('click', function() {
    $("[name='check_ids[]']").prop('checked', this.checked);
  });
  
});

$(function() {
  $('.slider').slick({
      prevArrow: true,
      nextArrow: true,
      dots: false,
  });

  $(function(){
    var slick = $('#mainSlide').slick({
        appendArrows: $('#arrows'),
        autoplay: true,
        autoplaySpeed: 4000,
        speed: 800
    });
  });
});

// $(function() {
//   $('#all').on('click',function(){
//     var $count = $("input[type=checkbox]:checked").length;
//     var $not = $('input[type=checkbox]').not(':checked')
//     if($count >= 3) {
//         $not.attr("disabled",true);
//     }else{
//         $not.attr("disabled",false);
//     }
//   });
// });