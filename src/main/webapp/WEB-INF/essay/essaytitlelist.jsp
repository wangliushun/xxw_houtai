<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/style/bootstrap.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

</head>
<body>
<input type="button" class="btn btn-primary" value="新增征文专题" onclick="addeassytitle()">
<table id="eassytitletable"></table>
<script type="text/javascript">
    function queryeassytitle(){
        $("#eassytitletable").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){

        $("#eassytitletable").bootstrapTable({
            url:"<%=basePath%>/essay/queryessaytitle",
            height: $(window).height() - 250,
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
                    /*  starttimeStr:$("#starttime").val(),
                     endtimeStr:$("#endtime").val(),
                     ftname:$("#ftnams").val(),
                    ortype:$("[name='ortype'] option:selected").val(),
                    orname:$("[name='orname']").val(),
                    orbrand:$("[name='orbrand'] option:selected").val(),
                    bnames:$("[name='bnames']").val(),*/
                    page:this.pageNumber,//当前页
                    rows:this.pageSize //每页条数
                }
            },
            columns: [
                {
                    checkbox:true,
                },{
                    field: 'essaytitlename',
                    title: '征文标题',
                    width: 50
                },{
                    field: 'endtime',
                    title: '征文结束日期',
                    width: 50
                },{
                    field: 'aa',
                    title: '操作',
                    width: 50,
                    formatter:function(value,row,index){
                        var nowdate = new Date();
                        var endtime = new Date(row.endtime);
                       if (nowdate.getTime()>endtime.getTime()){
                            return "投稿已截止";
                        }
                       return "<input type='button' class=‘btn btn-primary’ value='投稿' onclick='toupword("+row.id+",\""+row.essaytitlename+"\")'/>";
                    }

                }]
        })
    })
    function toupword(id,essaytitlename){
        BootstrapDialog.show({
            title: '投稿',
            message: $('<div></div>').load('/essay/toupword'),
            buttons: [{
                label: '保存',
                action: function(dialog) {
                    $.ajax({
                        url:"/essay/addessay?id="+id+"&essaytitlename="+essaytitlename,
                        type:"post",
                        data:$("#addeasy-form").serialize(),
                        success:function (data){
                            alert("添加成功");
                            dialog.close();
                            searchss();
                        },
                        error:function (){

                            alert("错了")
                        }
                    })
                }
            }, {
                label: '取消',
                action: function(dialog) {
                    dialog.close();
                }
            }]
        });

    }
    function addeassytitle() {
        BootstrapDialog.show({
            title: '投稿',
            message: $('<div></div>').load('/essay/toaddeassytitle'),
            buttons: [{
                label: '保存',
                action: function(dialog) {
                    $.ajax({
                        url:"/essay/addeassytitle",
                        type:"post",
                        data:$("#addeasytitle-form").serialize(),
                        success:function (data){
                            alert("添加成功");
                            dialog.close();
                            queryeassytitle();
                        },
                        error:function (){

                            alert("错了")
                        }
                    })
                }
            }, {
                label: '取消',
                action: function(dialog) {
                    dialog.close();
                }
            }]
        });
    }
</script>
</body>
</html>