<%--
  Created by IntelliJ IDEA.
  User: abc
  Date: 2018/1/20
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<input type="button" class="btn btn-primary" value="新增投诉" onclick="addDialog()">
<table class="table" id="com-table" border="1"></table>



<script type="text/javascript" >
    $(function(){
        $("#com-table").bootstrapTable({
            url:"<%=request.getContextPath()%>/complain/queryCom",
            striped: true,//隔行变色
           //height: $(window).height() - 200,
            showColumns:true,//是否显示 内容列下拉框
            showPaginationSwitch:true,//是否显示 分页工具栏
            minimumCountColumns:1,//最小留下一个
            showRefresh:true,//显示刷新按钮
            showToggle:true,//显示切换视图
            search:false,//是否显示搜索框
            searchOnEnterKey:true,//设置为 true时，按回车触发搜索方法，否则自动触发搜索方法
            pagination:true,//开启分页
            paginationLoop:true,//开启分页无限循环
            pageNumber:1,//当前页数
            pageSize:5,//每页条数
            pageList:[5,10,15,20],//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
            sidePagination:"server",//
            method:'post',//发送请求的方式
            contentType:"application/x-www-form-urlencoded",//必须的否则条件查询时会乱码
            queryParams:function(params){
                //获取搜说框中输入的值
                var str = params.search;
                return {
                    //seriesname:str,//搜索框
                    page:this.pageNumber,//当前页
                    rows:this.pageSize //每页条数
                }
            },
            columns: [
                {
                    checkbox:true,
                },{
                    field: 'comid',
                    title: '编号',
                    idField:true,
                    width: 100
                },{
                    field: 'comfullname',
                    title: '用户名',
                    idField:true,
                    width: 100
                },{
                    field: 'complaininfo',
                    title: '投诉意见',
                    idField:true,
                    width: 100
                },{
                    field: 'complaintime',
                    title: '投诉时间',
                    idField:true,
                    width: 100
                },{
                    field: 'ww',
                    title: '操作',
                    width: 50,
                    formatter:function(value,row,index){
                        return "<input type='button' value='删除' class='btn btn-warning' onclick='deleteCom(\""+row.comid+"\")'/>";
                    }
                },{
                    field: 'w',
                    title: '操作',
                    width: 50,
                    formatter:function(value,row,index){
                        return "<input type='button' value='回复' class='btn btn-success' onclick='addre(\""+row.comid+"\")'/>";
                    }
                }]
        })

    })


    function addDialog(){
        BootstrapDialog.show({
            title: '新增投诉',
            message: $('<div></div>').load('<%=request.getContextPath()%>/complain/addcom'),
            buttons: [{
                label: '保存',
                action: function(dialog) {
                    //console.info(dialog)
                    $.ajax({
                        url:"<%=request.getContextPath()%>/complain/addcomplain",
                        type:"post",
                        data:$("#add-form").serialize(),
                        dataType:"json",
                        success:function(){
                            alert("意见投递成功")
                            ree()
                        },
                        error:function(){
                            alert("意见投递错误");
                        }
                    })
                    //更改弹框内容
                    dialog.close();
                }
            }, {
                label: '取消',
                action: function(dialog) {
                    dialog.close();
                    //更改弹框标题
//                 dialog.setTitle('Title 2');
                }
            }]
        });
    }

    function deleteCom(comid) {
        var msg = "您真的确定要删除此建议吗？\n\n请确认！";
        if (confirm(msg)==true){

            $.ajax({
                url:"<%=request.getContextPath()%>/complain/deleteCom.do?comid="+comid,
                type:"post",
                success:function(){
                    ree();
                },
                error:function(){
                    alert("删除失败");
                }
            });



            return true;
        }else{
            return false;
        }
    }


    function ree(){
        $("#com-table").bootstrapTable("refresh",{'pageNumber':1});
    }
function addre(comid){
    BootstrapDialog.show({
        title: '回复投诉',
        message: $('<div></div>').load('<%=request.getContextPath()%>/complain/addropl'),
        buttons: [{
            label: '回复',
            action: function(dialog) {
                $.ajax({
                    url:"<%=request.getContextPath()%>/complain/addResi?redit="+comid,
                    type:"post",
                    data:$("#royl").serialize(),
                    dataType:"json",
                    success:function(){
                        alert("回复成功")
                        ree()
                    },
                    error:function(){
                        alert("回复失败");
                    }
                })
                dialog.close();
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
