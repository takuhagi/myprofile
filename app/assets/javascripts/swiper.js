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
      delay: 4000,
    },
  })
})