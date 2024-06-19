
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StrayCats-Helping</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script type="module">
        import { Toast } from 'bootstrap/js/bootstrap.esm.min.js'
        Array.from(document.querySelectorAll('.toast'))
            .forEach(toastNode => new Toast(toastNode))
    </script>
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
            margin: 60px 585px 20px;
            padding: 20px;
            width: 300px;
            height: 300px;
            text-align: center;
            font-family: 微软雅黑;
            border-radius: 10px;
        }

        .btn {
            text-align: center;
            size: auto;
            font-size: 16px;
            font-family: 微软雅黑;
        }

        .alert {
            display: none;
            margin: 60px 620px;
        }
    </style>
</head>

<body style="background: fixed url(imge/bg2.jpg) no-repeat center center;">
<div class="title">
    <img src="imge/logo.png" alt="logo" width="350px">
</div>
<div class="regform">
    <h2>账号登录</h2><br>
    <form> <c:if test="${sessionScope.registerid != null}">
        <span class="error" style="color: red ">${sessionScope.tip}${sessionScope.registerid} </span>
    </c:if>
    </form>
    <form id="loginForm" action="./login" style="text-align: center;" method="post"
          onsubmit=" return check(this)">
        请选择您的身份：
        <select name="type" id="type">
            <option value="0">用户</option>
            <option value="1">负责人</option>
        </select><br><br>
        账号：<input type="text" placeholder="ID" id="userID" name="userID"><br><br>
        密码：<input type="password" placeholder="password" id="password" name="password"><br><br>
        <input type="submit" value="登录" size="20px" class="btn"><br><br>
    </form>
    <font color="red">暂无账号？</font>
    <a href="register.jsp">用户注册</a>

    <form> <c:if test="${requestScope.error != null}">
        <span class="error" style="color: red ">${error} </span>
        </c:if>
    </form>
</div>
<div id="error-message" class="alert alert-danger" role="alert">
    <a href="#" class="alert-link" id="error-text"></a>
    //
</div>

<script type="text/javascript">

        /*const userID = document.getElementById('userID').value;
        const password = document.getElementById('password').value;
        const type = document.getElementById('type').value;

        if (userID.length === 0 || password.length === 0) {
            alert('用户名或密码未填写!');
        }
        // 发送Ajax请求到服务器进行验证
       /* const xhr = new XMLHttpRequest();
        xhr.open('POST', '/login', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                const status = xhr.status;
                if (status >= 200 && status < 300) {
                    // 登录成功，重定向到主页或显示成功信息
                    window.location.href = '/home'; // 假设登录成功后重定向到主页
                } else {
                    // 显示错误信息
                    document.getElementById('error-message').style.display = 'block';
                    document.getElementById('error-text').textContent = '账户ID或密码错误！';
                }
            }
        };

        // 将用户名、密码和身份类型发送到服务器*/

   // });

</script>
</body>

</html>