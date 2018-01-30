<%--
  Created by IntelliJ IDEA.
  User: abc
  Date: 2018/1/23
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table" id="ray-table" border="1"></table>

<script type="text/javascript" >
    $(function(){
        $("#ray-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/complain/queryRay",
            striped: true,//隔行变色
            showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 分页工具栏
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            search:false,//是否显示搜索框
            searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            pagination:true,//开启分页
            paginationLoop:true,//开启分页无限循环
            pageNumber:1,//当前页数
            pageSize:5,//每页条数
            pageList:[5,10,15,20],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
            sidePagination:"server",//
            method:'post',//发送请求的方式
            contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
            queryParams:function(params){
                //获取搜说框中输入的值
                var str = params.search;
                return {
                    //seriesname:str,//搜索框
                    page:this.pageNumber,//当前页
                    rows:this.pageSize //每页条数
                }
            },
            columns: [
                {
                    checkbox:true,
                },{
                    field: 'comid',
                    title: '编号',
                    idField:true,
                    width: 100
                },{
                    field: 'comfullname',
                    title: '评论人',
                    idField:true,
                    width: 100
                },{
                    field: 'complaininfo',
                    title: '投诉意见',
                    idField:true,
                    width: 100
                },{
                    field: 'complaintime',
                    title: '投诉时间',
                    idField:true,
                    width: 100
                },{
                    field: 'crid',
                    title: '回复人员id',
                    idField:true,
                    width: 100
                },{
                    field: 'comreplyneirong',
                    title: '回复内容',
                    idField:true,
                    width: 100
                },{
                    field: 'comreplydata',
                    title: '回复时间',
                    idField:true,
                    width: 100
                }]
        })
    })


</script>

</body>
</html>
