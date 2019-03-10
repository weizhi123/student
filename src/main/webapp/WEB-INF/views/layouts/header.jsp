<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    //这断代码是用来拼接当前网页的相对路径的。
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
            Remove this if you use the .htaccess -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>OnlineExam</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="keywords" content="">
    <link rel="shortcut icon"
          href="${path}/resources/images/favicon.ico"/><!-- 显示在网页顶端的图标 -->
    <link href="${path}/resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
    <link href="${path}/resources/font-awesome/css/font-awesome.min.css"
          rel="stylesheet">
    <link href="${path}/resources/css/style.css" rel="stylesheet">

    <style>
        .question-number {
            color: #5cb85c;
            font-weight: bolder;
            display: inline-block;
            width: 30px;
            text-align: center;
        }

        .question-number-2 {
            color: #5bc0de;
            font-weight: bolder;
            display: inline-block;
            width: 30px;
            text-align: center;
        }

        .question-number-3 {
            color: #d9534f;
            font-weight: bolder;
            display: inline-block;
            width: 30px;
            text-align: center;
        }

        a.join-practice-btn {
            margin: 0;
            margin-left: 20px;
        }

        .content ul.question-list-knowledge {
            padding: 8px 20px;
        }

        .knowledge-title {
            background-color: #EEE;
            padding: 2px 10px;
            margin-bottom: 20px;
            cursor: pointer;
            border: 1px solid #FFF;
            border-radius: 4px;
        }

        .knowledge-title-name {
            margin-left: 8px;
        }

        .point-name {
            width: 200px;
            display: inline-block;
        }
    </style>

</head>

<body>
<header>
    <div class="container">
        <div class="row">
            <div class="col-xs-5">
                <div class="logo">
                    <%--<h1>--%>
                        <%--<a href="#"><img alt="" src="${path}/resources/images/logo.png"></a>--%>
                    <%--</h1>--%>
                </div>
            </div>
            <div class="col-xs-7" id="login-info">
                <a class="btn btn-success">欢迎你</a>

                <a class="btn btn-primary" href="index.jsp">退出</a>
            </div>
        </div>
    </div>
</header>


<!-- Navigation bar starts -->
<div class="navbar bs-docs-nav col-md-12" role="banner">
    <div class="container">
        <nav class="collapse navbar-collapse bs-navbar-collapse"
             role="navigation">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/ShowServlet"><i class="fa fa-home"></i>信息展示</a>
                </li>
                <li><a href="add.jsp"><i class="fa fa-dashboard"></i>添加学生</a></li>
                <%--<li><a href="/UpdateServlet"><i class="fa fa-edit"></i>修改学生</a></li>--%>

            </ul>
        </nav>
    </div>
</div>
<!-- Navigation bar ends -->

</body>