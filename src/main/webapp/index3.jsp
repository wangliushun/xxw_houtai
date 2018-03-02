<%--
  Created by IntelliJ IDEA.
  User: 54145
  Date: 2018/1/24
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <meta name="keywords" content="Kipy Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <!--webfonts-->
    <link href='fonts.googleapis.com/css?family=Open+Sans:700,300,600,800,400' rel='stylesheet' type='text/css'>
    <link href='fonts.googleapis.com/css?family=Marvel:400,700' rel='stylesheet' type='text/css'>
    <!--//webfonts-->
</head>
<body>
<h1>后台管理系统</h1>
<div class="login-form">
    <%--<p><a href="javascript:qt()">前台</a></p>--%>
    <h2>用户登录</h2>
    <div class="form-info">
        <form id="loginform">
            <input type="text" class="email" placeholder="账号" name="username" required=""/>
            <input type="password" class="password" placeholder="密码" name="password" required=""/><br/>
            <span id="msg"></span>
            <p><a href="#">记住密码?</a></p>
            <ul class="login-buttons">
                <li><a href="#" id="loginButton" class="hvr-sweep-to-left">登录</a></li>
                <li><a href="#" class="hvr-sweep-to-left">重置</a></li>
                <div class="clear"> </div>
            </ul>
        </form>
    </div>
</div>
<!-- jQuery 2.0.2 -->
<script src="js/jquery.min.js"></script>
    <script>
        $("#loginButton").on("click",function () {
            $.ajax({
                url:'/userscontroller/tologin',
                data:$("#loginform").serialize(),
                type:'post',
                dataType:"text",
                success:function (data) {
                    if(data=="loginNo"){
                        $("#msg").html("<font color='red'>用户名或密码错误</font>")
                    }else if(data=="Administrator"){
                        location.href="/home"
                    }else if(data=="Common"){
                        location.href="/show"
                    }
            }
            })
        })
    </script>
</body>
</html>
