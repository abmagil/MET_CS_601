# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 
 $("#canvasholder").ready ->
 	paper = new Raphael(document.getElementById('canvasholder'))
 	$.ajax(url: '/tables').done (json) ->
 		paper.add(json)
  
  # circle = paper.circle(50, 40, 10)
  # circle.attr("fill", "#ff0000")
  # circle.hover ->
  # 	console.log "alert" #Change to highlight the table? Maybe just remove entirely