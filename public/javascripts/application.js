$(document).ready( function(){
 
  // $("a[title=submit]").click( function(){
  //   $(this).parents("form").submit();
  // });

  $('.fade-out').delay(5000).fadeOut('slow'); 

  $('#login #user_password').focus();
  $('#scout-check-in #scout_search').focus();

	$(function() {
		$("#slider").slider({
			value: 10,
			min: 4,
			max: 30,
			step: 1,
			slide: function(event, ui) {
				$("#slider-amount").val(ui.value + " seconds");
			}
		});
		$("#slider-amount").val($("#slider").slider("value") + " seconds");
	});
});
