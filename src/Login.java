

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

@SuppressWarnings("serial")
public class Login extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		try {
			String user = request.getParameter("user");
			String pass = request.getParameter("pass");
			Hotel_DAO obj = new Hotel_DAO();
			PreparedStatement pst = obj.con.prepareStatement("select password from admin_login where user_id=?");
			pst.setString(1, user);
			ResultSet rs = pst.executeQuery();
			HttpSession hs = request.getSession();
			RequestDispatcher rd = null;
			if(rs.next())
			{
				String password=rs.getString(1);
				if(pass.equals(password))
				{
					
					hs.setAttribute("loginuser",user);
					response.sendRedirect("home.jsp");
					
				}
				else
				{
					
					rd = request.getRequestDispatcher("index.jsp");
					rd.include(request, response);
					out.println("<center><h3 style= color:red>Invalid Credentials</h3></center>");
					
					
				}
			}
			else {
				rd = request.getRequestDispatcher("index.jsp");
				rd.include(request, response);
				out.println("<center><h3 style= color:red>Invalid Credentials</h3></center>");
			}
			pst.close();
			obj.con.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		
	}

}
