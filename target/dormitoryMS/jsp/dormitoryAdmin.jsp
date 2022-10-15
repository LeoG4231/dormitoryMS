<%--
  Created by IntelliJ IDEA.
  User: 29741
  Date: 2022/9/30
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>DormitoryAdmin</title>
    <script type="text/javascript" src="../static/js/jquery-3.3.1.min.js"></script>
    <script>
        function frameChange(event){
            var btn=$(event)
            var frame=$('#frame')
            var id = btn.attr('id')
            switch (id){
                case 'register':
                    frame.attr('src','/lackSleep/register');
                    break;
                case 'record':
                    frame.attr('src','/lackSleep/list');
                    break;
            }
        }
    </script>
</head>
<body>
<h3>欢迎您，管理员${dormitoryAdmin.name}！</h3>
<div>
    <div style="width: 20%;height: auto;background: bisque">
        <div id="register" onclick="frameChange(this)">
            <h3>学生缺寝登记</h3>
        </div>
        <div id="record" onclick="frameChange(this)">
            <h3>学生缺寝记录</h3>
        </div>
    </div>
    <iframe id="frame" src="/lackSleep/list" style="width: 80%; height: 100%;"/>
</div>
</body>
</html>
