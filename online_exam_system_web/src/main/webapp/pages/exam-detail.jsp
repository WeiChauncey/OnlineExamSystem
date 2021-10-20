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
<link rel="stylesheet"    href="${pageContext.request.contextPath}/css/checkbox.css">
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


    /*先设置一个160x160的方块，然后我们在这里面完成我们的效果*/
    .circleProgress_wrapper {
        width: 160px;
        height: 160px;
        margin: 10px 0;
        position: relative;
    }
    /*这个容器里再放两个矩形，每个矩形都占一半*/
    .wrapper1 {
        width: 80px;
        height: 160px;
        position: absolute;
        top:0;
        overflow: hidden;
    }

    .right {
        right: 0;
    }

    .left {
        left: 0;
    }
    /*每个矩形中的半圆*/
    .circleProgress{
        width: 160px;
        height: 160px;
        border:20px solid #fff;
        border-radius: 50%;
        position: absolute;
        top:0;
        -webkit-transform: rotate(45deg);
        transform: rotate(45deg);
    }
    .rightcircle{
        border-top:20px solid green;
        border-right:20px solid green;
        right:0;
    }
    .leftcircle{
        border-bottom:20px solid green;
        border-left:20px solid green;
        left:0;
    }
    @-webkit-keyframes rcp{
        0%{
            border-top:20px solid green;
            border-right:20px solid green;
            -webkit-transform: rotate(45deg);
        }
        50%{
            border-top:20px solid rgb(232, 232, 12);
            border-right:20px solid rgb(232, 232, 12);
            -webkit-transform: rotate(225deg);
        }
        100%{-webkit-transform: rotate(225deg);}
    }
    @-webkit-keyframes lcp{
        0%{-webkit-transform: rotate(45deg);}
        50%{
            border-bottom:20px solid rgb(232, 232, 12);
            border-left:20px solid rgb(232, 232, 12);
            -webkit-transform: rotate(45deg);
        }
        100%{
            border-bottom:20px solid #ED1A1A;
            border-left:20px solid #ED1A1A;
            -webkit-transform: rotate(225deg);
        }
    }
    .timertext{
        width: 120px;
        height: 120px;
        line-height: 120px;
        text-align: center;
        font-size: 40px;
        background-color: #fff;
        border-radius: 50%;
        position: absolute;
        top:20px;
        left:20px;
    }
    /*前一半时间为绿色，后一半时间为黄色，考试时间到位红色*/
    @-webkit-keyframes ct{
        0%{color: #008800;}
        50%{color:rgb(232, 232, 12);}
        100%{color:#ED1A1A;}
    }


</style>

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
<%--                        <form id="quiz_form" action="${pageContext.request.contextPath}/exam/autoSubmit.do" method="POST" target="frmSubmit"  class="form-horizontal">--%>
                        <form id="quiz_form" action="${pageContext.request.contextPath}/exam/autoSubmit.do" method="POST"  class="form-horizontal">
                            <input type="hidden" name="hid" id="hid" value="${hid}"/>
                            <input type="hidden" name="eid" id="eid" value="${quizExam.eid}"/>
                            <input type="hidden" name="autoEid" id="autoEid" value="${autoEid}"/>
                            <%-- 试题部分  --%>
                            <div class="col-md-10">
                                <c:forEach items="${questionLibs}" var="questionLib" varStatus="status">
                                    <div class="row q-area" id="${questionLib.qtype.qtid}_${questionLib.qid}" >

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
                            <div class="col-md-2 fix-right" style="width:180px;">
                                <div class="row">
                                    <div class="col-md-12">
                                        <input type="hidden" name="endTime" id="endTime" value="${quizExam.time*60}">
                                        <div class="circleProgress_wrapper">
                                            <div class="wrapper1 right">
                                                <div class="circleProgress rightcircle" style="-webkit-animation: rcp ${quizExam.time*60}s linear;animation: rcp ${quizExam.time*60}s linear;"></div>
                                            </div>
                                            <div class="wrapper1 left">
                                                <div class="circleProgress leftcircle" style="-webkit-animation: lcp ${quizExam.time*60}s linear;animation: lcp ${quizExam.time*60}s linear;"></div>
                                            </div>
                                            <div id="lastTime" class="timertext" style="-webkit-animation: ct ${quizExam.time*60}s linear;animation: ct ${quizExam.time*60}s linear;">${quizExam.time*60}:00</div>
                                        </div>
                                        <button class="btn btn-success" style="width:100px;margin-left:30px;" onclick="submitQuiz();"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>&nbsp;交卷</button>
                                        <button class="btn btn-success" style="width:100px;margin-left:30px;" onclick="backgroundSubmit();"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>自动交卷</button>

                                        <script>
                                            // var sft=window.setInterval(function() {backgroundSubmit();},5000);
                                            window.setInterval(function() {quizTimer();},1000);
                                            setTimeout(function(){clearInterval(sft);submitQuiz();},${quizExam.time*60*1000} );
                                        </script>
                                    </div>
                                </div>

                                <div class="row" style="margin-top:10px;">
                                    <div class="col-md-12" style="text-align:center;font-weight:bold;">
                                        题卡
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12" style="text-align:center;">
                                        <c:forEach items="${questionLibs}" var="questionLib" varStatus="status">
                                            <div class="q-card">
                                                <a href="#${questionLib.qtype.qtid}_${questionLib.qid}">${status.count}</a>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>

                            </div>
                        </form>




                    </div>

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

    /**
     * 间隔1秒,自动更新考试倒计时时间
     */
    function quizTimer() {
        var endTime = parseInt($('#endTime')[0].value);
        endTime-=1;
        $('#endTime')[0].value=endTime;

        var dMin = parseInt(endTime / 60);
        var dSec = parseInt(endTime % 60);
        $('#lastTime')[0].innerText = dMin + ':' + dSec;
    }

    /**
     * 间隔5秒自动提交试卷
     */
    function backgroundSubmit() {
        $('#quiz_form').submit();
        //TODO 提交简答题
        <%--var hid=$('#hid').val(); //history table id--%>
        <%--var ansDivs=$('.ans-area');--%>
        <%--$.each(ansDivs,function(i,item){--%>
        <%--    var answer='';--%>
        <%--    if(item.innerHTML===undefined || item.innerHTML.length==0){--%>
        <%--    }else{--%>
        <%--        answer=item.innerHTML;--%>
        <%--    }--%>
        <%--    $.ajax({--%>
        <%--        type:'POST',--%>
        <%--        url: '${pageContext.request.contextPath}/exam/brifAnswer.do',--%>
        <%--        data: {--%>
        <%--            "hid": hid,--%>
        <%--            "answer":answer,--%>
        <%--            "qid":item.id.substr(5)--%>
        <%--        },--%>
        <%--        dataType:'text',--%>
        <%--        success:function(resp){--%>
        <%--            console.log(resp);--%>
        <%--        }--%>
        <%--    });--%>
        <%--});--%>
    }

    function chkEmptyAnswer(){
        var ar=true;
        $(".q-area").each(function(e){
            var r=true;
            var params=this.id.split("_");
            switch(params[0]){
                case "1":
                case "2":
                case "5":
                    if($(this).find('.panel-body :checked').length==0){
                        r=false;
                        ar=false;
                    }
                    break;
                case "3":
                    $(this).find("input").each(function(e){
                        if(this.value===undefined || this.value.length==0){
                            r=false;
                            ar=false;
                            return false;
                        }
                    });
                    break;
                case "4":
                    if($(this).find(".op-area > div").text().length==0){
                        r=false;
                        ar=false;
                    }
                    break;
            }
            if(r===false){
                $(this).find(".panel-default").removeClass("panel-default").addClass("panel-danger");
            }else{
                $(this).find(".panel-danger").removeClass("panel-danger").addClass("panel-default");
            }
        });
        return ar;
    }

    /**
     * 考试时间到，或者考生点击交卷时，进行提交试卷
     */
    function submitQuiz() {
        var r=chkEmptyAnswer();
        if(r===false){
            r=confirm("您还没做完所有题呢，一定要提交吗?")
            if(r==false){
                return;
            }
        }
        backgroundSubmit();
        <%--var t = setInterval(function () {--%>
        <%--    //获取iframe标签里body元素里的文字。即服务器响应过来的"上传成功"或"上传失败"--%>
        <%--    var word = $("iframe[name='frmSubmit']").contents().find("body").text();--%>
        <%--    if (word == "OK") {--%>
        <%--        clearInterval(t);   //清除定时器--%>
        <%--        var hid=$('#hid').val();--%>
        <%--        window.location = "${pageContext.request.contextPath}/exam/result.do?autoEid="+hid;--%>
        <%--    }--%>
        <%--}, 500);--%>
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