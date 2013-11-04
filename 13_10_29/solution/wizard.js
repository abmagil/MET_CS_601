var checkMarkMap = {
	"fullName" : "aboutYouDone",
	"state" : "locationDivDone" ,
	"address" : "emailDivDone",
	"completeRegistration" : "reviewDivDone"
};

$(document).ready(function() {
			setCancelClicks();
			setPrevOnClick();
			setContinueOnClick();
			setNameValidation();
			setStateValidation();
			setEmailValidation();
			setAjaxSpinner();
		});
		
		
function setAjaxSpinner() {	//Technique cribbed from http://stackoverflow.com/questions/68485/how-to-show-loading-spinner-in-jquery
	$(document)
    .ajaxStart(function() {
        $("img[src='spinning-wheel.gif']").show();
    })
    .ajaxStop(function() {
        $("img[src='spinning-wheel.gif']").hide();
    });
}		

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
					$("#" + checkMarkMap[data]).fadeOut("fast");	//This is definitely a hack for time reasons.  It accomplishes the goal, but leaves the checkmark flashing visible briefly.
				}
			});
		});
	});
}

function setContinueOnClick() {
	$("img[alt=Continue]").each(function() {
			$(this).on("click", function() {
				if (!$(this).hasClass('disabled')) {
					$.ajax({
						url: "sessionbuilder.php",
						data: $(this).closest("ul").siblings("input,select").serialize() ,
						type: "POST"
					});
				}
			});
		});
}

function setNameValidation() {

	var nameRE = /\w{2,} \w{2,}/;
	var contButtons = $("#fullName").siblings("ul").find("img[alt=Continue]");
	
	$("#fullName").on("keyup",function() {
		var nameMatch = nameRE.test($(this).val());
		if (nameMatch) {
			contButtons.each(function() {
				$(this).removeClass('disabled');
				$(this).on("click blur", function() {
					navigate('aboutYou', 'locationDiv');
				});
			});
		} else {
			contButtons.each(function() {
				$(this).addClass('disabled');
			//	$(this).unbind("click");	//These are working TOO well, so removing.
			});
		}
	})
	.on("change", function() {
		$.ajax({
			url : "namechecker.php",
			data : $(this).serialize() ,
			success : function(data) {
				if (data === "NAME_DOES_NOT_EXIST") {
					$("#fullName").after("<img src='thumbs_up.jpeg' />");	//Adds multiples if for some reason the user keeps entering unused names
				}
				if (data === "NAME_EXISTS") {
					alert("That name is already taken.  Please try again");
					$("#fullName").val("");	//Can't access fullName via "this"
				}
			}
		});
	});
}

function setStateValidation() {
	var contButtons = $("#state").siblings("ul").find("img[alt=Continue]");
	
	$("#state").on('click blur keyup',function() {
		var pass = $(this).val() != "Select One"; 
		if (pass) {
			contButtons.each(function() {
				$(this).removeClass('disabled');
				$(this).on("click", function() {
					navigate('locationDiv', 'emailDiv');
				});
			});
		} else {
			contButtons.each(function() {
				$(this).addClass('disabled');
			//	$(this).unbind("click");
			});
		}
	});
	
}

function setEmailValidation() {
	
	var contButtons = $("#address").siblings("ul").find("img[alt=Continue]");
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

	$("#address").on('blur keyup',function() {
		var pass = re.test($(this).val()); 
		if (pass) {
			contButtons.each(function() {
				$(this).removeClass('disabled');
				$(this).on("click", function() {
					navigate('emailDiv', 'confirmDiv');
				});
			});
		} else {
			contButtons.each(function() {
				$(this).addClass('disabled');
			//	$(this).unbind("click");
			});
		}
	});

}

function completeRegistration() {
	$("img[alt=Complete]").on("click", function() {
		$.ajax({
			url : "saveToDB.php",
			success : function(data) {
				if (data == "PASS") {
					alert("Success!");
					window.location.reload(true);
				}
				if (data == "FAIL") {
					$("img[alt=Complete]").parent().after("<div><p>Sorry, our system failed.  We are going to fire these developers...</p></div>");
				}
			}
		});
	});
}
