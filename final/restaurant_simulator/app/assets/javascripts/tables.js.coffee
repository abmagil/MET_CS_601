# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 
 $("#canvasholder").ready ->
	paper = new Raphael(document.getElementById('canvasholder'))
	window.tables ?= {}
	onduty = $("#tablewaitermap > table")
	$.ajax(url: '/tables').done (json) ->
		for json_str in json
			el = paper.add([json_str])[0]
			id = el.attr('title')
			r = $("<tr><td>Table <span>" + id + "</span></td><td></td></tr>").appendTo(onduty)
			window.tables[id] = {"table": el, "waiter": r[0]}	#Maps between table ID, table and waitermap
			el.click ->
				 $.ajax(
				 	beforeSend:  ->
				 		window.update["data"] && window.update["type"]
				 	type: "POST"
				 	url: '/tables/' + this.attr("title")
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
				 		window.update = {}
				 		window.tables[table]["waiter"] = name
				 		addCircle(el)
				 )
				
		onduty = $("#tablewaitermap > table")
		$("tr",onduty).hover (->
			waiternm = $(this).children('td').eq(1).text()
			if (waiternm)
				for pair in window.tables
					console.log this
					if pair["waiter"] = waiternm
						#Highlight waiters
						tableRows = $("tr:contains(" + waiternm + ")")
						tableRows.addClass("highlightedworking") if $(this).hasClass("working")
						#Highlight tables
						pair["table"].node.attr("fill", "f00")
			
		), -> 
			$("tr", onduty).removeClass("highlightedworking")
			for pair in window.tables
			  pair["table"].node.attr("fill", "000")



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