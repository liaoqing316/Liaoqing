<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-11
  Time: 09:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javabean.DBAccessBean" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>系统管理</title>
</head>
<body>
<div align="center">
    <form method="post" action="system_control.jsp">
        <b>查询/删除管理员信息<hr>
            <table border="3">
                <tr>
                    <td><b>是否删除</b></td>
                    <td><b>用户名</b></td>
                    <td><b>密码</b></td>

                </tr>
                <%
                    try{
                        DBAccessBean db = new DBAccessBean();
                        db.createConn();
                        String sql = "select * from usertable;";
                        ResultSet rst=db.query(sql);
                        while (rst.next()) {
                %>
                <tr>

                    <td><input type="checkbox" id="checkbox" name="checkbox" value="<%=rst.getString("username")%>" > </td>
                    <td><input type="text" name="username" value="<%=rst.getString("username")%>" readonly="true"> </td>
                    <td><input type="text" name="password" value="<%=rst.getString("password")%>" readonly="true"></td>

                </tr>

                <%
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
        <b>添加管理员信息<hr>
            <table border="3">
                <tr>
                    <td><b>用户名</b></td>
                    <td><b>密码</b></td>


                </tr>
                <tr>
                    <td><input name=add_username type = "text"></td>
                    <td><input name=add_password type = "text"></td>
                </tr>
            </table>

            <input type="submit" name="submit" value="保存修改">
            <input type="button" name="return" value="返回" onclick="window.location.href='menu.jsp'">
        </b>
    </form>
</div>


</body>
</html>
