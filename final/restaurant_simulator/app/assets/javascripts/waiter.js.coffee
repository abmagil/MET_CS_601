# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ ->
  paper = new Raphael(document.getElementById('canvas'),320,200)
  circle = paper.circle(50, 40, 10)
  circle.attr("fill", "#f00")
  $("#offduty li").on 
    click: ->
      $(this).css("display", "none") #Show that this waiter is on duty.  Next step is remove from list.  Maybe with display:none so that order stays correct
      flashTables()

  flashTables = -> 
    alert("Select the table to serve.")