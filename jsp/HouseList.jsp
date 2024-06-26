<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>猫屋列表</title>
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
            text-align: center;
        }

        h1,
        h2 {
            text-align: center;
        }

        .filter-section {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin: 0 10px;
        }

        .result-section {
            margin-top: 20px;
        }

        table {
            width: 100%;
            margin-top: 10px;
        }

        .table-striped tbody tr:nth-of-type(odd) {
            background-color: rgba(0, 0, 0, .05);
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


<main>
    <h1>筛选爱心猫屋信息</h1>
    <form action="./managerHouseList" method="get">
    <div class="filter-section">
        <div class="form-group">
            <label for="region">区域:</label>
            <select id="region" name="region" class="form-control">
                <option value="" selected disabled>区域</option>
                <c:forEach var="area" items="${sessionScope.areas}">
                    <option value="${area.areaID}">${area.areaName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="house-id">猫屋ID:</label>
            <input type="text" id="house-id" name="house-id" class="form-control">
        </div>
        <button id="search-btn" class="btn btn-primary" type="submit">查询</button>
    </div>
    <div class="result-section">
        <h2>爱心猫屋列表</h2>
        <table class="table table-striped">
            <thead class="thead-dark">
            <tr  style="text-align: center">
                <th scope="col">猫屋ID</th>
                <th scope="col">猫屋具体地址</th>
                <th scope="col">所属区域</th>
            </tr>
            </thead>
            <tbody id="result-table">
            <!-- Results will be inserted here -->
            <c:forEach var="home" items="${requestScope.managerhomes}">
                <tr>
                    <td>${home.homeID}</td>
                    <td>${home.homeAddress}</td>
                    <td>${home.areaID}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
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
    // Fetch available regions from the backend

    // Search cat houses based on selected region and house ID
    /*document.getElementById('search-btn').addEventListener('click', function () {
        const region = document.getElementById('region').value;
        const houseId = document.getElementById('house-id').value;

        fetch(`/api/search-cat-houses`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ region, houseId })
        })
            .then(response => response.json())
            .then(data => {
                const resultTable = document.getElementById('result-table');
                resultTable.innerHTML = ''; // Clear existing results
                if (data.length > 0) {
                    data.forEach((house, index) => {
                        const row = document.createElement('tr');
                        row.innerHTML = `
                            <th scope="row">${index + 1}</th>
                            <td>${house.id}</td>
                            <td>${house.address}</td>
                            <td>${house.region}</td>
                        `;
                        resultTable.appendChild(row);
                    });
                } else {
                    const row = document.createElement('tr');
                    row.innerHTML = `<td colspan="4">没有找到匹配的猫屋</td>`;
                    resultTable.appendChild(row);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                const resultTable = document.getElementById('result-table');
                const row = document.createElement('tr');
                row.innerHTML = `<td colspan="4">查询出错，请稍后再试</td>`;
                resultTable.appendChild(row);
            });
    });*/
</script>

</body>

</html>
