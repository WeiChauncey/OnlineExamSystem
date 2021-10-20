<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>考试结果</title>
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
                考试 <small>考试结果</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li><a href="#">考试</a></li>
                <li class="active">考试结果</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">


                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="container">
                        <div class="row">
                            <div class="col-md-11">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <center>
                                            <h1 style="color:#660033"><font size=5>自动阅卷部分试题成绩:</font>${examResult.lastHistory.score}</h1>
                                        </center>
                                    </div>
                                    <c:if test="${examResult.remarkScore>0}">
                                        <table class="table table-striped table-hover" style="font-size:20px;font-weight:600;">
                                            <thead>
                                            <tr>
                                                <td>填空和简答<i class="fa fa-info"></i></td>
                                                <td>一共${examResult.remarkCount}道题目</td>
                                                <td>共${examResult.remarkScore}分</td>
                                                <td>待人工审阅后计入总分</td>
                                            </tr>
                                            </thead>
                                        </table>
                                    </c:if>



                                </div>
                            </div>
                        </div>
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