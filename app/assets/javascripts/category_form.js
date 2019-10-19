$(document).on('turbolinks:load', function() {
  $(function () {

    function buildChild() {
      var html =`<select class="select-wrap" id="child" name="item[parent_category]"><option value="">---</option></select>`
      return html;}

    function buildGrandChild() {
      var html =`<select class="select-wrap2" id="grand_child" name="item[category_id]"><option value="">---</option></select>`
      return html;}
    
    function buildOption(cateChild) {
      var html = `<option value="${cateChild.id}">${cateChild.name}</option>` 
      return html;}

      function buildSize(){
        var html = `<div class="data-form__size" id="sizebox">
                      <label class="data-form__size--title">サイズ</label>
                      <span class="Required__label">必須</span>
                      <div class="data-form__size--tab form-group">
                        <select class="select--box" required:"required" id="size" name="item[size_id]"></select>
                      </div>
                    </div>`
        return html;}

      function buildSizeOption(sizingOption){
        var html = `<option value="${sizingOption.id}">${sizingOption.name}</option>`
        return html;}

    $("#parent-form").on("change",function () {
      $('#child').remove();
      $('#grand_child').remove();
      $('#sizebox').remove();
      var parentValue = document.getElementById("parent-form").value;
      $.ajax({
        url: '/items/search',
        type: "GET",
        data: {parent_id: parentValue},
        dataType: 'json'
      })
      .done(function (data) {
        var html  = buildChild();
        $('.data-form__category--form-m').append(html)
        data.categories.forEach(function(cateChild) {
          var option  = buildOption(cateChild);
          $('#child').append(option);
        })
        $("#child").on("change",function () {
          $('#grand_child').remove();
          $('#sizebox').remove();
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
            $('.data-form__category--form-s').append(html)
            data.categories.forEach(function(cateChild) {
              var option  = buildOption(cateChild);
              $('#grand_child').append(option);
            })
          }
            $('#grand_child').on("change",function(){
              $('#sizebox').remove();
              var parentValue = document.getElementById("grand_child").value;
              $.ajax({
                url:  '/items/search',
                type: "GET",
                data: { parent_id: parentValue },
                dataType: 'json'
              })
              .done(function(data) {
                if(data.sizes == ""){$('#sizebox').css('display', 'none')
                }else{
                  $('#sizabox').css('display', 'block')
                    var html = buildSize();
                  $('.data-form__size').append(html)
                  data.sizes.forEach(function(sizingOption){
                    var option = buildSizeOption(sizingOption);
                    $('#size').append(option);
                  });
                }
              });
            });
          });
        });
      });
    });

    $("#child").on("change",function () {
      $('#grand_child').remove();
      $('#sizebox').remove();
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
          $('.data-form__category--form-s').append(html)
          data.categories.forEach(function(cateChild) {
            var option  = buildOption(cateChild);
            $('#grand_child').append(option);
          })
        }
        $('#grand_child').on("change",function(){
          $('#sizebox').remove();
          var parentValue = document.getElementById("grand_child").value;
          $.ajax({
              url:  '/items/search',
              type: "GET",
              data: { parent_id: parentValue },
              dataType: 'json'
          })
          .done(function(data) {
            if(data.sizes == ""){$('#sizebox').css('display', 'none')
            }else{
              $('#sizebox').css('display', 'block')
                var html = buildSize();
              $('.data-form__size').append(html)
              data.sizes.forEach(function(sizingOption){
                var option = buildSizeOption(sizingOption);
                $('#size').append(option);
              });
            }
          });
        });
      });
    });

    $('#grand_child').on("change",function(){
      $('#sizebox').remove();
      var parentValue = document.getElementById("grand_child").value;
      $.ajax({
          url:  '/items/search',
          type: "GET",
          data: { parent_id: parentValue },
          dataType: 'json'
      })
      .done(function(data) {
        if(data.sizes == ""){$('#sizebox').css('display', 'none')
        }else{
          $('#sizebox').css('display', 'block')
            var html = buildSize();
          $('.data-form__size').append(html)
          data.sizes.forEach(function(sizingOption){
            var option = buildSizeOption(sizingOption);
            $('#size').append(option);
          });
        }
      });
    });
  });
});
