<%--
  Created by IntelliJ IDEA.
  User: 29741
  Date: 2022/9/28
  Time: 8:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title>DormitoryManager</title>
    <script type="text/javascript" src="../static/js/jquery-3.3.1.min.js"></script>
    <script>
        function add(){
            $("#form_data_add").show()
        }
        function del(event){
            $("#form_data_del").show()

            var btn=$(event)
            var id = btn.data('id')

            $("#delId").val(id)
            $("#prompt").text("是否删除ID为"+id+"的宿舍信息？")
        }
        function update(event){
            $("#form_data_update").show()

            var btn=$(event)
            var id = btn.data('id')
            var buildingId = btn.data('buildingid')
            var name = btn.data('name')
            var type = btn.data('type')
            var available = btn.data('available')
            var telephone = btn.data('telephone')

            console.log('buildingId:'+buildingId)
            console.log('type:'+type)
            console.log('available:'+available)

            $("#updateId").val(id)
            $("#updateBuildingId").val(buildingId)
            $("#updateName").val(name)
            $("#type").val(type)
            $("#available").val(available)
            $("#updateTelephone").val(telephone)
        }
        function cancel(event){

        }
    </script>
</head>
<body>
<div style="width: 100%;height: 100%">
    <form action="/dormitory/search" method="post">
        <div>
            <label for="key">字段：</label>
            <select name="key">
                <option value="buildingName">楼宇</option>
                <option value="name">名称</option>
                <option value="telephone">电话</option>
            </select>
        </div>
        <div>
            <label for="value">值：</label>
            <input name="value" placeholder="字段值">
        </div>
        <div>
            <button type="submit">开始搜索</button>
            <button type="button" onclick="add()">添加宿舍信息</button>
        </div>
    </form>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>楼宇</th>
            <th>名称</th>
            <th>几人间</th>
            <th>空余床位</th>
            <th>电话</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="dormitory">
            <tr>
                <td>${dormitory.id}</td>
                <td>${dormitory.buildingName}</td>
                <td>${dormitory.name}</td>
                <td>${dormitory.type}</td>
                <td>${dormitory.available}</td>
                <td>${dormitory.telephone}</td>
                <td>
                    <div>
                        <button type="button"
                                data-id="${dormitory.id}"
                                data-buildingId="${dormitory.buildingId}"
                                data-name="${dormitory.name}"
                                data-type="${dormitory.type}"
                                data-available="${dormitory.available}"
                                data-telephone="${dormitory.telephone}"
                                onclick="update(this)">修改</button>
                        <button type="button"
                                data-id="${dormitory.id}"
                                onclick="del(this)">删除</button>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!--添加宿舍-->
    <form action="/dormitory/save" method="post" id="form_data_add" hidden>
        <div>
            <h3>添加宿舍信息</h3>
        </div>
        <div>
            <label>楼宇</label>
            <select id="addBuildingId" name="buildingId">
                <c:forEach items="${buildings}" var="building">
                    <option value="${building.id}" id="building">${building.name}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <label>名称</label>
            <input id="addName" name="name">
        </div>
        <div>
            <label>几人间</label>
            <select id="addType" name="type">
                <option value="1" id="type1">1</option>
                <option value="2" id="type1">2</option>
                <option value="3" id="type1">3</option>
                <option value="4" id="type1">4</option>
            </select>
        </div>
        <div>
            <label>空余床位</label>
            <select id="addAvailable" name="available">
                <option value="0" id="available1">0</option>
                <option value="1" id="available1">1</option>
                <option value="2" id="available1">2</option>
                <option value="3" id="available1">3</option>
                <option value="4" id="available1">4</option>
            </select>
        </div>
        <div>
            <label>电话</label>
            <input id="addTelephone" name="telephone">
        </div>
        <div>
            <button type="submit">添加</button>
            <button type="reset">重置</button>
            <button type="button" onclick="cancel(this)">取消</button>
        </div>
    </form>
    <!--修改宿舍-->
    <form action="/dormitory/update" method="post" id="form_data_update" hidden>
        <div>
            <h3>修改宿舍信息</h3>
        </div>
        <div hidden>
            <label>ID</label>
            <input id="updateId" name="id">
        </div>
        <div>
            <label>楼宇</label>
            <select id="updateBuildingId" name="buildingId">
                <c:forEach items="${buildings}" var="building">
                    <option value="${building.id}" id="building">${building.name}</option>
                </c:forEach>
            </select>
        </div>
        <div>
            <label>名称</label>
            <input id="updateName" name="name">
        </div>
        <div>
            <label>几人间</label>
            <select id="updateType" name="type">
                <option value="1" id="type">1</option>
                <option value="2" id="type">2</option>
                <option value="3" id="type">3</option>
                <option value="4" id="type">4</option>
            </select>
        </div>
        <div>
            <label>空余床位</label>
            <select id="updateAvailable" name="available">
                <option value="0" id="available">0</option>
                <option value="1" id="available">1</option>
                <option value="2" id="available">2</option>
                <option value="3" id="available">3</option>
                <option value="4" id="available">4</option>
            </select>
        </div>
        <div>
            <label>电话</label>
            <input id="updateTelephone" name="telephone">
        </div>
        <div>
            <button type="submit">修改</button>
            <button type="reset">重置</button>
            <button type="button" onclick="cancel(this)">取消</button>
        </div>
    </form>
    <!--删除宿舍-->
    <form action="/dormitory/delete" method="post" id="form_data_del" hidden>
        <div>
            <h3>删除宿舍信息</h3>
        </div>
        <div>
            <h4 id="prompt">删除提示信息</h4>
        </div>
        <div hidden>
            <input id="delId" name="id">
        </div>
        <div>
            <button type="submit">删除</button>
            <button type="button" onclick="cancel()">取消</button>
        </div>
    </form>
</div>
</body>
</html>
