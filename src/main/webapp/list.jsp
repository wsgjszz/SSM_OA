<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>部门管理</title>
    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <script>
        $(function () {
            $.get("department/page",{"currentPage":1},function (result) {
                //解析并显示数据
                bulid_deps(result);
            })

            //构建部门表
            function bulid_deps(result) {
                var deps=result.extend.pageInfo.list;
                $.each(deps,function (index,item) {
                    var depIdTd = $("<td></td>").append(item.dep_id);
                    var depNameTd = $("<td></td>").append(item.dep_name);
                    var depNumTd = $("<td></td>").append(item.dep_num);
                    var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm").append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
                    var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm").append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
                    //由于append()返回原来的元素，因此可以链式编程
                    $("<tr></tr>").append(depIdTd).append(depNameTd).append(depNumTd).append(editBtn).append(deleteBtn).appendTo("#dep_table tbody");
                })
            }
            //构建分页条
            function bulid_page(result) {
            }
        })
    </script>
</head>
<body>
<!-- 搭建显示页面 -->
<div class="container">
    <!-- 标题 -->
    <div class="row">
        <div class="col-md-12">
            <h1>部门管理</h1>
        </div>
    </div>
    <!-- 按钮 -->
    <div class="row">
        <div class="col-lg-4 col-lg-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <!-- 显示表格数据 -->
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="dep_table">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>部门名称</th>
                        <th>部门人数</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <!-- 显示分页信息 -->
    <div class="row">
        <!-- 分页条信息 -->
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="#">首页</a></li>
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li><a href="#">尾页</a></li>
                </ul>
            </nav>
        </div>
        <!-- 分页文字信息 -->
        <div class="col-md-6">
            当前记录数为：xxx
        </div>
    </div>
</div>
</body>
</html>
