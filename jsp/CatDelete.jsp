<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>删除流浪猫</title>
    <!-- bootstrap js文件 -->
    <script type="module">
        import { Toast } from 'bootstrap.esm.min.js'

        Array.from(document.querySelectorAll('.toast'))
            .forEach(toastNode => new Toast(toastNode))
    </script>
    <!--重置样式-->
    <link href="./css/reset.css" rel="stylesheet">
    <!--幻灯片-->
    <link href="./css/hwslider.css" rel="stylesheet">
    <!--bootstrap css 文件-->
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.css" />
    <!--字体 -->
    <link href="./css/font-awesome.min.css" rel="stylesheet">
    <!--自定义 -->
    <link href="./css/style.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        main {
            flex: 1;
            padding: 20px;
        }

        h1 {
            text-align: center;
        }

        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: calc(100% - 20px);
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group textarea {
            resize: none;
        }

        .form-buttons {
            display: flex;
            justify-content: space-between;
        }

        .form-buttons button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }

        .form-buttons button[type="reset"] {
            background-color: #dc3545;
        }

        .form-buttons button:hover {
            opacity: 0.8;
        }
    </style>
    <% if (request.getAttribute("submitSuccess") != null) { %>
    <script type="text/javascript">
        var message1 = '<%= (Boolean) request.getAttribute("submitSuccess") ==true ?  request.getAttribute("finish").toString() : request.getAttribute("errornot").toString()%>';
        window.onload = function() {
            var combinedMessage = message1;
            if (combinedMessage.trim() !== "") {
                alert(combinedMessage);
            }
        };
    </script>
    <% } %>
</head>

<body>
<div id="welcomeMessage" style="text-align: right;"></div>
<!-- 头部 -->
<nav class="navbar navbar-default">
    <div class="container">
        <!-- 移动端导航图标 -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a href="#" class="navbar-brand"><img src="./imge/logo.png" alt="logo" height="85px"></a>
        </div>

        <!-- 导航-->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="HomeManager.jsp">首页 </a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle active" data-toggle="dropdown" role="button"
                       aria-haspopup="true" aria-expanded="false">
                        管理流浪猫 <span class="caret sr-only"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="CatManage.jsp">流浪猫列表</a></li>
                        <li><a href="CatAdd.jsp">增加流浪猫</a></li>
                        <li><a href="CatDelete.jsp">删除流浪猫</a></li>
                        <li><a href="CatModify.jsp">修改流浪猫</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">
                        管理爱心猫屋 <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="HouseList.jsp">猫屋列表</a></li>
                        <li><a href="HouseAdd.jsp">增加猫屋</a></li>
                        <li><a href="HouseDelete.jsp">删除猫屋</a></li>
                        <li><a href="HouseModify.jsp">修改猫屋</a></li>
                    </ul>
                </li>
                <li><a href="CheckApplication.jsp">查看绝育申请</a></li>
            </ul>
        </div>
    </div>
</nav>
<main style="background: url(./imge/bg2.jpg) no-repeat center center;">
    <h1>删除流浪猫的界面</h1>
    <h2>${requestScope.errornot}${requestScope.finish}</h2>
    <form action="./CatDelete" method="get">
        <div class="form-group">
            <label for="cat-id">小猫ID:</label>
            <input type="text" id="CatID" name="CatID" required placeholder="请输入需要删除的小猫的id！">
        </div>
        <div class="form-buttons">
            <button type="submit">确认</button>
            <button type="reset">重置</button>
        </div>
        <div id="error-message" class="error-message" style="display:none;">
            <span>${requestScope.errornot}</span>
            <span></span>
        </div>
    </form>
</main>

</div>
<!--尾部-->
<footer>
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12 ">
                    <div class="single-footer-widget">
                        <div class="section-heading">
                            <h4>关于我们</h4>
                            <div class="line"></div>
                        </div>
                        <p>“StrayCats-Helping”是与智能设备云联动的网站
                            可实现云投喂、云吸猫、云监控，
                            更可以聚集更多的爱猫人士，一起努力推行TNR。
                        </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12 f1">
                    <div class="single-footer-widget">
                        <div class="section-heading">
                            <h4>服务</h4>
                            <div class="line"></div>
                        </div>
                        <ul class="footer-service">
                            <li><a href="#"><span class="fa fa-check"></span>云喂养</a></li>
                            <li><a href="#"><span class="fa fa-check"></span>捕捉 绝育 放回</a></li>
                            <li><a href="#"><span class="fa fa-check"></span>管理爱心猫屋</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12 f2">
                    <div class="single-footer-widget">
                        <div class="section-heading">
                            <h4>关注我们</h4>
                            <div class="line"></div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12">
                    <div class="single-footer-widget">
                        <div class="section-heading">
                            <h4>联系我们</h4>
                            <div class="line"></div>
                        </div>
                        <address class="contact-info">
                            <p><span class="fa fa-home"></span>123456789</p>
                            <p><span class="fa fa-phone"></span>123456789</p>
                            <p><span class="fa fa-envelope"></span>123456789</p>
                        </address>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!--jq和bootstrapjs 文件 -->
<script src="./js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>

<script>

    document.getElementById('delete-cat-form').addEventListener('submit', function (event) {
        event.preventDefault();
        const catId = document.getElementById('cat-id').value;

        // 假设后端API端点为 /api/delete-cat
        fetch(`/api/delete-cat`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ catId })
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('小猫已成功删除');
                    document.getElementById('delete-cat-form').reset();
                } else {
                    document.getElementById('error-message').style.display = 'block';
                }
            })
            .catch(error => {
                console.error('Error:', error);
                document.getElementById('error-message').style.display = 'block';
            });
    });


    $(function () {
        $("#hwslider").hwSlider({
            height: 220,
            autoPlay: true,
            arrShow: true,
            dotShow: true,
            touch: false,
        });

        // 获取用户信息并显示欢迎消息
        $.ajax({
            url: '/getUserInfo',
            method: 'GET',
            success: function (data) {
                const userInfo = JSON.parse(data);
                const welcomeMessage = `负责人${userInfo.ManagerName}！  <a href="./index.html">退出</a>`;
                $('#welcomeMessage').html(welcomeMessage);
            },
            error: function () {
                const welcomeMessage = `游客 <a href="./index.html">退出</a>`;
                $('#welcomeMessage').html(welcomeMessage);
            }
        });

    });

</script>

</body>

</html>
