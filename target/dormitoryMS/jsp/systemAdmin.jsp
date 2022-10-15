<%--
  Created by IntelliJ IDEA.
  User: 29741
  Date: 2022/9/23
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>SystemAdmin</title>
    <script type="text/javascript" src="../static/js/jquery-3.3.1.min.js"></script>
    <script>
        function frameChange(event){
            var btn=$(event)
            var frame=$('#frame')
            var id = btn.attr('id')
            switch (id){
                case 'dormitoryAdmin':
                    frame.attr('src','/dormitoryAdmin/list');
                    break;
                case 'student':
                    frame.attr('src','/student/list');
                    break;
                case 'building':
                    frame.attr('src','/building/list');
                    break;
                case 'dormitory':
                    frame.attr('src','/dormitory/list');
                    break;
                case 'move':
                    frame.attr('src','/move/list');
                    break;
                case 'record':
                    frame.attr('src','/moveRecord/list');
                    break;
            }
        }
    </script>
</head>
<body>
<h3>欢迎您，管理员${systemAdmin.name}！</h3>
<div>
    <div style="width: 20%;height: auto;background: bisque">
        <div id="dormitoryAdmin" onclick="frameChange(this)">
            <h3>宿舍管理员</h3>
        </div>
        <div id="student" onclick="frameChange(this)">
            <h3>学生管理</h3>
        </div>
        <div id="building" onclick="frameChange(this)">
            <h3>楼宇管理</h3>
        </div>
        <div id="dormitory" onclick="frameChange(this)">
            <h3>宿舍管理</h3>
        </div>
        <div id="move" onclick="frameChange(this)">
            <h3>学生迁出登记</h3>
        </div>
        <div id="record" onclick="frameChange(this)">
            <h3>学生迁出记录</h3>
        </div>
    </div>
    <iframe id="frame" src="/dormitoryAdmin/list" style="width: 80%; height: 100%;"/>
</div>
</body>
</html>
