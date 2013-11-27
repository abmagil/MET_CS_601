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
				 	url: '/tables/' + el.attr("title")
				 	dataType: 'json'
				 	data :
				 		_method: 'put'
				 		type: window.update["type"]
				 		data: window.update["data"]	#Throws uncaught reference error before this is set, but the code shouldn't be called because of beforeSend
				 	success: (data, textStatus, jqXHR) ->
				 		name = data["name"]
				 		table =  data["table"] 
				 		$("li:contains(" + name + ")").addClass("working")
				 		$("td:contains(Table " +table+ ")").next().text(name).parent().addClass("working")
				 		$()
				 		window.update = {}
				 		addCircle(el)
				 )
				
		onduty = $("#tablewaitermap > table")
		for t in json
			onduty.append "<tr><td>Table " + t.title + "</td><td></td></tr>"
		$("tr",onduty).hover (->
			waiternm = $(this).children('td').eq(1).text()
			tables = $("tr:contains(" + waiternm + ")")
			tables.addClass("highlightedworking") if $(this).hasClass("working")
		), -> 
			$("tr", onduty).removeClass("highlightedworking")


addCircle = (el) ->
  paper = el.paper
  wrap = []
  wrap.push(center(el))
  paper.add(wrap)
#Returns an object which can be added to the canvas (after wrapping) with radius equal to the size of the passed element and centered on it
center = (element) ->
	rtn =
		"type" : "circle"
		"fill" : "#f00"
	if element.type == 'circle'
	 	rtn["cx"] = element.attr("cx")
	 	rtn["cy"] = element.attr("cy")
	 	rtn["r"] = element.attr("r")
 	else if element.type == 'rect'
	 	rtn["cx"] = element.attr("x") + (element.attr("width") / 2)
	 	rtn["cy"] = element.attr("y") + (element.attr("height") / 2)
	 	rtn["r"] = element.attr("height") /2
	rtn