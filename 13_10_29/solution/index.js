$(document).ready(function() {
	$("#imgdiv").addClass("hidden");

	$("#catpic").on("click", function() {
		$("#imgdiv").removeClass('hidden').addClass("showright");
	});

});