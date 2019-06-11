<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-04
  Time: 10:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<title>登陆界面</title>
    <div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:-1">
        <img src="timg.jpeg" height="100%" width="100%"/>
    </div>
</head>

<div align=center>
<form name="form1" action="login_control.jsp" method="post" >
 <h1>人力资源管理系统</h1>

    <table>
        <tr><td colspan="2">
        <tr>
            <td>账号：
            <td><input name=username type="text">
        <tr>
            <td>密码：
            <td><input name=password type = "password">

        <tr>
            <td colspan="2">
                <input type="submit" name="submit" value="提交" style="width: 75px">
                <a href="register.jsp">注册新用户</a>
            </td>
        </tr>
    </table><br>
</form>
</div>
</body>
</html>




