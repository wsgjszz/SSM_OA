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
            $.get("emp/page",{"currentPage":1},function (result) {
                //解析并显示员工数据
                bulid_deps(result);
                //解析并显示分页信息
                bulid_page_info(result);
                //解析并显示分页条
                bulid_page_nav(result);
            })

            //构建部门表
            function bulid_deps(result) {
                var deps=result.extend.pageInfo.list;
                $.each(deps,function (index,item) {
                    var depNameTd = $("<td></td>").append(item.dep_name);
                    var empNameTd = $("<td></td>").append(item.emp_name);
                    var empPosTd = $("<td></td>").append(item.emp_position);
                    var empSexTd = $("<td></td>").append(item.emp_gender);
                    var empAgeTd = $("<td></td>").append(item.emp_age);
                    var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm").append("<span></span>").addClass("glyphicon glyphicon-pencil").append("编辑");
                    var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm").append("<span></span>").addClass("glyphicon glyphicon-trash").append("删除");
                    //由于append()返回原来的元素，因此可以链式编程
                    $("<tr></tr>").append(depNameTd).append(empNameTd).append(empPosTd).append(empSexTd).append(empAgeTd).append(editBtn).append(deleteBtn).appendTo("#dep_table tbody");
                })
            }

            //构建分页信息
            function bulid_page_info(result) {
                //当前记录数为：xxx
                var total = result.extend.pageInfo.total;
                var total_page = parseInt(result.extend.pageInfo.total/5)+1;
                $("#page_info").append("当前记录数为："+total+",共 "+total_page+" 页");
            }

            //构建分页条
            function bulid_page_nav(result) {
                var ul = $("<ul></ul>").addClass("pagination");
                var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
                var PrePageLi = $("<li></li>").append($("<a></a>").append("&laquo;").attr("href","#"));
                var NextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;").attr("href","#"));
                var endPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));

                //添加首页和前一页
                ul.append(firstPageLi).append(PrePageLi);
                //添加页码
                $.each(result.extend.pageInfo.navigatepageNums,function (index, item) {
                    var NumLi = $("<li></li>").append($("<a></a>").append(item).attr("href","#"));;
                    ul.append(NumLi);
                })
                //添加尾页和下一页
                ul.append(NextPageLi).append(endPageLi);

                $("<nav></nav>").append(ul).attr("aria-label","Page navigation").appendTo("#page_nav");


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
            <h1>员工管理</h1>
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
                        <th>部门</th>
                        <th>姓名</th>
                        <th>职位</th>
                        <th>性别</th>
                        <th>年龄</th>
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
        <div class="col-md-6" id="page_nav"></div>
        <!-- 分页文字信息 -->
        <div class="col-md-6" id="page_info"></div>
    </div>
</div>
</body>
</html>
