<%--
  Created by IntelliJ IDEA.
  User: Forever
  Date: 2018/1/23
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <form id="shenhe-Info">
        <input type="hidden" name="essayid" value="${essinfo.essayid}">
         <table>

                标题：<input type="text" name="essayname" value="${essinfo.essayname}"><br><br>
                内容：<textarea name="essaycontent">${essinfo.essaycontent}</textarea>
                <hr>

                <input type="radio" name="essayzt" value="1">审核通过<input type="radio" name="essayzt" value="2">审核未通过
         </table>
    </form>
</body>
</html>
