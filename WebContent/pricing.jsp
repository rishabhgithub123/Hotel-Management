<!DOCTYPE html>
<html lang="en">


<!-- Mirrored from dreamguys.co.in/preadmin/hotel/default/pricing.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Jul 2019 18:36:28 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <title>Hotel - Pricing</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
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
                        <div class="content container-fluid">
                <div class="row">
                    <div class="col-sm-8 col-4">
                        <h4 class="page-title">Pricing</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6 col-md-4 col-lg-4 col-xl-3">
                        <div class="pricing-box">
                            <h3><font color="blue">Single<br>Non A/C</font></h3>
                            <br>
                            <h1 class="pricing-rate">&#x20b9; 1500</h1>
                            <p></p>
                            <ul>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Free Breakfast</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Free Wifi</li>
								<li><i class="fa fa-check" aria-hidden="true"></i> Laundry</li>
								<li><i class="fa fa-check" aria-hidden="true"></i> Parking</li>
                                <li>&nbsp;</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-4 col-xl-3">
                        <div class="pricing-box">
                         <h3><font color="blue">Single A/C</font></h3>
                         <br>
                         <br>
                            <h1 class="pricing-rate">&#x20b9; 2000</h1>
                            <p></p>
                            <ul>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Free Breakfast</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Free Dinner</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Free Wifi</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Fitness center</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Air Conditioning</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Parking</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Laundry</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-4 col-xl-3">
                        <div class="pricing-box">
                            <h3><font color="blue">Double<br>Non A/C</font></h3>
                            <br>
                            <h1 class="pricing-rate">&#x20b9; 2000</h1>
                            <p></p>
                            <ul>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Free Breakfast</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Free Dinner</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Free Wifi</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Fitness center</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Parking</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Connecting Door</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Conference Hall</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-4 col-xl-3">
                        <div class="pricing-box">
                            <h3><font color="blue">Double A/C</font></h3>
                            <br><br>
                            <h1 class="pricing-rate">&#x20b9; 2500</h1>
                            <p></p>
                            <ul>
                            <li><i class="fa fa-check" aria-hidden="true"></i> Free Breakfast</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Free Dinner</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Free Wifi</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Fitness center</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Air Conditioning</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Parking</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Connecting Door</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Conference Hall</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-sm-6 col-md-4 col-lg-4 col-xl-3">
                        <div class="pricing-box">
                            <h3><font color="blue">Suite</font></h3>
                            <br><br>
                            <h1 class="pricing-rate">&#x20b9; 3000</h1>
                            <p></p>
                            <ul>
                            <li><i class="fa fa-check" aria-hidden="true"></i> Free Breakfast</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Free Dinner</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Free Wifi</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Fitness center</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Air Conditioning</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Parking</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Connecting Door</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> conference Hall</li>
                                <li><i class="fa fa-check" aria-hidden="true"></i> Roof-top pool</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="notification-box">
                <div class="msg-sidebar notifications msg-noti">
                    <div class="topnav-dropdown-header">
                        <span>Messages</span>
                    </div>
                    <div class="drop-scroll msg-list-scroll" id="msg_list">
                        <ul class="list-box">
                            <li>
                                <a href="chat.html">
                                    <div class="list-item">
                                        <div class="list-left">
                                            <span class="avatar">R</span>
                                        </div>
                                        <div class="list-body">
                                            <span class="message-author">Richard Miles </span>
                                            <span class="message-time">12:28 AM</span>
                                            <div class="clearfix"></div>
                                            <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="chat.html">
                                    <div class="list-item new-message">
                                        <div class="list-left">
                                            <span class="avatar">J</span>
                                        </div>
                                        <div class="list-body">
                                            <span class="message-author">John Doe</span>
                                            <span class="message-time">1 Aug</span>
                                            <div class="clearfix"></div>
                                            <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="chat.html">
                                    <div class="list-item">
                                        <div class="list-left">
                                            <span class="avatar">T</span>
                                        </div>
                                        <div class="list-body">
                                            <span class="message-author"> Tarah Shropshire </span>
                                            <span class="message-time">12:28 AM</span>
                                            <div class="clearfix"></div>
                                            <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="chat.html">
                                    <div class="list-item">
                                        <div class="list-left">
                                            <span class="avatar">M</span>
                                        </div>
                                        <div class="list-body">
                                            <span class="message-author">Mike Litorus</span>
                                            <span class="message-time">12:28 AM</span>
                                            <div class="clearfix"></div>
                                            <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="chat.html">
                                    <div class="list-item">
                                        <div class="list-left">
                                            <span class="avatar">C</span>
                                        </div>
                                        <div class="list-body">
                                            <span class="message-author"> Catherine Manseau </span>
                                            <span class="message-time">12:28 AM</span>
                                            <div class="clearfix"></div>
                                            <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="chat.html">
                                    <div class="list-item">
                                        <div class="list-left">
                                            <span class="avatar">D</span>
                                        </div>
                                        <div class="list-body">
                                            <span class="message-author"> Domenic Houston </span>
                                            <span class="message-time">12:28 AM</span>
                                            <div class="clearfix"></div>
                                            <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="chat.html">
                                    <div class="list-item">
                                        <div class="list-left">
                                            <span class="avatar">B</span>
                                        </div>
                                        <div class="list-body">
                                            <span class="message-author"> Buster Wigton </span>
                                            <span class="message-time">12:28 AM</span>
                                            <div class="clearfix"></div>
                                            <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="chat.html">
                                    <div class="list-item">
                                        <div class="list-left">
                                            <span class="avatar">R</span>
                                        </div>
                                        <div class="list-body">
                                            <span class="message-author"> Rolland Webber </span>
                                            <span class="message-time">12:28 AM</span>
                                            <div class="clearfix"></div>
                                            <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="chat.html">
                                    <div class="list-item">
                                        <div class="list-left">
                                            <span class="avatar">C</span>
                                        </div>
                                        <div class="list-body">
                                            <span class="message-author"> Claire Mapes </span>
                                            <span class="message-time">12:28 AM</span>
                                            <div class="clearfix"></div>
                                            <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="chat.html">
                                    <div class="list-item">
                                        <div class="list-left">
                                            <span class="avatar">M</span>
                                        </div>
                                        <div class="list-body">
                                            <span class="message-author">Melita Faucher</span>
                                            <span class="message-time">12:28 AM</span>
                                            <div class="clearfix"></div>
                                            <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="chat.html">
                                    <div class="list-item">
                                        <div class="list-left">
                                            <span class="avatar">J</span>
                                        </div>
                                        <div class="list-body">
                                            <span class="message-author">Jeffery Lalor</span>
                                            <span class="message-time">12:28 AM</span>
                                            <div class="clearfix"></div>
                                            <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="chat.html">
                                    <div class="list-item">
                                        <div class="list-left">
                                            <span class="avatar">L</span>
                                        </div>
                                        <div class="list-body">
                                            <span class="message-author">Loren Gatlin</span>
                                            <span class="message-time">12:28 AM</span>
                                            <div class="clearfix"></div>
                                            <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            <li>
                                <a href="chat.html">
                                    <div class="list-item">
                                        <div class="list-left">
                                            <span class="avatar">T</span>
                                        </div>
                                        <div class="list-body">
                                            <span class="message-author">Tarah Shropshire</span>
                                            <span class="message-time">12:28 AM</span>
                                            <div class="clearfix"></div>
                                            <span class="message-content">Lorem ipsum dolor sit amet, consectetur adipiscing</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </div>
                    <div class="topnav-dropdown-footer">
                        <a href="chat.html">See all messages</a>
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
    <script src="assets/js/app.js"></script>
</body>


<!-- Mirrored from dreamguys.co.in/preadmin/hotel/default/pricing.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Jul 2019 18:36:29 GMT -->
</html>