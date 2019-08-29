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
try{
	Class.forName(driver);
	con = DriverManager.getConnection(url, bduser, dbpass);
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
    <title>Hotel - All Booking</title>
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
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
                    <div class="col-sm-4 col-3">
                        <h4 class="page-title">All Booking</h4>
                    </div>
                    <div class="col-sm-8 col-9 text-right m-b-20">
                        <a href="add-booking.jsp" class="btn btn-primary float-right btn-rounded"><i class="fa fa-plus"></i> Add Booking</a>
                        <a href="NewRequest.jsp" class="btn btn-primary float-right btn-rounded">Booking Request</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
						<div class="table-responsive">
                            <table class="table table-striped custom-table" id="table">
                            
                            	<%
								try{
      								ptr = con.prepareStatement("select booking_info.b_id,booking_info.b_name,room_info.room_type,booking_info.b_roomNo,booking_info.b_date,booking_info.b_time,booking_info.arrive_date,booking_info.depart_date,booking_info.b_email,booking_info.b_phone,booking_info.b_message from booking_info join room_info on booking_info.b_id=room_info.customer_id;");
	  								ResultSet rs=ptr.executeQuery();
									out.println("<thead><tr><th>Booking ID</th><th>Name</th><th>Room Type</th><th>Room Number</th><th>Date</th><th>Time</th><th>Arrive</th><th>Depart</th><th>Email</th><th>Phone</th><th>Message</th><th class=text-right>Action</th></tr></thead><tbody>");
	  								while(rs.next()) {
	  								out.println("<tr>");
	  								out.println("<td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getInt(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td>"+rs.getString(7)+"</td><td>"+rs.getString(8)+"</td><td>"+rs.getString(9)+"</td><td>"+rs.getString(10)+"</td><td>"+rs.getString(11)+"</td>");
	  								out.println("<td class=\"text-right\">");
	  								out.println("<div class=\"dropdown dropdown-action\">");
									out.println("<a href=\"#\" class=\"action-icon dropdown-toggle\" data-toggle=\"dropdown\" aria-expanded=\"false\"><i class=\"fa fa-ellipsis-v\"></i></a>");		
									out.println("<div class=\"dropdown-menu dropdown-menu-right\">");
									out.println("");
									out.println("<a class=\"dropdown-item\" href=\"javascript:{}\" onclick=\"document.getElementById('hiddentext1').submit();\"><i class=\"fa fa-pencil m-r-5\"></i> Edit</a>");
									out.println("<a class=\"dropdown-item\" href=\"#\" data-toggle=\"modal\" data-target=\"#delete_room\"><i class=\"fa fa-trash-o m-r-5\"></i> Delete</a>");	
									out.println("</div></div></td></tbody>");
	  								}
	  
	  							ptr.close();
	  							con.close();
	  
	
	  							} catch (Exception e) {
	  							e.printStackTrace();
	  							}
	  							
								%>
                            <form method="get" id="hiddentext1" action="edit-booking.jsp"><input type="text" id="tf1" name="firstbox" style="display: none" /></form>
                            </table>
						</div>
                    </div>
                </div>
				<div id="delete_room" class="modal fade delete-modal" role="dialog">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-body text-center">
							<img src="assets/img/sent.png" alt="" width="50" height="46">
							<h3>Are you sure want to delete this Booking?</h3>
							<div class="m-t-20"> 
								<form method="get" id="hiddentext2" action="Delete_booking"><input type="text" id="tf2" name="firstbox" style="display: none;" />
								<input type="text" id="tf3" name="secondbox"  style="display: none;" />
								<a href="#" class="btn btn-white" data-dismiss="modal">Close</a>
								<button type="submit" class="btn btn-danger">Delete</button></form>
							</div>
						</div>
					</div>
				</div>
			 	</div>
            </div>
        </div>
    </div>
    <div class="sidebar-overlay" data-reff=""></div>
    <script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script src="assets/js/jquery-3.2.1.min.js"></script>
	<script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/select2.min.js"></script>
	<script src="assets/js/moment.min.js"></script>
	<script src="assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="assets/js/app.js"></script>
    <script type="text/javascript">
    $("#table tr").click(function(){
    	   var value=$(this).find('td:first').html();
    	   document.getElementById("tf1").value = value;
    	   document.getElementById("tf2").value = value;
    	   var roomId = $(this).find("td").eq(3).html();
     	   document.getElementById("tf3").value = roomId;
    	});
    $("#table tr").hover(function(){
    	$(this).css("background-color", "#cee5fd");
    	}, function(){
    	$(this).css("background-color", "#f6f6f6");
 	});
   
    </script>
</body>
</html>