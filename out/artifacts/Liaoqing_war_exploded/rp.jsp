<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-11
  Time: 09:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javabean.DBAccessBean"%>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>奖惩管理</title>
</head>
<body>
<body>
<div align="center">
    <form method="post" action="rp_control.jsp">
        <b>查询/删除奖惩信息<hr>
            <table border="3">
                <tr>
                    <td><b>是否删除</b></td>
                    <td><b>编号</b></td>
                    <td><b>姓名</b></td>
                    <td><b>部门</b></td>
                    <td><b>奖惩情况</b></td>

                </tr>
                <%
                    try{
                        DBAccessBean db = new DBAccessBean();
                        db.createConn();
                        String sql = "select * from rp;";
                        ResultSet rst=db.query(sql);
                        while (rst.next()) {

                %>
                <tr>
                    <td><input type="checkbox" id=checkbox name="checkbox" value="<%=rst.getString("rpId")%>" > </td>
                    <td><input type="text" name=rpId value="<%=rst.getString("rpId")%>" readonly="true"> </td>
                    <td><input type="text" name=rpName value="<%=rst.getString("rpName")%>" readonly="true"> </td>
                    <td><input type="text" name=rpDepartment value="<%=rst.getString("rpDepartment")%>" readonly="true"> </td>
                    <td><input type="text" name=rpRp value="<%=rst.getString("rpRp")%>" readonly="true"> </td>
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
        <b>添加奖惩信息<hr>
            <table border="3">
                <tr>
                    <td><b>姓名</b></td>
                    <td><b>部门</b></td>
                    <td><b>奖惩情况</b></td>

                </tr>
                <tr>
                    <td><input name=add_rpName type = "text"></td>
                    <td><input name=add_rpDepartment type = "text"></td>
                    <td><input name=add_rpRp type = "text"></td>
                </tr>
            </table>

            <input type="submit" name="submit" value="保存修改">
            <input type="button" name="return" value="返回" onclick="window.location.href='menu.jsp'">
        </b>
    </form>
</div>

</body>
</html>
