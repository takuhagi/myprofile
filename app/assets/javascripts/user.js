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

$(function() {
  $('input[class=top]').on('click',function(){
    var $count = $("input[class=top]:checked").length;
    var $not = $('input[class=top]').not(':checked')
    if($count >= 1) {
        $not.attr("disabled",true);
    }else{
        $not.attr("disabled",false);
    }
  })
});

$(function() {
  $('input[class=middle]').on('click',function(){
    var $count = $("input[class=middle]:checked").length;
    var $not = $('input[class=middle]').not(':checked')
    if($count >= 6) {
        $not.attr("disabled",true);
    }else{
        $not.attr("disabled",false);
    }
  })
});

$(function() {
  $('input[class=bottom]').on('click',function(){
    var $count = $("input[class=bottom]:checked").length;
    var $not = $('input[class=bottom]').not(':checked')
    if($count >= 4) {
        $not.attr("disabled",true);
    }else{
        $not.attr("disabled",false);
    }
  })
});
// $(function() {
//   $('input[class=bottom]').change(function(){
//     if ( $(this).is(':checked')) {
//       $('#bottom_list').append(this.value);
//     } else {
//       $('#bottom_list').empty(this.value);
//     }
//   })
// });

