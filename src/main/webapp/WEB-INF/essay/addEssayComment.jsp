<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

</head>
<body>

<table id="essayCommentListTable"></table>
<form id="addessayCommentform">
    <input type="hidden" id="essayid" name="essayides" value="${essayid}">
    <textarea rows="10px" cols="40px" name="commentcontent" placeholder="请输入评论"></textarea>
</form>
<script type="text/javascript">
    function queryEssayComment(){
        $("#essayCommentListTable").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){
        var essayid=$("#essayid").val();
        $("#essayCommentListTable").bootstrapTable({
            url:"<%=basePath%>/essay/queryEssayComment?essayides="+essayid,
            striped: true,//隔行变色
            showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 分页工具栏
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            // search:true,//是否显示搜索框
            searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            pagination:true,//开启分页
            paginationLoop:true,//开启分页无限循环
            pageNumber:1,//当前页数
            pageSize:2,//每页条数
            pageList:[2,3,4],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
            sidePagination:"server",//
            method:'post',//发送请求的方式
            contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
            queryParams:function(params){
                return {
                    page:this.pageNumber,//当前页
                    rows:this.pageSize //每页条数
                }
            },
            columns: [
                {
                    checkbox:true,
                },{
                    field: 'commentname',
                    title: '评论人姓名',
                    width: 50
                },{
                    field: 'commentcontent',
                    title: '评论内容',
                    width: 50
                },{
                    field: 'commenttime',
                    title: '评论时间',
                    width: 50
                },{
                    field: 'essayname',
                    title: '文章名称',
                    width: 50
                }]
        })
    })
</script>
</body>
</html>