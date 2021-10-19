<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>考试入口</title>
    <meta name="description" content="OnlineExamSystem">
    <meta name="keywords" content="OnlineExamSystem">


    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">

</head>
<style>
    .q-area .panel-heading{
        font-size: 20px;
        font-weight: bold;
    }
    .lbl-qtype{
        color:#5B9BD5;
    }
    .lbl-qscore{
        color:darkgray;
    }
    .q-card{
        border: solid 1px darkgray;
        color:darkgray;
        display: inline-block;
        padding: 0 6px;
        margin:2px 0;
    }
    .q-card:hover{
        background-color: lightgray;
    }
    .q-card a{
        text-decoration: none;
    }
    .question-title{
        font-size: 20px;
        font-weight: bold;
    }
    .input-in-label {
        margin:0 5px 0 0;
        display:inline-block
    }
</style>
<%--<style>--%>
<%--    .circleprogress {--%>
<%--        width: 160px;--%>
<%--        height: 160px;--%>
<%--        border: 20px solid red;--%>
<%--        border-radius: 50%;--%>
<%--    }--%>
<%--</style>--%>
<%--<link rel="stylesheet"  href="${pageContext.request.contextPath}/css/circle_timer.css">--%>

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
                考试 <small>考试列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li><a href="#">考试</a></li>
                <li class="active">考试列表</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <!-- .box-body -->
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">试卷：${quizExam.title}               岗位： ${quizExam.station.name}            类型： ${quizExam.type}          </h3>
                </div>

                <div class="box-body">
                    <div class="row">
<%--                        <iframe name="frmSubmit" frameborder="0" style="display: none"></iframe>--%>
                        <form id="quiz_form" action="update.php?type=qsubmit" method="POST" target="frmSubmit"  class="form-horizontal">
                            <input type="hidden" name="hid" id="hid" value="<?=$hid?>"/>
                            <input type="hidden" name="eid" id="eid" value="<?=$eid?>"/>
                            <input type="hidden" name="auto_eid" id="auto_eid" value="<?=$auto_eid?>"/>
                            <%-- 试题部分  --%>
                            <div class="col-md-10">
                                <c:forEach items="${questionLibs}" var="questionLib" varStatus="status">
                                    <div class="row q-area" id="${questionLib.qid}" >
<%--                                    <div class="row q-area" id="${questionLib.qtype.qtid}"+"_"+"${questionLib.qid}" >--%>
                                        <div class="col-md-12">
                                            <div class="panel panel-default">
                                                <%-- 试题标题  --%>
                                                <div class="panel-heading">
                                                    <div class="panel-title">
                                                        <span class="lbl-qtype">${status.count}.[${questionLib.qtype.name}题] </span>
                                                         ${questionLib.qns}
                                                        <span class="lbl-qscore">(${questionLib.score}分)</span>
                                                    </div>
                                                </div>
                                                 <%-- 试题内容  --%>
                                                <div class="panel-body">
                                                    <%-- 0、试题图片  --%>
                                                    <c:if test="${questionImgs.size()>0}">
                                                        <c:forEach items="${questionImgs}" var="questionImg" >
                                                            <c:if test="${questionImg.qid==questionLib.qid}">
                                                                <div><label class="question-title">配图</label></div>
                                                                <div class="col-md-12">
                                                                    <img src="${questionImg.image}" width="${questionImg.img_width}" height="${questionImg.img_height}">
                                                                </div>
                                                            </c:if>
                                                        </c:forEach>
                                                        <hr/>
                                                    </c:if>
                                                    <%-- 4、简答  --%>
                                                    <c:if test="${questionLib.qtype.qtid==4}">
                                                        <div class="row">
                                                            <button class="btn btn-info btn-xs" onclick="showDrawPanel(this);">绘图</button>
                                                        </div>
                                                        <div class="row op-area">
                                                            <div id="edit_${questionLib.qid}" class="col-md-12 ans-area" contenteditable="true"></div>
                                                        </div>
                                                    </c:if>
                                                    <%-- 5、判断  --%>
                                                    <c:if test="${questionLib.qtype.qtid==5}">
                                                        <div class="row op-area">
                                                            <c:if test="${optionList.size()>0}">
                                                                <c:forEach items="${optionList}" var="option">
                                                                    <c:if test="${option.qid== questionLib.qid}">
                                                                        <label class="input-in-label">
                                                                            <input type="radio" name="ans_${questionLib.qid}" id="ans_${questionLib.qid}" value="${option.optionid}"/>
                                                                            <span class="rdb-success ip-normal">${option.option}</span>
                                                                        </label>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:if>
                                                        </div>
                                                    </c:if>
                                                    <%-- 3、填空  --%>
                                                    <c:if test="${questionLib.qtype.qtid==3}">
                                                        <div class="input-group row">
                                                            <c:if test="${optionList.size()>0}">
                                                                <c:forEach items="${optionList}" var="option" varStatus="status">
                                                                    <c:if test="${option.qid== questionLib.qid}">
                                                                        <span class="input-group-addon">${status.count}</span>
                                                                        <input class="form-control" type="text" name="${option.option}"/>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:if>
                                                        </div>
                                                    </c:if>
                                                    <%-- 1.2 单选、多选：可能存在图片  --%>
                                                    <c:if test="${questionLib.qtype.qtid==1 ||questionLib.qtype.qtid==2 }">
                                                        <c:if test="${optionList.size()>0}">
                                                            <c:forEach items="${optionList}" var="option" varStatus="status">
                                                                <c:if test="${option.qid== questionLib.qid}">
                                                                    <%--存在图片,不显示选项内容  --%>
                                                                    <c:if test="${option.is_img==1}">
                                                                        <label class="input-in-label">
                                                                            <input type="${questionLib.qtype.qtid==1?'radio':'checkbox'} " name="ans_${questionLib.qid}" id="ans_${questionLib.qid}" value="${option.optionid}"/>
                                                                            <span class="${questionLib.qtype.qtid==1?'rdb':'chb'}-success ip-normal img-preview" style="background-image:url('${option.option}');background-repeat:no-repeat;width:'.${option.img_width}.'px;height:'.${option.img_height}.'px;"></span>
                                                                        </label>
                                                                    </c:if>
                                                                    <%--不存在图片  --%>
                                                                    <c:if test="${option.is_img!=1}">
                                                                        <label class="input-in-label">
                                                                            <input type="${questionLib.qtype.qtid==1? 'radio' : 'checkbox' }" name="ans_${questionLib.qid}" id="ans_${questionLib.qid}" value="${option.optionid}"/>
                                                                            <span class="${questionLib.qtype.qtid==1?'rdb':'chb'}-success ip-normal " >${option.option}</span>
                                                                        </label>
                                                                    </c:if>
                                                                </c:if>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:if>

                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </c:forEach>


                            </div>

                            <%-- 时间部分  --%>

                        </form>




                    </div>
                    <!-- 数据表格 -->
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