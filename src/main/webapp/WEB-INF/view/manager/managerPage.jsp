<%--
  Created by IntelliJ IDEA.
  User: Forever
  Date: 2018/1/30
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path;
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

${loginUser.username}
<c:if test="${loginUser.userlevel==1}">
    <button  type="button" class="btn btn-default">指派临时管理员</button>
    <button  type="button" class="btn btn-default">发布任务</button>
</c:if>
<c:if test="${loginUser.userlevel==2}">
    <button  type="button" class="btn btn-default" onclick="toFaBu()">发布任务</button>
    <div class="dropdown">
        <button type="button" class="btn dropdown-toggle" id="dropdownMenu1"
                data-toggle="dropdown">
            待审核
            <span class="caret"></span>
        </button>
        <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#" onclick="towz()">文章</a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#" id="tpan">图片</a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#" id="ypin">音频</a>
            </li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#" id="yle">娱乐</a>
            </li>
            <li role="presentation" class="divider" ></li>
            <li role="presentation">
                <a role="menuitem" tabindex="-1" href="#">分离的链接</a>
            </li>
        </ul>
    </div>

</c:if>
    <%--发布任务--%>

    <div id="fbrw" style="display: none" align="center">
        <form id="fbrw-form">
            <table>
                <tr>
                    <td>任务类型</td>
                    <td>
                        <select name="text">
                            <option>请选择</option>
                            <c:forEach items="${zhutilist}" var="r">
                            <option value="${r.text}">${r.text}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>接受人</td>
                    <td>
                        <select name="username">
                            <option>请选择</option>
                            <c:forEach items="${userslist}" var="u">
                                <option value="${u.username}">${u.username}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="button" class="btn btn-default" onclick="toaddfbrw()">发布</button><%--
                        <button type="button" class="btn btn-default">取消</button>--%>
                    </td>
                </tr>
            </table>
        </form>

    </div>

    <div id="wz" style="display: none">
        <table id="wz-table"></table>
    </div>
    <div id="tp" style="display: none">
        <table id="tp-table"></table>
    </div>
    <div id="yp" style="display: none">
        <table id="yp-table"></table>
    </div>
    <div  id="yl" style="display: none">
        <table id="yl-table"></table>
    </div>






