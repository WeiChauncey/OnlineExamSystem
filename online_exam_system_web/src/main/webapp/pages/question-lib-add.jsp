<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>添加试题</title>
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
                产品管理 <small>产品表单</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i
                        class="fa fa-dashboard"></i> 首页</a></li>
                <li><a
                        href="${pageContext.request.contextPath}/quize/findAll.do">产品管理</a></li>
                <li class="active">产品表单</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <form action="${pageContext.request.contextPath}/quize/save.do"
              method="post">
            <!-- 正文区域 -->
            <section class="content"> <!--产品信息-->

                <div class="panel panel-default">
                    <div class="panel-heading">产品信息</div>
                    <div class="row data-type">
                        <%--						@Insert("INSERT INTO quiz(eid,title,station_id,time,type,owner,pass_score,is_random,retry)\n" +--%>
                        <%--						"            VALUE(#{eid},#{title},#{station_id},#{time},#{type},#{owner},#{pass_score},#{is_random},#{retry}) ")--%>
                        <%--						需要下拉框--%>
                        <div class="col-md-2 title">岗位</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="station_id"
                                   placeholder="岗位" value="">
                        </div>
                        <div class="col-md-2 title">试卷名称</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="title"
                                   placeholder="试卷名称" value="">
                        </div>

                        <div class="col-md-2 title">考试时间</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="time"
                                   placeholder="考试时间" value="">
                        </div>

                        <div class="col-md-2 title">及格分数</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" name="pass_score"
                                   placeholder="及格分数" value="">
                        </div>

                        <div class="col-md-2 title">考试类型</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" placeholder="考试类型"
                                   name="type" value="">
                        </div>
                        <div class="col-md-2 title">重考次数</div>
                        <div class="col-md-4 data">
                            <input type="text" class="form-control" placeholder="重考次数"
                                   name="retry" value="">
                        </div>

                        <div class="col-md-2 title">出题形式</div>
                        <div class="col-md-4 data">
                            <select class="form-control select2" style="width: 100%"
                                    name="is_random">
                                <option value="0" selected="selected">随机</option>
                                <option value="1">手动</option>
                            </select>
                        </div>

                        <div class="col-md-2 title rowHeight2x">其他信息</div>
                        <div class="col-md-10 data rowHeight2x">
							<textarea class="form-control" rows="3" placeholder="其他信息"
                                      name="productDesc"></textarea>
                        </div>

                    </div>
                </div>
                <!--订单信息/--> <!--工具栏-->
                <div class="box-tools text-center">
                    <button type="submit" class="btn bg-maroon">保存</button>
                    <button type="button" class="btn bg-default"
                            onclick="history.back(-1);">返回
                    </button>
                </div>
                <!--工具栏/-->
			</section>
            <!-- 正文区域 /-->
        </form>
    </div>
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
        $('#datepicker-a3').datetimepicker({
            format: "yyyy-mm-dd hh:ii",
            autoclose: true,
            todayBtn: true,
            language: "zh-CN"
        });
    });

    $(document).ready(function () {
        // 激活导航位置
        setSidebarActive("order-manage");
        $("#datepicker-a3").datetimepicker({
            format: "yyyy-mm-dd hh:ii",

        });

    });
</script>


</body>

</html>