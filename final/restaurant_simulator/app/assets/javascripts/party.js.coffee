# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
##TODO Needs a rewrte
$ ->
	$("form[action='/party'").bind "ajax:success",  (evt, data, status, xhr) ->
		addrow = $(data).prependTo( $("#notifications") )
		addrow.on
			click: ->
				window.update["type"] = "party"
				window.update["data"] = addrow.find("input").val()
