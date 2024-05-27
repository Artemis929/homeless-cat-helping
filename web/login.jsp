<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StrayCats-Helping</title>
    <link rel="stylesheet" href="style.css">
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
            margin: 60px 620px 20px;
            padding: 20px;
            width: 300px;
            height: 280px;
            text-align: center;
            font-family: 微软雅黑;
            border-radius: 10px;
        }

        .btn {

            width: 120px;
            height: 30px;
            size: auto;
            font-size: 15px;
            font-family: 微软雅黑;
        }

        .error {
            font-size: 15px;
            text-align: center;
            display: block;
            margin: 60px 620px;

        }
    </style>
</head>

<body style="background: fixed url(imge/bg2.jpg) no-repeat center center;">
    <div class="title">
        <img src="imge/logo.png" alt="logo" width="350px">
        <h2>账号登录</h2>
    </div>
    <div class="regform">
        <script type="text/javascript">
            function check(form) {
                var username = form.username.value;
                var password = form.password.value;
                if (username.length == 0 || password.length == 0) {
                    alert('用户名或密码未填写!');
                    return false;
                } else {
                    return true;
                }
            }
        </script>

        <form action="login" method="post" onsubmit="return check(this)" style="text-align: center;">
            请选择您的身份：
            <select name="type">
                <option value="0">用户</option>
                <option value="1">负责人</option>
            </select><br><br>
            账号：<input type="text" placeholder="ID" id="userID" name="userID"><br><br>
            密码：<input type="password" placeholder="password" id="password" name="password"><br><br>
            <input type="submit" value="登录" size="20px" class="btn"><br><br>

        </form>
        <font color="red">暂无账号？</font>
        <a href="register.html">用户注册</a>
    </div>
    <c:if test="${requestScope.error != null}">
        <span class="error" style="color: red ">${error} </span>
    </c:if>
</body>

</html>