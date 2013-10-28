 <!doctype html>
<html>
 <head>
  <title>CS Flowers</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="styles/stylesheet.css" type="text/css" charset="utf-8" />
  <link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://codeorigin.jquery.com/jquery-2.0.3.min.js"></script>
  <script src="http://codeorigin.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
  <script src="checkout.js" type="text/javascript"></script>
  
  <style>
  img[alt="Pay Now"] {
	    height: 64px;
	    width: 64px; 
	    padding-right: 10px;
	    vertical-align: middle;
  }
  img[alt="Your Information"], img[alt="Billing Address"] {
	    height: 36px;
	    width: 36px;
}
fieldset {
	 margin-top: 20px;
	 font-size: 34px;
}
  </style>
 </head>
 <body>
   <div id="name">CS Flowers</div>

   <div id="checkout_container">
	
     <h1><img src="images/cart.png" alt="Cart">Checkout</h1>

     <img src="images/flower_line.gif">

     <fieldset>
	   <legend><img src="images/person.jpeg" alt="Your Information">Your Information</legend>
     <div>
      <input type="text" maxlength="25" size="25" name="first_name" id="first_name" alt="First Name" placeholder="First Name">
     </div>

     <div>
	   <input type="text" maxlength="25" size="25" name="last_name" id="last_name" alt="Last Name" placeholder="Last Name">
	 </div>
     </fieldset>

     <fieldset>
	  <legend><img src="images/home2.png" alt="Billing Address">Billing Address</legend>
		
     <div>
	   <input type="text" maxlength="255" size="50" name="line1" id="line1" alt="Address Line 1" placeholder="Address (line 1)">
	 </div>

     <div>
	   <input type="text" maxlength="255" size="50" name="line2" id="line2" alt="Address Line 2" placeholder="Address (line 2)">
	 </div>

     <div>
	   <input type="text" maxlength="25" size="25" name="city" id="city" alt="City" placeholder="City">
	 </div>

	


    <div alt="PayDiv">
      <button type="button" id="ChargeBtn">
	   <img src="images/online_payments.png" alt="Pay Now">
	     Pay Now
      </button>
    </div>

   </div>
  
 </body>
</html>