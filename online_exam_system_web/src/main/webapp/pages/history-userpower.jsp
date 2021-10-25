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


    <title>历史-考生</title>
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
                历史 <small>考生</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li><a href="#">历史</a></li>
                <li class="active">考生</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="row">
                <%--left column--%>
                <div class="col-md-4">
                    <div class="box box-primary">

                        <div class="box-body">

                            <!-- 数据表格 -->
                            <div class="table-box">

                                <!--数据列表-->
                                <div class="tab-pane" id="tab-treetable">
                                    <table id="collapse-table"
                                           class="table table-bordered table-hover dataTable">

                                        <c:forEach items="${powerStationList}" var="powerStation" varStatus="sectionNo">
                                            <tr data-tt-id="${sectionNo.index+1}">   <!--sectionNo.index 从0开始-->
                                                <td colspan="1">${powerStation.stationName}</td>      <!--显示列数-->
                                                <tbody>

                                                <c:forEach items="${powerStation.quizNameList}" var="stationQuiz"
                                                           varStatus="stationNo"> <!--岗位-->

                                                    <tr data-tt-id=${sectionNo.index+1}${stationNo.index+1} data-tt-parent-id="${sectionNo.index+1}">
                                                        <td id="${stationQuiz.eid}">
                                                            <span onclick="showQList(this)">${stationQuiz.title}
