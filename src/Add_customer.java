

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Add_customer extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher rd = null;
		
		
		try {
			String C_name = request.getParameter("C_name");
			String location = request.getParameter("location");
			String checkin = request.getParameter("checkin");
			String checkout = request.getParameter("checkout");
			String Croom_type = request.getParameter("Croom_type");
			Hotel_pojoClass obj = new Hotel_pojoClass();
			Hotel_DAO dao = new Hotel_DAO();
			obj.setC_name(C_name);
			obj.setLocation(location);
			obj.setCheckin(checkin);
			obj.setCheckout(checkout);
			obj.setCroom_type(Croom_type);
			dao.addCustomer(obj);
			rd = request.getRequestDispatcher("customer.jsp");
			out.println("<center><h3 style= color:green>Requested Successfull, Thank you for choosing Surya Hotel</h3></center>");
			rd.include(request, response);
			
			
			
			
		} catch (Exception e) {
			rd = request.getRequestDispatcher("customer.jsp");
			out.println("<center><h3 style= color:red>Wrong Input</h3></center>");
			rd.include(request, response);
			
		}
	}

}
