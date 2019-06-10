<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-10
  Time: 08:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" %>
<%@ page import="javabean.DBAccessBean" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>员工信息</title>
</head>
<body>
<div align="center">
    <form method="post" action="staff_control.jsp">
        <b>修改员工信息<hr>
            <table border="3">
                <tr>
                    <td><b>是否删除</b></td>
                    <td><b>员工编号</b></td>
                    <td><b>员工姓名</b></td>
                    <td><b>员工性别</b></td>
                    <td><b>员工年龄</b></td>
                    <td><b>所在部门</b></td>

                </tr>
<%
    try{
        DBAccessBean db = new DBAccessBean();
        db.createConn();
        String sql = "select * from staff;";
        ResultSet rst=db.query(sql);
        int count =0;
        while (rst.next()) {

%>
            <tr>
                <td><input type="checkbox" id="<%=count + "checkbox"%>" name="checkbox" value="<%=rst.getString("sId")%>" > </td>
                <td><input type="text" name="<%=count + "sId"%>" value="<%=rst.getString("sId")%>" readonly="true"> </td>
                <td><input type="text" name="<%=count + "sName"%>" value="<%=rst.getString("sName")%>"> </td>
                <td><input type="text" name="<%=count + "sSex"%>" value="<%=rst.getString("sSex")%>"> </td>
                <td><input type="text" name="<%=count + "sAge"%>" value="<%=rst.getString("sAge")%>"> </td>
                <td><input type="text" name="<%=count + "sDeparment"%>" value="<%=rst.getString("sDepartment")%>"> </td>
            </tr>

<%

            count++;
        }
        session.setAttribute("count",count);
        db.closeRs();
        db.closeStmt();
        db.closeConn();
    }catch (Exception e){
        e.printStackTrace();
    }
%>
            </table>
        </b>
        <b>添加员工信息<hr>
            <table border="3">
                <tr>
                    <td><b>员工姓名</b></td>
                    <td><b>员工性别</b></td>
                    <td><b>员工年龄</b></td>
                    <td><b>所在部门</b></td>

                </tr>
                <tr>
                    <td><input name=sName type = "text"></td>
                    <td><input name=sSex type = "text"></td>
                    <td><input name=sAge type = "text"></td>
                    <td><input name=sDepartment type = "text"></td>
                </tr>
            </table>

            <input type="submit" name="submit" value="保存修改">
            <input type="button" name="return" value="返回" onclick="window.location.href='menu.jsp'">
        </b>
    </form>
</div>

</body>
</html>
