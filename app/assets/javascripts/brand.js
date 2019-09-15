$(document).on('turbolinks:load', function() {

  var suggestions_list = $('.data__brand--form--seggestions')

  function appendBrand(brand) {
    var html   =`<div class="brand_name" data-brand-name="${ brand.name }">${ brand.name }</div>`
    suggestions_list.append(html);}

  $("#item_brand_id").on("keyup", function() {
    var input = $("#item_brand_id").val();
    $.ajax({
      type: 'GET',
      url: '/items/brand_suggestions',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(brands) {
      $(".data__brand--form--seggestions").empty();
      if (brands.length !== 0) {
        brands.forEach(function(brand){
          appendBrand(brand);
        });
      }
      else {
        $(".data__brand--form--seggestions").empty();
      }
    })
  });
  $(document).on("click",".brand_name",function () {
    var brand_name = $(this).text();
    $("#item_brand_id").val(brand_name);
  })
});