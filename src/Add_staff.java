

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Add_staff extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher rd = null;
		
		
		try {
			int staff_id = Integer.parseInt(request.getParameter("staff_id"));
			String staff_name = request.getParameter("staff_name");
			String staff_gender = request.getParameter("staff_gender");
			String staff_email = request.getParameter("staff_email");
			String staff_phone = request.getParameter("staff_phone");
			int staff_role = Integer.parseInt(request.getParameter("staff_role"));
			String staff_jdate = request.getParameter("staff_jdate");
			String staff_address = request.getParameter("staff_address");
			Hotel_pojoClass obj = new Hotel_pojoClass();
			Hotel_DAO dao = new Hotel_DAO();
			obj.setStaff_id(staff_id);
			obj.setStaff_name(staff_name);
			obj.setStaff_gender(staff_gender);
			obj.setStaff_email(staff_email);
			obj.setStaff_phone(staff_phone);
			obj.setStaff_role(staff_role);
			obj.setStaff_jdate(staff_jdate);
			obj.setStaff_add(staff_address);
			dao.addStaff(obj);
//			out.println("<body onload=alert('New Room Added Successfully')></body>");
			rd = request.getRequestDispatcher("add-staff.jsp");
			rd.include(request, response);
			
			out.println("<center><h3 style= color:green>New Staff Added Successfully</h3></center>");
			
			
			
		} catch (Exception e) {
			rd = request.getRequestDispatcher("add-staff.jsp");
			rd.include(request, response);
			out.println("<center><h3 style= color:red>Wromg Input</h3></center>");
		}
	}

}
