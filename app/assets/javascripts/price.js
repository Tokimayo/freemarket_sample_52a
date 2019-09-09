$(document).on('turbolinks:load', function() {
  $(function () {
    $('.price_form').on("keyup",function(){
      var i = $('.price_form').val();
      var commission = Math.floor( i / 10 );
      var result = ( i - commission );

      var commission_price = $('.sale__commission--price');
      var profit_price = $('.sale__profit--price');
      
      if ( i >= 300 && i <= 9999999 ) {
      commission_price.text('¥' + commission);
      profit_price.text('¥' + result);
      }else {
        commission_price.text('-');
        profit_price.text('-');
      }
    });
  });
});