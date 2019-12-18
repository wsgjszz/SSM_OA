<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="./css/left.css" type="text/css"/>
    <!-- 引入Vue -->
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
</head>
<body>
<div id="app">
    <div class="wrap" style="float: left">
        <div class="header">61°</div>
        <div class="nav">
            <ul>
                <li class="list">
                    <h2><i></i>工作区</h2>
                    <div class="hide">
                        <a href="javascript:void(0)" ><h5>考勤管理</h5></a>
                        <a href="javascript:void(0)"><h5>工作汇报</h5></a>
                    </div>
                </li>
                <li class="list">
                    <h2><i></i>通讯录</h2>
                    <div class="hide">
                        <a href="javascript:void(0)"><h5>权限组</h5></a>
                        <a href="javascript:void(0)"><h5>通讯录管理</h5></a>
                    </div>
                </li>
                <li class="list">
                    <h2><i></i>消息中心</h2>
                    <div class="hide">
                        <a href="javascript:void(0)"><h5>企业公告</h5></a>
                        <a href="javascript:void(0)"><h5>信息推送</h5></a>
                    </div>
                </li>
                <li class="list">
                    <h2><i></i>架构管理</h2>
                    <div class="hide">
                        <a href="javascript:void(0)" @click="changeSrc('list.jsp')"><h5>部门管理</h5></a>
                        <a href="javascript:void(0)"><h5>员工管理</h5></a>
                    </div>
                </li>
                <li class="list">
                    <h2><i></i>安全</h2>
                    <div class="hide">
                        <a href="javascript:void(0)" @click="changeSrc('add.jsp')"><h5>修改密码</h5></a>
                    </div>
                </li>
            </ul>
        </div>
    </div>
    <div id="header">
        <iframe style="float: left" height="5%" width="80%" src="header.jsp"></iframe>
    </div>
    <br>
    <div id="content">
        <iframe style="float: left" height="93%" width="80%" :src="iframeSrc"></iframe>
    </div>
</div>
<script>
    var app=new Vue({
        el: "#app",
        data:{
            iframeSrc:"first.jsp" +
                ""
        },
        methods:{
            changeSrc:function (src) {
                this.iframeSrc=src;
            }
        }
    })
</script>
<script>
    (function () {
        var oList = document.querySelectorAll('.list h2'),
            oHide = document.querySelectorAll('.hide'),
            oIcon = document.querySelectorAll('.list i'),
            lastIndex = 0;
        for(var i=0;i<oList.length;i++){
            oList[i].index = i;//自定义属性
            oList[i].isClick = false;
            oList[i].initHeight = oHide[i].clientHeight;
            oHide[i].style.height = '0';
            oList[i].onclick = function () {
                if(this.isClick){
                    oHide[this.index].style.height = '0';
                    oIcon[this.index].className = '';
                    oList[this.index].className = '';
                    oList[this.index].isClick = false;
                }
                else{
                    oHide[lastIndex].style.height = '0';
                    oIcon[lastIndex].className = '';
                    oList[lastIndex].className = '';
                    oHide[this.index].style.height = '90px';
                    oIcon[this.index].className = 'on';
                    oList[this.index].className = 'on';
                    oList[lastIndex].isClick = false;
                    oList[this.index].isClick = true;
                    lastIndex = this.index;
                }
            }
        }
    })();
</script>

</body>
</html>