<%--
  Created by IntelliJ IDEA.
  User: 29741
  Date: 2022/9/27
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="../static/js/jquery-3.3.1.min.js"></script>
    <script>
        function add(){
            $("#form_data_add").show()
        }
        function update(event){
            $("#form_data_update").show()
            var btn = $(event)
            var id = btn.data('id')
            var name = btn.data('name')
            var introduction = btn.data('introduction')
            var adminId = btn.data('adminid')

            $("#updateId").val(id)
            $("#updateName").val(name)
            $("#updateIntroduction").val(introduction)
            $("#dormitoryId").val(adminId)
        }
        function del(event){
            $("#form_data_del").show()
            var id = $(event).data('id')

            $("#prompt").text('确认是否删除ID为'+id+'的楼宇信息？')
            $("#delId").val(id)
        }
        function cancel(event){
            $(event).hidden
        }
    </script>
</head>
<body>
<div style="width: 100%;height: 100%;">
    <div>
        <form action="/building/search" method="post">
            <div>
                <label for="key">字段：</label>
                <select name="key">
                    <option value="name">名称</option>
                    <option value="introduction">介绍</option>
                    <option value="adminName">管理员</option>
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
            <th>名称</th>
            <th>介绍</th>
            <th>管理员</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="building">
            <tr>
                <td>${building.id}</td>
                <td>${building.name}</td>
                <td>${building.introduction}</td>
                <td>${building.adminName}</td>
                <td>
                    <div>
                        <button type="button" onclick="update(this)"
                                data-id="${building.id}"
                                data-name="${building.name}"
                                data-introduction="${building.introduction}"
                                data-adminId="${building.adminId}">修改</button>
                        <button type="button" onclick="del(this)"
                                data-id="${building.id}">删除</button>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!--添加楼宇-->
    <form action="/building/save" method="post" id="form_data_add" hidden>
        <div>
            <div>添加楼宇信息</div>
        </div>
        <div>
            <form>
                <div hidden>
                    <input type="text" id="addId" name="id">
                </div>
                <div>
                    <label>名称</label>
                    <input id="addName" name="name">
                </div>
                <div>
                    <label>介绍</label>
                    <input id="addIntroduction" name="introduction">
                </div>
                <div>
                    <label>管理员</label>
                    <select id="addAdminId" name="adminId">
                        <c:forEach items="${dormitoryAdmins}" var="dormitoryAdmin">
                            <option value="${dormitoryAdmin.id}" id="dormitoryAdmin">${dormitoryAdmin.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <button type="submit">添加</button>
                    <button type="reset">重置</button>
                    <button type="button" onclick="cancel('#form_data_add')">取消</button>
                </div>
            </form>
        </div>
    </form>
    <!--修改楼宇信息-->
    <form action="/building/update" method="post" id="form_data_update" hidden>
        <div>
            <h3>修改楼宇信息</h3>
        </div>
        <div>
            <form>
                <div hidden>
                    <input id="updateId" name="id">
                </div>
                <div>
                    <label>名称</label>
                    <input id="updateName" name="name">
                </div>
                <div>
                    <label>介绍</label>
                    <input id="updateIntroduction" name="introduction">
                </div>
                <div>
                    <label>管理员</label>
                    <select id="updateAdminId" name="adminId">
                        <c:forEach items="${dormitoryAdmins}" var="dormitoryAdmin">
                            <option value="${dormitoryAdmin.id}" id="dormitoryAdmin">${dormitoryAdmin.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div>
                    <button type="submit">修改</button>
                    <button type="reset">重置</button>
                    <button type="button" onclick="cancel('#form_data_update')">取消</button>
                </div>
            </form>
        </div>
    </form>
    <!--删除楼宇信息-->
    <form action="/building/delete" method="post" id="form_data_del" hidden>
        <div>
            <h3>删除楼宇信息</h3>
        </div>
        <div>
            <h4 id="prompt">删除提示信息</h4>
        </div>
        <div hidden>
            <input id="delId" name="id">
        </div>
        <div>
            <button type="submit">删除</button>
            <button type="button">取消</button>
        </div>
    </form>
</div>
</body>
</html>
