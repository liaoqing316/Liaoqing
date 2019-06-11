<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-11
  Time: 08:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javabean.DBAccessBean" %>
<%@ page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("utf-8");%>
<html>
<head>
    <title>薪资信息</title>
</head>
<body>
<%

    DBAccessBean db = new DBAccessBean();
    db.createConn();

    try {
        String delete;
        String[] deleteString = request.getParameterValues("checkbox");
        if (deleteString != null) {//删除数据
            for (int i = 0; i < deleteString.length; i++) {
                delete = deleteString[i];
                if (delete != null) {
                    String sql = "delete from pay where pId=" + delete + ";";
                    db.update(sql);
                }
            }
        }
    }catch(Exception e){
        e.printStackTrace();
    }

    try {   //更新数据
        int count = (int) session.getAttribute("count");
        for (int i = 0; i <= count; i++) {  //更新数据
            String pId = request.getParameter(i + "pId");
            String pName = request.getParameter(i + "pName");
            String pSex = request.getParameter(i + "pSex");
            String pAge = request.getParameter(i + "pAge");
            String pDepartment = request.getParameter(i + "pDepartment");
            String pPay = request.getParameter(i +"pPay");
            if ((!pSex.equals("")) || (!pAge.equals("")) || (!pDepartment.equals("")) || (!pPay.equals(""))) {
                String sql = "update pay set pName = '" + pName + "',pSex =' " + pSex + " ',pAge = " + pAge + ",pDepartment = '" + pDepartment +"',pPay ='" + pPay + "' where pId=" + pId + ";";
                db.update(sql);
            }
        }
    }catch (Exception e) {
        e.printStackTrace();
    }

    try {
        String pName=request.getParameter("pName");   //添加数据
        String pSex=request.getParameter("pSex");
        String pAge=request.getParameter("pAge");
        String pDepartment=request.getParameter("pDepartment");
        String pPay=request.getParameter("pPay");
        String sql = "insert into pay values(null,'" + pName + "','"+ pSex +"'," + pAge +",'"+ pDepartment +"','" + pPay +"');";
        db.update(sql);
        db.closeRs();
        db.closeStmt();
        db.closeConn();
    }catch (Exception e){
        e.printStackTrace();
    }

    PrintWriter output = response.getWriter();
    output.print("<script>alert('保存完成'); " +
            "window.location='pay.jsp' </script>");

    output.flush();
    output.close();


%>
</body>
</html>
