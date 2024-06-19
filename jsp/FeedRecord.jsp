<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>我的投喂记录</title>
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
                    <li><a href="HomeUser.jsp" class="active">首页<span class="sr-only"></span></a></li>
                    <li><a href="CatList.jsp">查看流浪猫</a></li>
                    <li><a href="homeList.jsp">爱心猫屋</a></li>
                    <li><a href="NeuterApplication.jsp">绝育申请</a></li>
                    <li><a href="FeedRecord.jsp">我的投喂记录</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h3 style="text-align: center;">投喂排行榜</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">排名</th>
                            <th scope="col">ID</th>
                            <th scope="col">总投喂量</th>
                        </tr>
                    </thead>
                    <tbody id="rankingTable">
                        <!-- 动态加载投喂排行榜数据 -->
                        <c:forEach var="feedamount" items="${sessionScope.feedamounts}">
                            <tr>
                                <c:forEach var="integer" items="${feedamount}">
                                <td>${integer}</td> <!-- 输出数组中的每个Integer -->
                                <!-- 可以在这里添加分隔符，比如逗号 -->
                                 </c:forEach>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div id="userRanking" style="text-align: center; margin-top: 10px;">
                    <!-- 动态加载用户投喂排名 -->
                </div>
            </div>
            <div class="col-md-6">
                <h3 style="text-align: center;">我的投喂记录</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">日期</th>
                            <th scope="col">猫屋ID</th>
                            <th scope="col">投喂量</th>
                            <th scope="col">价格</th>
                        </tr>
                    </thead>
                    <tbody id="feedingRecordTable">
                        <!-- 动态加载我的投喂记录数据 -->
                    <c:forEach var="feed" items="${sessionScope.myfeeds}">
                        <tr>
                            <td>${feed.date}</td>
                            <td>${feed.homeID}</td>
                            <td>${feed.amount}</td>
                            <td>${feed.price}</td>
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
    <script src="../js/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="../js/bootstrap.js"></script>

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
                    const welcomeMessage = `用户${userInfo.VolunteerName}  <a href="../index.html">退出</a>`;
                    $('#welcomeMessage').html(welcomeMessage);

                    // 加载用户的投喂排名
                    loadUserRanking(userInfo.VolunteerName);
                },
                error: function () {
                    const welcomeMessage = `游客 <a href="../index.html">退出</a>`;
                    $('#welcomeMessage').html(welcomeMessage);
                }
            });

            // 动态加载投喂排行榜和我的投喂记录数据
            loadRankingTable();
            loadFeedingRecordTable();
        });

        function loadRankingTable() {
            $.ajax({
                url: '/getRanking', // 你的后台接口
                method: 'GET',
                success: function (data) {
                    const rankingTable = document.getElementById('rankingTable');
                    rankingTable.innerHTML = ''; // 清空之前的内容
                    data.forEach((item, index) => {
                        const row = document.createElement('tr');
                        row.innerHTML = `
                            <th scope="row">${index + 1}</th>
                            <td>${item.id}</td>
                            <td>${item.totalFeed}</td>
                        `;
                        rankingTable.appendChild(row);
                    });
                },
                error: function (error) {
                    console.error('Error fetching ranking data:', error);
                }
            });
        }

        function loadFeedingRecordTable() {
            $.ajax({
                url: '/getFeedingRecords', // 你的后台接口
                method: 'GET',
                success: function (data) {
                    const feedingRecordTable = document.getElementById('feedingRecordTable');
                    feedingRecordTable.innerHTML = ''; // 清空之前的内容
                    data.forEach(item => {
                        const row = document.createElement('tr');
                        row.innerHTML = `
                            <th scope="row">${item.date}</th>
                            <td>${item.homeId}</td>
                            <td>${item.feedAmount}</td>
                            <td>${item.price}</td>
                        `;
                        feedingRecordTable.appendChild(row);
                    });
                },
                error: function (error) {
                    console.error('Error fetching feeding records:', error);
                }
            });
        }

        function loadUserRanking(userName) {
            $.ajax({
                url: '/getUserRanking', // 你的后台接口
                method: 'GET',
                data: { userName: userName },
                success: function (data) {
                    const userRanking = document.getElementById('userRanking');
                    userRanking.innerHTML = `我的当前排名: ${data.rank} 名`;
                },
                error: function (error) {
                    console.error('Error fetching user ranking:', error);
                }
            });
        }
    </script>

</body>

</html>