$(function(){
  $('.slider').slick({
    autoplay: true,
    autoplaySpeed: 7000,
  });
});


$(function(){
  $('.item-slider').slick({
    asNavFor:'.item-slider-nav',
    arrows: true,
    slidesToShow:1,
  });
});
$(function(){
  $('.item-slider-nav').slick({
    asNavFor:'.item-slider',
    focusOnSelect: true,
    arrows: false,
    slidesToShow:4,
  });
});
