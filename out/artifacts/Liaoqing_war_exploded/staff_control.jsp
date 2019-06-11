<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-10
  Time: 08:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javabean.DBAccessBean" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <title>员工管理</title>
</head>
<body>
<%

    DBAccessBean db = new DBAccessBean();
    db.createConn();

    try {
        String delete;
        String[] deleteString = request.getParameterValues("checkbox");
        if (deleteString != null) {//删除数据
           //delete = deleteString[0];
            for (int i = 0; i < deleteString.length; i++) {
                delete = deleteString[i];
                if (delete != null) {
                    String sql = "delete from staff where sId=" + delete + ";";
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
            String sId = request.getParameter(i + "sId");
            String sName = request.getParameter(i + "sName");
            String sSex = request.getParameter(i + "sSex");
            String sAge = request.getParameter(i + "sAge");
            String sDepartment = request.getParameter(i + "sDepartment");
          if ((!sSex.equals("")) || (!sAge.equals("")) || (!sDepartment.equals(""))) {
                String sql = "update staff set sName = '" + sName + "',sSex =' " + sSex + " ',sAge = " + sAge + ",sDepartment = '" + sDepartment +"' where sId=" + sId + ";";
                db.update(sql);
            }
        }
    }catch (Exception e) {
        e.printStackTrace();
    }

    try {
        String sName=request.getParameter("sName");   //添加数据
        String sSex=request.getParameter("sSex");
        String sAge=request.getParameter("sAge");
        String sDepartment=request.getParameter("sDepartment");
        String sql = "insert into staff values(null,'" + sName + "','"+ sSex +"'," + sAge +",'"+ sDepartment +"');";
        db.update(sql);
        db.closeRs();
        db.closeStmt();
        db.closeConn();
    }catch (Exception e){
        e.printStackTrace();
    }

    PrintWriter output = response.getWriter();
    output.print("<script>alert('保存完成'); " +
            "window.location='staff.jsp' </script>");

    output.flush();
    output.close();


%>
</body>
</html>
