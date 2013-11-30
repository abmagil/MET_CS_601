# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 
 $("#canvasholder").ready ->
	paper = new Raphael(document.getElementById('canvasholder'))
	paper.customAttributes.arc = (xloc, yloc, value, total, R) ->
		alpha = 360 / total * value
		a = (90 - alpha) * Math.PI / 180
		x = xloc + R * Math.cos(a)
		y = yloc - R * Math.sin(a)
		path = undefined
		if total is value
			path = [["M", xloc, yloc - R], ["A", R, R, 0, 1, 1, xloc - 0.01, yloc - R]]
		else
			path = [["M", xloc, yloc - R], ["A", R, R, 0, +(alpha > 180), 1, x, y]]
		path: path
	window.tables ?= {}
	onduty = $("#tablewaitermap > table")
	$.ajax(url: '/tables').done (json) ->
		for json_str in json
			el = build_table(json_str, paper)
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
						pair["table"].attr("fill","#4D2900")
		), ->
			#Unhighlight Waiters
			$("tr", onduty).removeClass("highlightedworking")
			#unhighlight tables
			waiternm = $(this).children('td').eq(1).text()
			if (waiternm)
				for key,pair of window.tables
					pair["table"].attr("fill", "black")

build_table = (json, paper) ->
	el = paper.add([json])[0]
	start_party(el) if json["party"]
	set_waiter(el) if json["waiter"]
	return el

start_party = (el) ->
	addCircle(el)

set_waiter = (el) ->
	console.log el


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

#Draws a circle with radius equal to the size of the shortest edge of the passed element and centered on it
addCircle = (el) ->
	paper = el.paper
	midpoint = center(el)
	arc = paper.path().attr(
		stroke: "#f00"
		"stroke-width" : 14
		arc: [midpoint["cx"], midpoint["cy"], 0,100,midpoint["r"] - 5]
		)
	arc.animate
		arc: [midpoint["cx"], midpoint["cy"], 100, 100, midpoint["r"] - 5]
		, 8500, "linear"
	# wrap = []
	# midpoint = center(el)
	# rtn =
	# 	"type" : "circle"
	# 	"fill" : "#f00"
	# $.extend(rtn,midpoint)
	# wrap.push(rtn)
	# paper.add(wrap)


#returns the midpoint and smallest-side size of a passed element in object form
center = (element) ->
	middle = element.getBBox()
	rtn = {}
	# 	"type" : "circle"
	# 	"fill" : "#f00"
	rtn["cx"] =middle["x"] + middle["width"]/2
	rtn["cy"] = middle["y"] + middle["height"] /2
	widerThanTall = middle["height"] < middle["width"]
	rtn["r"] = (if widerThanTall then middle["height"]/2 else middle["width"]/2)
	rtn
