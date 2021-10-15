<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>


<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/img/avatar5.png"
                     class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><security:authentication property="principal.username"></security:authentication></p>
                <!-- 当前操作的对象principal -->
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>
            <li id="admin-index"><a
                    href="${pageContext.request.contextPath}/quiz/findExamByUser.do"><i
                    class="fa fa-university"></i> <span>考试</span></a></li>
            <li class="treeview"><a href="#"> <i class="fa fa-clock-o"></i>
                <span>历史#</span> <span class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
				</span>
            </a>
                <ul class="treeview-menu">

                    <li id="history-me"><a
                            href="#">
                        <i class="fa fa-circle-o"></i> 我的#
                    </a></li>
                    <li id="history-all"><a
                            href="#"> <i
                            class="fa fa-circle-o"></i> 考生#
                    </a></li>

                </ul>
            </li>
            <li class="treeview"><a href="#"> <i class="fa fa-folder-open"></i>
                <span>题库</span> <span class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
				</span>
            </a>
                <ul class="treeview-menu">

                    <li id="question-list"><a
                    						href="${pageContext.request.contextPath}/question/findAll.do?page=1&size=30">
                        <i class="fa fa-circle-o"></i> 试题列表
                    </a></li>
                    <li id="question-listtree"><a
                    <%--						href="${pageContext.request.contextPath}/question/findAll.do?page=1&size=6">--%>
                            href="${pageContext.request.contextPath}/manage/findSectionQuestionLib.do">
                        <i class="fa fa-circle-o"></i> 试题列表tree
                    </a></li>
                    <li id="question-add"><a
                            href="#"> <i
                            class="fa fa-circle-o"></i> 添加试题#
                    </a></li>

                </ul>
            </li>
            <li class="treeview"><a href="#"> <i class="fa fa-book"></i>
                <span>卷库</span> <span class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
				</span>
            </a>
                <ul class="treeview-menu">

                    <li id="quiz-list"><a
                            href="${pageContext.request.contextPath}/quiz/findAll.do">
                        <i class="fa fa-circle-o"></i> 试卷列表
                    </a></li>
                    <li id="quiz-add"><a
                            href="${pageContext.request.contextPath}/orders/findAll.do?page=1&pageSize=3"> <i
                            class="fa fa-circle-o"></i> 添加试卷#
                    </a></li>

                </ul>
            </li>
            <li id="admin-index"><a
                    href="#"><i
                    class="fa fa-balance-scale"></i> <span>批阅#</span></a></li>

            <li class="treeview"><a href="#"> <i class="fa fa-user"></i>
                <span>用户</span> <span class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
				</span>
            </a>
                <ul class="treeview-menu">

                    <li id="users-list"><a
                            href="${pageContext.request.contextPath}/user/findAll.do">
                        <i class="fa fa-circle-o"></i> 列表
                    </a></li>
                    <li id="users-add"><a
                            href="${pageContext.request.contextPath}/pages/user-add.jsp"> <i
                            class="fa fa-circle-o"></i> 添加
                    </a></li>

                </ul>
            </li>
            <li class="treeview"><a href="#"> <i class="fa fa-cube"></i>
                <span>管理</span> <span class="pull-right-container"> <i
                        class="fa fa-angle-left pull-right"></i>
				</span>
            </a>
                <ul class="treeview-menu">

                    <li id="manage-station">

                        <a
                                href="${pageContext.request.contextPath}/manage/findAllStation.do">
                            <i class="fa fa-circle-o"></i> 岗位
                        </a>

                    </li>
                    <li id="manage-section"><a
                            href="${pageContext.request.contextPath}/manage/findAllSection.do"> <i
                            class="fa fa-circle-o"></i> 工段
                    </a></li>

                </ul>
            </li>

            <security:authorize access="hasRole('ADMIN')"> <!-- 只有admin可以看到该界面 -->
                <li class="treeview"><a href="#"> <i class="fa fa-bar-chart-o"></i>
                    <span>报表#</span> <span class="pull-right-container"> <i
                            class="fa fa-angle-left pull-right"></i>
				</span>
                </a>
                    <ul class="treeview-menu">

                        <li id="report-user"><a
                                href="#">
                            <i class="fa fa-circle-o"></i> 考生成绩#
                        </a></li>
                        <li id="report-error"><a
                                href="#"> <i
                                class="fa fa-circle-o"></i> 错误统计#
                        </a></li>
                        <li id="report-certification"><a
                                href="#"> <i
                                class="fa fa-circle-o"></i> 认证资料#
                        </a></li>

                    </ul>
                </li>
            </security:authorize>

            <li id="admin-index"><a
                    href="${pageContext.request.contextPath}/sysLog/findAll.do"><i
                    class="fa fa-database"></i> <span>日志</span></a></li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script
        src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script
        src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
