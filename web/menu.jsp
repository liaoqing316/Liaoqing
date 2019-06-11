<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head><title>管理界面</title></head>
<body>
<div align="center">
    <table width="200" border="1">
        <tr>
            <td>
                <input type="button" value="部门管理" style="width: 200px;height: 50px"  onclick="window.location.href='department.jsp'">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="员工管理" style="width: 200px;height: 50px" onclick="window.location.href='staff.jsp'">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="招聘管理" style="width: 200px;height: 50px" onclick="window.location.href='hire.jsp'">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="培训管理" style="width: 200px;height: 50px" onclick="window.location.href='train.jsp'">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="奖惩管理" style="width: 200px;height: 50px" onclick="window.location.href='rp.jsp'">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="薪资管理" style="width: 200px;height: 50px" onclick="window.location.href='pay.jsp'">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="系统管理" style="width: 200px;height: 50px" onclick="window.location.href='system.jsp'">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="用户修改" style="width: 200px;height: 50px" onclick="window.location.href='user_change.jsp'">
            </td>
        </tr>
        <tr>
            <td>
                <input type="button" value="安全退出" style="width: 200px;height: 50px" onclick="window.location.href='exit.jsp'">
            </td>
        </tr>
    </table>
</div>
</body>
</html>