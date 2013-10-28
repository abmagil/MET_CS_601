/***********Checkout Page*****************************/
$(function() {
	
	$("button").button();
	
	$("#ChargeBtn").on("click", function() {
		fireValidators();
	});
});
	
function fireValidators() {
	notempty($("#first_name"));
	notempty($("#last_name"));
	notempty($("#line1"));
	notempty($("#city"));
}	

function notempty(domNode) {
	if(!$.trim(domNode.val()).length) {	//taken from http://stackoverflow.com/questions/1854556/check-if-inputs-are-empty-using-jquery 
		domNode.addClass("error");
	} else {
		domNode.removeClass("error");
	}
}
