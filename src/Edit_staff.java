

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Edit_staff extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher rd = null;
		
		
		try {
			int staff_id = Integer.parseInt(request.getParameter("tf1"));
			String staff_email = request.getParameter("tf2");
			String staff_phone = request.getParameter("tf3");
			String staff_add = request.getParameter("tf4");
			Hotel_pojoClass obj = new Hotel_pojoClass();
			Hotel_DAO dao = new Hotel_DAO();
			obj.setStaff_id(staff_id);
			obj.setStaff_email(staff_email);
			obj.setStaff_phone(staff_phone);
			obj.setStaff_add(staff_add);
			dao.editStaff(obj);
//			out.println("<body onload=alert('New Room Added Successfully')></body>");
			rd = request.getRequestDispatcher("edit-staff.jsp");
			rd.include(request, response);
			out.println("<center><h3 style= color:green>Staff Information Updated Successfully</h3></center>");
			
		} catch (Exception e) {
			rd = request.getRequestDispatcher("edit-staff.jsp");
			rd.include(request, response);
			out.println("<center><h3 style= color:red>Wrong Input</h3></center>");
		}
	}

}
