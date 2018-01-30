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
<input type="button" class="btn btn-primary" value="推广文章" onclick="updategeneralize(1)">
<input type="button" class="btn btn-primary" value="收回文章" onclick="updategeneralize(2)">
<table id="generalizeListTable"></table>
<script type="text/javascript">
    function queryessaygeneralize(){
        $("#eassyListTable").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){

        $("#generalizeListTable").bootstrapTable({
            url:"<%=basePath%>/generalize/queryessaygeneralize",
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
                    field: 'userfullname',
                    title: '用户昵称',
                    width: 50
                },{
                    field: 'essayname',
                    title: '文章标题',
                    width: 50
                },{
                    field: 'essaycontent',
                    title: '文章内容',
                    width: 50,
                    formatter:function(value,row,index){
                        var a=row.essaycontent;

                        return a.substr(0,16)+"......";

                    }
                },{
                    field: 'essaystarttime',
                    title: '提交时间',
                    width: 50
                },{
                    field: 'essayimg',
                    title: '文章封面',
                    width: 50,
                    formatter:function(value,row,index){

                        return  "<img src='<%=basePath%>//upimg//"+row.essayimg+"' style='height: 80px;width: 80px'>";

                    }
                },{
                    field: 'votes',
                    title: '投票数',
                    width: 50
                },{
                    field: 'generalize',
                    title: '是否已推广',
                    width: 50,
                    formatter:function(value,row,index){

                       if(row.generalize==0){
                           return "未推广";
                       }else{
                           return "已推广";
                       }

                    }
                }]
        })
    })
    function updategeneralize(identifying) {
        //获取选中的框格
        var mid = $("#generalizeListTable").bootstrapTable("getSelections");
        console.info(mid)
        var m = "";
        for (var i = 0; i < mid.length; i++) {
            m += "," + mid[i].essayid;
        }
        //对id进行截取
        var id = m.substr(1);
        if(id.length>0){
            $.ajax({
                url: '<%=request.getContextPath()%>/generalize/updategeneralize',
                type: "post",
                data: {"essayides":id,"identifying":identifying},
                dataType: "text",
                success: function (m) {
                    if (m > 0) {
                        alert("修改成功！")
                        //刷新数据表格
                        $("#generalizeListTable").bootstrapTable("refresh");
                    }
                }, error: function () {
                    alert("失败！")
                }
            })
        }else {
            alert("请至少选择一项......")
        }

    }

</script>
</body>
</html>