<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>添加联系人</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h3 style="text-align: center;font-size: 25px">添加部门页面</h3>
    <form action="${pageContext.request.contextPath}/department/add" method="post">
        <div class="form-group">
            <label for="dep_name">部门名称：</label>
            <input type="text" name="name" class="form-control" id="dep_name">
        </div>
        <div class="form-group">
            <label>性别：</label>
            <input type="radio" name="gender" value="男" checked="checked">男
            <input type="radio" name="gender" value="女">女
        </div>
        <div class="form-group">
            <label for="age">年龄：</label>
            <input type="text" name="age" class="form-control" id="age">
        </div>
        <div class="form-group">
            <label for="address" style="float:left;margin-top: 8px">籍贯：</label>
            <select name="address" class="form-control" id="address" style="width: 300px;">
                <option value="北京">北京</option>
                <option value="广东">广东</option>
                <option value="福建">福建</option>
                <option value="湖南">湖南</option>
                <option value="深圳">深圳</option>
            </select>
        </div>
        <div class="form-group">
            <label for="name">QQ：</label>
            <input type="text" name="qq" class="form-control" id="qq" placeholder="请输入QQ号码">
        </div>
        <div class="form-group">
            <label for="email">Email：</label>
            <input type="text" class="form-control" name="email" id="email" placeholder="请输入你的邮箱地址">
        </div>

        <div class="form-group" style="margin-left: 40%">
            <input class="btn btn-primary" type="submit" value="提交">
            <input class="btn btn-default" type="reset" value="重置">
            <a href="${pageContext.request.contextPath}//FindUserByPageServlet">
                <input class="btn btn-default" type="button" value="返回">
            </a>
        </div>
    </form>
</div>
</body>
</html>
