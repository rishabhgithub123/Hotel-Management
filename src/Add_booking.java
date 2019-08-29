

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Add_booking extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher rd = null;
		
		
		try {
			int booking_id = Integer.parseInt(request.getParameter("booking_id"));
			String booking_name = request.getParameter("booking_name");
			int booking_rtype = Integer.parseInt(request.getParameter("booking_rtype"));
			int booking_room = Integer.parseInt(request.getParameter("room_no"));
			String booking_date = request.getParameter("booking_date");
			String booking_time = request.getParameter("booking_time");
			String booking_arrive = request.getParameter("booking_arrive");
			String booking_depart = request.getParameter("booking_depart");
			String booking_email = request.getParameter("booking_email");
			String booking_phone = request.getParameter("booking_phone");
			String booking_message = request.getParameter("booking_message");
			
			Hotel_pojoClass obj = new Hotel_pojoClass();
			Hotel_DAO dao = new Hotel_DAO();
			obj.setBooking_id(booking_id);
			obj.setBooking_name(booking_name);
			obj.setBooking_rtype(booking_rtype);
			obj.setRoom_no(booking_room);
			obj.setBooking_date(booking_date);
			obj.setBooking_time(booking_time);
			obj.setBooking_arrive(booking_arrive);
			obj.setBooking_depart(booking_depart);
			obj.setBooking_email(booking_email);
			obj.setBooking_phone(booking_phone);
			obj.setBooking_message(booking_message);
			dao.addBooking(obj);
//			out.println("<body onload=alert('New Room Added Successfully')></body>");
			rd = request.getRequestDispatcher("payment.jsp");
			rd.include(request, response);
			out.println("<center><h3 style= color:green>New Booking Added Successfully</h3></center>");
			
			
			
		} catch (Exception e) {
			rd = request.getRequestDispatcher("add-booking.jsp");
			rd.include(request, response);
			out.println(e);
		}
	}

}
