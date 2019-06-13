<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-11
  Time: 09:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户修改</title>
</head>
<body>
<form method="post" action="user_change_control.jsp">

<div align="center">
    <table>
        <tr>
            <td>账号：
            <td><input type="text" name="username" readonly="true" id="username"> </td>
        </tr>

        <tr>
            <td>密码：
            <td><input type="password" name="password"  id="password"> </td>
        </tr>
        <tr>
            <td>确认密码：
            <td><input type="password" id="password1" name="password1"> </td>
        </tr>
        <script language="JavaScript" type="text/javascript">
            document.getElementById("username").value=<%=(String)session.getAttribute("username")%>;
        </script>
        <tr>
            <td><input type="submit" name="submit" value="确认修改" > </td>
            <td><input type="button" name="return" value="返回" onclick="window.location.href='menu.jsp'"></td>

        </tr>
    </table></br>

</div>
</form>
</body>
</html>
