<%@ page import="cn.itcast.domain.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入自定义的css -->
    <link rel="stylesheet" href="./css/header.css" type="text/css"/>
    <%
        User user = (User) pageContext.getSession().getAttribute("user");
        if (user!=null){
            pageContext.setAttribute("login_msg"," 欢迎您，"+user.getUsername());
        }else {
            pageContext.setAttribute("login_msg","您尚未登录");
        }
    %>
</head>
<body>
    <div id="banner">
        <button class="btn btn-danger" id="btn_quit">
            <span class="glyphicon glyphicon-off"></span>
        </button>
        <div id="user_banner">
            <span class="glyphicon glyphicon-user"></span>
            <span id="user_login">${login_msg}&nbsp;</span>
        </div>
    </div>
</body>
</html>
