<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- 屏幕适配 -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1">
    <!-- 绝对路径获取-->
    <c:set var="path" value="${pageContext.request.contextPath}"></c:set>


    <!-- Javascript files -->
    <!-- jQuery -->
    <script type="text/javascript" src="${path}/resources/js/jquery/jquery-1.9.0.min.js"></script>
    <script type="text/javascript" src="${path}/resources/js/all.js"></script>
    <script src="${path}/resources/bootstrap/layer/layer.js"  type="text/javascript"></script>
    <%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>

    <!-- Bootstrap JS -->
    <script type="text/javascript" src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <title>学生信息展示</title>
</head>
<body  style="background-color:lightblue">
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>


<div class="row">
    <div class="container" style="min-height:500px;">
        <div class="row">
            <div class="col-xs-9">
                <div class="page-header">
                    <h1><i class="fa fa-list-ul"></i> 学生管理 </h1>
                    <h6 style="color:darkblue">
                        <sys:message content="${message}"/>
                    </h6>
                </div>
                <div class="page-content row">
                    <form action="UpdateServlet" method="post">
                        <table>
                            <tr>
                                <td>学号:</td>
                                <td><input  type="text" class="df-input-narrow required" id="studentId" name="studentId" value="${student.studentId}" readonly="true"/></td>
                            </tr>

                            <tr>
                                <td>姓名:</td>
                                <td><input  type="text"class="df-input-narrow required" id="userName" name="userName" value="${student.userName}"/></td>
                            </tr>
                            <tr>
                                <td>年龄:</td>
                                <td><input  type="text" class="df-input-narrow required" id="age" name="age" value="${student.age}"/></td>
                            </tr>

                            <tr>
                                <td>性别:</td>
                                <td> <select name="gender" class="df-input-narrow required"  id="gender-select" style="width: 164px ;height: 27.68px">
                                    <%--<option value="-1" >--请选择--</option>--%>
                                    <c:choose>
                                        <c:when test="${student.gender == 0}">
                                            <option value="0" selected="selected">女</option>
                                            <option value="1">男</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="0">女</option>
                                            <option value="1" selected="selected">男</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select></td>
                            </tr>
                            <tr>
                                <td>邮箱:</td>
                                <td><input  type="text"  class="df-input-narrow required" id="email" name="email" value="${student.email}"/></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input id="btn-save"  type="submit"  class="btn btn-primary" value="提交"/>
                                    <input  type="button"  class="btn btn-primary"   value="返回" onclick="history.go(-1)"/>
                                </td>
                            </tr>
                        </table>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>


<style>
    .int{ height: 30px; text-align: left; width: 600px; }
    label{ width: 200px; margin-left: 20px; }
    .high{ color: red; }
    .msg{ font-size: 13px; }
    .onError{ color: red; }
    .onSuccess{ color: green; }
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
    //为表单元素添加失去焦点事件
    $("form :input").blur(function(){

        var $parent = $(this).parent();
        $parent.find(".msg").remove(); //删除以前的提醒元素（find()：查找匹配元素集中元素的所有匹配元素）

        //验证工号
        if($(this).is("#studentId")){
            var studentId = $("#studentId").val();
            if (studentId == "") {
                var errorMsg = " 请输入学号！";
                $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
            } else if (studentId.length != 10) {
                var errorMsg = " 请输入10位学号！";
                $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
            } else {
                var re=/[\+|\-|\\|\/||&|!|~|@|#|\$|%|\^|\*|\(|\)|=|\?|´|"|<|>|\.|,|:|;|\]|\[|\{|\}|\|]+/;
                if(re.test(studentId)){
                    var errorMsg = " 只能是数字字母或者下划线的组合！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                } else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }
            }
        }

        //验证姓名
        if($(this).is("#userName")){
            var username = $("#userName").val();
            if (username == "") {
                var errorMsg = " 请输入姓名！";
                $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
            } else if (username.length < 2 || username.length > 20) {
                var errorMsg = " 姓名请保持在6到20个字符以内！";
                $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
            } else {
                var okMsg=" 输入正确";
                $parent.find(".high").remove();
                $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
            }
        }

        if($(this).is("#age")){
            var age = $("#age").val();
            if (age == "") {
                var errorMsg = " 年龄！";
                $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
            } else if (age.length > 4) {
                var errorMsg = " 年龄在1-120之间！";
                $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
            } else {
                var re = /^(?:[1-9]?\d|120)$/;
                if (!re.test(age)) {
                    var errorMsg = "年龄无效！";
                    $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
                }
                else{
                    var okMsg=" 输入正确";
                    $parent.find(".high").remove();
                    $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
                }

            }
        }

        //验证邮箱
        if($(this).is("#email")){
            var emailVal = $.trim(this.value);
            var regEmail = /.+@.+\.[a-zA-Z]{2,4}$/;
            if(emailVal== "" || (emailVal != "" && !regEmail.test(emailVal))){
                var errorMsg = " 请输入正确的E-Mail住址！";
                $parent.append("<span class='msg onError'>" + errorMsg + "</span>");
            }
            else{
                var okMsg=" 输入正确";
                $parent.find(".high").remove();
                $parent.append("<span class='msg onSuccess'>" + okMsg + "</span>");
            }
        }
    }).keyup(function(){
        //triggerHandler 防止事件执行完后，浏览器自动为标签获得焦点
        $(this).triggerHandler("blur");
    }).focus(function(){
        $(this).triggerHandler("blur");
    });


    //点击重置按钮时，通过trigger()来触发文本框的失去焦点事件
    $("#btn-save").click(function(){
        //trigger 事件执行完后，浏览器会为submit按钮获得焦点
        $("form .required:input").trigger("blur");
        var numError = $("form .onError").length;
        if(numError){
            return false;
        }
        return true;
    });

</script>
</body>
</html>
</body>
</html>