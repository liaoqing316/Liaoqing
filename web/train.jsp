<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-11
  Time: 08:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javabean.DBAccessBean"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>培训管理</title>
</head>
<body>
<div align="center">
    <form method="post" action="train_control.jsp">
        <b>查询/修改/删除培训信息<hr>
            <table border="3">
                <tr>
                    <td><b>是否删除</b></td>
                    <td><b>培训编号</b></td>
                    <td><b>培训人</b></td>
                    <td><b>性别</b></td>
                    <td><b>年龄</b></td>
                    <td><b>部门</b></td>

                </tr>
                <%
                    try{
                        DBAccessBean db = new DBAccessBean();
                        db.createConn();
                        String sql = "select * from train;";
                        ResultSet rst=db.query(sql);
                        int count =0;
                        while (rst.next()) {

                %>
                <tr>
                    <td><input type="checkbox" id="<%=count + "checkbox"%>" name="checkbox" value="<%=rst.getString("tId")%>" > </td>
                    <td><input type="text" name="<%=count + "tId"%>" value="<%=rst.getString("tId")%>" readonly="true"> </td>
                    <td><input type="text" name="<%=count + "tName"%>" value="<%=rst.getString("tName")%>"> </td>
                    <td><input type="text" name="<%=count + "tSex"%>" value="<%=rst.getString("tSex")%>"> </td>
                    <td><input type="number" name="<%=count + "tAge"%>" value="<%=rst.getString("tAge")%>"> </td>
                    <td><input type="text" name="<%=count + "tDepartment"%>" value="<%=rst.getString("tDepartment")%>"> </td>
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
        <b>添加培训信息<hr>
            <table border="3">
                <tr>
                    <td><b>姓名</b></td>
                    <td><b>性别</b></td>
                    <td><b>年龄</b></td>
                    <td><b>部门</b></td>

                </tr>
                <tr>
                    <td><input name=tName type = "text"></td>
                    <td><input name=tSex type = "text"></td>
                    <td><input name=tAge type = "number"></td>
                    <td><input name=tDepartment type = "text"></td>
                </tr>
            </table>

            <input type="submit" name="submit" value="保存修改">
            <input type="button" name="return" value="返回" onclick="window.location.href='menu.jsp'">
        </b>
    </form>
</div>
</body>
</html>
