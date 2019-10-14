$(document).on('turbolinks:load', function() {
  $(function () {
    $('#item_images_attributes_1_image').hide();
    $('#item_images_attributes_2_image').hide();
    $('#item_images_attributes_3_image').hide();
    $('#item_images_attributes_4_image').hide();
    $('#item_images_attributes_5_image').hide();
    $('#item_images_attributes_6_image').hide();
    $('#item_images_attributes_7_image').hide();
    $('#item_images_attributes_8_image').hide();
    $('#item_images_attributes_9_image').hide();

    $("#item_images_attributes_0_image").on("change", function () {
      var preimage1 = `<div class="preimage preimage1"><div class="preimage__top"><img id="img1" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>`
      $('#item_images_attributes_0_image').hide();
      $('#item_images_attributes_1_image').show();
      $('#preimg1').hide();
      $('#preview').append(preimage1)
    })

    $("#item_images_attributes_0_image").change(function (e) {
      var file = e.target.files[0];
      var reader = new FileReader();
      reader.onload = (function () {
        return function(e) {
          $("#img1").attr("src", e.target.result);
        };
      })(file);
      reader.readAsDataURL(file);
    });
    $("#item_images_attributes_1_image").on("change", function(){
      var preimage2 = '<div class="preimage"><div class="preimage__top"><img id="img2" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
      $('#item_images_attributes_1_image').hide();
      $('#item_images_attributes_2_image').show();
      $('#preimg2').hide();
      $('#preview').append(preimage2)
    })
    
    $("#item_images_attributes_1_image").change(function(e){
      var file = e.target.files[0];
      var reader = new FileReader();
      reader.onload = (function(){
        return function(e){
          $("#img2").attr("src", e.target.result);
        };
      })(file);
      reader.readAsDataURL(file);
    });
    
    $("#item_images_attributes_2_image").on("change", function(){
      var preimage3 = '<div class="preimage"><div class="preimage__top"><img id="img3" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
      $('#item_images_attributes_2_image').hide();
      $('#item_images_attributes_3_image').show();
      $('#preimg3').hide();
      $('#preview').append(preimage3)
    })
    
    $("#item_images_attributes_2_image").change(function(e){
      var file = e.target.files[0];
      var reader = new FileReader();
      reader.onload = (function(){
        return function(e){
          $("#img3").attr("src", e.target.result);
        };
      })(file);
      reader.readAsDataURL(file);
    });
    
    $("#item_images_attributes_3_image").on("change", function(){
      var preimage4 = '<div class="preimage"><div class="preimage__top"><img id="img4" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
      $('#item_images_attributes_3_image').hide();
      $('#item_images_attributes_4_image').show();
      $('#preimg4').hide();
      $('#preview').append(preimage4)
    })
    
    $("#item_images_attributes_3_image").change(function(e){
      var file = e.target.files[0];
      var reader = new FileReader();
      reader.onload = (function(){
        return function(e){
          $("#img4").attr("src", e.target.result);
        };
      })(file);
      reader.readAsDataURL(file);
    });
    
    $("#item_images_attributes_4_image").on("change", function(){
      var preimage5 = '<div class="preimage"><div class="preimage__top"><img id="img5" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
      $('#item_images_attributes_4_image').hide();
      $('#item_images_attributes_5_image').show();
      $('#preimg5').hide();
      $('#preview').append(preimage5)
    })
    
    $("#item_images_attributes_4_image").change(function(e){
      var file = e.target.files[0];
      var reader = new FileReader();
      reader.onload = (function(){
        return function(e){
          $("#img5").attr("src", e.target.result);
        };
      })(file);
      reader.readAsDataURL(file);
    });
    
    $("#item_images_attributes_5_image").on("change", function(){
      var preimage6 = '<div class="preimage preimage6"><div class="preimage__top"><img id="img6" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
      $('#item_images_attributes_5_image').hide();
      $('#item_images_attributes_6_image').show();
      $('#preimg6').hide();
      $('#preview').append(preimage6)
    })
    
    $("#item_images_attributes_5_image").change(function(e){
      var file = e.target.files[0];
      var reader = new FileReader();
      reader.onload = (function(){
        return function(e){
          $("#img6").attr("src", e.target.result);
        };
      })(file);
      reader.readAsDataURL(file);
    });
    
    $("#item_images_attributes_6_image").on("change", function(){
      var preimage7 = '<div class="preimage preimage7"><div class="preimage__top"><img id="img7" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
      $('#item_images_attributes_6_image').hide();
      $('#item_images_attributes_7_image').show();
      $('#preimg7').hide();
      $('#preview').append(preimage7)
    })
    
    $("#item_images_attributes_6_image").change(function(e){
      var file = e.target.files[0];
      var reader = new FileReader();
      reader.onload = (function(){
        return function(e){
          $("#img7").attr("src", e.target.result);
        };
      })(file);
      reader.readAsDataURL(file);
    });
    
    $("#item_images_attributes_7_image").on("change", function(){
      var preimage8 = '<div class="preimage preimage8"><div class="preimage__top"><img id="img8" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
      $('#item_images_attributes_7_image').hide();
      $('#item_images_attributes_8_image').show();
      $('#preimg8').hide();
      $('#preview').append(preimage8)
    })
    
    $("#item_images_attributes_7_image").change(function(e){
      var file = e.target.files[0];
      var reader = new FileReader();
      reader.onload = (function(){
        return function(e){
          $("#img8").attr("src", e.target.result);
        };
      })(file);
      reader.readAsDataURL(file);
    });
    
    $("#item_images_attributes_8_image").on("change", function(){
      var preimage9 = '<div class="preimage preimage9"><div class="preimage__top"><img id="img9" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
      $('#item_images_attributes_8_image').hide();
      $('#item_images_attributes_9_image').show();
      $('#preimg9').hide();
      $('#preview').append(preimage9)
    })
    
    $("#item_images_attributes_8_image").change(function(e){
      var file = e.target.files[0];
      var reader = new FileReader();
      reader.onload = (function(){
        return function(e){
          $("#img9").attr("src", e.target.result);
        };
      })(file);
      reader.readAsDataURL(file);
    });
    
    $("#item_images_attributes_9_image").on("change", function(){
      var preimage10 = '<div class="preimage preimage10"><div class="preimage__top"><img id="img10" style="width:110px; height:80px;" /></div><div class="preimage__bottom"><p class="preimage__bottom__side1">編集</p><p class="preimage__bottom__side2">削除</p></div></div>'
      $('#item_images_attributes_9_image').hide();
      $('#preimg10').hide();
      $('#preview').append(preimage10)
      $('.images__upload-area__uploader').hide();
    })
    
    $("#item_images_attributes_9_image").change(function(e){
      var file = e.target.files[0];
      var reader = new FileReader();
      reader.onload = (function(){
        return function(e){
          $("#img10").attr("src", e.target.result);
        };
      })(file);
      reader.readAsDataURL(file);
      });
  });
});