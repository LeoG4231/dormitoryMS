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
    <title>adminManager</title>
    <script type="text/javascript" src="../static/js/jquery-3.3.1.min.js"></script>
    <script>
        function add(){
            $('#form_data_add').show()
        }
        function update(event){
            $('#form_data_update').show()
            var btn = $(event)
            var id = btn.data("id")
            var username = btn.data("username")
            var password = btn.data("password")
            var name = btn.data("name")
            var gender = btn.data("gender")
            var telephone = btn.data("telephone")

            $('#updateId').val(id)
            $('#updateUsername').val(username)
            $('#updatePassword').val(password)
            $('#updateName').val(name)
            var list = $('#gender')
            for(var i=0;i<list.length;i++){
                if (gender == $(list.get(i)).val()){
                    $(list.get(i)).prop('checked',true)
                }
            }
            $("#updateTelephone").val(telephone)
        }
        function del(event){
            $('#form_data_del').show()
            var btn = $(event)
            var id = btn.data("id")

            $('#prompt').text('确认是否删除ID为'+id+'的宿管信息？')
            $('#delId').val(id)
        }
        function cancel(event){
            $(event).hidden
        }
    </script>
</head>
<body>
<div style="width: 100%;height: 100%;">
    <div>
        <form action="/dormitoryAdmin/search" method="post">
            <div>
                <label for="name">字段：</label>
                <select name="key">
                    <option value="username">用户名</option>
                    <option value="name">姓名</option>
                    <option value="telephone">联系电话</option>
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
            <th>用户名</th>
            <th>密码</th>
            <th>姓名</th>
            <th>性别</th>
            <th>联系电话</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="dormitoryAdmin">
            <tr>
                <td>${dormitoryAdmin.id}</td>
                <td>${dormitoryAdmin.username}</td>
                <td>${dormitoryAdmin.password}</td>
                <td>${dormitoryAdmin.name}</td>
                <td>${dormitoryAdmin.gender}</td>
                <td>${dormitoryAdmin.telephone}</td>
                <td>
                    <div>
                        <button type="button" onclick="update(this)"
                                data-id="${dormitoryAdmin.id}"
                                data-username="${dormitoryAdmin.username}"
                                data-password="${dormitoryAdmin.password}"
                                data-name="${dormitoryAdmin.name}"
                                data-gender="${dormitoryAdmin.gender}"
                                data-telephone="${dormitoryAdmin.telephone}">修改</button>
                        <button type="button" onclick="del(this)"
                                data-id="${dormitoryAdmin.id}">删除</button>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <!--添加宿管的表单-->
    <form action="/dormitoryAdmin/save" method="post" id="form_data_add" hidden>
        <div id="addUserModal"
             role="dialog" tabindex="-1">
            <div>
                <button type="button" data-dismiss="updateUserModal">x</button>
                <h4>添加宿管</h4>
            </div>
            <div>
                <form role="form">
                    <div>
                        <label>用户名</label>
                        <input type="text" id="addUsername" name="username">
                    </div>
                    <div>
                        <label>密码</label>
                        <input type="text" id="addPassword" name="password">
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
                        <label>联系电话</label>
                        <input type="text" id="addTelephone" name="telephone">
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
    <!--修改宿管信息的表单-->
    <form action="/dormitoryAdmin/update" method="post" id="form_data_update" hidden>
        <div id="updateUserModal"
             role="dialog" tabindex="-1">
            <div>
                <h4>修改宿管信息</h4>
            </div>
            <div>
                <form role="form">
                    <div hidden>
                        <input type="text" id="updateId" name="id">
                    </div>
                    <div>
                        <label>用户名</label>
                        <input type="text" id="updateUsername" name="username">
                    </div>
                    <div>
                        <label>密码</label>
                        <input type="text" id="updatePassword" name="password">
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
                    <div>
                        <label>联系电话</label>
                        <input type="text" id="updateTelephone" name="telephone">
                    </div>
                    <div>
                        <button type="submit">修改</button>
                        <button type="reset">重置</button>
                        <button type="button" onclick="cancel(this)">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </form>
    <!--删除宿管信息的表单-->
    <form method="post" action="/dormitoryAdmin/del" id="form_data_del" hidden>
        <div>
            <h3>删除宿管信息</h3>
        </div>
        <div>
            <h4 id="prompt">删除提示信息</h4>
        </div>
        <div>
            <input type="hidden" id="delId" name="id" placeholder="">
        </div>
        <div>
            <button type="submit">删除</button>
            <button type="button" onclick="cancel(this)">取消</button>
        </div>
    </form>
</div>
</body>
</html>
