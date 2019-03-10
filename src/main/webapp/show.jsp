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

    <!-- js获取路径配置 -->
    <script type="text/javascript">
        var path = "${path}"

        $(document).ready(function () {

            var selectFlag = true;
            $('#checkAll').click(function () {
                if (selectFlag) {
                    $("tbody :checkbox").prop("checked", true);
                    selectFlag = false;
                } else {
                    $("tbody :checkbox").prop("checked", false);
                    selectFlag = true;
                }
            });

            $('#deleteAll').click(function(){
                // alert("123");
                var ids = [];
                $('[name=items]:checkbox').each(function(){
                    if(this.checked){
                        ids.push(this.value);
                    }
                });
                if(ids.length == 0){
                    //alert("123");
                    promptMessage("请选择学生");
                    return false;
                }
                layer.confirm("确定删除？",{offset: 't' , btn: ['确定','取消']},function(){
                    $.ajax({
                        type:"post",
                        url:"/DeleteBatchStudent?ids="+ids,
                        contentType:"application/json",
                        data:JSON.stringify(ids),
                        success:function(data){
                            location.reload();
                        }
                    });
                });
            });

        });

        function promptMessage(tip){
            layer.open({
                type: 1,
                offset: 't' ,//具体配置参考：offset参数项
                content: '<div style="padding: 20px 80px;">'+tip+'</div>',
                btn: '确定',
                btnAlign: 'c' ,//按钮居中
                shade: 0 ,//不显示遮罩
                yes: function(){
                    layer.closeAll();
                }
            });
        }
        function confirmDelete()    {
            if(confirm('确定要执行此操作吗?'))
            {
                return true;
            }
            return false;
        }

        function selecAll(val) {
            $("input[name='items']").each(function () {
                this.checked = val;
            });
        }

    </script>

    <title>学生信息展示</title>
</head>
<body  style="background-color:lightblue">
<%@ include file="/WEB-INF/views/layouts/header.jsp" %>

<div class="modal inmodal fade" id="importBox" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">导入数据</h4>
            </div>
            <div class="modal-body modal-office-body">
                <form id="importForm" action="/ImportStudent" method="post" enctype="multipart/form-data"
                      class="form-search" style="padding-left:20px;text-align:center;"><br/>
                    <div class="form-group">
                        <input id="uploadFile" name="file" type="file"  class="form-control btn-primary" />　
                    </div>
                    <div class="form-group">
                        <input id="btnImportSubmit" class="btn btn-primary" type="submit" value="导入"/>
                        <a href="/StudentTemplateServlet">下载模板</a>&nbsp;导入文件不能超过5M，仅允许导入“xls”或“xlsx”格式文件！
                    </div>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>
    <div class="row">
            <div class="container" style="min-height:500px;">
                <div class="row">
                    <div class="col-xs-9">
                        <div class="page-header">
                            <h1><i class="fa fa-list-ul"></i> 学生管理 </h1>
                            <h6 style="color:darkblue">
                               ${alreadyExists}
                               ${updateSucess}
                               ${updateFail}
                               ${batchDelSucess}
                               ${batchDelFail}
                               ${delSucess}
                               ${delFail}
                               ${downTemlateFail}
                               ${fail}
                               ${suc}
                            </h6>
                        </div>
                        <div class="page-content row">
                           <form id="searchForm" action="/FilterServlet" class="breadcrumb form-search form-horizontal">

                                <div class="form-group">
                                    <label class="col-sm-1">学号:</label>
                                    <input id="studentId" name="studentId" htmlEscape="false" maxlength="50" class="input-medium"/>
                                    &nbsp; &nbsp; &nbsp;
                                    <input id="btnSubmit"
                                           class="btn btn-primary"
                                           type="submit"
                                           value="查 询"/>
                                    &nbsp; &nbsp; &nbsp;
                                    <button type="button" id="btnImport" data-target="#importBox" data-toggle="modal"  class="btn btn-primary">Excel导入</button>
                                    &nbsp; &nbsp; &nbsp;
                                    <input id="deleteAll" class="btn btn-primary" type="button" value="批量删除"/>
                                </div>
                            </form>

                            <div id="question-list">
                                <table class="table-striped table">
                                    <thead>
                                    <tr>
                                        <td>
                                            <input id="checkAll" type="checkbox"
                                                   onclick="selecAll(this.checked)"/></td>
                                        <td>学号</td>
                                        <td>姓名</td>
                                        <td>年龄</td>
                                        <td>性别</td>
                                        <td>邮箱</td>
                                        <td>操作</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list}" var="item">
                                        <tr>
                                            <td>
                                                <input id="item" name="items" type="checkbox" value="${item.studentId}" >
                                            </td>
                                            <td>${item.studentId }</td>
                                            <td>${item.userName }</td>
                                            <td>${item.age }</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${item.gender == 1 }">
                                                        男
                                                    </c:when>
                                                    <c:when test="${item.gender == 0 }">
                                                        女
                                                    </c:when>
                                                    <c:otherwise>
                                                        其他
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${item.email }</td>

                                            <td>

                                                <a href="/UpdateServlet?studentId=${item.studentId}">修改</a>
                                                <a href="/DeleteServlet?studentId=${item.studentId}" onclick="return confirmDelete();">删除</a>

                                            </td>
                                        </tr>
                                    </c:forEach>

                                    </tbody>
                                    <tfoot></tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


<%@ include file="/WEB-INF/views/layouts/footer.jsp" %>
</body>
</html>