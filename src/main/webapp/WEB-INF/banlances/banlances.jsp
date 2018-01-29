<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/19
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table class="table" id="ban-table" border="1"></table>
   <script>

        $("#ban-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/banlances/querybanlance.do",
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
                    field: 'id',
                    title: '用户id',
                    idField:true,
                    width: 100
                },{
                    field: 'fullname',
                    title: '昵称',
                    width: 100
                },{
                    field: 'username',
                    title: '账号',
                    width: 100
                },{
                    field: 'balances',
                    title: '余额',
                    width: 100
                },{
                    field: 'money_stas',
                    title: '状态',
                    width: 100,
                    formatter: function(value,row,index){

                        return row.money_stas == 1?'冻结':'解冻';
                    }
                },{
                    field: 'money_stas',
                    title: '操作',
                    width: 100,
                    formatter: function(value,row,index){

                        return row.money_stas == 1?"<input type='button' value='解冻' onclick='toupdate(\""+row.id+"\",\""+row.money_stas+"\")'/>":"<input type='button' value='冻结' onclick='toupdate(\""+row.id+"\",\""+row.money_stas+"\")'/><input type='button' value='转账'>";
                    }
                }/*,{
                    field: 'ss',
                    title: '操作',
                    width: 50,
                    formatter:function(value,row,index){
                        return "<input type='button' value='修改' onclick='toupdate(\""+row.userid+"\")'/><input type='button' value='删除' onclick='deleteus(\""+row.userid+"\")'/>";
                    }
                }*/]
        })
       function toupdate(id,stas) {

                $.ajax({
                    url:"<%=request.getContextPath()%>/banlances/updateStas.do",
                    type:"post",
                    data:{"userid":id,"money_status":stas},
                    dataType:"text",
                    async:false,
                    success:function (){
                        $("#ban-table").bootstrapTable('refresh');
                        alert("修改成功");
                    },
                    error:function (){
                        alert("修改状态出错，请检查程序");
                    }
                })

       }

    </script>
</body>
</html>
