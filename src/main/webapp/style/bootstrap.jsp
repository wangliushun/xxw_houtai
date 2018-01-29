<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap 插件 css -->
<link href="<%=basePath%>/js/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<!-- Bootstrap 核心css -->
<link href="<%=basePath%>/js/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap TreeView css -->
<link href="<%=basePath%>/js/bootstrap-treeview/dist/bootstrap-treeview.min.css" rel="stylesheet">

<!-- Bootstrap addTabs css -->
<link href="<%=basePath%>/js/bootStrap-addTabs/bootstrap.addtabs.css" rel="stylesheet">

<!-- Bootstrap table css -->
<link href="<%=basePath%>/js/bootstrap-table/dist/bootstrap-table.css" rel="stylesheet">
<!-- bootstrap-datetimepicker css -->
<link href="<%=basePath%>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.css" rel="stylesheet">

<!-- bootstrap-dialog css -->
<link href="<%=basePath%>/js/bootstrap-dialog/dist/css/bootstrap-dialog.css" rel="stylesheet">
<!-- bootstrap-fileinput css -->
<link href="<%=basePath%>/js/bootstrap-fileinput/css/fileinput.css" rel="stylesheet">
</head>
<body>

<!--jQuery核心js  -->
<script src="<%=basePath%>/js/jquery.min.js"></script>
<!-- bootstrap 核心js文件 -->
<script src="<%=basePath%>/js/bootstrap/js/bootstrap.min.js"></script>
<!-- bootStrap TreeView -->
<script src="<%=basePath%>/js/bootstrap-treeview/dist/bootstrap-treeview.min.js"></script> 
<!-- bootStrap addTabs -->
<script src="<%=basePath%>/js/bootStrap-addTabs/bootstrap.addtabs.js"></script>   
<!-- bootStrap table -->
<script src="<%=basePath%>/js/bootstrap-table/dist/bootstrap-table.js"></script>
<!-- bootStrap table 语言包中文-->
<script src="<%=basePath%>/js/bootstrap-table/dist/locale/bootstrap-table-zh-CN.js"></script> 
<!-- bootstrap-datetimepicker -->
<script src="<%=basePath%>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="<%=basePath%>/js/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>  
<!-- bootstrap-dialog -->
<script src="<%=basePath%>/js/bootstrap-dialog/dist/js/bootstrap-dialog.js"></script>
<!-- bootstrap-fileinput -->
<script src="<%=basePath%>/js/bootstrap-fileinput/js/fileinput.js"></script>
<script src="<%=basePath%>/js/bootstrap-fileinput/js/locales/zh.js"></script>
</body>
</html>