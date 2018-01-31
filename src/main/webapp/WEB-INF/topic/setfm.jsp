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

    <c:forEach items="${p}" var="p">
        <a href="javascript:upfm('${p.picurl}')"><img src="<%=request.getContextPath()%>${p.picurl}" width="50px" height="50px"></a>&nbsp;&nbsp;
    </c:forEach>
<form id="setfm-form" method="post">
    <table>
        <tr>
            <td>
                <input type="hidden" id="sets" name="fmimgurl" value="${ul}"/>
            </td>
        </tr>
    </table>
</form>

    <script type="text/javascript">
        function upfm(ul){
            $("#sets").val(ul);
        }
    </script>
</body>
</html>
