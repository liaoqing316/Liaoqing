<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-11
  Time: 08:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javabean.DBAccessBean" %>
<%@ page import="java.sql.ResultSet" %>
<html>
<head>
    <title>薪资信息</title>
</head>
<body>
<div align="center">
    <form method="post" action="pay_control.jsp">
        <b>查询/修改/删除薪资信息<hr>
            <table border="3">
                <tr>
                    <td><b>是否删除</b></td>
                    <td><b>员工编号</b></td>
                    <td><b>员工姓名</b></td>
                    <td><b>员工性别</b></td>
                    <td><b>员工年龄</b></td>
                    <td><b>所在部门</b></td>
                    <td><b>员工薪资</b></td>

                </tr>
                <%
                    try{
                        DBAccessBean db = new DBAccessBean();
                        db.createConn();
                        String sql = "select * from pay;";
                        ResultSet rst=db.query(sql);
                        int count =0;
                        while (rst.next()) {

                %>
                <tr>
                    <td><input type="checkbox" id="<%=count + "checkbox"%>" name="checkbox" value="<%=rst.getString("pId")%>" > </td>
                    <td><input type="text" name="<%=count + "pId"%>" value="<%=rst.getString("pId")%>" readonly="true"> </td>
                    <td><input type="text" name="<%=count + "pName"%>" value="<%=rst.getString("pName")%>"> </td>
                    <td><input type="text" name="<%=count + "pSex"%>" value="<%=rst.getString("pSex")%>"> </td>
                    <td><input type="number" name="<%=count + "pAge"%>" value="<%=rst.getString("pAge")%>"> </td>
                    <td><input type="text" name="<%=count + "pDepartment"%>" value="<%=rst.getString("pDepartment")%>"> </td>
                    <td><input type="text" name="<%=count + "pPay"%>" value="<%=rst.getString("pPay")%>"> </td>
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
        <b>添加薪资信息<hr>
            <table border="3">
                <tr>
                    <td><b>员工姓名</b></td>
                    <td><b>员工性别</b></td>
                    <td><b>员工年龄</b></td>
                    <td><b>所在部门</b></td>
                    <td><b>员工薪资</b></td>

                </tr>
                <tr>
                    <td><input name=pName type = "text"></td>
                    <td><input name=pSex type = "text"></td>
                    <td><input name=pAge type = "number"></td>
                    <td><input name=pDepartment type = "text"></td>
                    <td><input name=pPay type = "text"></td>
                </tr>
            </table>

            <input type="submit" name="submit" value="保存修改">
            <input type="button" name="return" value="返回" onclick="window.location.href='menu.jsp'">
        </b>
    </form>
</div>


</body>
</html>
