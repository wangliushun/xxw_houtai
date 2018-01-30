<%--
  Created by IntelliJ IDEA.
  User: Forever
  Date: 2018/1/23
  Time: 16:15
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
<table id="shehheAudio-table"></table>

<script>

    $(function(){
        $("#shehheAudio-table").bootstrapTable({
            url:"shenhe/queryShenAudioByPage.do",
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
                    field: 'audioid',
                    title: 'id',
                    idField:true,
                    width: 100
                },{
                    field: 'audiotitle',
                    title: '标题',
                    idField:true,
                    width: 100
                },{
                    field: 'audioanchor',
                    title: '主播',
                    width: 100
                },{
                    field: 'audiourl',
                    title: '来源url',
                    width: 100

                },{
                    field: 'audiotime',
                    title: '发布时间',
                    width: 100

                },{
                    field: 'audioimg',
                    title: '封面',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return  "<img src='<%=basePath%>/"+rowdata.audioimg+"' style='height: 80px;width: 80px'>";

                    }

                },{
                    field: 'audiozt',
                    title: '审核状态',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        if(rowdata.audiozt==0){
                            return "未审核";
                        }else if(rowdata.audiozt==1) {
                            return "审核通过";
                        }else if(rowdata.audiozt==2) {
                            return "审核未通过";
                        }
                    }
                },{
                    field: 'm',
                    title: '操作',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return "<input type='button' value='审核'  onClick='toUpdateAudiozt("+rowdata.audioid+")'/>";
                    }

                }
            ]
        })

    })

    //审核文章
    function toUpdateAudiozt(idss){
        BootstrapDialog.show({

            title: '审核征文信息',
            message: $('<div></div>').load('shenhe/toShAudiozzt.do?audioid='+idss),

            buttons: [{
                label: '审核',
                action: function(dialog) {
                    $.ajax({
                        url:"shenhe/updateShAudiozt.do",

                        type:"post",

                        data:$("#shenheAudio-Info").serialize(),

                        dataType:"text",
                        async:false,
                        success:function (data){
                            if(data>0){
                                alert("审核成功");
                                dialog.close();
                                $("#shehheAudio-table").bootstrapTable('refresh');
                            }
                        },
                        error:function (){
                            alert("审核出错，请检查程序");
                        }
                    })
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