<script>

    function towz() {
        $("#wz").attr("style","");
        $("#tp").attr("style","display:none");
        $("#yl").attr("style","display:none");
        $("#yp").attr("style","display:none");
        $("#fbrw").attr("style","display:none");
        $("#wz-table").bootstrapTable({
            url:"shenhe/queryShenEssayByPage.do",
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
                    field: 'essayid',
                    title: '文章id',
                    idField:true,
                    width: 100
                },{
                    field: 'essaytitleid',
                    title: '征文标题ID',
                    idField:true,
                    width: 100
                },{
                    field: 'essaytitlename',
                    title: '征文标题名称',
                    width: 100
                },{
                    field: 'userfullname',
                    title: '用户昵称',
                    width: 100

                },{
                    field: 'userid',
                    title: '提交人id',
                    width: 100

                },{
                    field: 'essayname',
                    title: '文章标题',
                    width: 100

                },{
                    field: 'essaycontent',
                    title: '文章内容',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        var a= rowdata.essaycontent;
                        return  a.substr(0,5)+"......";
                    }
                },{
                    field: 'essaystarttime',
                    title: '提交时间',
                    width: 100

                },{
                    field: 'essayimg',
                    title: '文章封面',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return  "<img src='<%=basePath%>//upimg//"+rowdata.essayimg+"' style='height: 80px;width: 80px'>";

                    }

                },{
                    field: 'votes',
                    title: '投票数',
                    width: 100

                },{
                    field: 'essayzt',
                    title: '审核状态',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        if(rowdata.essayzt==0){
                            return "未审核";
                        }else if(rowdata.essayzt==1) {
                            return "审核通过";
                        }else if(rowdata.essayzt==2) {
                            return "审核未通过";
                        }
                    }
                },{
                    field: 'm',
                    title: '操作',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return "<input type='button' value='审核'  onClick='pageShEssayzt(\""+rowdata.essayid+"\","+rowdata.userid+")'/>";
                    }

                },{
                    field: 'n',
                    title: '查看文章详情',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return "<input type='button' value='查看文章详情'  onClick='pageShowEssayzt(\""+rowdata.essayid+"\")'/>";
                    }

                }
            ]
        })


    }
    //审核文章
    function pageShEssayzt(ids,uids){

        BootstrapDialog.show({

            title: '审核征文信息',
            message: $('<div></div>').load('shenhe/toShEssayzt.do?essayid='+ids),

            buttons: [{
                label: '审核',
                action: function(dialog) {
                    if($("[name='essayzt']:checked").val()==undefined){
                        alert("请先选择是否审核通过");
                    }else{
                        $.ajax({
                            url:"shenhe/updateShEssayzt.do",

                            type:"post",

                            data:$("#shenhe-Info").serialize(),

                            dataType:"text",
                            async:false,
                            success:function (data){
                                if(data>0){
                                    alert("审核成功");
                                    dialog.close();
                                   $("#wz-table").bootstrapTable('refresh');
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

    function pageShowEssayzt(eid){
        BootstrapDialog.show({

            title: '文章内容详情',
            message: $('<div></div>').load('shenhe/toshowssay.do?essayid='+eid),
            buttons: [ {
                label: '确定',
                action: function(dialog) {
                    dialog.close();
                }
            }]
        });
    }

    /*=================================================================================================================================================*/
    /*=================================================================================================================================================*/

    $("#tpan").click(function(){

        $("#tp").attr("style","");
        $("#wz").attr("style","display:none");
        $("#yl").attr("style","display:none");
        $("#yp").attr("style","display:none");
        $("#fbrw").attr("style","display:none");
        $("#tp-table").bootstrapTable({
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
                        return "<input type='button' value='审核'  onClick='pageShTopiczt(\""+rowdata.id+"\")'/>";
                    }

                }
            ]
        })

    });
    //审核图片话题
    function pageShTopiczt(topicids){
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
                                    $("#tp-table").bootstrapTable('refresh');
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
    /*==============================================================================================================*/
    /*==============================================================================================================*/
    $("#ypin").click(function(){
        alert("点击了音频");

    });
    /*==============================================================================================================*/
    /*==============================================================================================================*/
    $("#yle").click(function(){

        $("#yl").attr("style","");
        $("#wz").attr("style","display:none");
        $("#tp").attr("style","display:none");
        $("#fbrw").attr("style","display:none");
        $("#yl-table").bootstrapTable({
            url:"shenhe/queryShenJokerByPage.do",
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
                    title: 'id',
                    idField:true,
                    width: 100
                },{
                    field: 'title',
                    title: '笑话标题',
                    idField:true,
                    width: 100
                },{
                    field: 'uptimes',
                    title: '笑话发布时间',
                    width: 100
                },{
                    field: 'content',
                    title: '笑话内容',
                    width: 100

                },{
                    field: 'typesid',
                    title: '笑话类型',
                    width: 100

                },{
                    field: 'publisher',
                    title: '发布人',
                    width: 100

                },{
                    field: 'cai',
                    title: '踩',
                    width: 100

                },{
                    field: 'zan',
                    title: '赞',
                    width: 100

                },{
                    field: 'jokershzt',
                    title: '审核状态',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        if(rowdata.jokershzt==0){
                            return "未审核";
                        }else if(rowdata.jokershzt==1) {
                            return "审核通过";
                        }else if(rowdata.jokershzt==2) {
                            return "审核未通过";
                        }
                    }
                },{
                    field: 'm',
                    title: '操作',
                    width: 100,
                    formatter:function (val,rowdata,rowIndex){
                        return "<input type='button' value='审核'  onClick='pageJokerzt("+rowdata.id+")'/>";
                    }

                }
            ]
        })
    });

    //审核娱乐话题

    function pageJokerzt(jokids){

        BootstrapDialog.show({

            title: '审核娱乐话题',
            message: $('<div></div>').load('shenhe/toShJokerzt.do?jokids='+jokids),

            buttons: [{
                label: '审核',
                action: function(dialog) {
                    if($("[name='jokershzt']:checked").val()==undefined){
                        alert("请先选择是否审核通过");
                    }else{
                        $.ajax({
                            url:"shenhe/updateShJokerzt.do?jokids="+jokids,

                            type:"post",

                            data:$("#shenheJoker-Info").serialize(),

                            dataType:"text",
                            async:false,
                            success:function (data){
                                if(data>0){
                                    alert("审核成功");
                                    dialog.close();
                                    $("#yl-table").bootstrapTable('refresh');
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
/*==================================发布任务=======================================================*/
    function toFaBu(){
        $("#fbrw").attr("style","");
        $("#wz").attr("style","display:none");
        $("#tp").attr("style","display:none");
        $("#yl").attr("style","display:none");
        $("#yp").attr("style","display:none");

    }
    //发布任务   项数据任务表添加
    function toaddfbrw(){
        $.ajax({
            url:"fabu/addRenWu.do",

            type:"post",

            data:$("#fbrw-form").serialize(),

            dataType:"text",
            async:false,
            success:function (data){
                if(data>0){
                    alert("新增成功");
                    /*dialog.close();
                    $("#anchor-table").bootstrapTable('refresh');*/
                }
            },
            error:function (){
                alert("新增出错，请检查程序");
            }
        })

    }

</script>
</body>
</html>
