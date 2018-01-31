<%--
  Created by IntelliJ IDEA.
  User: Forever
  Date: 2018/1/23
  Time: 17:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form id="shenheAudio-Info">

        <input type="hidden" name="audioid" value="${audioInfo.audioid}">
        <table>
            音频标题：<input type="text" name="audiotitle" value="${audioInfo.audiotitle}"><br>
            主播：<input type="text" name="audioanchor" value="${audioInfo.audioanchor}"><br>
            发布时间：<input type="text" name="audiotime" value="${audioInfo.audiotime}"><br>
            封面：<img src="<%=basePath%>${audioInfo.audioimg}" style="height: 80px;width: 80px">

            <hr>
            <input type="radio" name="audiozt" value="1">审核通过<input type="radio" name="audiozt" value="2">审核未通过
        </table>
    </form>
</body>
</html>
