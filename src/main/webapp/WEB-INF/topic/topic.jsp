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
      <c:forEach items="${tlist}" var="t">
                <a href="javascript:searchss(${t.id})">${t.text}</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </c:forEach>
    <!-- 点击类型重新赋值 -->
      <table>
          <tr>
              <td>
                  <input type="hidden" id="a" value="0"/>
              </td>
          </tr>
      </table>

      <!-- 新增按钮 -->
    <div style="display: none" id="anniu">
        <input type="button" class="btn btn-primary" value="新增" onclick="addDialog()" >
    </div>
    <!-- 点赞回到当前页，hidden当前页 -->
    <%--<input type="text" id="pa" value="${pa}"/>--%>

<!-- 列表展示 -->
<table class="table" id="stu-table" ></table>
<script type="text/javascript">

    //新增话题
    function addDialog(){
        var mms=$("#a").val();
        BootstrapDialog.show({
            title: '添加话题',
            message: $('<div></div>').load('/top/test4'),
            buttons: [{
                label: '保存',
                action: function(dialog) {
                    $.ajax({
                        url:"/top/saveTopic?topictypeid="+mms,
                        type:"post",
                        data:$("#addtop-form").serialize(),
                        success:function (data){
                            alert("添加成功");
                            dialog.close();
                            searchss(mms);
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
    //重新设置封面
    function xiugaipiczu(xfm,tid){
        $.ajax({
            url:"/top/updatePicZufm",
            type:"post",
            data:{"fmimgurl":xfm,"picgroupmenuid":tid},
            success:function (data){
                if(data>0){
                }
            },
            error:function (){
                alert("重新设置封面错了")
            }
        })
    }
    //修改话题
    function aa(cid,tid){
        BootstrapDialog.show({
            title: '修改话题',
            message: $('<div></div>').load('/top/uptopic?id='+cid+"&mid="+tid),
            buttons: [{
                label: '修改',
                action: function(dialog) {
                    var xfm=$("#setchushifm").val();
                    //alert(xfm);
                    if($("#flag").val()=="是封面"){
                        $.ajax({
                            url:"/top/updateTopic",
                            type:"post",
                            data:$("#uptop-form").serialize(),
                            dataType:"text",
                            async:false,
                            success:function (upFlag){
                                if(upFlag==1){
                                    alert("修改成功");
                                    dialog.close();
                                    //是封面同时修改对应类型封面
                                    xiugaipiczu(xfm,tid);
                                    if( $("#a").val()==0){
                                        searchss(0);
                                    }else{
                                        searchss(tid);
                                    }
                                }
                            },
                            error:function (){
                                alert("修改出错，请检查程序");
                            }
                        })
                    }else{
                        $.ajax({
                            url:"/top/updateTopic",
                            type:"post",
                            data:$("#uptop-form").serialize(),
                            dataType:"text",
                            async:false,
                            success:function (upFlag){
                                if(upFlag==1){
                                    alert("修改成功");
                                    dialog.close();
                                    if( $("#a").val()==0){
                                        searchss(0);
                                    }else{
                                        searchss(tid);
                                    }
                                }
                            },
                            error:function (){
                                alert("修改出错，请检查程序");
                            }
                        })
                    }

                }
            }, {
                label: '取消',
                action: function(dialog) {
                    dialog.close();
                }
            }]
        });

    }

    /*//修改话题
    function aa(cid,tid){
        BootstrapDialog.show({
            title: '修改话题',
            message: $('<div></div>').load('/uptopic?id='+cid),
            buttons: [{
                label: '修改',
                action: function(dialog) {
                    $.ajax({
                        url:"/updateTopic",
                        type:"post",
                        data:$("#uptop-form").serialize(),
                        dataType:"text",
                        async:false,
                        success:function (upFlag){
                            if(upFlag==1){
                                alert("修改成功");
                                dialog.close();
                                if( $("#a").val()==0){
                                    searchss(0);
                                }else{
                                    searchss(tid);
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
    */
    //是否显示新增按钮
    function searchss(ttid){
        $("#a").val(ttid);
        $("#stu-table").bootstrapTable("refresh",{'pageNumber':1});
        if($("#a").val()!=0){
            $("#anniu").attr("style","");
        }
    }
    //页面加载
    $(function(){
        ser();
        /*var no=new Date();
        alert(no.getTime())*/
    })
    //页面分页展示话题
    function ser(){
        $("#stu-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/top/queryTopicByMenuId",
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
                    topictypeid:$("#a").val()
                }
            },
            columns: [
                {
                    checkbox:true,
                },{
                    field: 'picurl',
                    title: '图片',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                            return "<a href='javascript:topaddpl(\""+rowdata.id+"\",\""+rowdata.topictypeid+"\")'><img src='<%=basePath%>"+rowdata.picurl+"' width='50px' height='50px'/></a>";
                     }
                },{
                    field: 'topicnr',
                    title: '话题内容',
                    width: 100
                },{
                    field: 'topiczancount',
                    title: '点赞数',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return "<input type='button' class='btn btn-primary' value='"+rowdata.topiczancount+"'  onClick='dianzan(\""+rowdata.id+"\",\""+rowdata.topictypeid+"\")'/>";
                    }

                },{
                    field: 'p',
                    title: '操作',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return "<input type='button' class='btn btn-primary' value='评论列表'  onClick='querytoppl(\""+rowdata.id+"\")'/>";
                    }

                },{
                    field: 'v',
                    title: '操作',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return "<input type='button' class='btn btn-primary' value='修改'  onClick='aa(\""+rowdata.id+"\",\""+rowdata.topictypeid+"\")'/>";
                    }

                },{
                    field: 'n',
                    title: '操作',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return "<input type='button' class='btn btn-primary' value='删除'  onClick='querytgbyid(\""+rowdata.id+"\",\""+rowdata.topictypeid+"\",\""+rowdata.picurl+"\")'/>";
                    }

                }
            ]
        })
    }
    //评论列表
    function querytoppl(cid){
        BootstrapDialog.show({
            title: '评论列表',
            message: $('<div></div>').load('/top/toquerytoppl?topid='+cid),
            buttons: [{
                label: '取消',
                action: function(dialog) {
                    dialog.close();
                }
            }]
        });
    }

    //点击图片查看详细信息
    function topaddpl(cid,tid){
        BootstrapDialog.show({
            title: '详细信息',
            message: $('<div></div>').load('/top/totopxiangxi?id='+cid),
            buttons: [{
                label: '取消',
                action: function(dialog) {
                    dialog.close();
                }
            }]
        });
    }

    //点赞专用刷新页面
    function dianzansearchss(ttid){
        $("#a").val(ttid);
        $("#stu-table").bootstrapTable("refresh");
        if($("#a").val()!=0){
            $("#anniu").attr("style","");
        }
    }

    //点赞
    function dianzan(cid,tid){
        $.ajax({
            url:"/top/updatezanById?id="+cid,
            type:"post",
            success:function (data){
                if( $("#a").val()==0){
                    dianzansearchss(0);
                }else{
                    dianzansearchss(tid);
                }
            },
            error:function (){
                alert("点赞时出错了")
            }
        })
    }



    //不是封面，可以删除
    function deletetopics(cid,tid){
        if(confirm("确认删除吗?")){
        $.post("<%=basePath%>/top/deletetopic",{'id':cid},function(data){
            if(data > 0){
                alert("删除成功");
                if( $("#a").val()==0){
                    searchss(0);
                }else{
                    searchss(tid);
                }
            }
        })
        }
    }
    //删除前先查询是否是该类型封面
    function querytgbyid(cid,tid,ur){
        $.ajax({
            url:"/top/querytgById?picgroupmenuid="+tid,
            type:"post",
            success:function (data){
                if(data[0].fmimgurl==ur){
                    alert("此话题图片是封面，请修改该类型封面后再删除");
                }else{
                    deletetopics(cid,tid);
                }
            },
            error:function (){
                alert("删除时查询出错了")
            }
        })
    }

</script>
</body>
</html>