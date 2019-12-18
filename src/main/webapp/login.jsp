<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理员登录</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- 获取项目路径 -->
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <script>
        function reflushcode() {
            var vcode = document.getElementById("vcode");
            vcode.src="${APP_PATH}/utils/checkCode?Time="+new Date().getTime();
        }
    </script>
</head>
<body>
<div class="container" style="width: 500px">
    <h3 style="text-align: center">管理员登录</h3>
    <form action="${APP_PATH}/user/login" method="post">
        <div class="form-group">
            <label for="username">用户名：</label>
            <input type="text" name="username" class="form-control" id="username">
        </div>
        <div class="form-group">
            <label for="password">密码：</label>
            <input type="password" name="password" class="form-control" id="password">
        </div>
        <div class="form-inline">
            <label for="checkcode">验证码：</label>
            <input type="text" name="checkcode" class="form-control" id="checkcode">
            <a href="javascript:reflushcode()">
                <img src="${APP_PATH}/utils/checkCode" title="看不清" id="vcode">
            </a>
        </div>
        <hr>
        <div class="form-group">
            <input class="btn btn-primary" type="submit" value="登录">
        </div>
    </form>

    <!-- 出错时显示的信息框 -->
    <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close">
            <span>x</span>
        </button>
        <strong>${login_msg}</strong>
    </div>
</div>
</body>
</html>
