<%--
  Created by IntelliJ IDEA.
  User: 29741
  Date: 2022/9/28
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>moveRegister</title>
    <script type="text/javascript" src="../static/js/jquery-3.3.1.min.js"></script>
    <script>
        function move(event){
            $('#form_data_move').show()
            var btn=$(event)
            var id=btn.data('id')
            var dormitoryId=btn.data('dormitoryid')
            $('#prompt').text("确认迁出ID为"+id+"的学生？")
            $('#moveId').val(id)
            $('#dormitoryId').val(dormitoryId)
        }
    </script>
</head>
<body>
<div style="width: 100%;height: 100%">
    <form action="/move/search" method="post">
        <div>
            <label for="key">字段：</label>
            <select name="key">
                <option value="dormitoryName">宿舍</option>
                <option value="name">姓名</option>
            </select>
        </div>
        <div>
            <label for="value">值：</label>
            <input name="value" placeholder="字段值">
        </div>
        <div>
            <button type="submit">搜索</button>
        </div>
    </form>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>宿舍</th>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>状态</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="student">
            <tr>
                <td>${student.id}</td>
                <td>${student.dormitoryName}</td>
                <td>${student.number}</td>
                <td>${student.name}</td>
                <td>${student.gender}</td>
                <td>${student.state}</td>
                <td>
                    <button type="button" onclick="move(this)"
                            data-id="${student.id}"
                            data-dormitoryId="${student.dormitoryId}">迁出</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!--迁出学生-->
    <form action="/move/moveOut" method="post" id="form_data_move" hidden>
        <div>
            <h3>学生迁出登记</h3>
        </div>
        <div>
            <h4 id="prompt">学生迁出提示</h4>
        </div>
        <div>
            <h4>迁出原因</h4>
            <input name="reason" maxlength="20">
        </div>
        <div hidden>
            <input id="moveId" name="studentId">
            <input id="dormitoryId" name="dormitoryId">
        </div>
        <div>
            <button type="submit">迁出</button>
            <button type="reset">取消</button>
        </div>
    </form>
</div>
</body>
</html>
