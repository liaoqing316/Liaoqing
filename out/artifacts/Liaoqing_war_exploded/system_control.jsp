<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-11
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javabean.DBAccessBean" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <title>系统管理</title>
</head>
<body>
<%

    DBAccessBean db = new DBAccessBean();
    db.createConn();
    try {
        String delete;
        String[] deleteString = request.getParameterValues("checkbox");
        if (deleteString != null) {//删除数据
            for (int i = 0; i < deleteString.length; i++) {
                delete = deleteString[i];
                if (delete != null) {
                    String sql = "delete from usertable where username='" + delete + "';";
                    db.update(sql);
                }
            }
        }
    }catch(Exception e){
        e.printStackTrace();
    }


    try {
        String username=request.getParameter("add_username");//添加数据
        String password=request.getParameter("add_password");
        if ((!username.equals(""))) {
            String sql = "insert into usertable values('" + username + "','" + password + "');";
            db.update(sql);
        }
        db.closeRs();
        db.closeStmt();
        db.closeConn();
    }catch (Exception e){
        e.printStackTrace();
    }
    PrintWriter output = response.getWriter();
    output.print("<script>alert('保存完成'); " +
            "window.location='system.jsp' </script>");

    output.flush();
    output.close();

%>
</body>
</html>
