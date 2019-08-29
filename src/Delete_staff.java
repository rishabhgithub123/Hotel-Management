

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Delete_staff extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher rd = null;
		
		
		try {
			int staff_id = Integer.parseInt(request.getParameter("firstbox"));
			Hotel_pojoClass obj = new Hotel_pojoClass();
			Hotel_DAO dao = new Hotel_DAO();
			obj.setStaff_id(staff_id);
			dao.deleteStaff(obj);
			rd = request.getRequestDispatcher("all-staff.jsp");
			
			rd.include(request, response);
			out.println("<center><h3 style= color:green>Staff "+staff_id+" Is Deleted Successfully</h3></center>");
			
		} catch (Exception e) {
			rd = request.getRequestDispatcher("all-staff.jsp");
			rd.include(request, response);
			out.println("<center><h3 style= color:red>Wrong Input</h3></center>");
		}
	}

}
