$(function () {

  function buildChild() {
    var html =`<select class="select-wrap" id="child" name="item[category_id]"><option value="">---</option></select>`
    return html;}

  function buildGrandChild() {
    var html =`<select class="select-wrap2" id="grand_child" name="item[category_id]"><option value="">---</option></select>`
    return html;}
  
  function buildOption(cateChild) {
    var html = `<option value="${cateChild.id}">${cateChild.name}</option>` 
    return html;}

  $("#parent-form").on("change",function () {
    $('#child').remove();
    $('#grand_child').remove();
    var parentValue = document.getElementById("parent-form").value;
    $.ajax({
      url: '/items/search',
      type: "GET",
      data: {parent_id: parentValue},
      dataType: 'json'
    })
    .done(function (data) {
      var html  = buildChild();
      $('.data__category--form-m').append(html)
      data.categories.forEach(function(cateChild) {
        var option  = buildOption(cateChild);
        $('#child').append(option);
      })
      $("#child").on("change",function () {
        $('#grand_child').remove();
        var parentValue = document.getElementById("child").value;
        $.ajax({
          url: '/items/search',
          type: "GET",
          data: {parent_id: parentValue},
          dataType: 'json'
        })
        .done(function (data) {
          cnt = data.categories.length
          if (cnt == 0) {
            $('#grand_child').remove();
          }else{
          var html  = buildGrandChild();
          $('.data__category--form-s').append(html)
          data.categories.forEach(function(cateChild) {
            var option  = buildOption(cateChild);
            $('#grand_child').append(option);
          })
        }
        })
      })
    })
  })
});