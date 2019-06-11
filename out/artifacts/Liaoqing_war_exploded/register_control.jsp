<%--
  Created by IntelliJ IDEA.
  User: liaoqing
  Date: 2019-06-04
  Time: 16:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="javabean.BusinessBean" %>
<%@ page import="java.io.PrintWriter" %>

<%
    String username = request.getParameter("username");
    String password1 = request.getParameter("password1");
    String password2 = request.getParameter("password2");
    if((!username.equals("")) && (!password1.equals("")) && (!password2.equals("")) && (password1.equals(password2))){
        BusinessBean businessBean=new BusinessBean();
        boolean isExist = businessBean.isExist(username);
        if(!isExist){
            businessBean.add(username,password1);
            PrintWriter output = response.getWriter();
            output.print("<script>alert('注册成功'); " +
                    "window.location='index.jsp' </script>");

            output.flush();
            output.close();
        }
        else {
            PrintWriter output = response.getWriter();
            output.print("<script>alert('注册失败，用户名已存在'); " +
                    "window.location='register.jsp' </script>");

            output.flush();
            output.close();
        }
    }
    else{
        PrintWriter output = response.getWriter();
        output.print("<script>alert('注册失败'); " +
                "window.location='register.jsp' </script>");

        output.flush();
        output.close();
    }
%>

