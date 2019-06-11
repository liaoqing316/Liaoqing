<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-11
  Time: 11:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javabean.DBAccessBean" %>
<%@ page import="java.io.PrintWriter" %>
<html>
<head>
    <title>用户修改</title>
</head>
<body>
<%
    DBAccessBean db = new DBAccessBean();
    db.createConn();
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String password1 = request.getParameter("password1");
    if(!password.equals("")&&(!password1.equals(""))) {
        if (password.equals(password1)) {
            String sql = "update usertable set password='" + password + "' where username='" + username + "';";
            db.update(sql);
            db.closeRs();
            db.closeStmt();
            db.closeConn();
            PrintWriter output = response.getWriter();
            output.print("<script>alert('保存完成'); " +
                    "window.location='index.jsp' </script>");

            output.flush();
            output.close();
        }else {
            PrintWriter output = response.getWriter();
            output.print("<script>alert('密码不一致'); " +
                    "window.location='user_change.jsp' </script>");

            output.flush();
            output.close();
        }
    }else {
            PrintWriter output = response.getWriter();
            output.print("<script>alert('密码为空'); " +
                    "window.location='user_change.jsp' </script>");

            output.flush();
            output.close();
    }
%>
</body>
</html>
