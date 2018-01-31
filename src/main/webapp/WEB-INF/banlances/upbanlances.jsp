<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/30
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
        <form id="upban-form">
            <input type="hidden" value="${uid}">
            <table>
                <tr>
                    <td>转账人</td>
                    <td>${name}</td>
                </tr>
                <tr>
                    <td>余额</td>
                    <td>${balan}</td>
                </tr>
                <tr>
                    <td>转账金额</td>
                    <td><input type="text" name="balance"></td>
                </tr>
                <tr>
                    <td>转给用户</td>
                    <td>
                        <select id="jsid">
                            <c:forEach items="${userlist}" var="li">
                                <option value="${li.id}">${li.username}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
</body>
</html>
