<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
</head>
<body>
<form id="addjoker-form" method="post" >
    <table>
        <tr>
            <td>标题</td>
            <td>
                <input type="text"  name="title"/>
            </td>
        </tr>
        <tr>
            <td>内容</td>
            <td rowspan="3">
                <textarea rows="3" cols="50" name="content"></textarea>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
