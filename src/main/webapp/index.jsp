<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<h2><a href="account/findAll">测试查询</a></h2>
<br>
<h3>测试保存</h3>
<br>
<form action="account/save" method="post">
    姓名：<input type="text" name="name"><br>
    金额：<input type="text" name="money"><br>
    <input type="submit" value="提交">
</form>
</body>
</html>