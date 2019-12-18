<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改联系人</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container" style="width: 400px">
    <h3 style="text-align: center;font-size: 25px">修改联系人页面</h3>
    <form action="${pageContext.request.contextPath}/UserUpdateServlet" method="post">
        <div>
            <input type="hidden" name="id" value="${user.id}" id="userid">
        </div>
        <div class="form-group">
            <label for="name">姓名：</label>
            <input type="text" name="name" class="form-control" value="${user.name}" id="name" readonly>
        </div>
        <div class="form-group">
            <label>性别：</label>
            <c:if test="${user.gender=='男'}">
                <input type="radio" name="gender" value="男" checked>男
                <input type="radio" name="gender" value="女">女
            </c:if>
            <c:if test="${user.gender=='女'}">
                <input type="radio" name="gender" value="男">男
                <input type="radio" name="gender" value="女" checked>女
            </c:if>
        </div>
        <div class="form-group">
            <label for="name">年龄：</label>
            <input type="text" name="age" class="form-control" value="${user.age}" id="age">
        </div>
        <div class="form-group">
            <label for="address" style="float:left;margin-top: 8px">籍贯：</label>
            <select name="address" class="form-control" value="${user.address}" id="address" style="width: 310px;">
                <c:if test="${user.address=='北京'}">
                    <option value="北京" selected>北京</option>
                    <option value="广东">广东</option>
                    <option value="福建">福建</option>
                    <option value="湖南">湖南</option>
                    <option value="深圳">深圳</option>
                </c:if>
                <c:if test="${user.address=='广东'}">
                    <option value="北京">北京</option>
                    <option value="广东" selected>广东</option>
                    <option value="福建">福建</option>
                    <option value="湖南">湖南</option>
                    <option value="深圳">深圳</option>
                </c:if>
                <c:if test="${user.address=='福建'}">
                    <option value="北京">北京</option>
                    <option value="广东">广东</option>
                    <option value="福建" selected>福建</option>
                    <option value="湖南">湖南</option>
                    <option value="深圳">深圳</option>
                </c:if>
                <c:if test="${user.address=='湖南'}">
                    <option value="北京">北京</option>
                    <option value="广东">广东</option>
                    <option value="福建">福建</option>
                    <option value="湖南" selected>湖南</option>
                    <option value="深圳">深圳</option>
                </c:if>
                <c:if test="${user.address=='深圳'}">
                    <option value="北京">北京</option>
                    <option value="广东">广东</option>
                    <option value="福建">福建</option>
                    <option value="湖南">湖南</option>
                    <option value="深圳" selected>深圳</option>
                </c:if>
            </select>
        </div>
        <div class="form-group">
            <label for="name">QQ：</label>
            <input type="text" name="qq" class="form-control" value="${user.qq}" id="qq" placeholder="请输入QQ号码">
        </div>
        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text" class="form-control" name="email" value="${user.email}" id="email" placeholder="请输入你的邮箱地址">
        </div>

        <div class="form-group" style="margin-left: 40%">
            <input class="btn btn-primary" type="submit" value="提交">
            <input class="btn btn-default" type="reset" value="重置">
            <a href="${pageContext.request.contextPath}/FindUserByPageServlet">
                <input class="btn btn-default" type="button" value="返回">
            </a>
        </div>
    </form>
</div>
</body>
</html>