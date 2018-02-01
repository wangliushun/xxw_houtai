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
    <table class="table" id="pg-table" border="1"></table>
    <script type="text/javascript">
        function sxfm(){
            $("#pg-table").bootstrapTable("refresh",{'pageNumber':1});
        }

        $(function(){
            $("#pg-table").bootstrapTable({
                url:"<%=request.getContextPath()%>/top/queryPicGroup",
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
                        rows:this.pageSize //每页条数
                    }
                },
                columns: [
                    {
                        checkbox:true,
                    },{
                        field: 'typename',
                        title: '类型名称',
                        idField:true,
                        width: 100
                    },{
                        field: 'fmimgurl',
                        title: '封面图片',
                        width: 100,
                        formatter:function (val,rowdata,rowIndex){
                            return "<img src='<%=basePath%>"+rowdata.fmimgurl+"' width='50px' height='50px'/>";
                        }
                    },{
                        field: 'n',
                        title: '操作',
                        width: 100,
                        formatter:function (val,rowdata,rowIndex){
                            return "<input type='button' value='设置封面图片'  onClick='setfm(\""+rowdata.picgroupmenuid+"\",\""+rowdata.fmimgurl+"\")'/>";
                        }
                    }
                ]
            })
        })

        function setfm(menuids,fmurl){
            BootstrapDialog.show({
                title: '设置封面',
                message: $('<div></div>').load('/top/setfm?ur='+fmurl+"&topictypeid="+menuids),
                buttons: [{
                    label: '确定',
                    action: function(dialog) {
                        $.ajax({
                            url:"/top/updatePicGroupfm?picgroupmenuid="+menuids,
                            type:"post",
                            data:$("#setfm-form").serialize(),
                            success:function (data){
                                alert("设置封面成功");
                                dialog.close();
                                sxfm();
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
