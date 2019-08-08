$(function(){

  // 子カテゴリー

  function buildEmptyOption(){
    var html = `<option value="">---</option>`
    return html
  }

  function buildOption(category){
    var html = `<option value="${category.id}">${category.name}</option>`
    return html
  }

  function buildSelect(){
    var html = `<select name="item[child_categories_id]" id="item_child_categories_id">
                </select>`
    return html
  }

  function buildGrandSelect(){
    var html = `<select name="item[grand_child_categories_id]" id="item_grand_child_categories_id">
                </select>`
    return html
  }

  $('#item_category_id').on('change', function(){
    var value = this.value

    if(value == "") {
      if($('.child-category-select')){
        $('.child-category-select').empty();
      }
      if($('.grand-child-category-select')){
        $('.grand-child-category-select').empty();
      }
    }
    else {
      $.ajax({
        type: 'get',
        url: 'sell/child',
        data: {keyword: value},
        dataType: 'json'
      })
      .done(function(child_categories){
        $('.child-category-select').empty();
        if($('.grand-child-category-select')){
          $('.grand-child-category-select').empty();
        }
        $('.child-category-select').append(buildSelect());
        $('#item_child_categories_id').append(buildEmptyOption());
        child_categories.forEach(function(child_category){
          option = buildOption(child_category);
          $('#item_child_categories_id').append(option);
        })
      })
      .fail(function(){
        alert("失敗しました");
      })
    }
  })



  // 孫カテゴリー

  $(document).on('change',"#item_child_categories_id", function(){
    var value = this.value

    $.ajax({
      type: 'get',
      url: 'sell/grand',
      data: {keyword: value},
      dataType: 'json'
    })
    .done(function(grand_child_categories){
      $('.grand-child-category-select').empty();
      $('.grand-child-category-select').append(buildGrandSelect());
      $('#item_grand_child_categories_id').append(buildEmptyOption());
      grand_child_categories.forEach(function(grand_child_category){
        option = buildOption(grand_child_category);
        $('#item_grand_child_categories_id').append(option);
      })
    })
    .fail(function(){
      alert("失敗しました");
    })
  })

  // header

  function buildLink(category){
    var html = `<a data-id="${category.id}" href="/">${category.name}
</a>`
    return html
  }

  $('.nav-list-parent__item h3 a').on('mouseover', function(){
    var id = this.getAttribute('data-id');

    $.ajax({
      type: 'get',
      url: 'child',
      data: {keyword: id},
      dataType: 'json'
    })
    .done(function(child_categories){
      $('.nav-list-child__item__inner').empty();
      child_categories.forEach(function(child_category){
        link = buildLink(child_category);
        $('.nav-list-child__item__inner').append(link);
      })
    })
    .fail(function(){
      alert("失敗しました");
    })
  })


  function buildGrandLink(category){
    var html = `<li class="nav-list-grand-child__item">
                  <a data-id="${category.id}" href="/">${category.name}
                  </a>
                </li>`
    return html
  }

  $(document).on('mouseover',".nav-list-child__item__inner a", function(){
    var id = this.getAttribute('data-id');

    $.ajax({
      type: 'get',
      url: 'grand',
      data: {keyword: id},
      dataType: 'json'
    })
    .done(function(grand_child_categories){
      $('.nav-list-grand-child').empty();
      grand_child_categories.forEach(function(grand_child_category){
        link = buildGrandLink(grand_child_category);
        $('.nav-list-grand-child').append(link);
      })
    })
    .fail(function(){
      alert("失敗しました");
    })
  })
})
