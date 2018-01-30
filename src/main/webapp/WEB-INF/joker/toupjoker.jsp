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
<form id="upjok-form" method="post">
    <input type="hidden" name="id" value="${jok.id}"/>
    <input type="hidden" name="uptimes" value="${jok.uptimes}"/>
    <input type="hidden" name="typesid" value="${jok.typesid}"/>
    <input type="hidden" name="publisher" value="${jok.publisher}"/>
    <input type="hidden" name="jokershzt" value="${jok.jokershzt}"/>
    <table>
        <tr>
            <td>标题</td>
            <td>
                <input type="text"  name="title" value="${jok.title}">
            </td>
        </tr>
        <tr>
            <td>内容</td>
            <td>
                <textarea rows="3" cols="50" name="content">${jok.content}</textarea>
            </td>
        </tr>
        <tr>
            <td>踩</td>
            <td>
                <input type="text"  name="cai" value="${jok.cai}">
            </td>
        </tr>
        <tr>
            <td>赞</td>
            <td>
                <input type="text"  name="zan" value="${jok.zan}">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
