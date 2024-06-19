<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>绝育申请</title>
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
    <h3 style="text-align: center;">可申请绝育的流浪猫</h3>
    <table class="table table-striped">
        <thead>
        <tr>
            <th >小猫ID</th>
            <th >昵称</th>
            <th >性别</th>
            <th >绝育费用</th>
            <th>申请绝育</th>
        </tr>
        </thead>
        <tbody id="catList">
        <!-- 动态加载流浪猫数据 -->
        <c:forEach  var="cat" items="${sessionScope.IntactCats}">
            <tr>
            <td>${cat.catID}</td>
            <td>${cat.catName}</td>
            <td>${cat.sex}</td>
            <td>100</td>
            <td>
                 <button type="button" class="btn btn-secondary feed-button"  data-toggle="modal" data-target="#feedModal"data-cat-id="${cat.catID}" data-cat-name="${cat.catName}" data-cat-sex="${cat.sex}">申请绝育</button>
                 <div class="modal fade" id="feedModal" tabindex="-1" role="dialog" aria-labelledby="feedModalLabel"
                     aria-hidden="true">
                     <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="feedModalLabel">绝育</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <form action="./NeuterApplication" method="get">
                            <div class="modal-body">
                                <div class="form-group">
                                    <label for="catid">小猫ID</label>
                                    <input type="number" id="catid" name="CatID" value="${cat.catID}" class="form-control" placeholder="小猫ID" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="catName">小猫名称</label>
                                    <input type="text" id="catName" name="CatName" class="form-control"value="${cat.catName}" placeholder="小猫名字" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="catSex">小猫性别(M:雄性;F:雌性;N:未知)</label>
                                    <input type="text" id="catSex" name="Sex" class="form-control" value="${cat.sex}" placeholder="小猫性别" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="feedCost">价格</label>
                                    <input type="text" id="feedCost" class="form-control" name="price" value="100" placeholder="绝育价格" readonly>
                                </div>
                                <div id="thankYouMessage" style="margin-top: 20px; display: none;">
                                    <p>感谢投喂！</p>
                                    <img src="./imge/1.png" alt="感谢投喂" style="width: 200px">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success" >确定</button>
                            </div>
                            </form>
                        </div>
                    </div>
                </div>
             </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
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


    $(document).ready(function() {
        $('.feed-button').on('click', function() {
            var catId = $(this).data('cat-id');
            var catName = $(this).data('cat-name');
            var catSex = $(this).data('cat-sex');
            $('#catid').val(catId);
            $('#catName').val(catName);
            $('#catSex').val(catSex);
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
                const welcomeMessage = `用户${userInfo.VolunteerName}  <a href="./index.html">退出</a>`;
                $('#welcomeMessage').html(welcomeMessage);
            },
            error: function () {
                const welcomeMessage = `游客 <a href="./index.html">退出</a>`;
                $('#welcomeMessage').html(welcomeMessage);
            }
        });

        // 动态加载可申请绝育的流浪猫数据
        loadCats();
    });

    function loadCats() {
        $.ajax({
            url: '/getCatsForNeuter', // 你的后台接口
            method: 'GET',
            success: function (data) {
                const catList = document.getElementById('catList');
                catList.innerHTML = ''; // 清空之前的内容
                data.forEach(cat => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                            <td><img src="${cat.photo}" alt="猫照片" style="width: 100px; height: auto;"></td>
                            <td>${cat.id}</td>
                            <td>${cat.name}</td>
                            <td>${cat.gender}</td>
                            <td>${cat.neuterFee}</td>
                            <td><button class="btn btn-primary" onclick="applyNeuter(${cat.id})">申请绝育</button></td>
                        `;
                    catList.appendChild(row);
                });
            },
            error: function (error) {
                console.error('Error fetching cats:', error);
            }
        });
    }

    function applyNeuter(catId) {
        window.location.href = `payNeuterFee.html?catId=${catId}`;
    }
</script>

</body>

</html>
