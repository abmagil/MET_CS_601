var operand1 = "";
var total = "";
var state;


$("#reset").click(function() {
	reset();
});


$("td.number")	//Set behavior for all TDs
	.click( function() {
		updateOperand(this);
})	.mousedown( function() {
	this.style.background = 'grey';
}).mouseup( function() {
	this.style.background = 'white';
});

$("td.operator")	//Set behavior for all TDs
	.click( function() {
		setState(this);
}).mousedown( function() {
	this.style.background = 'grey';
}).mouseup( function() {
	this.style.background = 'white';
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
	total = "";
	state = null;
	$("#result").html("&nbsp;");
}

function updateOperand(button) {
	if (state) {
		operand1 += button.innerHTML;
		$("#result").text(operand1);
	}
	else {
		total += button.innerHTML;
		$("#result").text(total);
	}
}

function setState(button) {
	state = button.innerHTML;
}

function calculate() {
	if (state == "+") {
		total = parseInt(total) + parseInt(operand1);	//stupid overloading...
	}
	if (state == "-") {
		total -= operand1;	
	}		
	if (state == "*") {
		total *= operand1;
	}
	if (state == "/") {
		total /= operand1;
	}
	state;
	operand1 = "";
	$("#result").html("&nbsp;" + total);
}
