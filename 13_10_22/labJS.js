function go() {
	setGoButton();
}

function setGoButton() {
	btn = $("#go");
	btn.on("click", function() {
		console.log("you clicked.");
	});
}
