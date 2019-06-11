<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-06
  Time: 09:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javabean.DBAccessBean" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("utf-8");%>

<html>
<head>
    <title>部门信息2</title>
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
                    String sql = "delete from department where dId=" + delete + ";";
                    db.update(sql);
                }
            }
        }
    }catch(Exception e){
        e.printStackTrace();
    }


    try {
        String dName=request.getParameter("dName");   //添加数据
        if ((!dName.equals(""))) {
            String sql = "insert into department values(null,'" + dName + "');";
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
            "window.location='department.jsp' </script>");

    output.flush();
    output.close();

%>
</body>
</html>