<%--                                                              <span class="badge"   onclick="clearHis(this);">清空</span>--%>
                                                            </span>
                                                        </td>
                                                    </tr>


                                                </c:forEach>

                                                </tbody>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                                <!--数据列表/-->

                            </div>
                            <!-- 数据表格 /-->

                        </div>
                        <!-- /.box-body -->
                    </div>
                </div>
                <%--right column--%>
                <div class="col-md-8">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <!--工具栏-->
                            <!--工具栏/-->
                        </div>

                        <div class="box-body">


                            <!-- 数据表格 -->
                            <div class="table-box">
                                <input type="hidden" id="quizId">


                                <!--数据列表1-->
                                <table id="import-table" class="table table-striped table-bordered table-hover"
                                       width="100%"></table>
                                <!--数据列表1-->
                                <!--数据列表-->
                                <table id="dataList"
                                       class="table table-bordered table-striped table-hover dataTable">
                                    <thead>
                                    <tr>

                                        <th class="sorting_asc sorting_asc_disabled">序号</th>
                                        <th class="sorting_asc sorting_asc_disabled">姓名</th>
                                        <th class="sorting_desc sorting_asc_disabled">考试时间</th>
                                        <th class="sorting_asc sorting_asc_disabled">总成绩</th>
                                        <th class="sorting_desc sorting_desc_disabled">及格分</th>
                                        <th class="sorting_desc sorting_desc_disabled">结果</th>
                                    </tr>
                                    </thead>
                                    <tbody id="tableListBody">

                                    <tr id="trtemplate" style="text-align: center; ">
                                        <td id="no"></td>
                                        <td id="name"></td>
                                        <td id="examTime"></td>
                                        <td id="totalScore"></td>
                                        <td id="passScore"></td>
                                        <td id="result"></td>
                                        <td id="function"></td>
                                    </tr>
                                    </tbody>

                                </table>
                                <!--数据列表/-->

                            </div>
                            <!-- 数据表格 /-->


                        </div>
                        <!-- /.box-body -->


                    </div>
                </div>
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

    function changePageSize() {
        //获取下拉框的值
        var pageSize = $("#changePageSize").val();

        //向服务器发送请求，改变没页显示条数
        location.href = "${pageContext.request.contextPath}/question/findAll.do?page=1&size="
            + pageSize;
    }

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    function showQList(e) {
        var eid = $(e).parent().attr('id');
        $("#quizId").val(eid);
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/history/findHistoryByEid.do',
            data: {'eid': eid},
            datatype: 'json',
            async: 'false',
            success: function (data) {
                // debugger;
                //每次刷入数据前，先清空数据
                $("#tableListBody  tr:not(:first)").html("");
                //1,获取上面id为trtemplate的tr元素
                var tr = $("#trtemplate");
                for (var i = 0; i < data.length; i++) {
                    var item = data[i];
                    var items = tr.clone();


                    //循环遍历trtemplate的每一个td元素，并赋值
                    items.children("td").each(function (innerindex) {  <!--innerindex列序号，从0开始-->
                        switch (innerindex) {
                            case 0:
                                $(this).html(data.length - i);
                                break;
                            case 1:
                                $(this).html(item.userName);
                                break;
                            case 2:
                                $(this).html(item.submit_timeStr);
                                break;
                            case 3:
                                $(this).html(item.userScore + item.remarkScore);
                                break;
                                ;
                            case 4:
                                $(this).html(item.pass_score);
                                break;
                            case 5:
                                $(this).html(" <td> <span class=\"label label-success\">" + item.examResult + "</span></td>");
                                break;
                            case 6:
                                $(this).html("   <td class=\"text-center\">\n" +
                                    <%--"      <button type=\"button\" class=\"btn bg-olive btn-xs\" onclick=\"location.href='${pageContext.request.contextPath}/question/findById.do?id="+item.qid+"'\">修改</button>\n" +--%>
                                    "      <button type=\"button\" class=\"btn bg-olive btn-xs\"  onclick=\"delQuestion(\'" + item.hid + "\')\">删除</button>\n" +
                                    "  </td>")

                                break;
                        }

                    });
                    //把克隆好的tr追加原来的tr后面
                    items.insertAfter(tr);
                }

            },
            error: function (data) {
                alert("error..........")
            }
        })

    }

    function showQListAuto(e) {
        eid = $("#quizId").val();
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/history/findHistoryByEid.do',
            data: {'eid': eid},
            datatype: 'json',
            async: 'false',
            success: function (data) {
                // debugger;
                //每次刷入数据前，先清空数据
                $("#tableListBody  tr:not(:first)").html("");
                //1,获取上面id为trtemplate的tr元素
                var tr = $("#trtemplate");
                for (var i = 0; i < data.length; i++) {
                    var item = data[i];
                    var items = tr.clone();


                    //循环遍历trtemplate的每一个td元素，并赋值
                    items.children("td").each(function (innerindex) {  <!--innerindex列序号，从0开始-->
                        switch (innerindex) {
                            case 0:
                                $(this).html(data.length - i);
                                break;
                            case 1:
                                $(this).html(item.userName);
                                break;
                            case 2:
                                $(this).html(item.submit_timeStr);
                                break;
                            case 3:
                                $(this).html(item.userScore + item.remarkScore);
                                break;
                                ;
                            case 4:
                                $(this).html(item.pass_score);
                                break;
                            case 5:
                                $(this).html(" <td> <span class=\"label label-success\">" + item.examResult + "</span></td>");
                                break;
                            case 6:
                                $(this).html("   <td class=\"text-center\">\n" +
                                    <%--"      <button type=\"button\" class=\"btn bg-olive btn-xs\" onclick=\"location.href='${pageContext.request.contextPath}/question/findById.do?id="+item.qid+"'\">修改</button>\n" +--%>
                                    "      <button type=\"button\" class=\"btn bg-olive btn-xs\"  onclick=\"delQuestion(\'" + item.hid + "\')\">删除</button>\n" +
                                    "  </td>")

                                break;
                        }

                    });
                    //把克隆好的tr追加原来的tr后面
                    items.insertAfter(tr);
                }

            },
            error: function (data) {
                alert("error..........")
            }
        })

    }

    function delQuestion(hid) {
        $.ajax({
            type: 'POST',
            data: {'hid': hid},
            url: '${pageContext.request.contextPath}/history/deleteHistoryById.do',
            datatype: 'json',
            async: 'false',
            success: function (data) {

                alert("success.........."),
                    showQListAuto();

            },
            error: function (data) {
                alert("error..........")
            }
        })
    }

    $(document).ready(function () {

        /*table tree*/
        $("#collapse-table").treetable({
            expandable: true
        });

        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });

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