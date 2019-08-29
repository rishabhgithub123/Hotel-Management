

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Change_password extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher rd = null;
		
		
		try {
			String user = request.getParameter("tf1");
			String np = request.getParameter("tf2");
			String cnp = request.getParameter("tf3");
			Hotel_DAO dao = new Hotel_DAO();
			if(np.equals(cnp)) {
				String INSERTQUERY = "update admin_login set password=?  where user_id=?";
				dao.stmt = dao.con.prepareStatement(INSERTQUERY);
				dao.stmt.setString(1, np);
				dao.stmt.setString(2, user);
				dao.stmt.execute();
				rd = request.getRequestDispatcher("settings.jsp");
				rd.include(request, response);
				out.println("<center><h3 style= color:green>Password Changed</h3></center>");
			}
				
		} catch (Exception e) {
			rd = request.getRequestDispatcher("settings.jsp");
			rd.include(request, response);
			out.println("<center><h3 style= color:red>Failed</h3></center>");
		}
	}

}
