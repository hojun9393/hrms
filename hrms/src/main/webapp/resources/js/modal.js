$(function(){
  $("#confirm").click(function(){
      modalClose();
  });
  $("#modal-open").click(function(){
	   $("#popup").css('display','flex').hide().fadeIn();
  });
  $("#close").click(function(){
      modalClose();
  });
  function modalClose(){
    $("#popup").fadeOut();
  }
});