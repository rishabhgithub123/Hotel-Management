

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Feedback extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher rd = null;
		
		
		try {
			String fname = request.getParameter("fname");
			String feedback = request.getParameter("feedback");
			Hotel_pojoClass obj = new Hotel_pojoClass();
			Hotel_DAO dao = new Hotel_DAO();
			obj.setFname(fname);
			obj.setFeedback(feedback);
			dao.addFeedback(obj);
			rd = request.getRequestDispatcher("feedback.jsp");
			rd.include(request, response);
			
			out.println("<center><h3 style= color:green>Feedback sent! Thank you for your time.</h3></center>");
			
			
			
		} catch (Exception e) {
			rd = request.getRequestDispatcher("feedback.jsp");
			rd.include(request, response);
			out.println("<center><h3 style= color:red>Try Again!</h3></center>");
		}
	}

}
