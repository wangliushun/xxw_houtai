<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/1/31
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table border="1" id="gift-form"> </table>

    <script>

        $(function(){
            $("#gift-form").bootstrapTable({
                url:"<%=request.getContextPath()%>/UserJifenInfo/querygift.do",
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
                        title: '礼物id',
                        idField:true,
                        width: 100
                    },{
                        field: 'giftname',
                        title: '礼物名称',
                        width: 100
                    },{
                        field: 'giftjifen',
                        title: '所需积分',
                        width: 100
                    },{
                        field: 'ss',
                        title: '操作',
                        width: 50,
                        formatter:function(value,row,index){
                            return "<input type='button' value='积分兑换' onclick='updatejifen(\""+row.giftjifen+"\")'/>";
                        }
                    }]
            })
        })


        function updatejifen(giftjifen) {
            var useridss=0;
            $.ajax({
                url:"<%=request.getContextPath()%>/UserJifenInfo/updatejifen.do?jifens="+giftjifen+"&userids="+useridss,
                type:"post",
                dataType:"text",
                async:false,
                success:function (upFlag){
                    if(upFlag==1){
                        alert("兑换成功")
                    }
                },
                error:function (){
                    alert("兑换失败,请检查程序");
                }
            })
        }


    </script>
</body>
</html>
