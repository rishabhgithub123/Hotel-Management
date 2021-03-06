<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.*"%>
<% 
String driver = application.getInitParameter("driver");
String url = application.getInitParameter("url");
String bduser = application.getInitParameter("user");
String dbpass = application.getInitParameter("pass");
Connection con = null;
PreparedStatement ptr = null;
ResultSet rs = null;
float a=0,b=0,c=0,d=0,f=0,room_avl=0,booking=0,exp=0,feed=0;
try{
	Class.forName(driver);
	con = DriverManager.getConnection(url, bduser, dbpass);
	ptr = con.prepareStatement("select count(room_no) from room_info where status = 'INACTIVE';");
	rs=ptr.executeQuery();
	while(rs.next()){
		 a = rs.getInt(1);
	}
	
	ptr = con.prepareStatement("select count(room_no) from room_info");
	rs=ptr.executeQuery();
	while(rs.next()){
		 b = rs.getInt(1);
	}
	ptr = con.prepareStatement("select count(*) from booking_info");
	rs=ptr.executeQuery();
	while(rs.next()){
		 c = rs.getInt(1);
	}
	ptr = con.prepareStatement("select sum(amount) from payment_info;");
	rs=ptr.executeQuery();
	while(rs.next()){
		 d = rs.getInt(1);
	}
	ptr = con.prepareStatement("select count(*) from feedback_info;");
	rs=ptr.executeQuery();
	while(rs.next()){
		 f = rs.getInt(1);
	}
	
	room_avl = (a/b)*100;
	booking = (c/b)*100;
	exp = (d/100000)*100;
	feed = (f/100)*100;	
	
}catch(Exception e){
	e.printStackTrace();	
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <title>Hotel - Dashboard</title>
     <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/plugins/morris/morris.css">
    <link rel="stylesheet" type="text/css" href="assets/css/jquery.circliful.css">
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <!--[if lt IE 9]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
	<![endif]-->
	<script type="text/javascript">
	var room_avl = <%out.println(room_avl);%>;
	var booking = <%out.println(booking);%>;
	var exp = <%out.println(exp);%>;
	var feed = <%out.println(feed);%>;
	</script>
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
                    <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="dash-widget">
							<div class="row no-gutters">
								<div class="col-5">
									<div class="circle1"></div>
								</div>
								<div class="col-7">
									<div class="dash-widget-info text-right">
										<h3><% out.println((int)c); %></h3>
										<span class="widget-title1">Total Booking </span>
									</div>
								</div>
							</div>
						</div>
					</div>
					 <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="dash-widget">
							<div class="row no-gutters">
								<div class="col-5">
									<div class="circle2"></div>
								</div>
								<div class="col-7">
									<div class="dash-widget-info text-right">
										<h3><% out.println((int)a); %></h3>
										<span class="widget-title2">Availble Rooms </span>
									</div>
								</div>
							</div>
						</div>
					</div>
					 <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="dash-widget">
							<div class="row no-gutters">
								<div class="col-5">
									<div class="circle3"></div>
								</div>
								<div class="col-7">
									<div class="dash-widget-info text-right">
										<h3><% out.println((int)f); %></h3>
										<span class="widget-title3">Feedback </span>
									</div>
								</div>
							</div>
						</div>
					</div>
                   <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                        <div class="dash-widget">
							<div class="row no-gutters">
								<div class="col-5">
									<div class="circle4"></div>
								</div>
								<div class="col-7">
									<div class="dash-widget-info text-right">
										<h3>&#x20b9; <% out.println((int)d); %></h3>
										  <span class="widget-title4">Collections </span>
									</div>
								</div>
							</div>
						</div>
					</div>
                </div>
				
				<div class="row">
					<div class="col-12 col-md-12 col-lg-12 col-xl-6">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title d-inline-block">Booking</h4> <a href="all-booking.jsp" class="btn btn-primary float-right">View all</a>
							</div>
							<div class="card-body p-0">
							<div class="table-responsive">
							<table class="table table-striped custom-table">
								<%
								try {
      								ptr = con.prepareStatement("select booking_info.b_id,booking_info.b_name,room_info.room_type,booking_info.b_roomNo,booking_info.b_phone from booking_info join room_info on booking_info.b_id=room_info.customer_id limit 4;");
	  								rs=ptr.executeQuery();
									out.println("<thead><tr><th>Booking ID</th><th>Name</th><th>Room Type</th><th>Room No</th><th>Phone</th></tr></thead><tdody>");
	  								while(rs.next()) {
	  								out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getInt(4)+"</td><td>"+rs.getString(5)+"</td></tr>");
	  								}
	  							} catch (Exception e) {
	  							e.printStackTrace();
	  							}
	  
								%>	
								</tbody>
							</table>
						</div>
							</div>
						</div>
					</div>
                    <div class="col-12 col-md-12 col-lg-12 col-xl-6">
                        <div class="card member-panel">
							<div class="card-header">
								<h4 class="card-title d-inline-block">Pricing </h4> <a href="pricing.jsp" class="btn btn-primary float-right">View all</a>
							</div>
                            <div class="card-body">
                                <div class="table-responsive">
							<table class="table table-striped custom-table">
								<%
								try {
      								ptr = con.prepareStatement("select * from room_rate limit 4;");
	  								rs=ptr.executeQuery();
									out.println("<thead><tr><th>Room Type</th><th>Rate</th><th>Action</th></tr></thead><tdody>");
	  								while(rs.next()) {
	  								out.println("<tr class=text-primary text-uppercase><td>"+rs.getString(1)+"</td><td>"+rs.getInt(2)+"</td><td><a href=pricing.jsp>View</a></td></tr>");
	  								}
	  							} catch (Exception e) {
	  							e.printStackTrace();
	  							}
	  
								%>									
								</tbody>
							</table>
						</div>
                            </div>
                           
                        </div>
                    </div>
				</div>
				<div class="row">
					<div class="col-12 col-md-12 col-lg-12 col-xl-6">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title d-inline-block">Rooms </h4> <a href="all-rooms.jsp" class="btn btn-primary float-right">View all</a>
							</div>
							<div class="card-block">
								<div class="table-responsive">
							<table class="table table-striped custom-table">
								<%
								try {
      								ptr = con.prepareStatement("select room_no,room_type,status from room_info limit 5;");
	  								rs=ptr.executeQuery();
									out.println("<thead><tr><th>Room Number</th><th>Room Type</th><th>Status</th></tr></thead><tdody>");
	  								while(rs.next()) {
	  								out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td></tr>");
	  								}
	  							} catch (Exception e) {
	  							e.printStackTrace();
	  							}
	  
								%>
								</tbody>
							</table>
						</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-md-12 col-lg-12 col-xl-6">
					<div class="card">
							<div class="card-header">
								<h4 class="card-title d-inline-block">Staff </h4> <a href="all-staff.jsp" class="btn btn-primary float-right">View all</a>
							</div>
							<div class="card-block">
						 <div class="table-responsive">
                            <table class="table table-striped custom-table mb-0">
                                <%
								try {
      								ptr = con.prepareStatement("select staff_id, staff_name, staff_gen, staff_phone from staff_info limit 5;");
	  								rs=ptr.executeQuery();
									out.println("<thead><tr><th>Staff ID</th><th>Staff Name</th><th>Gender</th><th>Phone</th></tr></thead><tdody>");
	  								while(rs.next()) {
	  								out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td></tr>");
	  								}
	  							} catch (Exception e) {
	  							e.printStackTrace();
	  							}
	  
								%>
                                </tbody>
                            </table>
                        </div>
						</div>
						</div>
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
    <script src="assets/js/Chart.bundle.js"></script>
    <script src="assets/js/chart.js"></script>
    <script src="assets/plugins/morris/morris.js"></script>
    <script src="assets/plugins/raphael/raphael-min.js"></script>
    <script src="assets/js/jquery.circliful.min.js"></script>
    <script src="assets/js/app.js"></script>
	
</body>
</html>