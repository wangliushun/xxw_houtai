<%--
  Created by IntelliJ IDEA.
  User: Forever
  Date: 2018/1/31
  Time: 19:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table id="faburw-table"></table>
<script>

    $(function(){
        $("#faburw-table").bootstrapTable({
            url:"fabu/queryFabuByPage.do",
            striped: true,//隔行变色
            showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 分页工具栏
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            search:true,//是否显示搜索框
            searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            pagination:true,//开启分页
            paginationLoop:true,//开启分页无限循环
            pageNumber:1,//当前页数
            pageSize:3,//每页条数
            pageList:[1,2,3,4],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
            sidePagination:"server",//
            method:'post',//发送请求的方式
            contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
            queryParams:function(params){
                //定义一个搜索框中传的是班级名字
                var str = params.search;
                return {
                    page:this.pageNumber,//当前页
                    rows:this.pageSize //每页条数
                }
            },
            columns: [
                {
                    checkbox:true,
                },{
                    field: 'acceptid',
                    title: '接收任务人',
                    idField:true,
                    width: 100
                },{
                    field: 'rwtype',
                    title: '任务内容',
                    width: 100
                },{
                    field: 'acceptzt',
                    title: '接受状态',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        if(rowdata.acceptzt==0){
                            return "未接受";
                        }else if(rowdata.acceptzt==1) {
                            return "已接受";
                        }
                    }

                },{
                    field: 'finishzt',
                    title: '完成状态',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        if(rowdata.finishzt==0){
                            return "未完成";
                        }else if(rowdata.finishzt==1) {
                            return "已完成";
                        }
                    }

                },{
                    field: 'shzts',
                    title: '审核状态',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        if(rowdata.shzts==0){
                            return "未审核";
                        }else if(rowdata.shzts==1) {
                            return "审核通过";
                        }else if(rowdata.shzts==2) {
                            return "审核未通过";
                        }
                    }

                },{
                    field: 'm',
                    title: '操作',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return "<input type='button' value='修改'  onClick='updateAnchor(\""+rowdata.id+"\")'/>"+
                            "<input type='button' value='删除'  onClick='deleteAnchor(\""+rowdata.id+"\")'/>";
                    }

                }
            ]
        })

    })



</script>







</body>
</html>
