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

    <!-- jqGrid组件基础样式包-必要 -->
    <link rel="stylesheet" href="../plugins/jqGrid/css/ui.jqgrid.css" />

    <!-- jqGrid主题包-非必要 -->
    <!-- 在jqgrid/css/css这个目录下还有其他的主题包，可以尝试更换看效果 -->
    <link rel="stylesheet" href="../plugins/jqGrid/css/css/redmond/jquery-ui-1.8.16.custom.css" />

    <!-- jquery插件包-必要 -->
    <!-- 这个是所有jquery插件的基础，首先第一个引入 -->
    <script type="text/javascript" src="../plugins/jqGrid/js/jquery-1.7.1.js"></script>

    <!-- jqGrid插件包-必要 -->
    <script type="text/javascript" src="../plugins/jqGrid/js/jquery.jqGrid.src.js"></script>

    <!-- jqGrid插件的多语言包-非必要 -->
    <!-- 在jqgrid/js/i18n下还有其他的多语言包，可以尝试更换看效果 -->
    <script type="text/javascript" src="../plugins/jqGrid/js/i18n/grid.locale-cn.js"></script>

    <!-- 本页面初始化用到的js包，创建jqGrid的代码就在里面 -->
<%--    <script type="text/javascript" src="../js/3_Question/question-lib-page-list-tree.js"></script>--%>

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
                            <input type="hidden" id="stationId" name="stationId">
                            <div>
                                <div class="col-md-1 title">题型</div>
                                <div class="col-md-2 data">
                                    <select class="form-control select2" style="width: 100%"
                                            name="d_qtype" id="d_qtype">
                                    </select>
                                </div>
                                <div class="col-md-1 title">分值</div>
                                <div class="col-md-2 data">
                                    <select class="form-control select2" style="width: 100%"
                                            name="d_score" id="d_score">
                                    </select>
                                </div>
                                <div class="col-md-1 title">来自</div>
                                <div class="col-md-2 data">
                                    <select class="form-control select2" style="width: 100%"
                                            name="d_from" id="d_from">
                                    </select>
                                </div>
                                <div class="col-md-3 data">
                                    <button class="btn btn-info btn-sm" onclick="addQuestion();">新建</button>
<%--                                    <button class="btn btn-danger btn-sm" onclick="delSelected();">删除</button>--%>
                                    <button class="btn btn-primary btn-sm" onclick="search();">查询</button>
                                </div>
                            </div>
