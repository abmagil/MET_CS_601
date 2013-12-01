# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$ -> 
 $("#canvasholder").ready ->
	paper = new Raphael(document.getElementById('canvasholder'))
	#This was a stackoverflow solution, but I lost the citation.
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
			id = json_str['title']
			r = $("<tr><td>Table <span>" + id + "</span></td><td></td><td><button type='button' class='close hidden' aria-hidden='true'>&times;</button></td></tr>").appendTo(onduty)
			window.tables[id] = {"maprow": r[0]} #Maps between table ID, table and waitermap
			el = build_table(json_str, paper)
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
						tableID =  data["table"] 
						if type is "waiter"
							assign_waiter(name, tableID)
						#Highlight table with party
						if type is "party"
							start_party(window.tables[tableID]["table"])
							$("input[value=" + data["name"] + "]").parent().remove()
						$(this).remove
						window.update = {}
						if type is "fail"
							alert data["message"]
					failure: ->
						alert "Sorry, something went wrong."
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
	el.hover(
		->
			el.attr("fill", "#165E35") if el.data("shape") is undefined
		->
			el.attr("fill", "black")
	)
	window.tables[ json["title"] ]["table"] = el
	add_tag(el)
	start_party(el) if json["party"]
	assign_waiter(json["waiter"], el.attr("title")) if json["waiter"]
	return el

start_party = (el) ->
	seated = $("#status").find("td:contains(Occupied)").next("td")
	add_value(seated, 1)
	addCircle(el)

assign_waiter = (waiter, table) ->
	tableID = table
	#Mark as working on the Waiters list
	#Mark as working in the Waiter Map
	$("td:contains(Table " +tableID+ ")").next().text(waiter).parent()
		.addClass("working")
		.find("button").removeClass("hidden")
	# #Maintain state in window.tables
	window.tables[tableID]["waiter"] = waiter
	# Mark as working on the table tag
	tag = window.tables[tableID]["table"].data("tag")
	tag.attr("fill", "#449065")	##To show which tables are waited on.	

##Add an identification tag to each table
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
	tag = paper.add(wrap)
	paper.text(middle["x"], middle["y"], el.attr("title")).attr("font-size", 18)
	el.data("tag", tag)

#Draws a circle with radius equal to the size of the shortest edge of the passed element and centered on it
addCircle = (el) ->
	paper = el.paper
	midpoint = center(el)
	arc = paper.path().attr(
		stroke: "#fff"
		"stroke-width" : 14
		arc: [midpoint["cx"], midpoint["cy"], 0,100,midpoint["r"] - 5]
	)
	el.data("shape", arc)
	arc.animate
		stroke: "#165E35"
		arc: [midpoint["cx"], midpoint["cy"], 100, 100, midpoint["r"] - 5]
		15 #bump up after testing
		"linear"
		->
			finish_party(el)

finish_party = (el) ->
	replace_progress_with_icon(el)
	prompt_party_removal(el)

prompt_party_removal = (el) ->
	#Get details of party, waiter, etc.
	$.ajax(
		url: "/tables/" + el.attr("title")
		success: (data, textStatus, jqXHR) ->
			addrow = $(data).prependTo($("#notifications"))
			$("button", addrow).on
				click: ->
					$.ajax(
						url: "/party/" + $(this).next("input").val()
						type: "POST"
						dataType: 'json'
						data:
							_method: "put"
							event: "bus"
						success: (data, textStatus, jqXHR) ->
							if data["cleared"]
								el.data("shape").remove()
								addrow.remove()
								seated = $("#status").find("td:contains(Occupied)").next("td")
								add_value(seated, -1)
								waiter_balance = $("#offduty").find("span:contains(" + data["waiter"] + ")").next()
								# console.log waiter_balance
								add_value(waiter_balance, data["waiter_tip"])
							table = data["table"]
					)
	)



replace_progress_with_icon = (el) ->
		dollar_path_str = "M16,1.466C7.973,1.466,1.466,7.973,1.466,16c0,8.027,6.507,14.534,14.534,14.534c8.027,0,14.534-6.507,14.534-14.534C30.534,7.973,24.027,1.466,16,1.466z M17.255,23.88v2.047h-1.958v-2.024c-3.213-0.44-4.621-3.08-4.621-3.08l2.002-1.673c0,0,1.276,2.223,3.586,2.223c1.276,0,2.244-0.683,2.244-1.849c0-2.729-7.349-2.398-7.349-7.459c0-2.2,1.738-3.785,4.137-4.159V5.859h1.958v2.046c1.672,0.22,3.652,1.1,3.652,2.993v1.452h-2.596v-0.704c0-0.726-0.925-1.21-1.959-1.21c-1.32,0-2.288,0.66-2.288,1.584c0,2.794,7.349,2.112,7.349,7.415C21.413,21.614,19.785,23.506,17.255,23.88z"
		dollar = el.paper.path(dollar_path_str).attr(
			fill: "#165E35", stroke: "none"
		)
		path = el.data("shape")
		el.data("shape", dollar)
		source = center(dollar)
		target = center(el)
		xoffset = target["cx"] - source["cx"]
		yoffset = target["cy"] - source["cy"]
		scale = target["r"] / source["r"]
		translationStr = "T" + xoffset + "," + yoffset + "s" + (scale)
		path.remove()
		dollar.transform(translationStr)
		rotation_str = ",R360," + target["cx"] + "," + target["cy"]
		dollar.animate(
			transform: translationStr + rotation_str, 1000, ">"	# Have to include translation in animation or it moves back to initial point
		)

#returns the midpoint and smallest-side size of a passed element in object form
center = (element) ->
	middle = element.getBBox()
	rtn = {}
	rtn["cx"] =middle["x"] + middle["width"]/2
	rtn["cy"] = middle["y"] + middle["height"] /2
	widerThanTall = middle["height"] < middle["width"]
	rtn["r"] = (if widerThanTall then middle["height"]/2 else middle["width"]/2)
	rtn

#Helper TODO FIX.
add_value = (element, incrementor) ->
	old_val = parseFloat(element.text(), 10)
	new_val = old_val + parseFloat(incrementor, 10)
	element.text(new_val)