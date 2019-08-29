<!DOCTYPE html>
<html>
<head>
<title>Welcome</title>
<link rel="stylesheet" type="text/css" href="assets/style.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
</head>
<body>
	<header id="main-header">
		<div class="container">
			<h1>HOTEL SURYA</h1>
		</div>
	</header>
	<nav id="navbar">
		<div class="container">
			<ul>
				<li><a href="customer.jsp">Home</a></li>
				<li><a href="#book">Booking</a></li>
				<li><a href="index.jsp">Admin Login</a></li>
				

			</ul>
		</div>
	</nav>

	<div class="third">
		<h2>
			BEST N' FRESH<br> -- Bed &amp; Breakfast --
		</h2>


	</div>

	<section id="showcase2">
		<div class="container">
			<h1>Far from Home?</h1>
		</div>
	</section>

	<section id="showcase">
		<div class="container">
			<h1>
				“There is only one boss, The Guest."
				</h1>	
		</div>


	</section>
	<section id="showcase3">
		<div class="container">
			<div class="bg-image2" id="rooms1">
			</div>
			<h1>Our Rooms</h1>
		</div>
		<div class="container">
			<div class="bg-image3">
				 
			</div>
			<h3 style="font-size:32px; color:white;">
					<i>At Surya, our passion is to connect our guests to the very
						best of our destinations. From the beaches of Hawaii and Bermuda
						to the deserts of the United Arab Emirates to the heart of London,
						our hotels offer guests extraordinary places, created by combining
						unique architecture and structure, expressive decor and artistry,
						and magnificent features.</i>
			</h3>
		</div>
	</section>
	<div class="container-3" id="services1">

		<div>
			<h1>Our Services</h1>
		</div>

	</div>


	<div class="container-1">
		<div class="box-1">
			<h2>
				<font color="black">Breakfast</font><br> <i
					class="fas fa-mug-hot"></i><br>
			</h2>
		</div>
		<div class="box-2">
			<h2>
				<font color="black">Garden</font><br> <i class="fas fa-tree"></i>

				<br>
			</h2>
		</div>
		<div class="box-3">
			<h2>
				<font color="black">Pool</font><br> <i class="fas fa-swimmer"></i>
				<br>
			</h2>
		</div>
	</div>

	<div class="container-2">
		<div class="box-1">
			<h2>
				<font color="black">Free WiFi</font><br> <i class="fas fa-wifi"></i><br>
			</h2>
		</div>
		<div class="box-2">
			<h2>
				<font color="black">Daily Houskeeping</font><br> <i
					class="fas fa-broom"></i> <br>
			</h2>
		</div>
		<div class="box-3">
			<h2>
				<font color="black">Dining Service</font><br> <i
					class="fas fa-utensils"></i> <br>
			</h2>
		</div>
	</div>
	<div class="container-2">
		<div class="box-1" id="gallery1">
			<h2>
				<img
					src="assets/img/2f3cfa9a13ce98dbed1986fcda384935.jpg"
					alt="Smiley face" height="650" width="380">
			</h2>
		</div>
		<div class="box-2">
			<h2>
				<img
					src="assets/img/434e3f48d1f2b156f586be7ad3d16cd0.jpg"
					alt="Smiley face" height="650" width="380">
			</h2>
		</div>
		<div class="box-3">
			<h2>
				<img
					src="assets/img/9ecbcbc3dc04faff5577c0281eed5088.jpg"
					alt="Smiley face" height="650" width="380">
			</h2>
		</div>
	</div>
	<div class="container-3">

		<div>
			<h1>Things to do</h1>
		</div>

	</div>


	<div class="container-1">
		<div class="box-1">
			<h2>
				<font color="black">Wineries Tour</font><br> <i
					class="fas fa-map-marked"></i><br>
			</h2>
		</div>
		<div class="box-2">
			<h2>
				<font color="black">Cultural Sites</font><br> <i
					class="fas fa-gopuram"></i> <br>
			</h2>
		</div>
		<div class="box-3">
			<h2>
				<font color="black">Market Tour</font><br> <i
					class="fas fa-store-alt"></i> <br>
			</h2>
		</div>
	</div>

	<div class="container-2">
		<div class="box-1" id="seedo1">
			<h2>
				<font color="black">Gaming Center</font><br> <i
					class="fas fa-gamepad"></i><br>
			</h2>
		</div>
		<div class="box-2">
			<h2>
				<font color="black">Birds Safari</font><br> <i
					class="fas fa-dove"></i> <br>
			</h2>
		</div>
		<div class="box-3">
			<h2>
				<font color="black">Horse Riding</font><br> <i
					class="fas fa-horse"></i> <br>
			</h2>
		</div>
	</div>
	<div class="form-container" id="book">
	<div class="container-5" id=bookroom>
	<form method="get" action="Add_customer">
	<div class="box-111">
			<h2>
			<font color="black">Name<input type="text" name="C_name" required></font>
			</h2>
		</div>
		<div class="box-111">
			<h2>
			<font color="black">Contact<input type="text" name="location" required></font>
			</h2>
		</div>
		<div class="box-222">
			<h2>
				<font color="black">CHECK-IN<input type="text" name="checkin" placeholder="DD/MM/YYYY" required></font>
			</h2>
		</div>
		<div class="box-3333">
			<h2>
				<font color="black">CHECK-OUT<input type="text" name="checkout" placeholder="DD/MM/YYYY" required></font>
			</h2>
		</div>
		<div class="box-333">
			<h2>
				<font color="black"><label>Room type</label>
                                        <select name="Croom_type" class="select">
                                            <option value="Single A/C">Single A/C</option>
                                            <option value="Single Non A/C">Single Non A/C</option>
                                            <option value="Double A/C">Double A/C</option>
                                            <option value="Double Non A/C">Double Non A/C</option>
                                            <option value="Suite">Suite</option>
                                        </select></font>
			</h2>
		</div>
		<div class="box-333">
			<h2>
				<button type="submit">BOOK ROOM</button>
			</h2>
		</div>
		</form>
	</div>
	</div>
	<div align="right">
			<h2>
				<button onclick="location.href = 'feedback.jsp'">Give Feedback</button>
			</h2>
		</div>



	
</body>
</html>