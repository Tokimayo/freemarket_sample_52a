$(document).on('turbolinks:load', function() {
  $(function () {
    $('#item_images_attributes_0_image').show();
    var array = [0,1,2,3,4,5,6,7,8,9]
    $.each(array, function (i) {
      var n = i + 1
      $("#item_images_attributes_"+i+"_image").on("change", function () {
        var preimage = '<div class="preimage"><div class="preimage__top"><img id="img" style="width:110px; height:80px;" /></div></div>'
        $('#item_images_attributes_'+i+'_image').hide();
        $('#item_images_attributes_'+n+'_image').show();
        $('#preimg'+n).hide();
        $('#preview').append(preimage)
        $('#img').attr('id', 'img'+n);
      })
      $("#item_images_attributes_"+i+"_image").change(function(e){
        var file = e.target.files[0];
        var reader = new FileReader();
        reader.onload = (function(){
          return function(e){
            $("#img"+n).attr("src", e.target.result);
          };
        })(file);
        reader.readAsDataURL(file);
      });
      $(document).on('click', '#delete_btn'+i, function(){
        var target_image = $(this).parent().parent();
        target_image.remove();
        $('#item_images_attributes_'+i+'__destroy').prop('checked',true);
      });    
    })
  });
});
