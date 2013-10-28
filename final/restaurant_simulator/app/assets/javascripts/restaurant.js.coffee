# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  canvas = $("canvas")
  if canvas.getcontext
    ctx = canvas.getContext("2d")
    ctx.fillStyle = "rgb(200,0,0)"
    ctx.fillRect 10, 10, 55, 50
