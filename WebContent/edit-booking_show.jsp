<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	String driver = application.getInitParameter("driver");
	String url = application.getInitParameter("url");
	String bduser = application.getInitParameter("user");
	String dbpass = application.getInitParameter("pass");
	Connection con = null;
	PreparedStatement ptr = null;
	RequestDispatcher rd = null;
	try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, bduser, dbpass);
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">
<title>Hotel-Edit Booking Details</title>
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
<link rel="stylesheet" type="text/css"
	href="assets/css/bootstrap-datetimepicker.min.css">
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
		<%
                    
					try{
							int b_id = Integer.parseInt(request.getParameter("tf1"));
							ptr = con.prepareStatement("SELECT count(b_id) FROM hotel_management.booking_info where b_id ="+b_id);
							ResultSet rs2=ptr.executeQuery();
							rs2.next();
							if(rs2.getInt(1)==1) {
								ptr = con.prepareStatement("SELECT * FROM hotel_management.booking_info where b_id ="+b_id);
								ResultSet rs1=ptr.executeQuery();
								while(rs1.next()) {	
							
							
					%>
		<div class="page-wrapper">
			<div class="content">
				<div class="row">
					<div class="col-lg-8 offset-lg-2">
						<h4 class="page-title">Edit Booking</h4>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-8 offset-lg-2">
						<form method="get" action="Edit_booking">
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Booking ID</label> <input class="form-control" type="text" name="tf1" placeholder="ID" value="<%out.println(rs1.getInt(1));%>" readonly required>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label> Name</label>
										<input class="form-control" type="text" value="<%out.println(rs1.getString(2));%>" disabled>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
										<div class="form-group">
											<label>Room type</label> <select class="select" disabled>
												<option value="101">Single A/C</option>
												<option value="102">Double A/C</option>
												<option value="103">Single Non A/C</option>
												<option value="104">Double Non A/C</option>
												<option value="105">Suite</option>
											</select>
										</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label> Room No</label>
										<input class="form-control" type="text" value="<%out.println(rs1.getInt(4));%>" disabled>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>Booking Date</label>
										<div class="cal-icon">
											<input type="text" class="form-control datetimepicker" value="<%
											java.util.Date b_Date = new java.util.Date(rs1.getDate(5).getTime());
											out.println(new SimpleDateFormat("dd/MM/yyyy").format(b_Date));%>" disabled>
										</div>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>Booking Time</label>
										<div class="time-icon">
											<input type="text" class="form-control" id="datetimepicker3" value="<%out.println(rs1.getString(6));%>" disabled>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Arrive </label>
                                        <div class="cal-icon">
                                            <input type="text" class="form-control datetimepicker" value="<%
											java.util.Date a_Date = new java.util.Date(rs1.getDate(7).getTime());
											out.println(new SimpleDateFormat("dd/MM/yyyy").format(a_Date));%>" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                     <div class="form-group">
                                        <label>Depart </label>
                                        <div class="cal-icon">
                                            <input type="text" class="form-control datetimepicker" name="tf3" value="<%
											java.util.Date d_Date = new java.util.Date(rs1.getDate(8).getTime());
											out.println(new SimpleDateFormat("dd/MM/yyyy").format(d_Date));%>" required>
                                        </div>
                                    </div>
                                </div>
                            </div>
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label> Email</label> <input class="form-control" type="email" name="tf4" placeholder="Email" value="<%out.println(rs1.getString(9));%>" required>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label> Phone Number</label> <input class="form-control" type="text" name="tf5" placeholder="Phone Number" value="<%out.println(rs1.getString(10));%>" required>
									</div>
								</div>
							</div>

							<div class="form-group">
								<label>Message</label>
								<textarea cols="30" rows="4" class="form-control" name="tf6" placeholder="Youre Message Here"><%out.println(rs1.getString(11));%></textarea>
							</div>

							<div class="m-t-20 text-center">
								<button class="btn btn-primary submit-btn">Save</button>
							</div>
						</form>
						<%
							}
								} else {
									rd = request.getRequestDispatcher("edit-booking.jsp");
									out.println("<center><h3 style= color:red>Try Again...! No Data is Found</h3></center>");
									rd.include(request, response);
									
								}

							ptr.close();
							con.close();


							} catch (Exception e) {
								rd = request.getRequestDispatcher("edit-booking.jsp");
								out.println("<center><h3 style= color:red>Try Again...! No Data is Found</h3></center>");
								rd.include(request, response);
								
							}
				
				%>
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
	<script>
		$(function() {
			$('#datetimepicker3').datetimepicker({
				format : 'LT'

			});
		});
	</script>
</body>


<!-- Mirrored from dreamguys.co.in/preadmin/hotel/default/edit-booking.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 19 Jul 2019 18:36:27 GMT -->
</html>