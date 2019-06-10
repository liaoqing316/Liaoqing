<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-04
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="javabean.BusinessBean" %>
<%
    String username = request.getParameter("username");
    String password1 = request.getParameter("password1");
    String password2 = request.getParameter("password2");
    if(username==null||password1==null||password2==null||!password1.equals(password2))
        response .sendRedirect("register.jsp");
    else{
        BusinessBean businessBean=new BusinessBean();
        boolean isExist = businessBean.isExist(username);
        if(!isExist){
            businessBean.add(username,password1);
            response.sendRedirect("index.jsp");
        }
        else
        response.sendRedirect("register.jsp");
    }
%>

