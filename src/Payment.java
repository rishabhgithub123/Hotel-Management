

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Payment extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher rd = null;
		
		
		try {
			int booking_id = Integer.parseInt(request.getParameter("booking_id"));
			String payment_type = request.getParameter("payment_type");
			String payment_date = request.getParameter("payment_date");
			int amount = Integer.parseInt(request.getParameter("amount"));
			String status2 = request.getParameter("status2");
			Hotel_pojoClass obj = new Hotel_pojoClass();
			Hotel_DAO dao = new Hotel_DAO();
			obj.setBooking_id(booking_id);
			obj.setPayment_type(payment_type);
			obj.setPayment_date(payment_date);
			obj.setAmount(amount);
			obj.setStatus2(status2);
			dao.Payment(obj);
			rd = request.getRequestDispatcher("add-booking.jsp");
			rd.include(request, response);
			
			out.println("<center><h3 style= color:green>Payment Successfull</h3></center>");
			
			
			
		} catch (Exception e) {
			rd = request.getRequestDispatcher("payment.jsp");
			rd.include(request, response);
			out.println("<center><h3 style= color:red>Payment Not Successfull</h3></center>");
		}
	}

}
