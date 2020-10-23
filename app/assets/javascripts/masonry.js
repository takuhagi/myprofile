$(window).load(function() {
  $('.PhotoGallery__list').masonry({
    itemSelector: '.picture-box',
    columnWidth: true //一列の幅サイズを指定
  });
});