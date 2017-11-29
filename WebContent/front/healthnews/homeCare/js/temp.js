$(function(){
  
  $(window).scroll(function(){
    //var $(window).scrollTop(); 為 scroll
    var scroll = $(window).scrollTop();
    //當卷軸超過70px，自動加上 .navbar-fixed-top ，如果小於就移除
    if( scroll >= 30){
      
      $(".navbar-scroll").removeClass("navbar-fixed-top");
      
    }else{
      
      $(".navbar-scroll").addClass("navbar-fixed-top")
      
    }
    
  });
});