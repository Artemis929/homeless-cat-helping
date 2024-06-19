<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>爱心猫屋</title>
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
<form action="./HouseList" method="post">
<div class="container">
    <div class="btn-group">
        <select  class="btn btn-success dropdown-toggle" style="width: 1000px;" data-toggle="dropdown"
                aria-expanded="false" id="regionDropdown" name="areaname">
            区域
            <option value="" selected disabled>区域</option>
            <c:forEach var="area" items="${sessionScope.areas}">
                <option value="${area.areaName}">${area.areaName}</option>
            </c:forEach>
        </select>
    </div>
    <button type="submit" class="btn btn-primary" style="margin-top: 0px; float: right;"
            >搜索</button>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">猫屋ID</th>
            <th scope="col">区域ID</th>
            <th scope="col">详细地址</th>
        </tr>
        </thead>
        <tbody id="homeList">
        <!-- 动态加载猫屋列表 -->
        <c:forEach var="home" items="${requestScope.homes}">
            <tr>
                <td>${home.homeID}</td>
                <td>${home.areaID}</td>
                <td>${home.homeAddress}</td>
                <td>
                    <!--<button type="button" class="btn btn-secondary feed-button"  data-toggle="modal" data-target="#feedModal">投喂</button>
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
                                    <!--<form action="./HouseListFeed" method="get">
                                    <input type="hidden" id="homeID" name="HomeID" value="${home.homeID}">
                                    <div class="form-group">
                                        <label for="feedAmount">投喂量 (g):</label>
                                        <input type="number" id="feedAmount" name="feed";class="form-control" placeholder="输入投喂量">
                                    </div>
                                    <div class="form-group">
                                        <label for="feedCost">费用:</label>
                                        <input type="text" id="feedCost" class="form-control" name="price" placeholder="点击按钮自动计算" readonly>
                                    </div>
                                    </form>
                                    <button type="button" class="btn btn-success" onclick="calculateCost()">计算费用</button>
                                    <div id="thankYouMessage" style="margin-top: 20px; display: none;">
                                        <p>感谢投喂！</p>
                                        <img src="./imge/1.png" alt="感谢投喂" style="width: 200px">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-success" onclick="submitFeedForm()">投喂</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>-->
                    <a href="HouseList-Feed.jsp?HomeID=${home.homeID}">投喂</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</form>
    <!-- Modal -->
    <form action="./HouseList" method="get">
    <!--<div class="modal fade" id="homeDetailModal" tabindex="-1" role="dialog" aria-labelledby="homeDetailModalLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="homeDetailModalLabel">猫屋详情</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- 猫屋详情内容 -->
                    <!--<p id="homeDetail"></p>
                    <h3 style="text-align: center;">今日投喂信息</h3>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">投喂者</th>
                            <th scope="col">投喂时间</th>
                            <th scope="col">投喂量（克）</th>
                        </tr>
                        </thead>
                        <tbody id="feedingRecordList">
                        <!-- 动态加载投喂记录 -->
                        <!--<c:forEach var="feed" items="${requestScope.TodayFeeds}">
                            <tr>
                                <td>${feed.volunteerID}</td>
                                <td>${feed.date}</td>
                                <td>${feed.amount}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <a href="#" id="feedLink" class="btn btn-primary" onclick="showFeedModal()">我要投喂</a>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>-->
    <!-- Feed Modal -->
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
    function submitFeedForm() {
        // 提交表单的逻辑
        var form = document.getElementById('feedForm');
        form.submit();
    }
    function prepareModal(homeID) {
        // 假设你已经有一个模态框准备显示
        // ... 模态框的显示逻辑 ...
        // 当需要发送homeID到后端时（例如，在模态框中的某个操作之后）
        $.ajax({
            url: './HouseList', // 替换为你的Servlet的URL
            type: 'Get',
            data: { homeID: homeID }, // 将homeID作为请求参数发送
            success: function(response) {
                // 请求成功后的处理逻辑
                // 你可以在这里处理服务器返回的数据
                console.log(response);
            },
            error: function(xhr, status, error) {
                // 请求失败后的处理逻辑
                console.error("Error: " + error);
            }
        });
    }

    function setHiddenFieldValue(button) {
        var homeId = button.getAttribute('data-home-id');
        document.getElementById('selectedHomeId').value = homeId;
    }


    let currentHomeId = null;

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

        // 动态加载区域选项
        loadRegions();

        // 初始加载猫屋列表
        filterHomes();

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
    }

    function selectOption(buttonId, menuId, value) {
        const button = document.getElementById(buttonId);
        button.textContent = value;
        button.setAttribute('data-selected', value);
    }

    function filterHomes() {
        const region = document.getElementById('regionDropdown').getAttribute('data-selected') || '全部区域';

        // 示例数据
        const exampleData = [
            { id: 1, name: '猫屋一号', region: '东区', address: '东区路123号' },
            { id: 2, name: '猫屋二号', region: '西区', address: '西区路456号' },
            { id: 3, name: '猫屋三号', region: '南区', address: '南区路789号' },
        ];
        homeList.innerHTML = ''; // 清空之前的内容

        // 使用示例数据
        exampleData.forEach(home => {
            const row = document.createElement('tr');
            row.innerHTML = `
                    <th scope="row"><a href="#" onclick="showHomeDetail(${home.id})">${home.id}</a></th>
                    <td><a href="#" onclick="showHomeDetail(${home.id})">${home.name}</a></td>
                    <td>${home.region}</td>
                    <td>${home.address}</td>
                `;
            homeList.appendChild(row);
        });
    }

    function showHomeDetail(homeId) {
        currentHomeId = homeId;

        // 示例详细信息和投喂记录
        const exampleDetails = {
            1: {
                name: '猫屋一号',
                address: '东区路123号',
                region: '东区',
                feedingRecords: [
                    { feeder: '张三', time: '2023-06-08 10:00', content: '猫粮' },
                    { feeder: '李四', time: '2023-06-08 14:00', content: '水' },
                ]
            },
            2: {
                name: '猫屋二号',
                address: '西区路456号',
                region: '西区',
                feedingRecords: [
                    { feeder: '王五', time: '2023-06-08 11:00', content: '猫粮' },
                    { feeder: '赵六', time: '2023-06-08 15:00', content: '水' },
                ]
            },
            3: {
                name: '猫屋三号',
                address: '南区路789号',
                region: '南区',
                feedingRecords: [
                    { feeder: '钱七', time: '2023-06-08 12:00', content: '猫粮' },
                    { feeder: '孙八', time: '2023-06-08 16:00', content: '水' },
                ]
            },
        };

        const data = exampleDetails[homeId];

        $('#homeDetailModalLabel').text(`猫屋详情 - ${data.name}`);
        $('#homeDetail').text(`详细地址: ${data.address}, 区域: ${data.region}`);
        const feedingRecordList = document.getElementById('feedingRecordList');
        feedingRecordList.innerHTML = ''; // 清空之前的内容
        data.feedingRecords.forEach((record, index) => {
            const row = document.createElement('tr');
            row.innerHTML = `
                    <th scope="row">${index + 1}</th>
                    <td>${record.feeder}</td>
                    <td>${record.time}</td>
                    <td>${record.content}</td>
                `;
            feedingRecordList.appendChild(row);
        });
        $('#homeDetailModal').modal('show');
    }

    function showFeedModal() {
        $('#feedModal').modal('show');
    }

    function calculateCost() {
        const feedAmountInput = document.getElementById('feedAmount');
        const feedAmount = parseFloat(feedAmountInput.value); // 尝试将值转换为浮点数

        // 检查 feedAmount 是否为数字
        if (isNaN(feedAmount) || !isFinite(feedAmount) || feedAmount <= 0) {
            alert('请输入一个有效的正数作为投喂量！');
            feedAmountInput.focus(); // 将焦点移回输入框以便用户更正
            return;
        }

        const feedCost = feedAmount * 0.1; // 假设每克0.1元
        document.getElementById('feedCost').value = feedCost.toFixed(2) + ' 元'; // 格式化输出，保留两位小数

        // 显示感谢信息
        document.getElementById('thankYouMessage').style.display = 'block';
    }


    function submitFeedingRecord() {
        const feedAmount = document.getElementById('feedAmount').value;
        const feedCost = document.getElementById('feedCost').value;

        $.ajax({
            url: '/submitFeedingRecord', // 你的后台接口
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                VolunteerID: 1, // 假设用户ID为1，实际应用中应从用户信息中获取
                HomeID: currentHomeId,
                Amount: feedAmount,
                Price: feedCost,
                Date: new Date().toISOString()
            }),
            success: function (response) {
                alert('投喂记录提交成功！');
                $('#feedModal').modal('hide');
            },
            error: function (error) {
                console.error('Error submitting feeding record:', error);
            }
        });
    }
</script>

</body>

</html>
