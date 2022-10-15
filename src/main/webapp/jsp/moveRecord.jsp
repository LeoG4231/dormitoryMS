<%--
  Created by IntelliJ IDEA.
  User: 29741
  Date: 2022/9/30
  Time: 18:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>moveRecord</title>
</head>
<body>
<div style="width: 100%;height: 100%">
    <div>
        <form action="/moveRecord/search" method="post">
            <div>
                <label for="key">字段：</label>
                <select name="key">
                    <option value="studentName">学生</option>
                    <option value="dormitoryName">宿舍</option>
                    <option value="reason">迁出原因</option>
                </select>
            </div>
            <div>
                <label for="value">值：</label>
                <input name="value" placeholder="" maxlength="20">
            </div>
            <div>
                <button type="submit">搜索</button>
            </div>
        </form>
    </div>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>学生</th>
            <th>宿舍</th>
            <th>迁出原因</th>
            <th>迁出日期</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="record">
            <tr>
                <td>${record.id}</td>
                <td>${record.studentName}</td>
                <td>${record.dormitoryName}</td>
                <td>${record.reason}</td>
                <td>${record.createDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
