 <!doctype html>
<html>
 <head>
  <title>CS Flowers</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="styles/stylesheet.css" type="text/css" charset="utf-8" />
  <script src="http://codeorigin.jquery.com/jquery-2.0.3.min.js"></script>
  <script src="http://codeorigin.jquery.com/ui/1.10.3/jquery-ui.min.js"></script>
  <script>
    $(function() {
		$("#gallery img").click(function() {
		  $( "#gallery" ).slideUp( "slow", function() {
		    // Animation complete.
		  });
		  $("#details").fadeIn();
		});
		
		$("img[alt=Home]").click(function() {
		  $( "#gallery" ).slideDown( "slow", function() {
		    // Animation complete.
		  });
		  $("#details").fadeOut();
		});
		
		$("article + div > cite").on("click", function(event) {
			document.location="cart.php";
		})
    });
  </script>
  
  <style>
   article + div > cite:hover {
	 border: 1px dotted orange;
   }
    article + div {
	   margin: auto;
	   text-align: center;
   }
    article + div > cite {
	   display: block;
	   color: orange;
	   font-size: 30px;
   }
  </style>
 </head>
 <body>
   <div id="name">CS Flowers</div>

   <div id="gallery">
	<div><img src="images/blue.jpg" alt="blue" ></div>
	<div><img src="images/beautiful.jpg" alt="beautiful"></div>
	<div><img src="images/orange.jpg" alt="orange" ></div>
	<div><img src="images/purple.jpg" alt="purple" ></div>
	<div><img src="images/roses.jpeg" alt="roses" ></div>
	<div><img src="images/tulips.jpg" alt="tulips" ></div>
   </div>

   <div id="details">
	    <section>
		  <img src="images/home.png" alt="Home">
		  <header>&quot;Wild Hearts&quot;</header>
		  <div><img src="images/beautiful.jpg" alt="beautiful"></div>
		  <article>
			   Wild hearts is for those that have wild in their hearts.
			   A beautiful collection of flowers, that will cost your plenty.
			   We love selling these flowers - it boosts our profit margin by
			   leaps and bounds.
		  </article>
		  <div>
		   <span class="price" id="item_23">$120.00</span>
		   <cite id="cart_23">Add to cart</cite>
		  </div>
		   
		</section>
   </div>
 </body>
</html>