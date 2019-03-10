<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>用户管理</title>
    <meta name="keywords" content="">
    <link rel="shortcut icon" href="/resources/images/favicon.ico" />
    <link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
    <link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">

    <link href="resources/css/exam.css" rel="stylesheet">
    <link href="resources/chart/morris.css" rel="stylesheet">
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
                    <form id="student-add-form" style="margin-top:40px;"  action="/AddServlet" method="post">

                        <div class="form-line form-studentId" style="display: block;">
                            <span class="form-label"><span class="warning-label"></span>学号：</span>
                            <input type="text" class="df-input-narrow required" id="studentId" name="studentId"><span class="form-message"></span>
                            <br>
                        </div>

                        <div class="form-line form-userName" style="display: block;">
                            <span class="form-label"><span class="warning-label"></span>姓名：</span>
                            <input type="text" class="df-input-narrow required" id="userName" name="userName"><span class="form-message"></span>
                            <br>
                        </div>

                        <div class="form-line form-age" style="display: block;">
                            <span class="form-label"><span class="warning-label"></span>年龄：</span>
                            <input type="text" class="df-input-narrow required" id="age" name="age"><span class="form-message"></span>
                            <br>
                        </div>


                        <div class="form-line form-gender" style="display: block;">
                            <span class="form-label"><span class="warning-label"></span>性别：</span>
                            <%--<form:input path="gender" type="text" class="df-input-narrow" id="gender" name="gender"/>--%>
                            <select name="gender" id="gender" style="width: 165px ;height: 27.68px">
                                <option value="-1" >--请选择--</option>
                                <option value="0">女</option>
                                <option value="1" >男</option>
                            </select>
                            <span class="form-message"></span>
                            <br>
                        </div>

                        <div class="form-line form-email" style="display: block;">
                            <span class="form-label"><span class="warning-label"></span>email：</span>
                            <input type="text" class="df-input-narrow required" id="email" name="email" ><span class="form-message"></span>
                            <br>
                        </div>

                        <div class="form-line">
                            <input id="btn-save" value="确认添加" type="submit" class="btn btn-primary">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input id="btnCancel" class="btn btn-primary" type="button" value="返回" onclick="history.go(-1)">
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>



<!-- Javascript files -->
<!-- jQuery -->
<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
<!-- Bootstrap JS -->
<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>

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
                var errorMsg = " 姓名请保持在2到20个字符以内！";
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
                if (re.test(age)) {
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