$(function(){
  $('.store-side-show').click(() => {
    $('.priority-store-profiles').show();
    $('.store-side-show').hide();
    $('.store-side-hide').show();
  })
  $('.store-side-hide').click(() => {
    $('.priority-store-profiles').hide();
    $('.store-side-show').show();
    $('.store-side-hide').hide();
  })
});

$(function(){
  $('.item-side-show').click(() => {
    $('.priority-item-profiles').show();
    $('.item-side-show').hide();
    $('.item-side-hide').show();
  })
  $('.item-side-hide').click(() => {
    $('.priority-item-profiles').hide();
    $('.item-side-show').show();
    $('.item-side-hide').hide();
  })
});

$(function(){
  $('.service-side-show').click(() => {
    $('.priority-service-profiles').show();
    $('.service-side-show').hide();
    $('.service-side-hide').show();
  })
  $('.service-side-hide').click(() => {
    $('.priority-service-profiles').hide();
    $('.service-side-show').show();
    $('.service-side-hide').hide();
  })
});

$(function(){
  $('.event-side-show').click(() => {
    $('.priority-event-profiles').show();
    $('.event-side-show').hide();
    $('.event-side-hide').show();
  })
  $('.event-side-hide').click(() => {
    $('.priority-event-profiles').hide();
    $('.event-side-show').show();
    $('.event-side-hide').hide();
  })
});

$(function(){
  $('.all-side-show').click(() => {
    $('.priority-store-profiles').show();
    $('.priority-item-profiles').show();
    $('.priority-service-profiles').show();
    $('.priority-event-profiles').show();
    
    $('.store-side-show').hide();
    $('.item-side-show').hide();
    $('.service-side-show').hide();
    $('.event-side-show').hide();

    $('.store-side-hide').show();
    $('.item-side-hide').show();
    $('.service-side-hide').show();
    $('.event-side-hide').show();
  })

$(function(){
  $('.all-side-hide').click(() => {
    $('.priority-store-profiles').hide();
    $('.priority-item-profiles').hide();
    $('.priority-service-profiles').hide();
    $('.priority-event-profiles').hide();
    
    $('.store-side-show').show();
    $('.item-side-show').show();
    $('.service-side-show').show();
    $('.event-side-show').show();

    $('.store-side-hide').hide();
    $('.item-side-hide').hide();
    $('.service-side-hide').hide();
    $('.event-side-hide').hide();
  })
});

});