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
<table id="eassyListTable"></table>
<script type="text/javascript">
    function queryessay(){
        $("#eassyListTable").bootstrapTable("refresh",{'pageNumber':1});
    }

    $(function(){

        $("#eassyListTable").bootstrapTable({
            url:"<%=basePath%>/essay/queryessay",
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

                        return  "<img src='<%=basePath%>/"+row.essayimg+"' style='height: 80px;width: 80px'>";

                    }
                },{
                    field: 'votes',
                    title: '投票数',
                    width: 50
                },{
                    field: 'aa',
                    title: '操作',
                    width: 50,
                    formatter:function(value,row,index){

                        return "<input type='button' value='赞(+2分)' onclick='toupvotes("+row.essayid+",2)'/>"+
                               "<input type='button' value='踩(-1分)' onclick='toupvotes("+row.essayid+",1)'/>"+
                               "<input type='button' value='转发(+5分)' onclick='toupvotes("+row.essayid+",5)'/>"+
                               "<input type='button' value='评论(+3分)' onclick='addEssayComment("+row.essayid+",3)'/>"
                            ;
                    }

                }]
        })
    })
    function toupvotes(essayid,votes){
       $.ajax({
            url:"<%=basePath%>/essay/updatevotes",
            type:"post",
            data:{"essayid":essayid,"votes":votes},
            dataType:"text",
            success:function(data){
                if(data==1){
                    $('#eassyListTable').bootstrapTable(('refresh'));
                }
            },
            error:function(){
                alert("错误");
            }
        })
    }
    function addEssayComment(essayid,votes) {
        BootstrapDialog.show({
            title: '投稿',
            message: $('<div></div>').load('/essay/toaddEssayComment?essayid='+essayid),
            buttons: [{
                label: '保存',
                action: function(dialog) {
                    $.ajax({
                        url:"/essay/addEssayComment?essayid="+essayid+"&votes="+votes,
                        type:"post",
                        data:$("#addessayCommentform").serialize(),
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
</script>
</body>
</html>