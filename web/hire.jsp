<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-10
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="java.util.*" %>
<%@ page import="javabean.DBAccessBean" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>招聘管理</title>
</head>
<body>
<div align="center">
    <form method="post" action="hire_control.jsp">
        <b>查询/修改/删除招聘信息<hr>
            <table border="3">
                <tr>
                    <td><b>录用</b></td>
                    <td><b>删除</b></td>
                    <td><b>编号</b></td>
                    <td><b>姓名</b></td>
                    <td><b>性别</b></td>
                    <td><b>年龄</b></td>
                    <td><b>部门</b></td>

                </tr>
                <%
                    try{
                        DBAccessBean db = new DBAccessBean();
                        db.createConn();
                        String sql = "select * from hire;";
                        ResultSet rst=db.query(sql);
                        int count =0;
                        while (rst.next()) {

                %>
                <tr>
                    <td><input type="checkbox" id="<%=count + "checkbox1"%>" name="checkbox1" value="<%=rst.getString("hId")%>" > </td>
                    <td><input type="checkbox" id="<%=count + "checkbox2"%>" name="checkbox2" value="<%=rst.getString("hId")%>" > </td>
                    <td><input type="text" name="<%=count + "hId"%>" value="<%=rst.getString("hId")%>" readonly="true"> </td>
                    <td><input type="text" name="<%=count + "hName"%>" value="<%=rst.getString("hName")%>"> </td>
                    <td><input type="text" name="<%=count + "hSex"%>" value="<%=rst.getString("hSex")%>"> </td>
                    <td><input type="number" name="<%=count + "hAge"%>" value="<%=rst.getString("hAge")%>"> </td>
                    <td><input type="text" name="<%=count + "hDepartment"%>" value="<%=rst.getString("hDepartment")%>"> </td>
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
        <b>添加招聘信息<hr>
            <table border="3">
                <tr>
                    <td><b>姓名</b></td>
                    <td><b>性别</b></td>
                    <td><b>年龄</b></td>
                    <td><b>部门</b></td>

                </tr>
                <tr>
                    <td><input name=hName type = "text"></td>
                    <td><input name=hSex type = "text"></td>
                    <td><input name=hAge type = "number"></td>
                    <td><input name=hDepartment type = "text"></td>
                </tr>
            </table>

            <input type="submit" name="submit" value="保存修改">
            <input type="button" name="return" value="返回" onclick="window.location.href='menu.jsp'">
        </b>
    </form>
</div>

</body>
</html>