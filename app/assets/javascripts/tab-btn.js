$(function()  {
  // タブのDOM要素を取得し、変数で定義
  let tabs = $(".menu__item");

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $(".active").removeClass("active");

    // クリックしたタブにactiveクラスを追加

    $(this).addClass("active");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);

    // クリックしたタブに対応するshowクラスを追加する
    $(".content").removeClass("show").eq(index).addClass("show");
  }

  // タブがクリックされたらtabSwitch関数を呼び出す
  tabs.click(tabSwitch);    
});



$(function()  {
  // タブのDOM要素を取得し、変数で定義
  let tabs = $(".tabs");

  // クラスの切り替えをtabSwitch関数で定義
  function tabSwitch() {
    // 全てのactiveクラスのうち、最初の要素を削除（"[0]は、最初の要素の意味"）
    $(".action").removeClass("action");

    // クリックしたタブにactiveクラスを追加

    $(this).addClass("action");

    // 何番目の要素がクリックされたかを、配列tabsから要素番号を取得
    const index = tabs.index(this);

    // クリックしたタブに対応するshowクラスを追加する
    $(".items-history__describe").removeClass("showoff").eq(index).addClass("showoff");
  }

  // タブがクリックされたらtabSwitch関数を呼び出す
  tabs.click(tabSwitch);    
});
