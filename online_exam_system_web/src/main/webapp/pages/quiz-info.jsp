<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>试卷详情</title>
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
    <!-- @@master = admin-layout.html-->
    <!-- @@block = content -->

    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                卷库 <small>试卷详情</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">卷库</a></li>
                <li class="active">试卷详情</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">列表</h3>
                </div>

                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">

                        <!--工具栏-->
                        <div class="pull-left">
                            <div class="form-group form-inline">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default" title="新建"
                                            onclick="location.href='${pageContext.request.contextPath}/pages/quiz-add.jsp'">
                                        <i class="fa fa-file-o"></i> 新建
                                    </button>
                                    <button type="button" class="btn btn-default" title="删除">
                                        <i class="fa fa-trash-o"></i> 删除
                                    </button>
                                    <button type="button" class="btn btn-default" title="开启">
                                        <i class="fa fa-check"></i> 开启
                                    </button>
                                    <button type="button" class="btn btn-default" title="屏蔽">
                                        <i class="fa fa-ban"></i> 屏蔽
                                    </button>
                                    <button type="button" class="btn btn-default" title="刷新">
                                        <i class="fa fa-refresh"></i> 刷新
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="box-tools pull-right">
                            <div class="has-feedback">
                                <input type="text" class="form-control input-sm"
                                       placeholder="搜索"> <span
                                    class="glyphicon glyphicon-search form-control-feedback"></span>
                            </div>
                        </div>
                        <!--工具栏/-->

                        <!--数据列表-->
                        <table id="dataList"
                               class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <%--										<th class="" style="padding-right: 0px;"><input--%>
                                <%--											id="selall" type="checkbox" class="icheckbox_square-blue">--%>
                                <%--										</th>--%>
                                <th class="sorting_asc">题目</th>
                                <th class="sorting">岗位</th>
                                <th class="sorting_desc">题型</th>
                                <th class="sorting_asc sorting_asc_disabled">分值</th>
                                <th class="sorting_desc sorting_desc_disabled">作者</th>
                                <th class="sorting_desc sorting_desc_disabled">导入文件</th>
                                <!-- radio -->
                                <%--										<div class="form-group">--%>
                                <%--											<div class="radio">--%>
                                <%--												<label>--%>
                                <%--													<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked="checked">--%>
                                <%--													Option one is this and that&mdash;be sure to include why it's great--%>
                                <%--												</label>--%>
                                <%--											</div>--%>
                                <%--											<div class="radio">--%>
                                <%--												<label>--%>
                                <%--													<input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">--%>
                                <%--													Option two can be something else and selecting it will deselect option one--%>
                                <%--												</label>--%>
                                <%--											</div>--%>
                                <%--											<div class="radio">--%>
                                <%--												<label>--%>
                                <%--													<input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled="disabled">--%>
                                <%--													Option three is disabled--%>
                                <%--												</label>--%>
                                <%--											</div>--%>
                                <%--										</div>--%>
                            </tr>
                            </thead>
                            <tbody>


                            <c:forEach items="${quizExam.question_libs}" var="questionlib">
                                <%--										title  station_id  time   type  pass_score   owner  is_random  closed--%>
                                <tr>
                                        <%--											<td><input name="ids" type="checkbox"></td>--%>
                                        <%--											<td>${questionLib.qns }</td>--%>
                                        <%--											<td>${questionLib.station.name }</td>--%>
                                        <%--											<td>${questionLib.qtype.name }</td>--%>
                                        <%--											<td>${questionLib.score }</td>--%>
                                        <%--											<td>${questionLib.owner.name }</td>--%>
                                        <%--											<td>${questionLib.filename }</td>	--%>
                                    <td>${questionlib.qns }</td>
                                    <td>${questionlib.station.name }</td>
                                    <td>${questionlib.qtype.name }</td>
                                    <td>${questionlib.score }</td>
                                    <td>${questionlib.owner.name }</td>
                                    <td>${questionlib.filename }</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <!--
                        <tfoot>
                        <tr>
                        <th>Rendering engine</th>
                        <th>Browser</th>
                        <th>Platform(s)</th>
                        <th>Engine version</th>
                        <th>CSS grade</th>
                        </tr>
                        </tfoot>-->
                        </table>
                        <!--数据列表/-->

                    </div>
                    <!-- 数据表格 /-->


                </div>
                <!-- /.box-body -->

                <!-- .box-footer-->
                <div class="box-footer">
                    <div class="pull-left">
                        <div class="form-group form-inline">
                            总共2 页，共14 条数据。 每页 <select class="form-control">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select> 条
                        </div>
                    </div>

                    <div class="box-tools pull-right">
                        <ul class="pagination">
                            <li><a href="#" aria-label="Previous">首页</a></li>
                            <li><a href="#">上一页</a></li>
                            <li><a href="#">1</a></li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#">5</a></li>
                            <li><a href="#">下一页</a></li>
                            <li><a href="#" aria-label="Next">尾页</a></li>
                        </ul>
                    </div>

                </div>
                <!-- /.box-footer-->


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


<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>--%>
<%--<script>--%>
<%--    $.widget.bridge('uibutton', $.ui.button);--%>
<%--</script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>--%>
<%--<script--%>
<%--        src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>--%>
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