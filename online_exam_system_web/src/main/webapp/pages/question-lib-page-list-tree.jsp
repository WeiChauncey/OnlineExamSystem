<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>题库列表</title>
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
                题库 <small>试题列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="#">题库</a></li>
                <li class="active">试题列表</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="row">
                <%--left column--%>
                <div class="col-md-3">
                    <div class="box box-primary">
<%--                        <div class="box-header with-border">--%>
<%--                            <h3 class="box-title">岗位信息</h3>--%>
<%--                        </div>--%>

                        <div class="box-body">

                            <!-- 数据表格 -->
                            <div class="table-box">

                                <!--数据列表-->
                                <div class="tab-pane" id="tab-treetable">
                                    <table id="collapse-table"
                                           class="table table-bordered table-hover dataTable">
                                        <thead>
                                        <tr>
                                            <th>岗位信息</th>
                                        </tr>
                                        </thead>


                                        <c:forEach items="${sectionsList}" var="section" varStatus="sectionNo">
                                            <tr data-tt-id="${sectionNo.index+1}">   <!--sectionNo.index 从0开始-->
                                                <td colspan="1">${section.name}</td>      <!--显示列数-->
                                                <tbody>

                                                <c:forEach items="${stationList}" var="station"
                                                           varStatus="stationNo"> <!--岗位-->
                                                    <c:if test="${station.section_id.name == section.name}">
                                                        <tr data-tt-id=${sectionNo.index+1}${stationNo.index+1} data-tt-parent-id="${sectionNo.index+1}">
                                                            <td id="${station.id}"><span onclick="showQList(this)">${station.name}</span> </td>
                                                        </tr>
                                                    </c:if>


                                                </c:forEach>

                                                </tbody>
                                            </tr>
                                        </c:forEach> 
<%--                                        <c:forEach items="${sectionsList}" var="section" varStatus="sectionNo">--%>
<%--                                            <tr data-tt-id="${sectionNo.index+1}">   <!--sectionNo.index 从0开始-->--%>
<%--                                                <td colspan="1">${section.name}</td>      <!--显示列数-->--%>
<%--                                                <tbody>--%>

<%--                                                <c:forEach items="${section.stationList}" var="station"--%>
<%--                                                           varStatus="stationNo"> <!--岗位-->--%>

<%--                                                    <tr data-tt-id=${sectionNo.index+1}${stationNo.index+1} data-tt-parent-id="${sectionNo.index+1}">--%>
<%--                                                        <td id="${station.id}"><span onclick="showQList(this)">${station.name}</span> </td>--%>
<%--                                                    </tr>--%>
<%--                                                </c:forEach>--%>

<%--                                                </tbody>--%>
<%--                                            </tr>--%>
<%--                                        </c:forEach>--%>


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
                <div class="col-md-9">
                    <div class="box box-primary">
                        <div class="box-header with-border">
                            <!--工具栏-->
<%--                            <div>--%>
<%--                                <div class="col-md-1 title">工段</div>--%>
<%--                                <div class="col-md-4 data">--%>
<%--                                    <select class="form-control select2" style="width: 100%"--%>
<%--                                            name="is_random" id="sectionName">--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-1 title">岗位</div>--%>
<%--                                <div class="col-md-4 data">--%>
<%--                                    <select class="form-control select2" style="width: 100%"--%>
<%--                                            name="is_random" id="stationName">--%>
<%--                                    </select>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-2 data">--%>
<%--                                    <button type="button" class="btn btn-default" title="查询">--%>
<%--                                        <i class="fa fa-search"></i> 查询--%>
<%--                                    </button>--%>
<%--                                </div>--%>
<%--                            </div>--%>

                            <!--工具栏/-->
                        </div>

                        <div class="box-body">

                            <!-- 数据表格 -->
                            <div class="table-box">


                                <!--数据列表1-->
                                <table id="import-table" class="table table-striped table-bordered table-hover" width="100%"></table>
                                <!--数据列表1-->
                                <!--数据列表-->
                                <table id="dataList"
                                       class="table table-bordered table-striped table-hover dataTable">
                                    <thead>
                                    <tr>
                                        <th class="" style="padding-right: 0px;"><input
                                                id="selall" type="checkbox" class="icheckbox_square-blue">
                                        </th>
                                        <th class="sorting_asc sorting_asc_disabled">序号</th>
                                        <th class="sorting_asc sorting_asc_disabled">题目</th>
                                        <th class="sorting sorting_asc_disabled">岗位</th>
                                        <th class="sorting_desc sorting_asc_disabled">题型</th>
                                        <th class="sorting_asc sorting_asc_disabled">分值</th>
                                        <th class="sorting_desc sorting_desc_disabled">作者</th>
                                        <th class="sorting_desc sorting_desc_disabled">导入文件</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    <tr id="trtemplate" style="text-align: center; ">
                                        <td id="ids"></td>
                                        <td id="no"></td>
                                        <td id="qns"></td>
                                        <td id="station"></td>
                                        <td id="qtype"></td>
                                        <td id="score"> </td>
                                        <td id="owner"></td>
                                        <td id="filename"></td>
                                        <td id="function"></td>
                                    </tr>
