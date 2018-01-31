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
        标题:${joks.title}<br/>
        ${joks.publisher}&nbsp;&nbsp;发表于&nbsp;&nbsp;${joks.uptimes}<br/>
        内容:${joks.content}<br/>
        踩:<input type="button" value="${joks.cai}"/>&nbsp;&nbsp;&nbsp;
        赞:<input type="button" value="${joks.zan}"/><br/><br/>

    <form id="addpl-form">
        匿名<input type="checkbox" name="plstate" value="1"/>
        <input type="hidden" name="jokerid" value="${joks.id}"/><br/>
        评论内容:<textarea rows="3" cols="50" name="content" id="nr"></textarea>
    </form><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button" value="发表" onclick="fbpl()"/>
        <script type="text/javascript">
            function fbpl(){
                $.ajax({
                    url:"/joker/savepl",
                    type:"post",
                    dataType:"text",
                    data:$("#addpl-form").serialize(),
                    async:false,
                    success:function (upFlag){
                        if(upFlag==1){
                            alert("添加评论成功")
                            $("#nr").val("");
                            $("[name='plstate']").prop("checked",false)
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
