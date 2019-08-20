$(function(){
  var image_tabs = $('.image-item-nav__inner');
  image_tabs.on('click', function(){
    image_tabs.removeClass('active');
    $(this).addClass('active');
  })
})
