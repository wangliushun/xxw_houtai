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
    <link rel="stylesheet" href="<%=basePath%>/uploadify/uploadify.css" type="text/css"/>
    <script type="text/javascript"  src="<%=basePath%>/uploadify/jquery.uploadify.min.js"></script>
</head>
<body>
<form id="addtop-form" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>图片</td>
            <td>
                <!-- 图片回显的位置 -->
                <div id="albumpictureshowImgDiv"></div>
                <!-- 	进度条位置 -->
                <div id="albumpictureshowBarDiv"></div>
                <input type="hidden" id="albumpicturemoviename" name="picurl">
                <!-- 上传按钮 -->
                <input type="file" id="albumpictures" name="artImg"/>
            </td>
        </tr>
        <tr>
            <td>话题内容</td>
            <td>
                <input type="text"  name="topicnr">
            </td>
        </tr>
    </table>
</form>

<script type="text/javascript">

    //页面加载
    $(function(){
        picchushi();
    })

    //uplodify
    function picchushi(){
        $("#albumpictures").uploadify({
            //前台请求后台的url 不可忽略的参数
            'uploader' :"/uploadPhotoFile",
            //插件自带 不可忽略的参数
            'swf' : '<%=request.getContextPath()%>/uploadify/uploadify.swf',
            //撤销按钮的图片路径
            'cancelImg' : '<%=request.getContextPath() %>/uploadify/uploadify-cancel.png',
            //如果为true 为自动上传 在文件后 为false 那么它就要我们自己手动点上传按钮
            'auto' : true,
            //可以同时选择多个文件 默认为true 不可忽略
            'multi' : false,
            //给上传按钮设置文字
            'buttonText' : '上传',
            //上传后队列是否消失
            'removeCompleted' : true,
            'removeTimeout' : 1,
            //上传文件的个数
            'uploadLimit' : 10,
            'fileTypeExts' : '*.jpg;*.jpge;*.gif;*.png',
            'fileSizeLimit' : '20MB',
            //给div的进度条加背景 不可忽略
            'queueID' : 'albumpictureshowBarDiv',
            // action中接收文件的全局变量名
            'fileObjName' : 'artImg',
            'onUploadSuccess' : function(file, data, response) {

                //	       将图片回显    data   接收到的是图片名称
                $("#albumpicturemoviename").val(data);
                var str1 = '<img style="width:100px;height:60px;border-style:solid;border-width:1px; border-color:black;"src="<%=request.getContextPath()%>'+data+'">';
                $("#albumpictureshowImgDiv").html(str1);
            }
        });

    }
</script>
</body>
</html>
