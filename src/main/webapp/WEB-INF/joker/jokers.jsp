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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>

</head>
<body>
        <!-- 展示类型 -->
        <c:forEach items="${jlist}" var="j">
            <a href="javascript:searchjok(${j.id})">${j.text}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </c:forEach>
        <!-- 点击类型重新赋值 -->
        <table>
            <tr>
                <td>
                    <input type="hidden" id="joker" value="0"/>
                </td>
            </tr>
        </table>

        <!-- 新增按钮 -->
        <div style="display: none" id="jkanniu">
            <input type="button"  value="新增" onclick="addjokDialog()" >
        </div>
        <!-- 列表展示 -->
        <table class="table" id="jok-table" border="1"></table>
        <script type="text/javascript">

            //新增娱乐话题
            function addjokDialog(){
                var jmm=$("#joker").val();
                BootstrapDialog.show({
                    title: '添加娱乐话题',
                    message: $('<div></div>').load('/joker/toaddjoker'),
                    buttons: [{
                        label: '保存',
                        action: function(dialog) {
                            $.ajax({
                                url:"/joker/saveJoker?typesid="+jmm,
                                type:"post",
                                data:$("#addjoker-form").serialize(),
                                success:function (data){
                                    alert("添加成功");
                                    dialog.close();
                                    searchjok(jmm);
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

            //修改
            function updatej(cid,tid){
                BootstrapDialog.show({
                    title: '修改娱乐话题',
                    message: $('<div></div>').load('/joker/toupjoker?id='+cid),
                    buttons: [{
                        label: '修改',
                        action: function(dialog) {
                            $.ajax({
                                url:"/joker/updateJoker",
                                type:"post",
                                data:$("#upjok-form").serialize(),
                                dataType:"text",
                                async:false,
                                success:function (upFlag){
                                    if(upFlag==1){
                                        alert("修改成功");
                                        dialog.close();
                                        if( $("#joker").val()==0){
                                            searchjok(0);
                                        }else{
                                            searchjok(tid);
                                        }
                                    }
                                },
                                error:function (){
                                    alert("修改出错，请检查程序");
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

            //是否显示新增按钮
            function searchjok(ttid){
                $("#joker").val(ttid);
                $("#jok-table").bootstrapTable("refresh",{'pageNumber':1});
                if($("#joker").val()!=0){
                    $("#jkanniu").attr("style","");
                }
            }

            //页面加载
            $(function(){
                jok();
            })

            //踩与赞专用刷新页面
            function dianzanjok(ttid){
                $("#joker").val(ttid);
                $("#jok-table").bootstrapTable("refresh");
                if($("#joker").val()!=0){
                    $("#jkanniu").attr("style","");
                }
            }

            //踩和赞
            function caizan(jid,tid,flag){
                    $.ajax({
                        url:"/joker/updatecaizan?jid="+jid+"&flag="+flag,
                        type:"post",
                        dataType:"text",
                        async:false,
                        success:function (upFlag){
                            if(upFlag==1){
                                if( $("#joker").val()==0){
                                    dianzanjok(0);
                                }else{
                                    dianzanjok(tid);
                                }
                            }
                        },
                        error:function (){
                            alert("修改出错，请检查程序");
                        }
                    })
            }

            //页面分页展示娱乐话题
            function jok(){
                $("#jok-table").bootstrapTable({
                    url:"<%=request.getContextPath()%>/joker/queryJokerByMenuId",
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
                            typesid:$("#joker").val()
                        }
                    },
                    columns: [
                        {
                            checkbox:true,
                        },{
                            field: 'content',
                            title: '内容',
                            width: 100,
                            formatter:function (val,rowdata,rowIndex){
                                var b=val.length;
                                var a=val.substring(0,15);
                                if(b<16){
                                    return ""+val+"<a href='javascript:queryJokerByContent(\""+rowdata.id+"\",\""+rowdata.typesid+"\")'>详细</a>"
                                }else{
                                    return ""+a+"....<a href='javascript:queryJokerByContent(\""+rowdata.id+"\",\""+rowdata.typesid+"\")'>详细</a>"
                                }
                            }
                        },{
                            field: 'cai',
                            title: '踩',
                            width: 100,
                            formatter:function (val,rowdata,rowIndex){
                                return "<input type='button' value='"+rowdata.cai+"'  onClick='caizan(\""+rowdata.id+"\",\""+rowdata.typesid+"\",1)'/>";
                            }

                        },{
                            field: 'zan',
                            title: '赞',
                            width: 100,
                            formatter:function (val,rowdata,rowIndex){
                                return "<input type='button' value='"+rowdata.zan+"'  onClick='caizan(\""+rowdata.id+"\",\""+rowdata.typesid+"\",2)'/>";
                            }

                        },{
                            field: 'p',
                            title: '操作',
                            width: 100,
                            formatter:function (val,rowdata,rowIndex){
                                return "<input type='button' value='评论列表'  onClick='querypl(\""+rowdata.id+"\")'/>";
                            }

                        },{
                            field: 'v',
                            title: '操作',
                            width: 100,
                            formatter:function (val,rowdata,rowIndex){
                                return "<input type='button' value='修改'  onClick='updatej(\""+rowdata.id+"\",\""+rowdata.typesid+"\")'/>";
                            }

                        },{
                            field: 'n',
                            title: '操作',
                            width: 100,
                            formatter:function (val,rowdata,rowIndex){
                                return "<input type='button' value='删除'  onClick='deletej(\""+rowdata.id+"\",\""+rowdata.typesid+"\")'/>";
                            }

                        }
                    ]
                })
            }

            //删除
            function deletej(cid,tid){
                if(confirm("确认删除吗?")){
                    $.post("<%=basePath%>/joker/deletejoker",{'id':cid},function(data){
                        if(data > 0){
                            alert("删除成功");
                            if( $("#joker").val()==0){
                                searchjok(0);
                            }else{
                                searchjok(tid);
                            }
                        }
                    })
                }
            }
            //详细
            function queryJokerByContent(jid,jtid){
                BootstrapDialog.show({
                    title: '详细',
                    message: $('<div></div>').load('/joker/toxiangxi?id='+jid),
                    buttons: [{
                        label: '取消',
                        action: function(dialog) {
                            dialog.close();
                        }
                    }]
                });
            }
            //评论列表
            function querypl(jid){
                BootstrapDialog.show({
                    title: '评论列表',
                    message: $('<div></div>').load('/joker/toquerypl?jkid='+jid),
                    buttons: [{
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
