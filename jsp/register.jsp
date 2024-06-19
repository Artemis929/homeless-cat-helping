<%--
  Created by IntelliJ IDEA.
  User: 86187
  Date: 2024/06/18
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StrayCats-Helping</title>
    <script type="module">
        import { Toast } from 'bootstrap.esm.min.js'

        Array.from(document.querySelectorAll('.toast'))
            .forEach(toastNode => new Toast(toastNode))
    </script>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .title {
            color: #232222;
            text-align: center;
            font-size: x-large;
            font-family: 微软雅黑;
        }

        .regform {
            align-content: center;
            background-color: rgba(249, 252, 252, 0.5);
            margin: 60px 560px 20px;
            padding: 20px;
            width: 420px;
            height: 400px;
            text-align: center;
            font-family: 微软雅黑;
            border-radius: 10px;
        }

        .error {
            font-size: 30px;
            text-align: center;
            display: block;
            margin: 60px 620px;
        }

        .btn {
            text-align: center;
            size: auto;
            font-size: 16px;
            font-family: 微软雅黑;
        }
    </style>
    <script type="text/javascript">
        var message1 = '<%= request.getAttribute("submitSuccess") != null ?  request.getAttribute("registerid").toString() : "" %>';
        var message2 = '<%= request.getAttribute("submitSuccess") != null ?  request.getAttribute("tip").toString() : "" %>';
        window.onload = function() {
            var combinedMessage =message2+ message1;
            if (combinedMessage.trim() !== "") {
                alert(combinedMessage); // 显示弹窗，包含两个消息
            }
        };
    </script>
</head>

<body style="background: url(imge/bg2.jpg) no-repeat center center; text-align: center;">
    <div>
        <img src="imge/logo.png" alt="logo" width="350px" class="img-fluid">
    </div>
    <div class="regform">
        <div style="text-align: center;">
            <h2>用户注册</h2>
        </div>
        <form method="post" action="./register"
            style="text-align: center;">
            <div class="item">
                昵称：<input type="text" name="VolunteerName" id="VolunteerName" required placeholder="请输入您的昵称">
            </div><br>
            <div class="item">
                密码：<input type="password" name="VolunteerSecret" id="VolunteerSecret" required placeholder="请输入您的密码">
            </div><br>
            <div class="item">
                邮箱：<input type="email" name="VolunteerEmail" id="VolunteerEmail" required placeholder="请输入您的邮箱"><br>
            </div><br>

            <div class="btn">
                <input type="submit" value="提交" id="submit">
                <input type="reset" value="重置" id="reset">
            </div>
            <br><br>
            <input type="checkbox" id="yes" checked="checked"> <label for="yes">我同意注册条款和用户加入标准</label><br><br>
            <a href="login.jsp">已有账号？立即登录</a>
        </form><br>
    </div>
    <div class="alert alert-danger" role="alert" id="error-message" style="display: none;">
        <a href="#" class="alert-link" id="error-text"></a>
    </div>
    <div class="alert alert-success" role="alert" id="success-message" style="display: none;">
        <a href="#" class="alert-link" id=""></a>
    </div>


    <script type="text/javascript">
        document.getElementById('registerForm').addEventListener('submit', function (event) {
            event.preventDefault(); // 阻止表单默认提交行为

            const name = document.getElementById('VolunteerName').value;
            const password = document.getElementById('VolunteerSecret').value;
            const email = document.getElementById('VolunteerEmail').value;

            // 发送Ajax请求到服务器进行注册

            // 将注册信息发送到服务器
            xhr.send(JSON.stringify({ VolunteerName: name, VolunteerSecret: password, VolunteerEmail: email }));
        });

    </script>
</body>

</html>