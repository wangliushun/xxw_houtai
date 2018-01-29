<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="<%=basePath%>/uploadify/uploadify.css" type="text/css"/>
    <script type="text/javascript"  src="<%=basePath%>/uploadify/jquery.uploadify.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<form id="addeasytitle-form" method="post">
    <table >
        <tr>
            <td >征文标题</td>
            <td >
                <input type="text" name="essaytitlename">
            </td>
        </tr>
        <tr>
            <td >投稿结束日期</td>
            <td >
                <input  class="Wdate" name="endtime" onFocus="WdatePicker()"/>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
