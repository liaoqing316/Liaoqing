<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-11
  Time: 08:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javabean.DBAccessBean" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <title>培训管理</title>
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
                    String sql = "delete from train where tId=" + delete + ";";
                    db.update(sql);
                }
            }
        }
    }catch(Exception e){
        e.printStackTrace();
    }

    try {   //更新数据
        int count = (int) session.getAttribute("count");
        for (int i = 0; i <= count; i++) {  //更新数据
            String tId = request.getParameter(i + "tId");
            String tName = request.getParameter(i + "tName");
            String tSex = request.getParameter(i + "tSex");
            String tAge = request.getParameter(i + "tAge");
            String tDepartment = request.getParameter(i + "tDepartment");
            if ((!tSex.equals("")) || (!tAge.equals("")) || (!tDepartment.equals(""))) {
                String sql = "update train set tName = '" + tName + "',tSex =' " + tSex + " ',tAge = " + tAge + ",tDepartment = '" + tDepartment +"' where tId=" + tId + ";";
                db.update(sql);
            }
        }
    }catch (Exception e) {
        e.printStackTrace();
    }

    try {
        String tName=request.getParameter("tName");   //添加数据
        String tSex=request.getParameter("tSex");
        String tAge=request.getParameter("tAge");
        String tDepartment=request.getParameter("tDepartment");
        String sql = "insert into train values(null,'" + tName + "','"+ tSex +"'," + tAge +",'"+ tDepartment +"');";
        db.update(sql);
        db.closeRs();
        db.closeStmt();
        db.closeConn();
    }catch (Exception e){
        e.printStackTrace();
    }

    PrintWriter output = response.getWriter();
    output.print("<script>alert('保存完成'); " +
            "window.location='train.jsp' </script>");

    output.flush();
    output.close();


%>
</body>
</html>
