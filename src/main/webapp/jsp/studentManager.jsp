<%--
  Created by IntelliJ IDEA.
  User: 29741
  Date: 2022/9/23
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>studentManager</title>
    <script type="text/javascript" src="../static/js/jquery-3.3.1.min.js"></script>
    <script>
        function update(event){
            $('#form_data_update').show()

            var btn=$(event)
            var id=btn.data('id');
            var dormitoryId=btn.data('dormitoryid')
            var number=btn.data('number')
            var name=btn.data('name')
            var gender=btn.data('gender')
            var state=btn.data('state')
            var o=btn.data('object')
            $('#updateId').val(id)
            $('#updateNumber').val(number)
            $('#updateName').val(name)
            $('#updateDormitoryId').val(dormitoryId)
            var list = $('#updateGender')
            for(var i=0;i<list.length;i++){
                if (gender == $(list.get(i)).val()){
                    $(list.get(i)).prop('checked',true)
                }
            }
            $('#updateState').val(state)
            var list2 = $('#dormitory')
            for(var i=0;i<list2.length;i++){
                if (dormitoryId == $(list2.get(i)).val()){
                    $(list2.get(i)).prop('selected',true)
                }
            }
        }
        function cancel(event){
            $(event).hidden
        }
        function add(){
            $("#form_data_add").show()
        }
    </script>
</head>
<body>
<div style="width: 100%;height: 100%;">
    <div>
        <form action="/student/search" method="post">
            <div>
                <label for="key">字段：</label>
                <select name="key">
                    <option value="number">学号</option>
                    <option value="name">姓名</option>
                </select>
            </div>
            <div>
                <label for="value">值：</label>
                <input name="value" placeholder="字段值" maxlength="12">
            </div>
            <div>
                <button type="submit">搜索</button>
            </div>
            <div>
                <button type="button" onclick="add()">添加</button>
            </div>
        </form>
    </div>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>宿舍</th>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>状态</th>
            <th>入住时间</th>
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
                <td>${student.createDate}</td>
                <td>
                    <div>
                        <button type="button" onclick="update(this)"
                                data-object="${student}"
                                data-id="${student.id}"
                                data-dormitoryId="${student.dormitoryId}"
                                data-number="${student.number}"
                                data-name="${student.name}"
                                data-gender="${student.gender}"
                                data-state="${student.state}">修改</button>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!--修改学生信息-->
    <form action="/student/update" method="post" id="form_data_update" hidden>
        <div id="updateUserModal"
             role="dialog" tabindex="-1">
            <div>
                <h4>修改学生信息</h4>
            </div>
            <div>
                <form role="form">
                    <div hidden>
                        <input type="text" id="updateId" name="id">
                    </div>
                    <div>
                        <label>宿舍</label>
                        <select id="updateDormitoryId" name="dormitoryId">
                            <c:forEach items="${dormitorys}" var="dormitory">
                                <option value="${dormitory.id}" id="dormitory">${dormitory.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label>学号</label>
                        <input type="text" id="updateNumber" name="number">
                    </div>
                    <div>
                        <label>姓名</label>
                        <input type="text" id="updateName" name="name">
                    </div>
                    <div>
                        <label>性别</label>
                        <input type="radio" checked value="男" name="gender">男
                        <input type="radio" value="女" name="gender">女
                    </div>
                    <input type="hidden" id="updateState" name="state">
                    <div>
                        <button type="submit">修改</button>
                        <button type="reset">重置</button>
                        <button type="button" onclick="cancel(this)">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </form>
    <!--添加学生信息-->
    <form action="/student/save" method="post" id="form_data_add" hidden>
        <div id="addUserModal"
             role="dialog" tabindex="-1">
            <div>
                <h4>添加学生信息</h4>
            </div>
            <div>
                <form role="form">
                    <div>
                        <label>宿舍</label>
                        <select id="addDormitoryId" name="dormitoryId">
                            <c:forEach items="${dormitorys}" var="dormitory">
                                <option value="${dormitory.id}" id="dormitory">${dormitory.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div>
                        <label>学号</label>
                        <input type="text" id="addNumber" name="number">
                    </div>
                    <div>
                        <label>姓名</label>
                        <input type="text" id="addName" name="name">
                    </div>
                    <div>
                        <label>性别</label>
                        <input type="radio" checked value="男" name="gender">男
                        <input type="radio" value="女" name="gender">女
                    </div>
                    <div>
                        <button type="submit">添加</button>
                        <button type="reset">重置</button>
                        <button type="button" onclick="cancel(this)">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </form>
</div>
</body>
</html>
