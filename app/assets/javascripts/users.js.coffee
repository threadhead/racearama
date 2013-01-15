@blink = blink = (selector) ->
  $(selector).delay(700).fadeOut('slow').fadeIn 'fast', ->
    blink this

@blink_once = blink_once = (selector) ->
  $(selector).delay(500).fadeOut('slow').fadeIn('fast')

jQuery ->
  blink '.alert.blink'