<%--                            <div class="col-md-9" id="d_search">--%>
<%--                                <div class="col-md-4 data search-item">--%>
<%--                                    <label for="d_title">题目</label>--%>
<%--                                    <input type="text" id="d_title" placeholder="包含此关键字的题目">--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4 data search-item">--%>
<%--                                    <label for="d_qtype">题型</label>--%>
<%--                                    <select id="d_qtype" name="d_qtype" multiple></select>--%>
<%--                                </div>--%>
<%--                                <div class="col-md-4 data search-item">--%>
<%--                                    <label for="d_from">来自</label>--%>
<%--                                    <select id="d_from" name="d_from" multiple></select>--%>
<%--                                </div>--%>
<%--                                <div class="search-item">--%>
<%--                                    <label for="d_score">分值</label>--%>
<%--                                    <select id="d_score" name="d_score" multiple></select>--%>
<%--                                </div>--%>
<%--                                <div class="pull-right">--%>
<%--                                    <button class="btn btn-info btn-sm" onclick="addQuestion();">新建</button>--%>
<%--                                    <button class="btn btn-danger btn-sm" onclick="delSelected();">删除</button>--%>
<%--                                    <button class="btn btn-primary btn-sm" onclick="search();">查询</button>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                            <!--工具栏/-->
                        </div>

                        <div class="box-body">


                            <!-- 数据表格 -->
                            <div class="table-box">
                                <div>
                                    <table id="list2"></table>
                                    <div id="pager2"></div>
                                </div>


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
                                    <tbody id="tableListBody">

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

    <%--function initStationBySection() {--%>
    <%--    $.ajax({--%>
    <%--        type: 'POST',--%>
    <%--        url: '${pageContext.request.contextPath}/manage/findAllSectionName.do',--%>
    <%--        // data:{'username':username, 'password':password},--%>
    <%--        datatype: 'json',--%>
    <%--        async: 'false',// false代表等待ajax执行完毕后才执行alert("ajax执行完毕")语句;想一个Ajax执行完后再执行另一个Ajax, 需要把async=false--%>
    <%--        success: function (data) {--%>
    <%--            $("#stationName").append("<option selected='selected'  value=0> </option>"); //显示空行--%>
    <%--            var selectSectionId = $("#sectionName").val();--%>
    <%--            for (var i = 0; i < data.length; i++) {  //第一层循环取到各个list--%>
    <%--                var section = data[i];--%>
    <%--                if (selectSectionId == section.id) {--%>
    <%--                    for (var j = 0; j < section.stationList.length; j++) {--%>
    <%--                        var station = section.stationList[j];--%>
    <%--                        $("#stationName").append("<option value=" + station.id + ">" + station.name + "</option>");--%>
    <%--                    }--%>

    <%--                }--%>

    <%--            }--%>
    <%--        },--%>
    <%--        error: function (data) {--%>
    <%--            alert("error..........")--%>
    <%--        }--%>

    <%--    })--%>
    <%--}--%>

    <%--$("#sectionName").change(function () {--%>
    <%--    initStationBySection()--%>

    <%--})--%>
    function showQList(e){
        var station_id=$(e).parent().attr('id');
        $("#stationId").val("");
        $("#d_qtype").empty();
        $("#d_score").empty();
        $("#d_from").empty();
        // $("#dataList tbody ").remove();
        // $("#trtemplate").remove();

        iniSearchArea(station_id);
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/question/findByStation.do',
            data:{'station_id':station_id, 'page':1,'size':1000},
            datatype: 'json',
            async: 'false',
            success: function (data) {
                // debugger;
                //每次刷入数据前，先清空数据
                $("#tableListBody  tr:not(:first)").html("");
                //1,获取上面id为trtemplate的tr元素
                var tr = $("#trtemplate");
                for (var i = 0; i < data.list.length; i++){
                    var item = data.list[i];
                    var items = tr.clone();
                    //循环遍历trtemplate的每一个td元素，并赋值
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
                                $(this).html(data.list[i].station.name);
                                break;;
                            case 4:
                                $(this).html(data.list[i].qtype.name);
                                break;
                            case 5:
                                $(this).html(item.score);
                                break;
                            case 6:
                                $(this).html(data.list[i].owner.name);
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
                    //把克隆好的tr追加原来的tr后面
                    items.insertAfter(tr);
                }

            },
            error: function (data) {
                alert("error..........")
            }
        })

    }
    function iniSearchArea(station_id){
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/question/iniData.do',
            data:{'station_id':station_id},
            datatype: 'json',
            async: 'false',
            success: function (data) {
                $("#stationId").val(station_id);
                $("#d_qtype").append("<option selected='selected'  value=0> </option>"); //显示空行
                for (var i = 0; i < data.typeList.length; i++) {  //第一层循环取到各个list
                    var qtype = data.typeList[i];
                    $("#d_qtype").append("<option value=" + qtype.qtid + ">" + qtype.name + "</option>");
                }
                $("#d_score").append("<option selected='selected'  value=0> </option>"); //显示空行
                for (var i = 0; i < data.scoreList.length; i++) {  //第一层循环取到各个list
                    var score = data.scoreList[i];
                    $("#d_score").append("<option value=" + score + ">" + score + "</option>");
                }
                $("#d_from").append("<option selected='selected'  value=0> </option>"); //显示空行
                for (var i = 0; i < data.fileNameList.length; i++) {  //第一层循环取到各个list
                    var fromFileName = data.fileNameList[i];
                    $("#d_from").append("<option value=" + fromFileName + ">" + fromFileName + "</option>");
                }

            },
            error: function (data) {
                alert("error"+data);
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

        function search(){

        }
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
                    $("#d_from").append("<option selected='selected'  value=0> </option>"); //显示空行
                    for (var i = 0; i < data.length; i++) {  //第一层循环取到各个list
                        var fromFileName = data[i];
                        $("#d_from").append("<option value=" + fromFileName + ">" + fromFileName + "</option>");
                    }
                },
                error: function (data) {
                    alert("error..........")
                }

            })
        }

        <%--// 初始化部门信息--%>
        <%--initSection();--%>

    });


</script>
</body>

</html>