<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/22
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="table" id="users-table" border="1"></table>
<script>

    $("#users-table").bootstrapTable({
        url:"<%=request.getContextPath()%>/users/queryUsers.do",
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
        pageSize:2,//每页条数
        pageList:[1,2,3,4],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
        sidePagination:"server",//
        method:'post',//发送请求的方式
        contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
        queryParams:function(params){
            var str = params.search;
            return {
                xname:str,//搜索框
                page:this.pageNumber,//当前页
                rows:this.pageSize //每页条数
            }
        },
        columns: [
            {
                checkbox:true,
            },{
                field: 'userinfoUsername',
                title: '账号',
                idField:true,
                width: 100
            },{
                field: 'userinfoPassword',
                title: '密码',
                width: 100
            },{
                field: 'fullnames',
                title: '昵称',
                width: 100
            },{
                field: 'userinfoSignature',
                title: '签名',
                width: 100
            },{
                field: 'totalscores',
                title: '积分',
                width: 100
            },{
                field: 'names',
                title: '地区',
                width: 100
            },{
                field: 'userinfoUsersex',
                title: '性别',
                width: 100
            },{
                field: 'userinfoBirthday',
                title: '生日',
                width: 100
            },{
                field: 'userinfoLovestatus',
                title: '恋爱状态',
                width: 100,
                formatter: function(value,row,index){

                    return row.money_stas == 1?'单身':'恋爱中';
                }
            },{
                field: 'userinfoHometown',
                title: '家乡',
                width: 100
            },{
                field: 'userinfoEmail',
                title: '邮箱',
                width: 100
            },{
                field: 'jobnames',
                title: '行业',
                width: 100
            }/*,{
                    field: 'ss',
                    title: '操作',
                    width: 50,
                    formatter:function(value,row,index){
                        return "<input type='button' value='修改' onclick='toupdate(\""+row.userid+"\")'/><input type='button' value='删除' onclick='deleteus(\""+row.userid+"\")'/>";
                    }
                }*/]
    })


</script>
</body>
</html>
