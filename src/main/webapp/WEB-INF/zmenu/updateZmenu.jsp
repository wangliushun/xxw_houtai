<%--
  Created by IntelliJ IDEA.
  User: 54145
  Date: 2018/1/25
  Time: 11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改菜单</title>
</head>
<body>

            <form role="form" id="updateZmenuform">
                <input type="hidden" name="id" value="${zmenuPoJo.id}"/>
                <div class="form-group">
                    <label class="col-sm-3 control-label">菜单名称：</label>
                    <input type="text" name="text" value="${zmenuPoJo.text}"/>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">上级菜单：</label>
                    <div class="col-sm-6">
                        <select class="selectpicker" name="pid">
                            <option value="2"${zmenuPoJo.id==2?'selected':''} >征文比赛</option>
                            <option value="3"${zmenuPoJo.id==3?'selected':''}>倾听世界</option>
                            <option value="4"${zmenuPoJo.id==4?'selected':''}>叫醒耳朵</option>
                            <option value="5"${zmenuPoJo.id==5?'selected':''}>每日一笑</option>
                        </select>
                    </div>
                </div>
            </form>
</body>
</html>
