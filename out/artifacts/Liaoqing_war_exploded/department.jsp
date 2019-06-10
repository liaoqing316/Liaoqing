<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-05
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" %>
<%@ page import="javabean.DBAccessBean" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>部门信息</title>
</head>
<body>
<div align="center">
    <form method="post" action="department_control.jsp">
 <b>修改部门信息<hr>
     <table border="3">
         <tr>
             <td><b>是否删除</b></td>
             <td><b>部门编号</b></td>
             <td><b>部门名称</b></td>
         </tr>
<%
    try{
        DBAccessBean db = new DBAccessBean();
        db.createConn();
        String sql = "select * from department;";
        ResultSet rst=db.query(sql);
        while (rst.next()) {
            out.println("<tr>");
            String string=rst.getString("dId");
            out.print("<td><input type='checkbox' name=checkbox value="+string+"></td>");
            out.println("<td>"+rst.getString("dId")+"</td>");
            out.println("<td>"+rst.getString("dName")+"</td>");
            out.println("</tr>");
        }
        db.closeRs();
        db.closeStmt();
        db.closeConn();
    }catch (Exception e){
        e.printStackTrace();
    }

%>
     </table>
 </b>
<b>添加部门信息<hr>
    <table border="3">
        <tr>
            <td><b>部门名称</b></td>
        </tr>
        <tr>
            <td><input name=dName type = "text">
        </tr>
    </table>

    <input type="submit" name="submit" value="保存修改">
    <input type="button" name=return" value="返回" onclick="window.location.href='menu.jsp'">
</b>
    </form>

 </div>
</body>
</html>
