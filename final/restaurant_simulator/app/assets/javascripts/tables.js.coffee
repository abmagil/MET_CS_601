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
				$.ajax(
					beforeSend:  ->
						window.update["data"] && window.update["type"]
					type: "POST"
					url: '/tables/' + el.id
					data :
						_method: 'put'
						type: window.update["type"]
						data: window.update["data"].innerHTML	#Throws uncaught reference error before this is set, but the code shouldn't be called because of beforeSend
				)