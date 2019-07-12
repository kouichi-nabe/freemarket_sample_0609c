$(function(){
  var notice_tabs = $('.user-content .content-tabs .content-tabs__item');
  notice_tabs.on('click', function(){
    notice_tabs.removeClass('active');
    $(this).addClass('active');

    var notice_tab_child = $('.user-notification__list');
    notice_tab_child.removeClass('active');
    if($(this).data('tab') == 1) {
      $('.user-notification__list[data-tab=1]').addClass('active');
    } else if ($(this).data('tab') == 2) {
      $('.user-notification__list[data-tab=2]').addClass('active');
    }
  })

  var shop_tabs = $('.user-shoping-data .content-tabs .content-tabs__item');
  shop_tabs.on('click', function(){
    shop_tabs.removeClass('active');
    $(this).addClass('active');

    var shop_tab_child = $('.shoping-list');
    shop_tab_child.removeClass('active');
    if($(this).data('tab') == 1) {
      $('.shoping-list[data-tab=1]').addClass('active');
    } else if ($(this).data('tab') == 2) {
      $('.shoping-list[data-tab=2]').addClass('active');
    }
  })
})
