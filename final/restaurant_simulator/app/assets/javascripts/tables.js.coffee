# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 
 $("#canvasholder").ready ->
 	paper = new Raphael(document.getElementById('canvasholder'))
 	$.ajax(url: '/tables').done (json) ->
 		paper.add(json)
 		paper.forEach (el) ->
      el.click ->
        $.ajax(url: '/tables/' + el.id + '/edit', 
                data: {"occupy": "seat"})
