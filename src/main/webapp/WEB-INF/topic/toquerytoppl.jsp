<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
    application.setAttribute("basePath", basePath);
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>

</head>
<body>

<!-- 列表展示 -->
<table class="table" id="toppl-table" border="1"></table>
<script type="text/javascript">
    function deletetoppl(cid){
        if(confirm("确认删除吗?")){
            $.post("<%=basePath%>/top/deletetopplbyId",{'id':cid},function(data){
                if(data > 0){
                    alert("删除成功");
                    sxtoppl();
                }
            })
        }
    }

    //页面加载
    $(function(){
        toppl();
    })


    function sxtoppl(){
        $("#toppl-table").bootstrapTable("refresh",{'pageNumber':1});
    }

    //页面分页展示娱乐话题
    function toppl(){
        var tsid=${topsid}
            $("#toppl-table").bootstrapTable({
                url:"<%=request.getContextPath()%>/top/queryTopPlByTopId?topicid="+tsid,
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
                pageSize:2,//每页条数
                pageList:[1,2,3,4],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
                sidePagination:"server",//
                method:'post',//发送请求的方式
                contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
                queryParams:function(params){
//	     	console.info(params.search);
//	            var name= $("#empName").val();
//	             var sex = $("#sex").val();
//	             alert(name+","+sex);
//	             return 的数据 是传递到  action类中的参数


                    //var str = params.search;
                    return {
                        // stuname:str,//搜索框
                        page:this.pageNumber,//当前页
                        rows:this.pageSize,//每页条数
                    }
                },
                columns: [
                    {
                        checkbox:true,
                    },{
                        field: 'topplstate',
                        title: '评论人',
                        width: 100,
                        formatter:function (val,row,rowIndex){
                            return val==1?"匿名":row.topusername;
                        }
                    },{
                        field: 'topcontent',
                        title: '评论内容',
                        width: 100
                    },{
                        field: 'toppltime',
                        title: '评论时间',
                        width: 100
                    },{
                        field: 'n',
                        title: '操作',
                        width: 100,
                        formatter:function (val,rowdata,rowIndex){
                            return "<input type='button' value='删除'  onClick='deletetoppl(\""+rowdata.id+"\")'/>";
                        }
                    }
                ]
            })
    }
</script>
</body>
</html>
