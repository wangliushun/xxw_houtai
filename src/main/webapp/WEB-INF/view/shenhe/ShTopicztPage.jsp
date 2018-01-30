<%--
  Created by IntelliJ IDEA.
  User: Forever
  Date: 2018/1/23
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>


<form id="shehheTopic-Info">
    <input type="hidden" name="essayid" value="${topics.id}">
    <table>
        话题内容：<textarea name="topicnr">${topics.topicnr}</textarea>
        <hr>
        <input type="radio" name="topicshzt" value="1">审核通过<input type="radio" name="topicshzt" value="2">审核未通过
    </table>
</form>

</body>
</html>
