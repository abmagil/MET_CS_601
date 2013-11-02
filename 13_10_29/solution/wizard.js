var checkMarkMap = {
	"fullName" : "aboutYouDone",
	"state" : "locationDivDone" ,
	"address" : "emailDivDone",
	"completeRegistration" : "reviewDivDone"
}

$(document).ready(function() {
			setCancelClicks()
			setPrevOnClick();
			setContinueOnClick();
			setNameValidation();
			setCheckmarkVisibilities();
		});

function setCancelClicks() {
 $("img[alt=Cancel]").on("click", function() {
	var conf = confirm("Do you really want to cancel?");
	if (conf) window.location = "index.php";
	});
 }

function setPrevOnClick() {
	$("img[alt=Previous]").each(function(){
		$(this).on("click", function() {
			$.ajax({
				url: "sessionremover.php",
				data: $(this).closest("ul").siblings("input,select").serialize() ,
				type: "POST",
				success : function(data) {
					$("#" + checkMarkMap[data]).fadeOut("fast");
				}
			});
		});
	});
}

function setContinueOnClick() {
	$("img[alt=Continue]").each(function() {
			$(this).on("click", function() {
				$.ajax({
					url: "sessionbuilder.php",
					data: $(this).closest("ul").siblings("input,select").serialize() ,
					type: "POST"
				});
			});
		});
}

function setNameValidation() {

	var nameRE = new RegExp("^\w\w+ \w\w+$")

	//$(fullName)
}

function setCheckmarkVisibilities() {
	
	
}
