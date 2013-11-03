$(function() {

	$("img[name=item_23]").parent().on("click", function() {
		$("#dialog").dialog();
	});

	$("#checkoutBtn").on("click", function() {
		saveCartToSession();
	})
	

	$("input[id*=slider]").on("change", function(event) {
		var itemId = this.id.split("_")[1];
		$("#qty_" + itemId).val(this.value);
	});
	
	var col = $("td:nth-child(1)");

	$("button").button();

	$("#checkoutBtn").on("click", function() {
		location = "checkout.php";
	});
	
	$("#backBtn").on("click", function() {
		location = "index.php";
	});
	
	$("#remove").on("click", function() {
		$(this).closest("tr").remove();
	});
	
	$("tr td img[alt=beautiful]").on("click", function() {
		//TODO modal box goes here for question 1 
	});
	
	applyTax();
}); 

function applyTax() {
	//Find col for price
	var index = -1;
	$("#items thead th").each(function() {
		if ($(this).text() == "Price") {
			index = $(this).index();
		}
	});
	console.log(index); //TODO APPARENTLY RETURN HERE
}

function saveCartToSession() {
	
	var items = $("#items").children("tbody").children("tr").each(function() {
		saveRow($(this));
	});
}


function saveRow(row) {
	var info = {};
	dataCells = row.children("td");
	var prodName = dataCells[1].innerText.replace(/^[a-zA-Z 0-9]/g,'');
	info[prodName] = {};
	info[prodName]["price"] = dataCells[2].innerText;
	info[prodName]["quantity"] = dataCells[3].children[1].value; //Definitely a hack
	$.ajax({
		url : "sessionbuilder.php" ,
		data : info ,
		method : "POST",
	})
}