<%--                                    <c:forEach items="${pageInfo.list}" var="questionLib">--%>
<%--                                        &lt;%&ndash;										title  station_id  time   type  pass_score   owner  is_random  closed&ndash;%&gt;--%>
<%--                                        <tr>--%>
<%--                                            <td><input name="ids" type="checkbox"></td>--%>
<%--                                            <td>${questionLib.qns }</td>--%>
<%--                                            <td>${questionLib.station.name }</td>--%>
<%--                                            <td>${questionLib.qtype.name }</td>--%>
<%--                                            <td>${questionLib.score }</td>--%>
<%--                                            <td>${questionLib.owner.name }</td>--%>

<%--                                            <td>${questionLib.filename }</td>--%>

<%--                                            <td class="text-center">--%>
<%--                                                <button type="button" class="btn bg-olive btn-xs"--%>
<%--                                                        onclick="location.href='${pageContext.request.contextPath}/question/findById.do?id=${questionLib.qid}'">--%>
<%--                                                    修改--%>
<%--                                                </button>--%>
<%--                                                <button type="button" class="btn bg-olive btn-xs">删除</button>--%>
<%--                                            </td>--%>
<%--                                        </tr>--%>
<%--                                    </c:forEach>--%>
                                    </tbody>

                                </table>
                                <!--数据列表/-->

                            </div>
                            <!-- 数据表格 /-->


                        </div>
                        <!-- /.box-body -->

                        <!-- .box-footer-->
<%--                        <div class="box-footer">--%>
<%--                            <div class="pull-left">--%>
<%--                                <div class="form-group form-inline">--%>
<%--                                    总共2 页，共14 条数据。 每页 <select class="form-control" id="changePageSize"--%>
<%--                                                              onchange="changePageSize()">--%>
<%--                                    <option>5</option>--%>
<%--                                    <option>6</option>--%>
<%--                                    <option>7</option>--%>
<%--                                    <option>8</option>--%>
<%--                                </select> 条--%>
<%--                                </div>--%>
<%--                            </div>--%>

<%--                            <div class="box-tools pull-right">--%>
<%--                                <ul class="pagination">--%>
<%--                                    &lt;%&ndash;								第一页，每页的数量&ndash;%&gt;--%>
<%--                                    <li>--%>
<%--                                        <a href="${pageContext.request.contextPath}/question/findAll.do?page=1&size=${pageInfo.pageSize}"--%>
<%--                                           aria-label="Previous">首页</a></li>--%>
<%--                                    <li>--%>
<%--                                        <a href="${pageContext.request.contextPath}/question/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a>--%>
<%--                                    </li>--%>

<%--                                    <c:forEach begin="1" end="${pageInfo.pages>10?10:pageInfo.pages}" var="pageNum">--%>
<%--                                        <li>--%>
<%--                                            <a href="${pageContext.request.contextPath}/question/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a>--%>
<%--                                        </li>--%>
<%--                                    </c:forEach>--%>
<%--                                    <li>--%>
<%--                                        <a href="${pageContext.request.contextPath}/question/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a>--%>
<%--                                    </li>--%>
<%--                                    &lt;%&ndash;	最后一页，每页的数量&ndash;%&gt;--%>
<%--                                    <li>--%>
<%--                                        <a href="${pageContext.request.contextPath}/question/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}"--%>
<%--                                           aria-label="Next">尾页</a></li>--%>
<%--                                </ul>--%>
<%--                            </div>--%>

