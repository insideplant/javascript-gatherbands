// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require activestorage
//= require moment.min
//= require cocoon
// require turbolinks

//= require moment
//= require fullcalendar

'use-strict';


window.onload = function(){
  // Next(Prev)ボタンの取得
  const next = document.querySelector('.next');
  const prev = document.querySelector(".prev");

  // liタグのwidthを取得
  const sliderwidth = document.querySelector(".sliderlist__item");

  
  let width = sliderwidth.clientWidth;

  // slider(ul要素、li要素一覧)の取得
  const sliderlist = document.querySelector(".sliderlist");
  const sliderlist_item = document.querySelectorAll(".sliderlist__item")

  // カウンターの設定
  let counter = 0;

  // イベントリスナー (next)
  next.addEventListener("click", function(){
    if(counter == sliderlist_item.length - 1) return; //ボタン連打対策
    prev.style.display = "block";
    sliderlist.style.transition = ".3s";
    counter ++;
    sliderlist.style.transform = "translateX("+ (- width * counter) + "px)";

    sliderlist.addEventListener("transitionend", function(){
      if(counter == sliderlist_item.length - 1){
          sliderlist.style.transition = "none";
          next.style.display = "none";
      }
    })
  });

  // イベントリスナー (prev)
  prev.addEventListener("click", function(){
    if(counter == sliderlist_item.length - sliderlist_item.length) return; //ボタン連打対策
    next.style.display = "block";
    sliderlist.style.transition = ".3s";
    counter --;
    sliderlist.style.transform = "translateX("+ (- width * counter) + "px)";

    sliderlist.addEventListener("transitionend", function(){
      if(counter == sliderlist_item.length - sliderlist_item.length){
          sliderlist.style.transition = "none";
          prev.style.display = "none";
      }
    })
  });
  
  const open = document.getElementById('open');
  const close = document.getElementById('close');
  const modal = document.getElementById('modal');
  const mask = document.getElementById('mask');
  
  open.addEventListener('click',()=>{
    modal.classList.remove('hidden');
    mask.classList.remove('hidden')
  });
  
  close.addEventListener('click',()=>{
    modal.classList.add('hidden');
    mask.classList.add('hidden');
  });
  
};

