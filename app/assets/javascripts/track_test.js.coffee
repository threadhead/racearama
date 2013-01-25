jQuery ->
  setSliderAmount = (val) ->
    $("span#slider-display").html val + " seconds"
    $("input#slider-amount").val val

  startLaneStatusTimer = ->
    $("#lane-status").everyTime 2000, ((i) ->
      $.getScript "/track_test/test_lanes"
    ), 0


  start_val = $("input#slider-amount").val()

  $("#slider").slider({
    value: start_val,
    min: 4,
    max: 30,
    step: 1,
    slide: (event, ui) ->
      setSliderAmount ui.value
    })

  setSliderAmount $("#slider").slider("value")


  $("a#test-race-submit").click ->
    $("#lane-status").stopTime()
    $("#test-lanes").hide()
    $("#test-race").show()
    $("#race-results").hide()
    $("#loader").slideDown()
    $("form#testrace").submit()

  startLaneStatusTimer() if $("#lane-status").length

  $("#lane-test-control").click ->
    if $(this).hasClass("running")
      $("#lane-status").stopTime()
      $(this).html "Resume Lane Test"
    else
      startLaneStatusTimer()
      $(this).html "Stop Lane Test"
    $(this).toggleClass "running"

  $("select#current_track").change ->
    $(@).parent('form').submit()
