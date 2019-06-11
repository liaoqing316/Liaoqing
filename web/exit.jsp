<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-11
  Time: 09:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%response.setCharacterEncoding("utf-8");%>
<html>
<head>
    <title>安全退出</title>
</head>
<body>
<%
    if (session.getAttribute("username")!=null)
        session.removeAttribute("username");
    if (session.getAttribute("password")!=null)
        session.removeAttribute("password");

    PrintWriter output = response.getWriter();
    output.print("<script>window.location='index.jsp' </script>");
    output.flush();
    output.close();
%>
</body>
</html>
