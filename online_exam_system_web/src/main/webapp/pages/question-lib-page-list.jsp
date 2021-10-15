<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">




<title>题库列表</title>
<meta name="description" content="AdminLTE2定制版">
<meta name="keywords" content="AdminLTE2定制版">




<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">
</head>


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
					题库 <small>试题列表</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="#">题库</a></li>
					<li class="active">试题列表</li>
				</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content">

				<!-- .box-body -->
                <div class="row">

                        <div class="box box-primary">
                            <div class="box-header with-border">
                                <!--工具栏-->
                                <div >
                                    <div class="col-md-1 title">工段</div>
                                    <div class="col-md-4 data">
                                        <select class="form-control select2" style="width: 100%"
                                                name="is_random" id="sectionName">
                                        </select>
                                    </div>
                                    <div class="col-md-1 title">岗位</div>
                                    <div class="col-md-4 data">
                                        <select class="form-control select2" style="width: 100%"
                                                name="is_random" id="stationName">
                                        </select>
                                    </div>
                                    <div class="col-md-2 data">
                                        <button type="button" class="btn btn-default" title="查询">
                                            <i class="fa fa-search"></i> 查询
                                        </button>
                                    </div>
                                </div>

                                <!--工具栏/-->
                            </div>

                            <div class="box-body">

                                <!-- 数据表格 -->
                                <div class="table-box">


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


                                        <c:forEach items="${pageInfo.list}" var="questionLib" varStatus="status">
                                            <%--										title  station_id  time   type  pass_score   owner  is_random  closed--%>
                                            <tr>
                                                <td><input name="ids" type="checkbox"></td>
												<td>${status.count }</td>
                                                <td>${questionLib.qns }</td>
                                                <td>${questionLib.station.name }</td>
                                                <td>${questionLib.qtype.name }</td>
                                                <td>${questionLib.score }</td>
                                                <td>${questionLib.owner.name }</td>

                                                <td>${questionLib.filename }</td>
                                                <td class="text-center">
                                                    <button type="button" class="btn bg-olive btn-xs" onclick="location.href='${pageContext.request.contextPath}/question/findById.do?id=${questionLib.qid}'">修改</button>
                                                    <button type="button" class="btn bg-olive btn-xs"  onclick="delQuestion(${questionLib.qid})">删除</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>

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
										每页${pageInfo.pageSize} 条， 总共 ${pageInfo.pages} 页。
<%--										每页 <select class="form-control" id="changePageSize" value =${pageInfo.pageSize} onchange="changePageSize()">--%>
<%--                                        <option>5</option>--%>
<%--                                        <option>6</option>--%>
<%--                                        <option>7</option>--%>
<%--                                        <option>8</option>--%>
<%--                                    </select> 条--%>
                                    </div>
                                </div>

                                <div class="box-tools pull-right">
                                    <ul class="pagination">
                                        <%--								第一页，每页的数量--%>
                                        <li><a href="${pageContext.request.contextPath}/question/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
                                        <li><a href="${pageContext.request.contextPath}/question/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>

                                        <c:forEach begin="1" end="${pageInfo.pages>10?10:pageInfo.pages}" var="pageNum">
                                            <li><a href="${pageContext.request.contextPath}/question/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
                                        </c:forEach>
                                        <li><a href="${pageContext.request.contextPath}/question/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
                                        <%--	最后一页，每页的数量--%>
                                        <li><a href="${pageContext.request.contextPath}/question/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
                                    </ul>
                                </div>

                            </div>
                            <!-- /.box-footer-->



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
				href="http://www.itcast.cn">研究院研发部</a>.
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
		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
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
		function initStationBySection() {
			$.ajax({
				type:'POST',
				url:'${pageContext.request.contextPath}/manage/findAllSectionName.do',
				// data:{'username':username, 'password':password},
				datatype:'json',
				async:'false',// false代表等待ajax执行完毕后才执行alert("ajax执行完毕")语句;想一个Ajax执行完后再执行另一个Ajax, 需要把async=false
				success:function(data){
					$("#stationName").append("<option selected='selected'  value=0> </option>"); //显示空行
					var selectSectionId = $("#sectionName").val();
					for(var i=0;i<data.length;i++){  //第一层循环取到各个list
						var section = data[i];
						if (selectSectionId ==section.id){
							for (var j=0; j<section.stationList.length;j++){
								var station = section.stationList[j];
								$("#stationName").append("<option value="+ station.id + ">" + station.name +"</option>");
							}

						}

					}
				},
				error:function (data) {
					alert("error..........")
				}

			})
		}

		$("#sectionName").change(function () {
			initStationBySection()

		})

		$(document).ready(function() {

			// 激活导航位置
			setSidebarActive("admin-datalist");

			// 列表按钮 
			$("#dataList td input[type='checkbox']").iCheck({
				checkboxClass : 'icheckbox_square-blue',
				increaseArea : '20%'
			});

			// 全选操作 
			$("#selall").click(function() {
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
					type:'POST',
					url:'${pageContext.request.contextPath}/manage/findAllSectionName.do',
					// data:{'username':username, 'password':password},
					datatype:'json',
					async:'false',// false代表等待ajax执行完毕后才执行alert("ajax执行完毕")语句;想一个Ajax执行完后再执行另一个Ajax, 需要把async=false
					success:function(data){
						// alert(JSON.stringify(data));  //[{"id":5,"name":"管制口","stationList":[]}]
						// var outTrxObj=JSON.stringify(data);
						// alert(data);
						$("#sectionName").append("<option selected='selected'  value=0> </option>"); //显示空行
						for(var i=0;i<data.length;i++){  //第一层循环取到各个list
							var section = data[i];
							$("#sectionName").append("<option value="+ section.id + ">" + section.name +"</option>");
						}
					},
					error:function (data) {
						alert("error..........")
					}

				})
			}
			// 初始化部门信息
			initSection();



		});


		$(document).ready(function() {

			/*table tree*/
			$("#collapse-table").treetable({
				expandable: true
			});

		});
	</script>
</body>

</html>