<%--                        </div>--%>
                        <!-- /.box-footer-->


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

    function initStationBySection() {
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/manage/findAllSectionName.do',
            // data:{'username':username, 'password':password},
            datatype: 'json',
            async: 'false',// false代表等待ajax执行完毕后才执行alert("ajax执行完毕")语句;想一个Ajax执行完后再执行另一个Ajax, 需要把async=false
            success: function (data) {
                $("#stationName").append("<option selected='selected'  value=0> </option>"); //显示空行
                var selectSectionId = $("#sectionName").val();
                for (var i = 0; i < data.length; i++) {  //第一层循环取到各个list
                    var section = data[i];
                    if (selectSectionId == section.id) {
                        for (var j = 0; j < section.stationList.length; j++) {
                            var station = section.stationList[j];
                            $("#stationName").append("<option value=" + station.id + ">" + station.name + "</option>");
                        }

                    }

                }
            },
            error: function (data) {
                alert("error..........")
            }

        })
    }

    $("#sectionName").change(function () {
        initStationBySection()

    })
    function showQList(e){
        var station_id=$(e).parent().attr('id');
        // iniSearchArea(station_id);
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/question/findByStation.do',
            data:{'station_id':station_id, 'page':1,'size':1000},
            datatype: 'json',
            async: 'false',
            success: function (data) {
                debugger;
                $("#trtemplate").cleanData;
                var tr = $("#trtemplate");
                for (var i = 0; i < data.list.length; i++){
                    var item = data.list[i];
                    var items = tr.clone();
                    items.children("td").each(function (innerindex) {  <!--innerindex列序号，从0开始-->
                        switch (innerindex) {
                            case 0:
                                $(this).html("<input name=\"ids\" type=\"checkbox\">");
                                break;
                            case 1:
                                $(this).html(data.list.length-i);
                                break;
                            case 2:
                                $(this).html(item.qns);
                                break;
                            case 3:
                                $(this).html(item.station.name);
                                break;;
                            case 4:
                                $(this).html(item.qtype.name);
                                break;
                            case 5:
                                $(this).html(item.score);
                                break;
                            case 6:
                                $(this).html(item.owner.name);
                                break;
                            case 7:
                                $(this).html(item.filename);
                                break;
                            case 8:
                                $(this).html("                                            <td class=\"text-center\">\n" +
                                    "                                                <button type=\"button\" class=\"btn bg-olive btn-xs\"\n" +
                                    "                                                        onclick=\"location.href='${pageContext.request.contextPath}/question/findById.do?id=${questionLib.qid}'\">\n" +
                                    "                                                    修改\n" +
                                    "                                                </button>\n" +
                                    "                                                <button type=\"button\" class=\"btn bg-olive btn-xs\">删除</button>\n" +
                                    "                                            </td>");
                                break;
                        }

                    });
                    items.insertAfter(tr);
                }

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

        function initSection() {
            //ajax异常处理：controller加@ResponseBody注解；js使用JSON.stringify(data)解析
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/manage/findAllSectionName.do',
                // data:{'username':username, 'password':password},
                datatype: 'json',
                async: 'false',// false代表等待ajax执行完毕后才执行alert("ajax执行完毕")语句;想一个Ajax执行完后再执行另一个Ajax, 需要把async=false
                success: function (data) {
                    // alert(JSON.stringify(data));  //[{"id":5,"name":"管制口","stationList":[]}]
                    // var outTrxObj=JSON.stringify(data);
                    // alert(data);
                    $("#sectionName").append("<option selected='selected'  value=0> </option>"); //显示空行
                    for (var i = 0; i < data.length; i++) {  //第一层循环取到各个list
                        var section = data[i];
                        $("#sectionName").append("<option value=" + section.id + ">" + section.name + "</option>");
                    }
                },
                error: function (data) {
                    alert("error..........")
                }

            })
        }

        // 初始化部门信息
        initSection();

    });


</script>
</body>

</html>