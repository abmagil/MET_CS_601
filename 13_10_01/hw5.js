var operand1 = "";
var operand2 = "";
var total = 0;
var state;


$("#reset").click(function() {
	reset();
});

$("td.number")	//Set behavior for all TDs
	.click( function() {
		updateOperand(this);
});

$("td.operator")	//Set behavior for all TDs
	.click( function() {
		setState(this);
});

$("#equals")
	.click(function() {
		calculate();
	});

/**
 *Reset state variables and clear display 
 */
function reset() {
	operand1 = "";
	operand2 = "";
	total = 0;
	state = null;
	$("#result").html("&nbsp;");
}

function updateOperand(button) {
	if (state) {
		operand1 += button.innerHTML;
		$("#result").text(operand1);
	}
	else {
		operand2 += button.innerHTML;
		$("#result").text(operand2);
	}
	
}

function setState(button) {
	state = button.innerHTML;
}

function calculate() {
	/**
	 *figure out total operator operand compbination and display it to the screen.
	 * Set as new total. 
	 */
}
