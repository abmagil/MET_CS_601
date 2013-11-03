<?php
	session_start();
?>

<!doctype html>
<html>
 <head>
  <title>CS Flowers</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="styles/stylesheet.css" type="text/css" charset="utf-8" />
  <link rel="stylesheet" type="text/css" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script src="http://codeorigin.jquery.com/jquery-2.0.3.min.js"></script>
  <script src="http://codeorigin.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
  <script src="cart.js" type="text/javascript"></script>
 </head>
 <body>
   <div id="name">CS Flowers</div>

   <div id="container">
	
     <h1><img src="images/cart.png" alt="Cart">Your Basket Contains</h1>

     <div name="Flower Border">
      &nbsp;
     </div>

     <table id="items">
	  <thead>
		<tr>
			<th>Remove</th>
			<th>Item</th>
			<th>Price</th>
			<th>Quantity</th>
		</tr>
	 </thead>
	 <tbody>
		<tr>
			<td><img id="remove" src="images/remove.png" alt="Remove"></td>
			<td><img name="item_23" src="images/beautiful.jpg" alt="beautiful" >
				<div id="dialog" class="hidden">
					<p>These are the details for the Wild Hearts bouquet.</p>
				</div>
				&quot;Wild Hearts&quot;</td>
			<td>$120.00</td>
			<td>
				<input type="range" id="slider_23" min="0" max="5" step="1" value="1" >
				<input type="text" id="qty_23" size="2" maxlength="2" value="1" readonly >
			</td>
		</tr>
	  </tbody>
    </table>

	<div alt="Button Bar">
      <button type="button" id="backBtn">
	   <img src="images/back.jpg" alt="Continue Shopping">
	    Return to shopping
      </button>
      <button type="button" id="checkoutBtn">
	   <img src="images/cart.png" alt="Continue Checkout">
	    Continue to checkout
      </button>
    </div>

   </div>
  
 </body>
</html>