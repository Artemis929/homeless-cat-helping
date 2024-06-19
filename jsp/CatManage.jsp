<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查看流浪猫</title>
    <!-- bootstrap js文件 -->
    <script type="module">
        import { Toast } from 'bootstrap.esm.min.js'

        Array.from(document.querySelectorAll('.toast'))
            .forEach(toastNode => new Toast(toastNode))
    </script>
    <!--重置样式-->
    <link href="./css/reset.css" rel="stylesheet">
    <!-- Bootstrap CSS 文件 -->
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.css" />
    <!-- 自定义样式 -->
    <link href="./css/style.css" rel="stylesheet">
    <!-- 字体 -->
    <link href="./css/font-awesome.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.7.2/font/bootstrap-icons.min.css">

    <style>
        .filter-group {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }

        .filter-group .btn-group,
        .filter-group .form-group {
            margin-right: 20px;
        }

        .btn {
            font-size: 16px;
        }

        .card-columns {
            column-count: 3;
            max-height: 70vh;
            /* 控制最大高度 */
            overflow-y: auto;
            /* 启用垂直滚动条 */
        }

        .card {
            margin: 10px;
        }

        .card-body {
            padding: 10px;
        }

        .card-title {
            font-size: 15px;
            margin-bottom: 0.5rem;
        }

        .card-text {
            font-size: 14px;
        }

        .card img {
            height: 150px;
            object-fit: cover;
        }

        /* 移除链接下划线 */
        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }

        table {
            width: 100%;
            margin-top: 20px;
        }

        th,
        td {
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
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


<!-- 筛选部分 -->
<form action="./CatManage" method="get">
<h1 style="text-align: center;">流浪猫查询页面</h1>
<div class="container">
    <div class="filter-group">
        <div class="btn-group">
            <select  class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown"
                     aria-expanded="false" id="regionDropdown" name="AreaName">
                区域
                <!-- 动态加载区域选项 -->
                <option value="" selected disabled>区域</option>
                <c:forEach var="area" items="${sessionScope.areas}">
                    <option value="${area.areaID}">${area.areaName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="btn-group">
            <select  class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown"
                     aria-expanded="false" id="genderDropdown" name="Sex">
                性别
                <option value="" selected disabled>性别</option>
                <option value="M">雄性</option>
                <option value="F">雌性</option>
            </select>
        </div>
        <div class="btn-group">
            <select  class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown"
                     aria-expanded="false" id="statusDropdown" name="LivingStatus">
                归属状态
                <option value="" selected disabled>归属状态</option>
                <option value="流浪">流浪</option>
                <option value="失踪">失踪</option>
                <option value="喵星">喵星</option>
                <option value="被领养">被领养</option>
            </select>
        </div>
        <div class="btn-group">
            <select  class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown"
                    aria-expanded="false" id="neuteredDropdown" name="SterilizationApplication">
                是否绝育
                <option value="" selected disabled>是否绝育</option>
                <option value="0">未绝育</option>
                <option value="1">已绝育</option>
            </select>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="catIdInput" placeholder="小猫ID" name="CatId">
        </div>
        <button type="submit" class="btn btn-primary">筛选</button>
    </div>

    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">小猫ID</th>
            <th scope="col">昵称</th>
            <th scope="col">性别</th>
            <th scope="col">区域</th>
            <th scope="col">归属状态</th>
            <th scope="col">是否绝育</th>
        </tr>
        </thead>
        <tbody id="catList">
        <!-- 动态加载小猫列表 -->
        <c:forEach var="cat" items="${requestScope.ManagerCats}">
            <tr>
                <!-- 假设你希望链接到一个名为viewHome.jsp的页面，并将homeID作为参数传递 -->
                <td>${cat.catID}</td>
                <td>${cat.catName}</td>
                <td>${cat.sex}</td>
                <td>${cat.areaID}</td>
                <td>${cat.livingStatus}</td>
                <td>${cat.sterilizationStatus}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</form>
<!-- 尾部 -->
<footer>
    <div class="footer-top">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-12">
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

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>

    $("#hwslider").hwSlider({
        height: 220,
        autoPlay: true,
        arrShow: true,
        dotShow: true,
        touch: false,
    });

    document.addEventListener('DOMContentLoaded', function () {
        loadRegions();
    });

    function loadRegions() {

        $.ajax({
            url: '/getRegions', // 你的后台接口
            method: 'GET',
            success: function (data) {
                const regionMenu = document.getElementById('regionMenu');
                data.forEach(region => {
                    const a = document.createElement('a');
                    a.className = 'dropdown-item';
                    a.href = '#';
                    a.textContent = region;
                    a.onclick = function () {
                        selectOption('regionDropdown', 'regionMenu', region);
                    };
                    regionMenu.appendChild(a);
                });
            },
            error: function (error) {
                console.error('Error fetching regions:', error);
            }
        });
        // 获取用户信息并显示欢迎消息
        $.ajax({
            url: '/getUserInfo',
            method: 'GET',
            success: function (data) {
                const userInfo = JSON.parse(data);
                const welcomeMessage = `负责人${userInfo.ManagerName}  <a href="./index.html">退出</a>`;
                $('#welcomeMessage').html(welcomeMessage);
            },
            error: function () {
                const welcomeMessage = `游客 <a href="./index.html">退出</a>`;
                $('#welcomeMessage').html(welcomeMessage);
            }
        });

    }

    function selectOption(buttonId, menuId, value) {
        const button = document.getElementById(buttonId);
        button.textContent = value;
        button.setAttribute('data-selected', value);
    }

    function filterCats() {
        const region = document.getElementById('regionDropdown').getAttribute('data-selected');
        const gender = document.getElementById('genderDropdown').getAttribute('data-selected');
        const status = document.getElementById('statusDropdown').getAttribute('data-selected');
        const neutered = document.getElementById('neuteredDropdown').getAttribute('data-selected');
        const catId = document.getElementById('catIdInput').value;

        $.ajax({
            url: '/filterCats', // 你的后台接口
            method: 'GET',
            data: {
                region: region,
                gender: gender,
                status: status,
                neutered: neutered,
                catId: catId
            },
            success: function (data) {
                const catList = document.getElementById('catList');
                catList.innerHTML = ''; // 清空之前的内容
                data.forEach((cat, index) => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                            <th scope="row">${index + 1}</th>
                            <td>${cat.catId}</td>
                            <td>${cat.name}</td>
                            <td>${cat.gender}</td>
                            <td>${cat.region}</td>
                            <td>${cat.status}</td>
                            <td>${cat.neutered}</td>
                        `;
                    catList.appendChild(row);
                });
            },
            error: function (error) {
                console.error('Error fetching cats:', error);
            }
        });
    }
</script>
</body>

</html>
