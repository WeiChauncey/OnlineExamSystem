<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>试题详情</title>
    <meta name="description" content="OnlineExamSystem">
    <meta name="keywords" content="OnlineExamSystem">

    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
            name="viewport">

<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/morris/morris.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/select2/select2.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/css/style.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">--%>
<%--    <link rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">--%>
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
                试题详情 <small>试题详情</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index.jsp"><i
                        class="fa fa-dashboard"></i> 首页</a></li>
                <li><a
                        href="${pageContext.request.contextPath}/user/findAll.do">题库</a></li>

                <li class="active" id="submit_btn">试题详情</li>
            </ol>
        </section>
        <!-- 内容头部 /-->
<%--        <form--%>
<%--                action="${pageContext.request.contextPath}/user/modifyStationByUser.do"--%>
<%--                method="post" onsubmit="return validateQAdd() ">--%>
            <!-- 正文区域 -->
            <section class="content"> <!-- .box-body -->
<%--                <div class="box box-primary">--%>
<%--                    <div class="box-header with-border">--%>
<%--                        <h2 class="box-title">${questionLib.station.section_id.name}(${questionLib.station.name})</h2>--%>
<%--                    </div>--%>


                    <div class="row">
<%--form提交后的结果在target指定的iframe里执行，而iframe已经隐藏了。这样提交后的效果就和无刷新的效果一样。--%>
                        <form name="qlib_add_form" action="${pageContext.request.contextPath}/question/modify1.do" method="POST" target="frmUpload"
                              onsubmit="return validateQAdd()">
                            <div class="col-md-12">
                                <input type="hidden" id="sid" name="sid" value="${questionLib.station.id}"/>
                                <input type="hidden" id="cur_qid" name="cur_qid" value="${questionLib.qid}"/>
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <div class="panel-title"
                                             style="border-left:5px solid orange;padding-left:10px;">${questionLib.station.section_id.name}
                                            -${questionLib.station.name}
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-6" id="d_left">
                                                <div id="opType" class="row">
                                                    <label class="col-md-2 question-title">题型</label>
                                                    <div class="col-md-10">
                                                        <c:forEach items="${questionTypeList}" var="questionType"><!--遍历试题类型，该试题类型勾选-->
                                                            <label class="input-in-label">
                                                                <input type="radio" name="qtype" id="qtype"
                                                                       value="${questionType.qtid}" ${questionType.qtid==questionLib.qtype.qtid?'checked': 'unchecked'}>
                                                                <span class="rdb-default ip-normal">${questionType.name}</span>
                                                            </label>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-md-2 question-title">分值</label>
                                                    <div class="col-md-10">
                                                        <input style="width:100%" type="number" name="qscore"
                                                               id="qscore" min="1" max="100"
                                                               value="${questionLib.score}"/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-md-2 question-title">题目</label>
                                                    <div class="col-md-10">
                                                        <input style="width:100%" type="text" name="qns" id="qns"
                                                               value="${questionLib.qns}"/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-md-2 question-title">配图</label>
                                                    <div class="col-md-10">
                                                        <input type="hidden" name="img_cnt" id="img_cnt"
                                                               value="${imageList.size()}"/>   <!--题目配图的数量-->
                                                        <span class="btn btn-success btn-xs op-btn"
                                                              onclick="showUploadMod(-1);">添加</span>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div id="imgDiv" class="col-md-12 clearfix"
                                                         style="border:1px solid darkgray;">
                                                        <!--遍历题目配图，如果配图尺寸大于100，则赋值100-->

                                                        <%--                                                        <div id="img<?=($c+1)?>" class="img-preview">--%>
                                                        <%--                                                            <input type="hidden" name="imgPath<?=($c+1)?>"--%>
                                                        <%--                                                                   id="imgPath<?=($c+1)?>" value="<?=$row['image']?>"/>--%>
                                                        <%--                                                            <input type="hidden" name="imgw<?=($c+1)?>"--%>
                                                        <%--                                                                   id="imgw<?=($c+1)?>" value="<?=$oriW?>"/>--%>
                                                        <%--                                                            <input type="hidden" name="imgh<?=($c+1)?>"--%>
                                                        <%--                                                                   id="imgh<?=($c+1)?>" value="<?=$oriH?>"/>--%>
                                                        <%--                                                            <span onclick="delImg(this);"><i--%>
                                                        <%--                                                                    class="fa fa-close"></i></span>--%>
                                                        <%--                                                        </div>--%>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 op-area">
                                                <div class="row" id="qt_pd"
                                                     style="${questionLib.qtype.qtid!=5?'display:none': ''}">
                                                    <!--类型5为判断题-->
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <label class="question-title">选项</label>
                                                        </div>
                                                        <div class="row">
                                                            <label class="input-in-label">
                                                                <input type="radio" name="as[]"   value="op_1" ${answerList[0].option=="正确"?'checked':''}/>
                                                                <span class="rdb-default ip-normal">正确</span>
                                                            </label>
                                                            <label class="input-in-label">
                                                                <input type="radio" name="as[]"  value="op_2" ${answerList[0].option=="错误"?'checked':''}/>
                                                                <span class="rdb-default ip-normal">错误</span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row" id="qt_other"
                                                     style="${questionLib.qtype.qtid==5?'display:none': ''}">
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <label class="question-title">选项</label>
                                                        </div>
                                                        <c:forEach items="${OptionList}" var="option" varStatus="status">

                                                            <!--
                                                            判断题radio：name ="as[]"
                                                            判断题 答案：value"op1,op2"

                                                            序号从1 开始
                                                            选择题     :name="optimg_"   value"${option.is_img}"
                                                            选择题     :name="opimgw_"   value"${option.img_width}"
                                                            选择题     :name="opimgh_"   value"${option.img_height}"
                                                            选项       :name="op_"       value '选项内容'
                                                            答案        name ="as[]"  value"op_${status.count }"
                                                           -->
                                                            <div class="row op-row">
                                                                <div class="col-md-12">
                                                                    <div class="input-group" id="oa_${option.qid}">
                                                                        <input type="hidden" name="opimg_${status.count }"
                                                                               id="opimg_${status.count }"
                                                                               value="${option.is_img}"/>
                                                                        <input type="hidden" name="opimgw_${status.count }"
                                                                               id="opimgw_${status.count }"
                                                                               value="${option.img_width}"/>
                                                                        <input type="hidden" name="opimgh_${status.count }"
                                                                               id="opimgh_${status.count }"
                                                                               value="${option.img_height}"/>
                                                                        <span class="input-group-addon">
                                                                            <input type="${questionLib.qtype.qtid==1?'radio': 'checkbox'}"
                                                                                   name="as[]"
                                                                                   id="as_${status.count }" value="op_${status.count }" ${option.optionid==answerList[0].optionid?'checked': ''} />
                                                                        </span>
                                                                        <input type="text" class="form-control"
                                                                               name="op_${status.count }" id="op_${status.count }"
                                                                               value="${option.option}"/>
                                                                        <span class="input-group-btn">
                                                                            <button type="button" class="btn btn-default"
                                                                                    onclick="showUploadMod(this);">图片</button>
                                                                            <button type="button" class="btn btn-warning"
                                                                                    onclick="removeOption(this);">移除</button>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <button type="button" onclick="addOption(this);"
                                                                        class="col-md-12 btn btn-default"><i
                                                                        class="fa fa-plus"></i></button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-footer text-right">
                                        <button class="btn btn-primary" onclick="saveQuestion();">保存</button>
                                        <a href="javascript:history.go(-1);" class="btn btn-default">返回</a>
                                    </div>
                                </div>
                        </form>
                    </div>
