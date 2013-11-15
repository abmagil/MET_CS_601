# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#@import "colors";

$ ->
  paper = new Raphael(document.getElementById('canvasholder'))
  
  circle = paper.circle(50, 40, 10)
  circle.attr("fill", "$white")
  $("#offduty li").on 
    click: ->
      $(this).addClass("working") #Show that this waiter is on duty.  Next step is remove from list.  Maybe with display:none so that order stays correct
      flashTables()

  #flashTables = ->