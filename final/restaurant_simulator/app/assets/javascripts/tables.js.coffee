# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 
 $("#canvasholder").ready ->
	paper = new Raphael(document.getElementById('canvasholder'))
	paper.setViewBox(0,0,800,800, true)
	window.tables ?= {}
	onduty = $("#tablewaitermap > table")
	$.ajax(url: '/tables').done (json) ->
		for json_str in json
			el = paper.add([json_str])[0]
			add_tag(el)
			id = el.attr('title')
			r = $("<tr><td>Table <span>" + id + "</span></td><td></td></tr>").appendTo(onduty)
			window.tables[id] = {"table": el, "maprow": r[0]}	#Maps between table ID, table and waitermap
			el.click ->
				$.ajax(
					beforeSend:  ->
						window.update.hasOwnProperty("type") && window.update.hasOwnProperty("data") 
					type: "POST"
					url: '/tables/' + this.attr("title")
					dataType: 'json'
					data :
						_method: 'put'
						type: window.update["type"]
						data: window.update["data"] 	#Throws uncaught reference error before this is set, but the code shouldn't be called because of beforeSend
					success: (data, textStatus, jqXHR) ->
						type = data["data"]
						name = data["name"]
						table =  data["table"] 
						if type is "waiter"
							#Mark as working on the Waiters list
							$("li:contains(" + name + ")")
								.addClass("working")
								.children("button").removeClass("hidden")	#Unhide the button to unassign
							#Mark as working in the Waiter Map
							$("td:contains(Table " +table+ ")").next().text(name).parent()
								.addClass("working")
								.append('<td><button type="button" class="close" aria-hidden="true">&times;</button></td>')
							#Clear out the update object
							window.update = {}
							#Maintain state in window.tables
							window.tables[table]["waiter"] = name
						#Highlight table with party
						if type is "party"
							addCircle(window.tables[table]["table"])
							$("input[value=" + data["name"] + "]").parent().remove()
						$(this).remove
						if type is "fail"
							alert data["message"]
					failure: ->
						alert "Sorry, that is not a valid selection."
				)
		$("tr",onduty).hover (->
			waiternm = $(this).children('td').eq(1).text()
			if (waiternm)
				for key, pair of window.tables
					if pair["waiter"] == waiternm
					  #Highlight waiters
						$(pair["maprow"]).addClass("highlightedworking") if $(this).hasClass("working")
						#Highlight tables
						pair["table"].attr("fill","#FF8900")
		), ->
			#Unhighlight Waiters
			$("tr", onduty).removeClass("highlightedworking")
			#unhighlight tables
			waiternm = $(this).children('td').eq(1).text()
			if (waiternm)
				for key,pair of window.tables
					pair["table"].attr("fill", "black")

add_tag = (el) ->
	paper = el.paper
	wrap = []
	middle = el.getBBox()
	rtn =
		"type" : "circle"
		"fill" : "white"
		"cx" : middle["x"]
		"cy" : middle["y"]
		"r" : 15
		"title" : el.attr("title")
	wrap.push rtn
	paper.add(wrap)
	paper.text(middle["x"], middle["y"], el.attr("title")).attr("font-size", 18)

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
