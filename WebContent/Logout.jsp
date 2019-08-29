
<%
	HttpSession hs = request.getSession();
	hs.invalidate();
	response.sendRedirect("index.jsp");
%>