$(document).ready(function(){
    $(".dwExpand").addClass('ui-closed').css('cursor','pointer');
    $(".dwExpand").nextUntil(".dwExpand2").slideToggle();
    $(".dwExpand").click(function() {
      
      $(this).nextUntil(".dwExpand2").slideToggle();
      $(this).toggleClass('ui-closed ui-open');
      });
    });
