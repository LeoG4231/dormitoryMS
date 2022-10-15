<%--
  Created by IntelliJ IDEA.
  User: 29741
  Date: 2022/9/22
  Time: 18:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>login</title>
</head>
<body>
<div>
    <form id="login_form" action="/account/login" method="post">
        <h3>用户登录</h3>
        <div>
            <span>${usernameError}</span>
            <input placeholder="请输入用户名" type="text" name="username">
        </div>
        <div>
            <span>${passwordError}</span>
            <input placeholder="请输入密码" type="text" name="password">
        </div>
        <div>
            <label class="radio-button">
                <input type="radio" name="type" checked value="systemAdmin">系统管理员
            </label>
            <label class="radio-button">
                <input type="radio" name="type" value="dormitoryAdmin">宿舍管理员
            </label>
        </div>
        <div>
            <button type="submit" name="submit">登录</button>
            <button type="reset" name="submit">重置</button>
        </div>
    </form>
</div>
</body>
</html>
