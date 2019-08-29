

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class Add_room extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		RequestDispatcher rd = null;
		
		
		try {
			int room_no = Integer.parseInt(request.getParameter("room_no"));
			String room_type = request.getParameter("room_type");
			String floor_no = request.getParameter("floor_no");
			Hotel_pojoClass obj = new Hotel_pojoClass();
			Hotel_DAO dao = new Hotel_DAO();
			obj.setRoom_no(room_no);
			obj.setRoom_type(room_type);
			obj.setFloor(floor_no);
			dao.addRoom(obj);
//			out.println("<body onload=alert('New Room Added Successfully')></body>");
			rd = request.getRequestDispatcher("add-room.jsp");
			rd.include(request, response);
			
			out.println("<center><h3 style= color:green>New Room Added Successfully</h3></center>");
			
			
			
		} catch (Exception e) {
			rd = request.getRequestDispatcher("add-room.jsp");
			rd.include(request, response);
			out.println("<center><h3 style= color:green>Wrong Input</h3></center>");
		}
	}

}
