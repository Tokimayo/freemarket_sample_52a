window.onload = function(){

  $(".item-detail__main-box--img-mini").hover(function(){
    var selectedImg = $(this).children(".item__detail--img-mini").attr('src');
    $(".item__detail--img").attr('src', selectedImg);
  });

  $(".item-detail__btn--like").on("click", function(e){
    e.preventDefault();
    $(".item-detail__btn--like").css("background-color", "white");
  });
};