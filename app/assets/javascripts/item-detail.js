$(document).on('turbolinks:load', function() {

  $(".item-detail__main-box--img-mini").hover(function(){
    var selectedImg = $(this).children(".item__detail--img-mini").attr('src');
    $(".item__detail--img").attr('src', selectedImg);
  });

  
  $(".item-detail__btn--like").on("click", function(e){
    e.preventDefault();

    var likeBtnFlg = $(".item-detail__btn--like").data("flg");
    $(".item-detail__btn--like").css("");
    if( likeBtnFlg === "off" ){
      $(".item-detail__btn--like").css("border", "thin solid #ef5185");
      $(".item-detail__btn--like").css("background-color", "#fff");
      $(".item-detail__btn--like").css("color", "#ef5185");
      $(".item-detail__btn--like i").css("color", "#ef5185");
      $(".item-detail__btn--like").data("flg", "on");
    } else {
      $(".item-detail__btn--like").css("border", "");
      $(".item-detail__btn--like").css("background-color", "#f5f5f5");
      $(".item-detail__btn--like").css("color", "");
      $(".item-detail__btn--like i").css("color", "#ccc");
      $(".item-detail__btn--like").data("flg", "off");
    }
  });
});