rect_size = 30
rect_off_clr = "#D6D4D5"
rect_on_clr  = "#121212"
rules = []
rules.push [1,1,1, 0]
rules.push [1,1,0, 0]
rules.push [1,0,1, 0]
rules.push [1,0,0, 1]
rules.push [0,1,1, 1]
rules.push [0,1,0, 1]
rules.push [0,0,1, 1]
rules.push [0,0,0, 0]

$(document).ready ->
  console.log "bob"
  for ruleNum in [0..7]
    el = $("#canvasRule#{ruleNum}")
    el.attr('width', rect_size * 4)
    el.attr('height', rect_size * 3)
    canvas = el[0]
    context = canvas.getContext("2d")
    for i in [0..2]
      drawBox(context, rules[ruleNum][i], i, 0, false)
    drawBox(context, rules[ruleNum][3], 1, 1, true)
    $("#rule#{ruleNum}").val(rules[ruleNum][3])
    bindPattern(ruleNum)

drawBox = (context, rule, x, y, border) ->
  context.beginPath()
  context.rect( x * rect_size, y * rect_size, rect_size - 3, rect_size - 3)
  clr = if rule == 1 then clr = rect_on_clr else clr = rect_off_clr
  context.fillStyle = clr
  context.fill()
  if border == true
    context.lineWidth = 1.5
    context.strokeStyle = '#56BAEC'
    context.stroke()
  context.closePath()

bindPattern = (ruleNum) -> 
  #wire up click event on bottom middle box of rule
  el = $("#canvasRule#{ruleNum}")
  el.bind 'click', (e) ->
    canvas = this
    context = canvas.getContext("2d")
    context.beginPath();
    context.rect(rect_size, rect_size, rect_size - 3, rect_size - 3)
    if ($("#rule#{ruleNum}").val() == "1")
      $("#rule#{ruleNum}").val(0)
      context.fillStyle = rect_off_clr
    else
      $("#rule#{ruleNum}").val(1)
      context.fillStyle = rect_on_clr
    context.fill();
    context.closePath();
    $('#patternForm').submit();
    