<%--                <iframe name="frmUpload" frameborder="0" style="display: none"></iframe>--%>
                <iframe name="frmUpload" frameborder="0" ></iframe>
                    <!-- 数据表格 -->
                    <div class="modal fade" tabindex="-1" role="dialog" id="mdUploadImg">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"><span>&times;</span>
                                    </button>
                                    <h4 class="modal-title">上传图片</h4>
                                </div>
                                <form action="fileupload" name="upload_form" method="post" target="frmUpload"
                                      enctype="multipart/form-data">
                                    <div class="modal-body">
                                        <input type="hidden" name="qid" id="qid"/>
                                        <input type="hidden" name="qindex" id="qindex"/>
                                        <input type="file" name="upload" id="file" value=""/><br/>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                        <button class="btn btn-primary" onclick="upload();">上传</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- 数据表格 /-->

<%--                </div>--%>
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

<%--<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>--%>
<%--<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>--%>
<%--<script>--%>
<%--    $.widget.bridge('uibutton', $.ui.button);--%>
<%--</script>--%>
<%--<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>--%>
<%--<script src="../plugins/raphael/raphael-min.js"></script>--%>
<%--<script src="../plugins/morris/morris.min.js"></script>--%>
<%--<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>--%>
<%--<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>--%>
<%--<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>--%>
<%--<script src="../plugins/knob/jquery.knob.js"></script>--%>
<%--<script src="../plugins/daterangepicker/moment.min.js"></script>--%>
<%--<script src="../plugins/daterangepicker/daterangepicker.js"></script>--%>
<%--<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>--%>
<%--<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>--%>
<%--<script--%>
<%--        src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>--%>
<%--<script--%>
<%--        src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>--%>
<%--<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>--%>
<%--<script src="../plugins/fastclick/fastclick.js"></script>--%>
<%--<script src="../plugins/iCheck/icheck.min.js"></script>--%>
<%--<script src="../plugins/adminLTE/js/app.min.js"></script>--%>
<%--<script src="../plugins/treeTable/jquery.treetable.js"></script>--%>
<%--<script src="../plugins/select2/select2.full.min.js"></script>--%>
<%--<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>--%>
<%--<script--%>
<%--        src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>--%>
<%--<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>--%>
<%--<script--%>
<%--        src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>--%>
<%--<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>--%>
<%--<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>--%>
<%--<script src="../plugins/ckeditor/ckeditor.js"></script>--%>
<%--<script src="../plugins/input-mask/jquery.inputmask.js"></script>--%>
<%--<script--%>
<%--        src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>--%>
<%--<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>--%>
<%--<script src="../plugins/datatables/jquery.dataTables.min.js"></script>--%>
<%--<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>--%>
<%--<script src="../plugins/chartjs/Chart.min.js"></script>--%>
<%--<script src="../plugins/flot/jquery.flot.min.js"></script>--%>
<%--<script src="../plugins/flot/jquery.flot.resize.min.js"></script>--%>
<%--<script src="../plugins/flot/jquery.flot.pie.min.js"></script>--%>
<%--<script src="../plugins/flot/jquery.flot.categories.min.js"></script>--%>
<%--<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>--%>
<%--<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>--%>
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

    function showUploadMod(i) {
        // document.getElementById('file').value="";
        // document.getElementById('qid').value=$('#cur_qid').val();
        // document.getElementById('qindex').value = i;
        var csModal = $('#mdUploadImg');
        csModal.modal('show');
    }

    function upload() {
        $("#upload_form").submit();
        var t = setInterval(function () {
            //获取iframe标签里body元素里的文字。即服务器响应过来的"上传成功"或"上传失败"
            var word = $("iframe[name='frmUpload']").contents().find("body").text();
            if (word != "") {
                var words = JSON.parse(word);
                switch (words['result']) {
                    case 'T':
                        addImgToDiv(words);
                        alert('上传成功！');
                        break;
                    case 'F':
                        alert('上传失败，' + words['msg']);
                        break;
                }
                clearInterval(t);   //清除定时器
                $("iframe[name='frmUpload']").contents().find("body").text('');//清空上次操作结果
                $('#mdUploadImg').modal('hide');
            }
        }, 500);
    }
    function removeOption(e){
        $(e).parents('div.op-row').remove();
    }
    function addOption(e){
        var opID;
        if($('#qt_other div.op-row').length==0){
            opID=1;
        }else{
            opID=parseInt($('#qt_other div.op-row:last div.input-group').attr('id').split('_')[1])+1;
        }
        var dom='';
        dom+='<div class="row op-row">';
        dom+='<div class="col-md-12">';
        dom+='<div class="input-group" id="oa_'+opID+'">';
        dom+='<input type="hidden" name="opimg_'+opID+'" id="opimg_'+opID+'" value="0"/>';
        dom+='<input type="hidden" name="opimgw_'+opID+'" id="opimgw_'+opID+'" value="0"/>';
        dom+='<input type="hidden" name="opimgh_'+opID+'" id="opimgh_'+opID+'" value="0"/>';
        dom+='<span class="input-group-addon">';
        dom+='<input type="radio" name="as[]" id="as_'+opID+'" value="op_'+opID+'" aria-label="..."/>';
        dom+='</span>';
        dom+='<input type="text" class="form-control" name="op_'+opID+'" id="op_'+opID+'" value=""/>';
        dom+='<span class="input-group-btn">';
        dom+='<button type="button" class="btn btn-default" onclick="showUploadMod(this);">图片</button>';
        dom+='<button type="button" class="btn btn-warning" onclick="removeOption(this);">移除</button>';
        dom+='</span>';
        dom+='</div>';
        dom+='</div>';
        dom+='</div>';
        $(dom).insertBefore('#qt_other div.row:last');
    }

    //先调拨form表单，提交数据。然后通过setInterval 以500毫秒为周期调用函数，查看iframe是否有值，alter后台信息
    function saveQuestion() {
        $('#qlib_add_form').submit();
        alert("操作成功");
        window.location = "${pageContext.request.contextPath}/question/findAll.do?page=1&size=30";

        var t = setInterval(function () {
            //获取iframe标签里body元素里的文字。即服务器响应过来的回复
            // var word = $("iframe[name='frmUpload']").contents().find("body").text();
            var iframeObj = $(window.frames["frmUpload"].document);
            var word=iframeObj.find("body").html();
            if (word != "") {
                var words = word.split(':');
                switch (words[0]) {
                    case 'T':
                        alert(words[1]);
                        break;
                    case 'F':
                        alert('失败:' + words[1]);
                        break;
                    default:
                        alert(word);
                        break;
                }
                clearInterval(t);   //清除定时器
                $("iframe[name='frmUpload']").contents().find("body").text('');
                // $('#mdUploadImg').modal('hide');
                <%--window.location = "${pageContext.request.contextPath}/question/findAll.do?page=1&size=30";--%>
            }
        }, 500);
    }
    function validateQAdd() {
        var qscore = parseInt(document.forms['qlib_add_form']['qscore'].value);
        if (qscore <= 0 || qscore > 100) {
            alert("试题分值必须大于0且小于或等于100!")
            return false;
        }
        var qns = $('#qns').val();
        if (qns.length == 0) {
            alert("请输入试题题目!");
            $('#qns').focus();
            return false;
        }
        var qtype = $('#opType :checked').val();
        if((qtype=='5' && $('#qt_pd :checked').length==0)
            || ((qtype=='1' || qtype=='2') && $('#qt_other :checked').length==0)){
            alert('请选择至少一个选项作为答案!');
            return false;
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