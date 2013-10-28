$(function() {

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
	console.log(index);
}
