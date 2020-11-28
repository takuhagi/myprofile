// モーダル表示用プラグイン「Modaal」のための記述
$(function(){
  $('.modaal').modaal();
});


// モーダル表示用プラグイン「fancybox」のための記述
$(function(){
  $(".fancybox").attr('rel', 'group').fancybox({
    transitionIn : 'elastic',
    speedIn  : 700,
    transitionOut : 'elastic',
    speedOut  : 150,
    cyclic: true,
    // titlePosition: 'inside',
  });  
});