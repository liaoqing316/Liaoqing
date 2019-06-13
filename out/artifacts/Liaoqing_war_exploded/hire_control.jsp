<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-10
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javabean.DBAccessBean" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("utf-8");%>

<html>
<head>
    <title>招聘管理</title>
</head>
<body>
<%

    DBAccessBean db = new DBAccessBean();
    db.createConn();

    try {  //录取
        String hire;
        String[] hireString = request.getParameterValues("checkbox1");
        if (hireString != null) {
            for (int i = 0; i < hireString.length; i++) {
                hire = hireString[i];
                if (hire != null) {
                    String sql = "insert into staff(sName,sSex,sAge,sDepartment) " +
                            "select hName,hSex,hAge,hDepartment from hire " +
                            "where hId ='"+hire+"';";
                    db.update(sql);
                    sql="delete from hire where hId = '"+hire+"';";
                    db.update(sql);
                }
            }
        }
    }catch(Exception e){
        e.printStackTrace();
    }

    try {
        String delete;
        String[] deleteString = request.getParameterValues("checkbox2");
        if (deleteString != null) {//删除数据
            for (int i = 0; i < deleteString.length; i++) {
                delete = deleteString[i];
                if (delete != null) {
                    String sql = "delete from hire where hId=" + delete + ";";
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
            String hId = request.getParameter(i + "hId");
            String hName = request.getParameter(i + "hName");
            String hSex = request.getParameter(i + "hSex");
            String hAge = request.getParameter(i + "hAge");
            String hDepartment = request.getParameter(i + "hDepartment");
            if ((!hSex.equals("")) || (!hAge.equals("")) || (!hDepartment.equals(""))) {
                String sql = "update hire set hName = '" + hName + "',hSex ='" + hSex + "',hAge = " + hAge + ",hDepartment = '" + hDepartment +"' where hId=" + hId + ";";
                db.update(sql);
            }
        }
    }catch (Exception e) {
        e.printStackTrace();
    }

    try {
        String hName=request.getParameter("hName");   //添加数据
        String hSex=request.getParameter("hSex");
        String hAge=request.getParameter("hAge");
        String hDepartment=request.getParameter("hDepartment");
        String sql = "insert into hire values(null,'"+ hName +"','"+ hSex +"',"+ hAge +",'"+ hDepartment +"');";
        db.update(sql);
        db.closeRs();
        db.closeStmt();
        db.closeConn();
    }catch (Exception e){
        e.printStackTrace();
    }

    PrintWriter output = response.getWriter();
    output.print("<script>alert('保存完成'); " +
            "window.location='hire.jsp' </script>");

    output.flush();
    output.close();


%>

</body>
</html>
