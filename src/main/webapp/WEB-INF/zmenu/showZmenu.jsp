<%--
  Created by IntelliJ IDEA.
  User: 54145
  Date: 2018/1/24
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>菜单列表</title>
</head>
<body>

    <table class="table" id="zmenuTab" border="1"></table>

<script>
    $(function(){
        $("#zmenuTab").bootstrapTable({
            url:"/zmenucontroller/queryZmenu",
            striped: true,//隔行变色
            showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 分页工具栏
            minimumCountColumns:1,//最小留下一个
            height: $(window).height() - 320,
            toolbar: '#toolbar',
            clickToSelect: true,
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            //search:true,//是否显示搜索框
            //  searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            pagination:true,//开启分页
            paginationLoop:true,//开启分页无限循环
            pageNumber:1,//当前页数
            pageSize:10,//每页条数
            pageList:[1,2,3,4],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
            sidePagination:"server",//
            method:'post',//发送请求的方式
            contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
            queryParams:function(params){
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
                    title: '菜单编号',
                    idField:true,
                    width: 100
                },{
                    field: 'text',
                    title: '菜单名称',
                    width: 100
                },{
                    field: 'pid',
                    title: '上级菜单',
                    width: 100,
                    formatter:function(value,row,index){
                        if(row.pid==2){
                            return "征文比赛";
                        }else if(row.pid==3){
                            return "倾听世界";
                        }else if(row.pid==4){
                            return "叫醒耳朵";
                        }else if(row.pid==5){
                            return "每日一笑";
                        }else{
                            return "无";
                        }
                    }

                },{
                    field: 's',
                    title: '操作',
                    width: 100,
                    formatter:function(value,row,index){
                      return "<input type='button' value='修改' onclick='toupZmenu("+row.id+")'/>"+
                          "<input type='button' value='删除' onclick='deleteZmenu("+row.id+")'/>";
                    }
                }]
        })
    })
    //修改
    function toupZmenu(id) {
        BootstrapDialog.show({
            title: '修改菜单',
            message: $('<div></div>').load('/zmenucontroller/toupZmenu?id='+id),
            buttons: [{
                label: '修改',
                action: function(dialog) {
                    //alert($("#add-form").serialize())
                    $.ajax({
                        url:"/zmenucontroller/updateZmenu",
                        type:"post",
                        data:$("#updateZmenuform").serialize(),
                        async:false,
                        success:function(data){
                            if(data==1){
                                alert("修改成功");
                                $("#zmenuTab").bootstrapTable("refresh");
                                dialog.close();
                            }
                        },
                        error:function(){
                            alert("修改报错");
                        }
                    })
                }
            }, {
                label: '取消',
                action: function(dialog) {
                    dialog.close();
                    //更改弹框标题
//	                 dialog.setTitle('Title 2');
                }
            }]
        });
    }

    //删除
    function deleteZmenu(id) {
        BootstrapDialog.show({
            title: '提示信息',
            message: '确定删除信息吗？',
            buttons: [{
                label: '确认',
                action: function (dialog) {
                     $.ajax({
                        url:"/zmenucontroller/deleteZmenu",
                        type:"post",
                        data:{"id":id},
                        async:false,
                        success:function(data){
                            if(data==1){
                                $("#zmenuTab").bootstrapTable("refresh");
                                dialog.close();
                            }
                        },
                        error:function(){
                            alert("删除报错");
                        }
                    })
                }
            }, {
                label: '取消',
                action: function(dialog) {
                    dialog.close();
                    //更改弹框标题
//	                 dialog.setTitle('Title 2');
                }
            }]
        });

    }
</script>
</body>
</html>
