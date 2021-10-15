<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>用户详情</title>
    <meta name="description" content="OnlineExamSystem">
    <meta name="keywords" content="OnlineExamSystem">

    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">

</head>

<body class="hold-transition skin-blue sidebar-mini">

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
                用户管理 <small>用户详情</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i
                        class="fa fa-dashboard"></i> 首页</a></li>
                <li><a
                        href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>

                <li class="active" id="submit_btn">用户详情</li>
            </ol>
        </section>
        <!-- 内容头部 /-->
        <form
                action="${pageContext.request.contextPath}/user/modifyStationByUser.do"
                method="post">
            <!-- 正文区域 -->
            <section class="content"> <!-- .box-body -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h2 class="box-title">${user.name}(${user.id})</h2>
                    </div>


                    <div class="box-body">

                        <!-- 数据表格 -->
                        <div class="table-box">
                            <input type="hidden" name="userId" value="${user.id}">
                            <%--                        避免controller空参数问题--%>
                            <input type="hidden" name="oids" value=999>
                            <input type="hidden" name="pids" value=999>
                            <input type="hidden" name="mids" value="999">
                            <!--数据列表-->
                            <table id="dataList"
                                   class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th class="sorting_asc sorting_asc_disabled">序号</th>
                                    <th class="sorting_asc sorting_asc_disabled">ID</th>
                                    <th class="sorting_desc sorting_asc_disabled">岗位</th>
                                    <th class="sorting_asc sorting_asc_disabled">工段</th>
                                    <th class="sorting_asc sorting_asc_disabled">所属岗位</th>
                                    <th class="sorting_asc sorting_asc_disabled">管理岗位</th>
                                    <th class="sorting_asc sorting_asc_disabled">出题岗位</th>
                                </tr>
                                </thead>
                                <tbody>


                                <c:forEach items="${stationList}" var="station" varStatus="status">
                                    <tr>
                                            <%--											<td><input name="ids" type="checkbox"></td>--%>
                                        <td>${status.count }</td>
                                        <td>${station.id }</td>
                                        <td>${station.name }</td>
                                        <td>${station.section_id.name }</td>
                                        <td><input name="oids" type="checkbox"
                                                   value="${station.id}"  ${user.ownStationsId.contains(station.id)?'checked': 'unchecked'} >
                                        </td>
                                        <td><input name="pids" type="checkbox"
                                                   value="${station.id}"  ${user.powerStationsId.contains(station.id)?'checked': 'unchecked'} >
                                        </td>
                                        <td><input name="mids" type="checkbox"
                                                   value="${station.id}"  ${user.qmakerStationsId.contains(station.id)?'checked': 'unchecked'} >
                                        </td>


                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!--数据列表/-->
                            <!--工具栏-->
                            <div class="box-tools text-center">
                                <button type="submit" class="btn bg-maroon">保存</button>
                                <button type="button" class="btn bg-default"
                                        onclick="history.back(-1);">返回
                                </button>
                            </div>
                            <!--工具栏/-->
                        </div>
                        <!-- 数据表格 /-->

                    </div>
                    <!-- /.box-body -->

                </div>

            </section>
            <!-- 正文区域 /-->
        </form>
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

    $(document)
        .ready(
            function () {
                // $("#submit_btn").click(function () {
                //     buttonFnc.saveFnc2();
                // })

                // 激活导航位置
                setSidebarActive("admin-datalist");

                // 列表按钮
                $("#dataList td input[type='checkbox']")
                    .iCheck(
                        {
                            checkboxClass: 'icheckbox_square-blue',
                            increaseArea: '20%'
                        });
                //获取集合
                {
                    <%--value="${station.id}" ${user.ownStations.contains(station.id)?checked: ''--%>

                }

                // 全选操作
                $("#selall")
                    .click(
                        function () {
                            var clicks = $(this).is(
                                ':checked');
                            if (!clicks) {
                                $(
                                    "#dataList td input[type='checkbox']")
                                    .iCheck(
                                        "uncheck");
                            } else {
                                $(
                                    "#dataList td input[type='checkbox']")
                                    .iCheck("check");
                            }
                            $(this).data("clicks",
                                !clicks);
                        });
            });
</script>
</body>

</html>