<%@ page contentType="text/html; charset=utf-8" %>
<%@ page language="java" import="java.util.*" %>
<html>
<head>
    <title>注册界面 </title>
</head>
<body>
<div align="center">
<form name ="form1" action ="register_control.jsp" method ="post">
    <h2>注册信息</h2>
    <table>
        <tr>
            <td>账号：</td>
            <td><input name="username" type="text" placeholder="请输入用户名、手机号、邮箱" size="22" /></br>
        </tr>
        <tr>
            <td>密码：</td>
            <td><input name="password1" type="password" placeholder="请输入密码" size="22" /></br>
        </tr>
        <tr>
            <td>确认密码：</td>
            <td><input name="password2" type="password" placeholder="请输入密码" size="22" /></br>
        </tr>
    </table>
            <input type=submit value="注册" style="width: 75">
            <a href="index.jsp">返回登录页面</a>
</form>
</div>
</body>
</html>