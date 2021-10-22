<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>历史我的</title>
    <meta name="description" content="OnlineExamSystem">
    <meta name="keywords" content="OnlineExamSystem">


    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">

</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- 页面头部 /-->
    <!-- 导航侧栏 -->
    <jsp:include page="aside.jsp"></jsp:include>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->

    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                历史 <small>我的</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li><a href="#">历史</a></li>
                <li class="active">我的</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--数据列表-->
                        <table id="dataList"
                               class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="text-center">No</th>
                                <th class="text-center">试卷名称</th>
                                <th class="text-center">交卷时间</th>
                                <th class="text-center">成绩</th>
                                <th class="text-center">及格分</th>
                                <th class="text-center">结果</th>

                            </tr>
                            </thead>
                            <tbody>


                            <c:forEach items="${historyMeList}" var="historyMe" varStatus="status">
                                <tr>
                                    <td class="text-center">${status.count }</td>
                                    <td>${historyMe.title }</td>
                                    <td>${historyMe.submit_timeStr }</td>
                                    <td>${historyMe.remarkScore + historyMe.userScore }</td>
                                    <td>${historyMe.pass_score}</td>
                                    <td>
                                        <c:if test="${historyMe.remarkScore + historyMe.userScore >= historyMe.pass_score}">
                                            <span class="label label-success">通过</span>
                                        </c:if>
                                        <c:if test="${(historyMe.isCorrect==0)&&(historyMe.remarkScore + historyMe.userScore < historyMe.pass_score)}">
                                            <span class="label label-warning">待定</span>
                                        </c:if>
                                        <c:if test="${(historyMe.isCorrect==1)&&(historyMe.remarkScore + historyMe.userScore < historyMe.pass_score)}">
                                            <span class="label label-danger">未通过</span>
                                        </c:if>
                                    </td>
                                    <td>
                                        <security:authorize access="hasRole('ADMIN')">
                                            <button class="btn btn-primary btn-xs"
                                                    onclick="delHistory(${historyMe.hid});">删除
                                            </button>
                                        </security:authorize>
                                    </td>

                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>
                        <!--数据列表/-->


                    </div>
                    <!-- 数据表格 /-->


                </div>
                <!-- /.box-body -->


            </div>

        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- @@close -->
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.8
        </div>
        <strong>Copyright &copy; 2014-2017 <a
                href="http://www.baidu.com">创新研究院</a>.
        </strong> All rights reserved.
    </footer>
    <!-- 底部导航 /-->

</div>


<script>
    $(document).ready(function () {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    function delHistory(hid) {
        $.ajax({
            type: 'POST',
            data: {'hid': hid},
            url: '${pageContext.request.contextPath}/history/deleteHistoryById.do',
            datatype: 'json',
            async: 'false',
            success: function (data) {

                alert("success.........."),
                    window.location = "${pageContext.request.contextPath}/history/findHistoryByUser.do";

            },
            error: function (data) {
                alert("error..........")
            }
        })

    }

    $(document).ready(function () {

        // 激活导航位置
        setSidebarActive("admin-datalist");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // 全选操作
        $("#selall").click(function () {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });
</script>
</body>

</html>