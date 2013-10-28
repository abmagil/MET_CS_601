$(function() {

	$("input[id*=slider]").on("change", function(event) {
		var itemId = this.id.split("_")[1];
		$("#qty_" + itemId).val(this.value);

	});

	$("button").button();


/******Cart Page***********************************/
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
}); 
