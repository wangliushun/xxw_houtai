<%--
  Created by IntelliJ IDEA.
  User: Forever
  Date: 2018/1/22
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table id="shehheTopic-table"></table>

<script>
    $(function(){
        $("#shehheTopic-table").bootstrapTable({
            url:"shenhe/queryShenTopicByPage.do",
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
                    field: 'id',
                    title: '图片id',
                    idField:true,
                    width: 100
                },{
                    field: 'topicnr',
                    title: '话题内容',
                    idField:true,
                    width: 100
                },{
                    field: 'topiczancount',
                    title: '话题点赞数',
                    width: 100
                },{
                    field: 'picurl',
                    title: '图片',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return  "<img src='<%=basePath%>/"+rowdata.picurl+"' style='height: 80px;width: 80px'>";

                    }
                },{
                    field: 'topictypeid',
                    title: '菜单id',
                    width: 100

                },{
                    field: 'uptime',
                    title: '上传时间',
                    width: 100

                },{
                    field: 'upusername',
                    title: '上传人',
                    width: 100

                },{
                    field: 'topicshzt',
                    title: '审核状态',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        if(rowdata.topicshzt==0){
                            return "未审核";
                        }else if(rowdata.topicshzt==1) {
                            return "审核通过";
                        }else if(rowdata.topicshzt==2) {
                            return "审核未通过";
                        }
                    }
                },{
                    field: 'm',
                    title: '操作',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return "<input type='button' value='审核'  onClick='toUpdateShTopiczt(\""+rowdata.id+"\")'/>";
                    }

                }
            ]
        })

    })

    //审核图片话题
    function toUpdateShTopiczt(topicids){
        BootstrapDialog.show({
            title: '审核图片话题信息',
            message: $('<div></div>').load('shenhe/toShTopiczt.do?topicids='+topicids),
            buttons: [{
                label: '审核',
                action: function(dialog) {
                    if($("[name='topicshzt']:checked").val()==undefined){
                        alert("请先选择是否审核通过");
                    }else{
                        $.ajax({
                            url:"shenhe/updateShTopiczt.do?topicids="+topicids,
                            type:"post",
                            data:$("#shehheTopic-Info").serialize(),
                            dataType:"text",
                            async:false,
                            success:function (data){
                                if(data>0){
                                    alert("审核成功");
                                    dialog.close();
                                    $("#shehheTopic-table").bootstrapTable('refresh');
                                }
                            },
                            error:function (){
                                alert("审核出错，请检查程序");
                            }
                        })
                    }

                }
            }, {
                label: '取消',
                action: function(dialog) {
                    dialog.close();
                    //更改弹框标题
//                     dialog.setTitle('Title 2');
                }
            }]
        });
    }
</script>

</body>
</html>
