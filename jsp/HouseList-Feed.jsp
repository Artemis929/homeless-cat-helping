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
                <li><a href="HomeUser.jsp">首页 </a></li>
                <li><a href="CatList.jsp" class="active">查看流浪猫<span class="sr-only"></span></a></li>
                <li><a href="HouseList.jsp">爱心猫屋</a></li>
                <li><a href="NeuterApplication.jsp">绝育申请</a></li>
                <li><a href="FeedRecord.jsp">我的投喂记录</a></li>
            </ul>
        </div>
    </div>
</nav>
<form action="./HouseListFeed" method="get">
<button type="button" class="btn btn-secondary feed-button"  data-toggle="modal" data-target="#feedModal" >投喂</button>

<!-- Feed Modal -->
<div class="modal fade" id="feedModal" tabindex="-1" role="dialog" aria-labelledby="feedModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="feedModalLabel">投喂</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 投喂表单 -->
                <input type="hidden" name="HomeID" value="${param.HomeID}">
                <div class="form-group">
                    <label for="feedAmount">投喂量 (g):</label>
                    <input type="number" id="feedAmount" name="feed";class="form-control" placeholder="输入投喂量">
                </div>
                <div class="form-group">
                    <label for="feedCost">费用:</label>
                    <input type="text" id="feedCost" class="form-control" name="price" placeholder="点击按钮自动计算" readonly>
                </div>
                <button type="button" class="btn btn-success" onclick="calculateCost()">计算费用</button>
                <div id="thankYouMessage" style="margin-top: 20px; display: none;">
                    <p>感谢投喂！</p>
                    <img src="./imge/1.png" alt="感谢投喂" style="width: 200px">
                </div>
            </div>
            <div class="modal-footer">
               <button type="submit">完成</button>
            </div>
        </div>
    </div>
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
                const welcomeMessage = `用户${userInfo.VolunteerName}  <a href="./index.html">退出</a>`;
                $('#welcomeMessage').html(welcomeMessage);
            },
            error: function () {
                const welcomeMessage = `游客 <a href="./index.html">退出</a>`;
                $('#welcomeMessage').html(welcomeMessage);
            }
        });



    });
    function calculateCost() {
        const feedAmountInput = document.getElementById('feedAmount');
        const feedAmount = parseFloat(feedAmountInput.value); // 尝试将值转换为浮点数

        // 检查 feedAmount 是否为数字
        if (isNaN(feedAmount) || !isFinite(feedAmount) || feedAmount <= 0) {
            alert('请输入一个有效的正数作为投喂量！');
            feedAmountInput.focus(); // 将焦点移回输入框以便用户更正
            return;
        }const feedCost = feedAmount * 0.1; // 假设每克0.1元
        document.getElementById('feedCost').value = feedCost.toFixed(2); // 格式化输出，保留两位小数

        // 显示感谢信息
        document.getElementById('thankYouMessage').style.display = 'block';
    }
</script>

</body>

</html>
