<%--
  Created by IntelliJ IDEA.
  User: 29741
  Date: 2022/9/30
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>LackSleepRegister</title>
</head>
<body>
<div style="height: 100%;width: 100%">
  <form action="/lackSleep/save" method="post">
    <div>
      <h3>添加缺寝信息</h3>
    </div>
    <div>
      <label>楼宇</label>
      <select name="buildingId">
        <c:forEach items="${buildings}" var="building">
          <option value="${building.id}" id="building">${building.name}</option>
        </c:forEach>
      </select>
    </div>
    <div>
      <label>宿舍</label>
      <select name="dormitoryId">
        <c:forEach items="${dormitorys}" var="dormitory">
          <option value="${dormitory.id}" id="dormitory">${dormitory.name}</option>
        </c:forEach>
      </select>
    </div>
    <div>
      <label>学生</label>
      <input name="studentName" placeholder="" maxlength="4">
    </div>
    <div>
      <label>原因</label>
      <input name="reason" placeholder="" maxlength="20">
    </div>
    <div>
      <button type="submit">提交</button>
      <button type="reset">重置</button>
    </div>
  </form>
</div>
</body>
</html>
