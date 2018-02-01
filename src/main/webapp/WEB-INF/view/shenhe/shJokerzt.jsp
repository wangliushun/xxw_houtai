<%--
  Created by IntelliJ IDEA.
  User: Forever
  Date: 2018/1/23
  Time: 19:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form id="shenheJoker-Info">

        <input type="hidden" name="id" value="${jokerInfo.id}">
         <input type="hidden" name="userid" value="${esslist.userid}">
        <table>
            笑话标题：<input type="text" name="title" value="${jokerInfo.title}"><br>
            笑话发布时间：<input type="text" name="uptimes" value="${jokerInfo.uptimes}"><br>
            笑话内容：<input type="text" name="content" value="${jokerInfo.content}"><br>
            <hr>
            <input type="radio" name="jokershzt" value="1">审核通过<input type="radio" name="jokershzt" value="2">审核未通过
        </table>

</form>

</body>
</html>
