<%@ page import="javabean.BusinessBean" %>
<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	if(username==null || password==null){
		response.sendRedirect("index.jsp");
	}
	else{
		BusinessBean businessbean = new BusinessBean();
		boolean isValid = businessbean.valid(username,password);
		out.print(isValid);
		if(isValid){
			session.setAttribute("username",username);
			session.setAttribute("password",password);
			response.sendRedirect("menu.jsp");
		}
		else{
			response.sendRedirect("index.jsp");
		}
	}

%>