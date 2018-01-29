<%--
  Created by IntelliJ IDEA.
  User: 54145
  Date: 2018/1/24
  Time: 21:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增菜单</title>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-3 column">
        </div>
        <div class="col-md-6 column">
            <br>
            <form role="form" id="zemnuForm">
                <div class="form-group">
                    <label class="col-sm-3 control-label">菜单名称：</label>
                    <input type="text" name="text"/>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">上级菜单：</label>
                    <div class="col-sm-6">
                        <select class="selectpicker" name="pid">
                            <option value="2">征文比赛</option>
                            <option value="3">倾听世界</option>
                            <option value="4">叫醒耳朵</option>
                            <option value="5">每日一笑</option>
                        </select>
                    </div>
                </div><br/>
                <hr/>
                &nbsp&nbsp&nbsp &nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                <button type="button" class="btn btn-primary btn-lg" id="addzemubutton">新增菜单</button>
            </form>
        </div>
        <div class="col-md-3 column">
        </div>
    </div>
</div>
<script>
    $("#addzemubutton").on("click",function () {
       $.ajax({
           url:'/zmenucontroller/addZmenu',
           data:$("#zemnuForm").serialize(),
           type:'post',
           dataType:'text',
           success:function (data) {
                if(data>0){
                    location.reload();
                }
           }
       })
    })
</script>
</body>
</html>
