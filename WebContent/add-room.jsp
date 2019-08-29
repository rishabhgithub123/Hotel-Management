<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <title>Hotel - Add Room</title>
   <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <!--[if lt IE 9]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
	<![endif]-->
</head>

<body>
    <div class="main-wrapper">
        <div class="header">
			<div class="header-left">
				<a href="home.jsp" class="logo">
					<img src="assets/img/logo.png" width="35" height="35" alt=""> <span>Hotel</span>
				</a>
			</div>
			<div class="menubar">
				<a id="toggle_btn" href="javascript:void(0);"><i class="fa fa-bars"></i></a>
			</div>		
            <a id="mobile_btn" class="mobile_btn float-left" href="#sidebar"><i class="fa fa-bars"></i></a>
            <ul class="nav user-menu float-right">
                
                <li class="nav-item dropdown has-arrow">
                    <a href="#" class="dropdown-toggle nav-link user-link" data-toggle="dropdown">
                        <span class="user-img"><img class="rounded-circle" src="assets/img/user.jpg" width="40" alt="Admin">
							<span class="status online"></span></span>
							
                        <span><%
							Object o = session.getAttribute("loginuser");
							String usr = (String)o;
							out.println(usr);
							%></span>
                    </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="settings.jsp">Settings</a>
						<a class="dropdown-item" href="Logout.jsp">Logout</a>
					</div>
                </li>
            </ul>
            <div class="dropdown mobile-user-menu float-right">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                <div class="dropdown-menu dropdown-menu-right">
                    <a class="dropdown-item" href="settings.jsp">Settings</a>
                    <a class="dropdown-item" href="Logout.jsp">Logout</a>
                </div>
            </div>
        </div>
        <div class="sidebar" id="sidebar">
            <div class="sidebar-inner slimscroll">
                <div id="sidebar-menu" class="sidebar-menu">
                    <ul>
                        <li class="menu-title">Main</li>
                        <li class="active" >
                            <a class="active" href="home.jsp"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a>
                        </li>
						<li class="submenu">
							<a href="#"><i class="fa fa-suitcase" aria-hidden="true"></i><span> Booking</span> <span class="menu-arrow"></span></a>
							<ul style="display: none;">
								<li><a href="all-booking.jsp">All Booking</a></li>
								<li><a href="edit-booking.jsp">Edit Booking</a></li>
								<li><a href="add-booking.jsp">Add Booking</a></li>
							</ul>
						</li>
						<li class="submenu">
							<a href="#"><i class="fa fa-key" aria-hidden="true"></i> <span> Rooms </span> <span class="menu-arrow"></span></a>
							<ul style="display: none;">
								<li><a href="all-rooms.jsp">All Rooms</a></li>
								<li><a href="edit-room.jsp">Edit Room</a></li>
								<li><a href="add-room.jsp">Add Room</a></li>
							</ul>
						</li>
                        <li class="submenu">
							<a href="#"><i class="fa fa-user"></i> <span> Staff </span> <span class="menu-arrow"></span></a>
							<ul style="display: none;">
								<li><a href="all-staff.jsp">All Staff</a></li>
								<li><a href="edit-staff.jsp">Edit Staff</a></li>
								<li><a href="add-staff.jsp">Add staff</a></li>
							</ul>
						</li>
                        <li>
                            <a href="pricing.jsp"><i class="fa fa-money" aria-hidden="true"></i> <span>Pricing</span></a>
                        </li>
						<li class="submenu">
							<a href="#"><i class="fa fa-money"></i> <span> Accounts </span> <span class="menu-arrow"></span></a>
							<ul style="display: none;">
								<li><a href="invoices.jsp">Invoices</a></li>
								<li><a href="payment.jsp">Payments</a></li>
							</ul>
						</li>
						<li>
                            <a href="reports.jsp"><i class="fa fa-money" aria-hidden="true"></i> <span>Feedbacks</span></a>
                        </li>
                        <li>
                            <a href="settings.jsp"><i class="fa fa-cog"></i> <span>Settings</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="page-wrapper">
                        <div class="content">
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <h4 class="page-title">Add Room</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8 offset-lg-2">
                        <form method="get" action="Add_room">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
										<label>Room Number</label>
										<input name ="room_no" class="form-control" type="text" required>
									</div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Room type</label>
                                        <select name="room_type" class="select">
                                            <option value="Single A/C">Single A/C</option>
                                            <option value="Single Non A/C">Single Non A/C</option>
                                            <option value="Double A/C">Double A/C</option>
                                            <option value="Double Non A/C">Double Non A/C</option>
                                            <option value="Suite">Suite</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
							<div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Floor Number</label>
                                        <select name="floor_no" class="select">
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="m-t-20 text-center">
                                <button class="btn btn-primary submit-btn">Save</button>
                                <button class="btn btn-danger submit-btn">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="sidebar-overlay" data-reff=""></div>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/select2.min.js"></script>
	<script src="assets/js/moment.min.js"></script>
	<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="assets/js/app.js"></script>
</body>
</html>