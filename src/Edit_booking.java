

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Edit_booking extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher rd = null;
		
		
		try {
			int booking_id = Integer.parseInt(request.getParameter("tf1"));
			String booking_depart = request.getParameter("tf3");
			String booking_email = request.getParameter("tf4");
			String booking_phone = request.getParameter("tf5");
			String booking_message = request.getParameter("tf6");
			Hotel_pojoClass obj = new Hotel_pojoClass();
			Hotel_DAO dao = new Hotel_DAO();
			obj.setBooking_id(booking_id);
			obj.setBooking_depart(booking_depart);
			obj.setBooking_email(booking_email);
			obj.setBooking_phone(booking_phone);
			obj.setBooking_message(booking_message);
			dao.editBooking(obj);
//			out.println("<body onload=alert('New Room Added Successfully')></body>");
			rd = request.getRequestDispatcher("edit-booking.jsp");
			rd.include(request, response);
			out.println("<center><h3 style= color:green>Booking Information Updated Successfully</h3></center>");
			
		} catch (Exception e) {
			rd = request.getRequestDispatcher("edit-booking.jsp");
			rd.include(request, response);
			out.println(e);
			//out.println("<center><h3 style= color:red>Wrong Input</h3></center>");
		}
	}

}
