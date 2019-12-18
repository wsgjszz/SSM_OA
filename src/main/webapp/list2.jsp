<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户信息列表</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        th,td{
            text-align: center;
        }
    </style>
    <script>
        window.onload=function () {

            document.getElementById("delete-btn").onclick=function () {
                if (confirm("您确定要删除选中条目吗？")) {
                    var cbs = document.getElementsByName("uid");
                    var flag=false;
                    for (var i = 0; i < cbs.length; i++) {
                        if (cbs[i].checked){
                            flag=true
                        }
                    }
                    if (flag){
                        document.getElementById("form").submit();
                    }
                }
            }

            document.getElementById("firstCb").onclick=function () {
                var cbs = document.getElementsByName("uid");
                for (var i = 0; i < cbs.length; i++) {
                    cbs[i].checked=this.checked;
                }
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h3 style="text-align: center;font-size: 30px">用户信息列表</h3>
        <div style="float: left;margin-bottom: 1px">
            <form action="${pageContext.request.contextPath}/FindUserByPageServlet" class="form-inline " method="post">
                <div class="form-group">
                    <label for="exampleInputName1">姓名</label>
                    <input type="text" name="name" value="${condition.name[0]}" class="form-control" id="exampleInputName1">
                </div>
                <div class="form-group">
                    <label for="exampleInputName2">籍贯</label>
                    <input type="text" name="address" value="${condition.address[0]}" class="form-control" id="exampleInputName2">
                </div>
                <div class="form-group">
                    <label for="exampleInputEmail2">邮箱</label>
                    <input type="email" name="email" value="${condition.email[0]}" class="form-control" id="exampleInputEmail2">
                </div>
                <button type="submit" class="btn btn-default">查询</button>
            </form>
        </div>
        <div class="" style="float:right;margin-bottom: 1px">
            <a href="add.jsp" class="btn btn-small btn-primary">添加联系人</a>
            <a href="javascript:void(0);" class="btn btn-small btn-primary" id="delete-btn">删除选中</a>
        </div>
        <form action="${pageContext.request.contextPath}/DeleteSelectedServlet" method="post" id="form">
            <table border="1" class="table table-bordered table-hover">
                <tr class="success">
                    <th><input type="checkbox" id="firstCb"></th>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>年龄</th>
                    <th>籍贯</th>
                    <th>QQ</th>
                    <th>邮箱</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${page.list}" var="user" varStatus="s">
                    <tr>
                        <th><input type="checkbox" name="uid" value="${user.id}"></th>
                        <td>${s.count}</td>
                        <td>${user.name}</td>
                        <td>${user.gender}</td>
                        <td>${user.age}</td>
                        <td>${user.address}</td>
                        <td>${user.qq}</td>
                        <td>${user.email}</td>
                        <td><a class="btn btn-small btn-success" href="${pageContext.request.contextPath}/UserFindServlet?id=${user.id}">修改</a>&nbsp;
                            <a class="btn btn-small btn-danger" href="${pageContext.request.contextPath}/DeleteServlet?id=${user.id}">删除</a></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
        <div style="margin-top: -25px">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${page.currentPage-1}&rows=5" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${page.totalPage}" step="1" var="i">
                        <c:if test="${i==page.currentPage}">
                            <li class="active"><a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${i}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a></li>
                        </c:if>
                        <c:if test="${i!=page.currentPage}">
                            <li><a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${i}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}">${i}</a></li>
                        </c:if>
                    </c:forEach>
                    <li>
                        <a href="${pageContext.request.contextPath}/FindUserByPageServlet?currentPage=${page.currentPage+1}&rows=5&name=${condition.name[0]}&address=${condition.address[0]}&email=${condition.email[0]}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <span style="font-size: 25px;margin-left: 5px">共${page.totalCount}条记录，共${page.totalPage}页</span>
                </ul>
            </nav>
        </div>
    </div>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
</body>
</html>
