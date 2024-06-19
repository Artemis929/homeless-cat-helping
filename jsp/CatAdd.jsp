<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>添加流浪猫</title>
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

        header,
        footer {
            background-color: #f8f8f8;
            padding: 10px 20px;
            text-align: center;
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
    <script type="text/javascript">
        var message1 = '<%= request.getAttribute("submitSuccess") != null ?  request.getAttribute("finishadd").toString() : "请按要求填写小猫信息" %>';
        window.onload = function() {
            var combinedMessage = message1;
            if (combinedMessage.trim() !== "") {
                alert(combinedMessage);
            }
        };
    </script>
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
    <h1>添加流浪猫界面</h1>
     <h4>${requestScope.finishadd}</h4>
     <form id="catAdd" action="./CatAdd" method="get">
        <div class="form-group" >
            <label for="CatName">小猫昵称:</label>
            <input type="text" id="CatName" name="CatName" placeholder="请输入小猫昵称！" required>
        </div>
        <div class="form-group">
            <label for="gender">性别:</label>
            <select id="gender" name="gender">
                <option value="M">雄性</option>
                <option value="F">雌性</option>
                <option value="N">未知</option>
            </select>
        </div>
        <div class="form-group">
            <label for="status">归属状态:</label>
            <select id="status" name="status">
                <option value="流浪">流浪</option>
                <option value="失踪">失踪</option>
                <option value="被领养">被领养</option>
                <option value="喵星">喵星</option>
            </select>
        </div>
        <div class="form-group">
            <label for="neutered">是否绝育:</label>
            <select id="neutered" name="neutered">
                <option value="1">是</option>
                <option value="0">否</option>
            </select>
        </div>
        <div class="form-group">
            <label for="area-name">所属区域:</label>
            <select id="area-name" name="area-name">
                <c:forEach var="area" items="${sessionScope.areas}">
                    <option value="${area.areaID}">${area.areaName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="description">特征描述(50字以内):</label>
            <textarea id="description" name="description" rows="4" maxlength="50"></textarea>
        </div>
        <div class="form-buttons">
            <button type="submit">确认</button>
            <button type="reset">重置</button>
        </div>
     </form>
</main>
<c:if test="${requestScope.error != null}">
    <%-- <div class="alert alert-danger" style="text-align: center;" role="alert">
        输入错误！
        </div>--%>
</c:if>


</div>
</form>
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

    document.addEventListener('DOMContentLoaded', function () {
        fetch('/api/get-manageable-areas')
            .then(response => response.json())
            .then(data => {
                const areaSelect = document.getElementById('area-id');
                areaSelect.innerHTML = ''; // Clear existing options
                data.forEach(area => {
                    const option = document.createElement('option');
                    option.value = area.id;
                    option.textContent = area.name;
                    areaSelect.appendChild(option);
                });
            })
            .catch(error => {
                console.error('Error fetching areas:', error);
                const areaSelect = document.getElementById('area-id');
                areaSelect.innerHTML = '<option value="">加载失败</option>';
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
