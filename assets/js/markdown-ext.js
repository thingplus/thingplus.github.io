$(document).ready(function(){
    $(".dwExpand").addClass('ui-closed').css('cursor','pointer');
    $(".dwExpand").nextUntil(".dwExpand2").addClass('detail');
    $(".dwExpand").nextUntil(".dwExpand2").slideToggle();
    $(".dwExpand").click(function() {
      
      $(this).nextUntil(".dwExpand2").slideToggle();
      $(this).toggleClass('ui-closed ui-open');
      });

});


$(document).ready(function(){
    $(".dwfqExpand").addClass('ui-closed').css('cursor','pointer');
    $(".dwfqExpand").addClass('line');
    $(".dwfqExpand").nextUntil(".dwfqExpand2").addClass('detail2');
    $(".dwfqExpand").nextUntil(".dwfqExpand2").slideToggle();
    $(".dwfqExpand").click(function() {
      
      $(this).nextUntil(".dwfqExpand2").slideToggle();
      $(this).toggleClass('ui-closed ui-open');
      $(this).toggleClass('line line2');
      });
var locHash = window.location.hash;
var locPath = window.location.pathname;
if (locPath.indexOf("faq") != -1 |  locPath.indexOf("troubleshooting") != -1){
  //console.log(locPath);
  if (locHash != ""){
    //console.log(locHash);   
    $(locHash).nextUntil(".dwfqExpand2").slideToggle();
    $(locHash).toggleClass('ui-closed ui-open');
    $(locHash).toggleClass('line line2');
  }
}
});


$.expr[':'].external = function(obj){ 
          return !obj.href.match(/^mailto\:/)
                  && (obj.hostname != location.hostname);                     
          
      };

$(function(){
// Add 'external' CSS class to all external links
$('a:external').addClass('external');

// turn target into target=_blank for elements w external class
$(".external").attr('target','_blank');
})

$(window).scroll(function() {
    if ($(this).scrollTop() > 50 ) {
        $('.scrolltop:hidden').stop(true, true).fadeIn();
    } else {
        $('.scrolltop').stop(true, true).fadeOut();
    }
});
$(function(){$(".scroll").click(function(){$("html,body").animate({scrollTop:0},"1000");return false})})

function signup(lang){
console.log(lang);
  if(lang == "en"){
    window.open('https://thingplus.net/signup-en/','_blank');
  }else{
    window.open('https://thingplus.net/signup/','_blank');
  }
}


// youtube 새창 띄우기 
// function open_youtube(url){
// cw=screen.availWidth;     //화면 넓이
// ch=screen.availHeight;    //화면 높이

// sw=640;    //띄울 창의 넓이
// sh=480;    //띄울 창의 높이

// ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
// mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치

// window.open(url,'tst','width='+sw+',height='+sh+',top='+mt+',left='+ml+',resizable=no,scrollbars=no');
// }

$(function() {
  $( "#Utube" ).draggable();
});


function open_youtube(url){
cw=screen.availWidth;     //화면 넓이
ch=screen.availHeight;    //화면 높이

sw=640;    //띄울 창의 넓이
sh=480;    //띄울 창의 높이

ml=(cw-sw)/2;        //가운데 띄우기위한 창의 x위치
mt=(ch-sh)/2;         //가운데 띄우기위한 창의 y위치
var vid_con ='<div style="display: block; left: '+ml+'px; top: '+mt+'px;" width="640">';
    vid_con +='<div style="background-color: azure;"" >test</div>';
    vid_con +='<iframe id="player" frameborder="0" allowfullscreen="1" title="YouTube video player" width="640" height="480" src='+url+'></iframe>';
    vid_con += '</div>';
$("div#Utube").html(vid_con);
}



