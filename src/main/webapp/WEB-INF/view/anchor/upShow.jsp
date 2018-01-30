<%--
  Created by IntelliJ IDEA.
  User: Forever
  Date: 2018/1/21
  Time: 18:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form id="up-form" method="post">

    <input type="hidden" name="id" value="${anchorlist.id}"/>
    alert("value="${anchorlist.id}"");

    <table>
        <tr>
            <td>name:</td>
            <td><input type="text" name="name" value="${anchorlist.name}"></td>
        </tr>
        <tr>
            <td>身份证:</td>
            <td><input type="text" name="idcard" value="${anchorlist.idcard}"></td>
        </tr>
        <tr>
            <td>账号:</td>
            <td><input type="text" name="account" value="${anchorlist.account}"></td>
        </tr>
        <tr>
            <td>密码:</td>
            <td><input type="text" name="password" value="${anchorlist.password}"></td>
        </tr>

    </table>
</form>

</body>
</html>
