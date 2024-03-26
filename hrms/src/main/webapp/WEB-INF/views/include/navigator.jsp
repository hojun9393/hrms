<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!-- Page Wrapper -->
<div id="wrapper">
	<!-- Sidebar -->
	<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	
		<!-- Sidebar - Brand -->
		<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.jsp">
			<div class="sidebar-brand-icon">
				<i class="fas fa-building"></i>
			</div>
			<div class="sidebar-brand-text mx-3">인사관리시스템</div>
		</a>
	
		<!-- Divider -->
		<hr class="sidebar-divider my-0">
	
		<!-- Nav Item - Dashboard -->
		<li class="nav-item ${ navSelected.equals('home') ? 'active' : '' }">
			<a class="nav-link" href="${pageContext.request.contextPath}">
				<i class="fas fa-fw fa-home"></i> 
				<span>홈</span>
			</a>
		</li>
		<li class="nav-item ${ navSelected.equals('work') ? 'active' : '' }">
			<a class="nav-link" href="${pageContext.request.contextPath}/work/main.do"> 
				<i class="fas fa-fw fa-briefcase"></i> 
				<span>근무</span>
			</a>
		</li>
		<li class="nav-item ${ navSelected.equals('vaca') ? 'active' : '' }">
			<a class="nav-link" href="${pageContext.request.contextPath}/vaca/main.do">
				<i class="fas fa-fw fa-plane"></i> 
				<span>연차</span>
			</a>
		</li>
		<li class="nav-item ${ navSelected.equals('docu') ? 'active' : '' }">
			<a class="nav-link" href="document_main.jsp">
				<i class="fas fa-fw fa-folder-open"></i> 
				<span>기안</span>
			</a>
		</li>
		<li class="nav-item ${ navSelected.equals('sign') ? 'active' : '' }">
			<a class="nav-link" href="${pageContext.request.contextPath}/sign/main.do"> 
				<i class="fas fa-fw fa-file-signature"></i> 
				<span>결재</span>
			</a>
		</li>
		<li class="nav-item ${ navSelected.equals('user') ? 'active' : '' }">
			<a class="nav-link" href="${pageContext.request.contextPath}/employee/main.do"> 
				<i class="fas fa-fw fa-users"></i> 
				<span>사원</span>
			</a>
		</li>
		<li class="nav-item ${ navSelected.equals('notice') ? 'active' : '' }">
			<a class="nav-link" href="${pageContext.request.contextPath}/notice/main.do"> 
				<i class="fas fa-fw fa-bullhorn"></i> 
				<span>공지</span>
			</a>
		</li>
	
		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">
	
		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>
	
	</ul>
	<!-- End of Sidebar -->
	
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">
	
		<!-- Main Content -->
		<div id="content">
	
			<!-- Topbar -->
			<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
	
				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">
	
					<!-- Nav Item - Alerts -->
					<li class="nav-item dropdown no-arrow mx-1">
						<a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 
							<i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
							<span class="badge badge-danger badge-counter">3+</span>
						</a> <!-- Dropdown - Alerts -->
						<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="alertsDropdown">
							<h6 class="dropdown-header">Alerts Center</h6>
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="mr-3">
									<div class="icon-circle bg-primary">
										<i class="fas fa-file-alt text-white"></i>
									</div>
								</div>
								<div>
									<div class="small text-gray-500">December 12, 2019</div>
									<span class="font-weight-bold">A new monthly report is ready to download!</span>
								</div>
							</a> 
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="mr-3">
									<div class="icon-circle bg-success">
										<i class="fas fa-donate text-white"></i>
									</div>
								</div>
								<div>
									<div class="small text-gray-500">December 7, 2019</div>
									$290.29 has been deposited into your account!
								</div>
							</a> 
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="mr-3">
									<div class="icon-circle bg-warning">
										<i class="fas fa-exclamation-triangle text-white"></i>
									</div>
								</div>
								<div>
									<div class="small text-gray-500">December 2, 2019</div>
									Spending Alert: We've noticed unusually high spending for your
									account.
								</div>
							</a> 
							<a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
						</div>
					</li>
	
					<!-- Nav Item - Messages -->
					<li class="nav-item dropdown no-arrow mx-1">
						<a class="nav-link dropdown-toggle" href="#" id="messagesDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 
							<i class="fas fa-envelope fa-fw"></i> <!-- Counter - Messages -->
							<span class="badge badge-danger badge-counter">7</span>
						</a> <!-- Dropdown - Messages -->
						<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="messagesDropdown">
							<h6 class="dropdown-header">MESSAGE CENTER</h6>
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/undraw_profile_1.svg" alt="...">
									<div class="status-indicator bg-success"></div>
								</div>
								<div class="font-weight-bold">
									<div class="text-truncate">
										Hi there! I am wondering if you can help me with a problem I've been having.
									</div>
									<div class="small text-gray-500">Emily Fowler Â· 58m</div>
								</div>
							</a> 
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/undraw_profile_2.svg" alt="...">
									<div class="status-indicator"></div>
								</div>
								<div>
									<div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
									<div class="small text-gray-500">Jae Chun Â· 1d</div>
								</div>
							</a> 
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/undraw_profile_3.svg" alt="...">
									<div class="status-indicator bg-warning"></div>
								</div>
								<div>
									<div class="text-truncate">
										Last month's report looks great, I am very happy with the progress so far, keep up the
										good work!
									</div>
									<div class="small text-gray-500">Morgan Alvarez Â· 2d</div>
								</div>
							</a> 
							<a class="dropdown-item d-flex align-items-center" href="#">
								<div class="dropdown-list-image mr-3">
									<img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="...">
									<div class="status-indicator bg-success"></div>
								</div>
								<div>
									<div class="text-truncate">
										Am I a good boy? The reason I ask is because someone told me that people say this to all
										dogs, even if they aren't good...
									</div>
									<div class="small text-gray-500">Chicken the Dog Â· 2w</div>
								</div>
							</a> 
							<a class="dropdown-item text-center small text-gray-500" href="${pageContext.request.contextPath}/message/main.do">메시지 탭으로 이동</a>
						</div>
					</li>
	
					<div class="topbar-divider d-none d-sm-block"></div>
	
					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow">
						<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 
							<span class="mr-2 d-none d-lg-inline text-gray-600 small">홍길동 부장</span>
							<img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/resources/img/undraw_profile.svg">
						</a> 
						<!-- Dropdown - User Information -->
						<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="userDropdown">
							<a class="dropdown-item" href="#"> 
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
							</a> 
							<a class="dropdown-item" href="#"> 
								<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i> Settings
							</a> 
							<a class="dropdown-item" href="#"> 
								<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> Activity Log
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> 
								<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> Logout
							</a>
						</div>
					</li>
	
				</ul>
	
			</nav>
			<!-- End of Topbar -->