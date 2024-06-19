<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>负责人主页</title>
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
                <li><a href="HomeManager.jsp" class="active">首页 <span class="sr-only"></span></a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">
                        管理流浪猫 <span class="caret"></span>
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
<!--幻灯片-->
<div id="hwslider" class="hwslider">
    <ul>
        <li>
            <a><img src="./imge/banner-1.jpg" /></a>
        </li>
        <li>
            <a><img src="./imge/banner-2.jpg" /></a>
        </li>
    </ul>
</div>
<div class="container">
    <div class="row">
        <!-- 最新投喂记录 -->
        <div class="col-md-6">
            <h3>最新投喂记录</h3>
            <table class="table" id="feedingRecords">
                <thead>
                <tr>
                    <th>日期</th>
                    <th>投喂人ID</th>
                    <th>猫屋ID</th>
                    <th>投喂量（克）</th>
                </tr>
                </thead>
                <tbody>
                <!-- 动态填充数据 -->
                <c:forEach  var="feed" items="${sessionScope.feeds}">
                    <tr>
                        <td>${feed.date}</td>
                        <td>${feed.volunteerID}</td>
                        <td>${feed.homeID}</td>
                        <td>${feed.amount}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>

        <!-- 最新绝育申请 -->
        <div class="col-md-6">
            <h3>最新绝育申请</h3>
            <table class="table" id="neuterApplications">
                <thead>
                <tr>
                    <th>日期</th>
                    <th>申请人</th>
                    <th>猫咪</th>
                    <th>绝育费用</th>
                    <th>状态</th>
                </tr>
                </thead>
                <tbody>
                <!-- 动态填充数据 -->
                <c:forEach var="SterilizationApplication" items="${sessionScope.SterilizationApplications}">
                    <tr>
                        <td>${SterilizationApplication.date}</td>
                        <td>${SterilizationApplication.volunteerID}</td>
                        <td>${SterilizationApplication.catID}</td>
                        <td>${SterilizationApplication.price}</td>
                        <td>${SterilizationApplication.status}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
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
<!--幻灯片JS 文件 -->
<script type="text/javascript" src="./js/jquery.hwslider.min.js"></script>
<script>
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

        // 获取最新投喂记录
        $.ajax({
            url: '/getFeedingRecords',
            method: 'GET',
            success: function (data) {
                const records = JSON.parse(data);
                const tbody = $('#feedingRecords tbody');
                tbody.empty();
                records.forEach(record => {
                    tbody.append(`
                            <tr>
                                <td>${record.Date}</td>
                                <td>${record.VolunteerID}</td>
                                <td>${record.HomeID}</td>
                                <td>${record.Amount}</td>
                            </tr>
                        `);
                });
            }
        });

        // 获取最新绝育申请
        $.ajax({
            url: '/getNeuterApplications',
            method: 'GET',
            success: function (data) {
                const applications = JSON.parse(data);
                const tbody = $('#neuterApplications tbody');
                tbody.empty();
                applications.forEach(application => {
                    tbody.append(`
                            <tr>
                                <td>${application.Date}</td>
                                <td>${application.VolunteerID}</td>
                                <td>${application.CatID.CatName}</td>
                                <td>${application.Price}</td>
                                <td>${application.Status}</td>
                            </tr>
                        `);
                });
            }
        });
    });

</script>

</body>

</html>
