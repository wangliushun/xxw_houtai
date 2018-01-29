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
</head>
<body>
<form id="addeasy-form" method="post" enctype="multipart/form-data">
    <table >
        <tr>
            <td >标题</td>
        </tr>
        <tr>
            <td >
              <input type="hidden" name="essayimg" id="essayimg">
              <input type="text" name="essayname">
            </td>
        </tr>
        <tr>
            <td >内容</td>
        </tr>
        <tr>
            <td >
                <textarea name="essaycontent"></textarea>
            </td>
        </tr>
    </table>
    <c:forEach items="${eassyimg}" var="eassyimglist">
        <c:if test="${eassyimglist!=null}">
            <a href="javascript:addeassyimg(${eassyimglist.essayimgname})">
                <img src="<%=basePath%>${eassyimglist.essayimgname}" style="height: 80px;width: 80px">
            </a>
        </c:if>
    </c:forEach>
</form>

<script type="text/javascript">
function addeassyimg(names){
    $("#essayimg").val(names);
}

</script>
</body>
</html>
