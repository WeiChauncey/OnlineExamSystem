<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${pageContext.request.contextPath}/img/user2-160x160.jpg"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>xxx</p>
				<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
			</div>
		</div>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">菜单</li>
			<li id="admin-index"><a
				href="${pageContext.request.contextPath}/pages/main.jsp"><i
					class="fa fa-university"></i> <span>考试入库</span></a></li>

			<li class="treeview"><a href="#"> <i class="fa fa-cogs"></i>
					<span>系统管理old</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>


			</a>
				<ul class="treeview-menu">

					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/user/findAll.do"> <i
							class="fa fa-circle-o"></i> 用户管理
					</a></li>
					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/role/findAll.do"> <i
							class="fa fa-circle-o"></i> 角色管理
					</a></li>
					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/permission/findAll.do">
							<i class="fa fa-circle-o"></i> 资源权限管理
					</a></li>
					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/sysLog/findAll.do"> <i
							class="fa fa-circle-o"></i> 访问日志
					</a></li>
				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-clock-o"></i>
					<span>历史</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/question/findAll.do?page=1&size=6">
							<i class="fa fa-circle-o"></i> 我的
					</a></li>
					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/orders/findAll.do?page=1&pageSize=3"> <i
							class="fa fa-circle-o"></i> 考生
					</a></li>

				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-folder-open"></i>
					<span>题库</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/question/findAll.do?page=1&size=6">
							<i class="fa fa-circle-o"></i> 试题列表
					</a></li>
					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/orders/findAll.do?page=1&pageSize=3"> <i
							class="fa fa-circle-o"></i> 添加试题
					</a></li>

				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-book"></i>
					<span>卷库</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/quiz/findAll.do">
							<i class="fa fa-circle-o"></i> 试卷列表
					</a></li>
					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/orders/findAll.do?page=1&pageSize=3"> <i
							class="fa fa-circle-o"></i> 添加试卷
					</a></li>

				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-user"></i>
					<span>用户</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/user/findAll.do">
							<i class="fa fa-circle-o"></i> 列表_OK
					</a></li>
					<li id="system-setting"><a
						href="${pageContext.request.contextPath}/pages/user-add.jsp"> <i
							class="fa fa-circle-o"></i> 添加_OK
					</a></li>

				</ul></li>
			<li class="treeview"><a href="#"> <i class="fa fa-cube"></i>
					<span>设置</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<li id="manage-station"><a
						href="${pageContext.request.contextPath}/manage/findAllStation.do">
							<i class="fa fa-circle-o"></i> 岗位
					</a></li>
					<li id="manage-section"><a
						href="${pageContext.request.contextPath}/manage/findAllSection.do"> <i
							class="fa fa-circle-o"></i> 工段
					</a></li>

				</ul></li>
		<li class="treeview"><a href="#"> <i class="fa fa-bar-chart-o"></i>
					<span>报表</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
				<ul class="treeview-menu">

					<li id="manage-station"><a
						href="${pageContext.request.contextPath}/manage/findAllStation.do">
							<i class="fa fa-circle-o"></i> 考生成绩
					</a></li>
					<li id="manage-section"><a
						href="${pageContext.request.contextPath}/manage/findAllSection.do"> <i
							class="fa fa-circle-o"></i> 错误统计
					</a></li>
					<li id="manage-section"><a
						href="${pageContext.request.contextPath}/manage/findAllSection.do"> <i
							class="fa fa-circle-o"></i> 认证资料
					</a></li>

				</ul></li>

		</ul>
	</section>
	<!-- /.sidebar -->
</aside>