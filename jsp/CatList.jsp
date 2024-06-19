<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>查看流浪猫</title>
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

        .filter-group .btn-group {
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

            <!-- 导航 -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="HomeUser.jsp" class="active">首页<span class="sr-only"></span></a></li>
                    <li><a href="CatList.jsp">查看流浪猫</a></li>
                    <li><a href="homeList.jsp">爱心猫屋</a></li>
                    <li><a href="NeuterApplication.jsp">绝育申请</a></li>
                    <li><a href="FeedRecord.jsp">我的投喂记录</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 筛选部分 -->
    <form action="./CatList" method="get">
    <div class="container">
        <div class="filter-group">
                <div class="btn-group">
                    <select  class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown"
                            aria-expanded="false" id="regionDropdown" name="areaname">
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
                    aria-expanded="false" id="genderDropdown" name="sex">
                    性别
                    <option value="" selected disabled>性别</option>
                    <option value="M">雄性</option>
                    <option value="F">雌性</option>
                </select>
            </div>
            <div class="btn-group">
                <select  class="btn btn-success dropdown-toggle" data-bs-toggle="dropdown"
                    aria-expanded="false" id="statusDropdown" name="livingstatus">
                    归属状态
                    <option value="" selected disabled>归属状态</option>
                    <option value="流浪">流浪</option>
                    <option value="失踪">失踪</option>
                    <option value="喵星">喵星</option>
                    <option value="被领养">被领养</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary" >筛选</button>
        </div>


            <!-- 动态加载小猫卡片 -->
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">小猫ID</th>
                    <th scope="col">小猫名字</th>
                    <th scope="col">详细描述</th>
                    <th scope="col">是否绝育</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="cat" items="${requestScope.usercats}">
                    <tr>
                        <!-- 假设你希望链接到一个名为viewHome.jsp的页面，并将homeID作为参数传递 -->
                        <td>${cat.catID}</td>
                        <td>${cat.catName}</td>
                        <td>${cat.characteristic}</td>
                        <td>${cat.sterilizationStatus}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
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
            <c:if test="${sessionScope.volunteer==null}">
            const WelcomeMessage = `游客  <a href="../login.jsp">退出</a>`;
            $('#WelcomeMessage').html(WelcomeMessage);
            </c:if>

            <c:if test="${sessionScope.volunteer.volunteerID != null}">
            const welcomeMessage = `用户 ${sessionScope.volunteer.volunteerName} <a href="../login.jsp">退出</a>`;
            $('#welcomeMessage').html(welcomeMessage);
            </c:if>

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

            $.ajax({
                url: '/filterCats', // 你的后台接口
                method: 'GET',
                data: {
                    region: region,
                    gender: gender,
                    status: status
                },
                success: function (data) {
                    const catCards = document.getElementById('catCards');
                    catCards.innerHTML = ''; // 清空之前的内容
                    data.forEach(cat => {
                        const card = document.createElement('div');
                        card.className = 'card';
                        card.style.width = '18rem';
                        card.innerHTML = `
                            <img src="${cat.image}" class="card-img-top" alt="${cat.name}">
                            <div class="card-body">
                                <h5 class="card-title">${cat.name}</h5>
                                <p class="card-text">${cat.description}</p>
                                <a href="#" class="btn btn-primary">查看详情</a>
                            </div>
                        `;
                        catCards.appendChild(card);
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