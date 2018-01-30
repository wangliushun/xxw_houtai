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
<img src="<%=request.getContextPath()%>${tops.picurl}" width="50px" height="50px"><br/>

内容:${tops.topicnr}<br/>
上传时间:${tops.uptime}<br/>
赞:<input type="button" value="${tops.topiczancount}"/><br/><br/>

<form id="addtoppl-form">
    匿名<input type="checkbox" name="topplstate" value="1"/>
    <input type="hidden" name="topicid" value="${tops.id}"/><br/>
    评论内容:<textarea rows="3" cols="50" name="topcontent" id="tpnr"></textarea>
</form><br/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="发表" onclick="fbtoppl()"/>
<script type="text/javascript">
    function fbtoppl(){
        $.ajax({
            url:"/savetoppl",
            type:"post",
            dataType:"text",
            data:$("#addtoppl-form").serialize(),
            async:false,
            success:function (upFlag){
                if(upFlag==1){
                    alert("添加评论成功")
                    $("#tpnr").val("");
                    $("[name='topplstate']").prop("checked",false)
                }
            },
            error:function (){
                alert("新增评论出错，请检查程序");
            }
        })
    }

</script>
</body>
</html>
