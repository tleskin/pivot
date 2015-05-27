$(document).ready(function(){
  $('.region-name').mouseenter(function(){
    $(this).siblings().slideToggle('info-box').delay(1000);
    })
});
