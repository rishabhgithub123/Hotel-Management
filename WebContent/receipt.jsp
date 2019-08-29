<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
    <title>Receipt</title>
      <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/dataTables.bootstrap4.min.css">
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
        <div class="page-wrapper" id="printableArea">
                       <div class="content" >
                <div class="row">
                    <div class="col-sm-5 col-4">
                        <h4 class="page-title">Receipt</h4>
                    </div>
                    <div class="col-sm-7 col-8 text-right m-b-30">
                        <div class="btn-group btn-group-sm">
                            <button class="btn btn-white" onclick="printDiv('printableArea')"><i class="fa fa-print fa-lg"></i> Print</button>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card-box">
                            <h4 class="payslip-title">Receipt for the Room Booking</h4>
                            <div class="row">
                                <div class="col-sm-6 m-b-20">
                                    <img src="assets/img/logo-dark.png" class="inv-logo" alt="">
                                    <ul class="list-unstyled mb-0">
                                        <li>Hotel</li>
                                      <!--   <li>3864 Quiet Valley Lane,</li>
                                        <li>Sherman Oaks, CA, 91403</li>  -->
                                    </ul>
                                </div>
                                <div class="col-sm-6 m-b-20">
                                    <div class="invoice-details">
                                        <h3 class="text-uppercase">Receipt</h3>
                                    </div>
                                </div>
                            </div>
                             <% 
                             try{
                            	 int id = Integer.parseInt(request.getParameter("firstbox"));
                            	 ptr=con.prepareStatement("select payment_info.booking_id,booking_info.b_name,payment_info.payment_type,payment_info.payment_date,payment_info.amount,payment_info.status from payment_info join booking_info on booking_info.b_id=payment_info.booking_id where payment_info.booking_id="+id);
                            	 ResultSet rs=ptr.executeQuery();
                            	 while(rs.next()) {
                            	out.println("<div class=row>");
                            	out.println("<div class=col-sm-12><div>");
                            	out.println("<h2 class=m-b-10><strong>Your Payment details</strong></h2>");
                            	out.println("<table class=table table-bordered><tbody><tr>");
                            	out.println("<td><strong>Booking ID</strong> <span class=float-right><td>"+rs.getInt(1)+"</td></span></td></tr><tr>");
                            	out.println("<td><strong>Name</strong> <span class=float-right><td>"+rs.getString(2)+"</td></span></td></tr><tr>");
                                out.println("<td><strong>Payment Type</strong> <span class=float-right><td>"+rs.getString(3)+"</td></span></td></tr><tr>");
                                out.println("<td><strong>Payment Date</strong> <span class=float-right><td>"+rs.getDate(4)+"</td></span></td></tr><tr>");               
                                out.println("<td><strong>Amount</strong> <span class=float-right><td>"+rs.getInt(5)+"</td></span></td></tr><tr>");
                                out.println("<td><strong>Status</strong> <span class=float-right><td><b>"+rs.getString(6)+"</b></td></span></td></tr><tr>");
                                out.println("</tr></tbody></table> </div></div>"); 
                             }
                             }
                             catch(Exception e)
                             {
                            	 
                             }
                             %>
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
    <script src="assets/js/app.js"></script>
    <script>
		$(function() {
			$('#datetimepicker3').datetimepicker({
				format : 'LT'

			});
		});
		
		function printDiv(divName) {
		     var printContents = document.getElementById(divName).innerHTML;
		     var originalContents = document.body.innerHTML;

		     document.body.innerHTML = printContents;

		     window.print();

		     document.body.innerHTML = originalContents;
		}
	</script>
</body>

</html>