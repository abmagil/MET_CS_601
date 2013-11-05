/***********Checkout Page*****************************/
var couponApplied = false;

$(function() {
	
	$("button").button();
	
	$("#stateselector").on("change", function() {
		setTaxAndTotal();
	});
    
    $("#couponBtn").on("click", function() {
    	$.ajax({
    		url : "getCoupons.php",
    		data : $("#couponCode").serialize(),
    		success : function(data) {
    			if (data === "GOOD") {
    				drop10();
    			}
    		}
    	});
    });
    
    $("div[alt=PayDiv] button").on("click", function() {
    	setModalPrices();
    	if (fireValidators()) { 
    		$("#pay-modal").dialog({
	    		modal : true,
	    		buttons : {
	    			"Save order and pay" : function() {
	    				$.ajax({
	    					url: "saveorder.php",
	    					data: $("input").not("input[placeholder='Coupon Code']").serialize()
	    				});
	    				$(this).dialog("close");
	    			},
	    			Cancel: function() {
	    				$(this).dialog("close");
	    			}
	    		}
	    	});
		}
    });
});

	
function fireValidators() {
	if (!(notempty($("#first_name")) && notempty($("#last_name")) && notempty($("#line1")) && notempty($("#city")))) {
		alert("Please enter all required information.");
		return false;
	}
	else {
		return true;
	}
}	

function notempty(domNode) {
	var bool = false;
	if(!$.trim(domNode.val()).length) {	//taken from http://stackoverflow.com/questions/1854556/check-if-inputs-are-empty-using-jquery 
		domNode.addClass("error");
	} else {
		domNode.removeClass("error");
		bool = true;
	}
	return bool;
}

//Returns the taxrate as a decimal (5% = 0.05)
function getTaxRate() {
	$.ajax({
		url : "getTax.php",
		method: "GET",
		data : $("#stateselector").serialize(),
		success : function(data) {
			
		}
	});
}

function setTaxAndTotal() {
	var price = getSubTotal();
	var taxRate = getTaxRate();
	var taxRate = 1 + taxRate;
	$("#grandtotal").val("$" + (price * taxRate).toFixed(2));
}


function drop10() {
	if (!couponApplied) {	//Prevent dropping the price more than once...but not really, since this is all client side.  Obviously, a full solution would be server-side
		var startPriceStr = $("#grandtotal").val();
		startPrice = startPriceStr.replace(/\$/g,'');
		$("#grandtotal").val(startPrice - 10);
		couponApplied = true;
	}
}

function getSubTotal() {
 	return $(".total").text().replace(/\$/g, '');
}


function setModalPrices() {
	var childList = $("#pay-modal").children("p");
	var subtotal = parseFloat(getSubTotal());
	var taxAmt = parseFloat(getTaxRate() * subtotal);
	childList.eq(0).children("span").text(subtotal.toFixed(2));
	childList.eq(1).children("span").text( taxAmt.toFixed(2));
	childList.eq(2).children("span").text((subtotal + taxAmt).toFixed(2));
}
