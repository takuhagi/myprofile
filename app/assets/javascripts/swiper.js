$(function() {
  new Swiper('.swiper-container', {
    // Optional parameters
    loop: true,
    effect: 'coverflow',

    // If we need pagination
    pagination: {
      el: '.swiper-pagination',
    },



    // Navigation arrows
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },

    // And if we need scrollbar
    scrollbar: {
      el: '.swiper-scrollbar',
    },

    autoplay: {
      delay: 5000,
    },

    on: {
      slideChange: function () {
        jQuery('.swiper-slide-content').css('opacity', '1');
        realIndex = this.realIndex + 1;
        jQuery('.swiper-slide-content-' + realIndex).css('opacity', '0');
      },
    },
  })
})

