'use-strict';


{
  // Next(Prev)ボタンの取得
  const next = document.querySelector('.next');
  const prev = document.querySelector(".prev");

  // liタグのwidthを取得
  const sliderwidth = document.querySelector(".sliderlist__item");

  
  let width = sliderwidth.clientWidth;

  // slider(ul要素、li要素一覧)の取得
  const sliderlist = document.querySelector(".sliderlist");
  const sliderlist_item = document.querySelectorAll(".sliderlist__item");

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
    });
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
    });
  });
}

{
  const menuItems= document.querySelectorAll('.menu li a');
  const contents= document.querySelectorAll('.content');
  
  
  menuItems.forEach(clickedItem=>{
    clickedItem.addEventListener('click',e=>{
      e.preventDefault();
      
      menuItems.forEach(item => {
        item.classList.remove('active');
      });
      
      clickedItem.classList.add('active');
      
      contents.forEach(content=>{
        content.classList.remove('active');
      });
      document.getElementById(clickedItem.dataset.id).classList.add('active');
    });
  });
}