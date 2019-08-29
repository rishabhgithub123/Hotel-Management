<!DOCTYPE html>
<html>
<head>
<title>Feedback</title>
<link rel="stylesheet" type="text/css" href="assets/style.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
</head>
<body>
	<header id="main-header">
		<div class="container">
			<h1>Feedback</h1>
		</div>
	</header>
	<nav id="navbar">
		<div class="container">
			<ul>
				<li><a href="customer.jsp">Back to home</a></li>
				

			</ul>
		</div>
	</nav>
	
	<div class="form-container">
	<div class="container-5" id=bookroom>
	<form  method="get" action="Feedback">
	<div class="box-111">
			<h2>
			<label>Name</label>
            <font color="black"><input type="text" name="fname" class="form-control" required></font>
			</h2>
		</div>
		<div class="box-111">
			<h2>
			<textarea cols="100" rows="9" placeholder="  write your feedback" name="feedback"></textarea>
			</h2>
		</div>
		
		
		
		<div class="box-333">
			<h2>
				<button>Sumbit</button>
			</h2>
		</div>
		</form>
	</div>
	</div>
	
</body>
</html>