$(document).on('turbolinks:load', function() {
  $(function () {

    function buildmeans1() {
      var html =`<select class="means--form" id="means" name="item[delivery_method]">
                  <option value="">---</option>
                  <option value="未定">未定</option>
                  <option value="らくらくメルカリ便">らくらくメルカリ便</option>
                  <option value="ゆうメール">ゆうメール</option>
                  <option value="レターパック">レターパック</option>
                  <option value="普通郵便(定形、定形外)">普通郵便(定形、定形外)</option>
                  <option value="クロネコヤマト">クロネコヤマト</option>
                  <option value="ゆうパック">ゆうパック</option>
                  <option value="クリックポスト">クリックポスト</option>
                  <option value="ゆうパケット">ゆうパケット</option>
                </select>`
      return html;}

    function buildmeans2() {
      var html =`<select class="means--form" id="means" name="item[delivery_method]">
                  <option value="">---</option>
                  <option value="未定">未定</option>
                  <option value="クロネコヤマト">クロネコヤマト</option>
                  <option value="ゆうパック">ゆうパック</option>
                  <option value="ゆうメール">ゆうメール</option>
                </select>`
      return html;}
  
    $("#item_shipping_charge").on("change",function () {
      $('#means').remove();
      var val = document.getElementById("item_shipping_charge").value;
      if (val == "") {
        $('#means').remove();
      }else if (val == "送料込み(出品者負担)") {
        var html  = buildmeans1();
        $('.shipping__means--form').append(html)
      }else{
        var html  = buildmeans2();
        $('.shipping__means--form').append(html)  
      }
    });
  });
});