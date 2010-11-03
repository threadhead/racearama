$(document).ready( function(){
 
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
