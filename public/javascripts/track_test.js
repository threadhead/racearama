$(document).ready( function(){
 
	$(function() {
		var start_val = $('input#slider-amount').val();
		$("#slider").slider({
			value: start_val,
			min: 4,
			max: 30,
			step: 1,
			slide: function(event, ui) {
				setSliderAmount(ui.value);
			}
		});
		setSliderAmount($("#slider").slider("value"));
	});
	
	function setSliderAmount (val) {
		$("span#slider-display").html(val + " seconds");
		$("input#slider-amount").val(val);
	}

	$('a#test-race-submit').click( function() {
		$('form#testrace').submit();
	});

	
	if ($('#lane-status').length) {
		startLaneStatusTimer();
	}

	
	$('#lane-test-control').click( function() {
		if ($(this).hasClass("running")) {
			$('#lane-status').stopTime();
			$(this).html('Resume Lane Test');
		} else {
			startLaneStatusTimer();
			$(this).html('Stop Lane Test');
		};
		$(this).toggleClass('running');

	});

	
	function startLaneStatusTimer () {
		$('#lane-status').everyTime(2000, function(i){
			$.getScript('/track_test/test_lanes');
		}, 0);
	}
});
