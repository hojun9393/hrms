<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
			<a class="nav-link" href="${pageContext.request.contextPath}/docu/main.do">
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
			<a class="nav-link" href="${pageContext.request.contextPath}/user/main.do"> 
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
							<c:if test="${fn:length(msgList) > 0}">
								<span class="badge badge-danger badge-counter" id="msgBadge">${fn:length(msgList)}</span>
							</c:if>
						</a> <!-- Dropdown - Messages -->
						<div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="messagesDropdown">
							<h6 class="dropdown-header">MESSAGE CENTER</h6>
							<c:if test="${fn:length(msgList) eq '0'}">
								<a class="dropdown-item align-items-center">
									<div class="font-weight-bold text-gray-500 text-center p-3">
										새로 받은 쪽지가 없습니다.
									</div>
								</a> 
							</c:if>
							<c:forEach items="${msgList}" var="vo">
								<a class="dropdown-item d-flex align-items-center" data-toggle="modal" data-target="#messageModalNav${vo.msgNo}" href="#" onclick="msgReadNavFn(${vo.msgRNo},this)" id="msgNav${vo.msgRNo}">
									<div class="dropdown-list-image mr-3">
										<img class="rounded-circle" src="${pageContext.request.contextPath}/resources/img/undraw_profile_1.svg" alt="...">
										<div class="status-indicator bg-success"></div>
									</div>
									<div class="font-weight-bold">
										<div class="text-truncate">
											${vo.content} 
										</div>
										<div class="small text-gray-500">${vo.dept} ${vo.name} ${vo.position}</div>
									</div>
								</a> 
							</c:forEach>
							<a class="dropdown-item text-center small text-gray-500" href="${pageContext.request.contextPath}/message/main.do">메시지 탭으로 이동</a>
						</div>
					</li>
	
					<div class="topbar-divider d-none d-sm-block"></div>
					<sec:authorize access="isAuthenticated()">
					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow">
						<a class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> 
							<span class="mr-2 d-none d-lg-inline text-gray-600 small">
								<sec:authentication property="principal.name"/> 
								<sec:authentication property="principal.positionCase"/> 
							</span>
							<img class="img-profile rounded-circle" src="${pageContext.request.contextPath}/resources/img/undraw_profile.svg">
						</a> 
						<!-- Dropdown - User Information -->
						<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="userDropdown">
							<a class="dropdown-item" href="#"> 
								<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 내 정보
							</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> 
								<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i> 로그아웃
							</a>
						</div>
					</li>
					</sec:authorize>
	
				</ul>
	
			</nav>
			
			<c:forEach items="${msgList}" var="vo">
				<div class="modal fade" id="messageModalNav${vo.msgNo}" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header bg-primary text-white">
								<h5 class="modal-title" id="exampleModalLabel">쪽지 읽기</h5>
								<button class="close" type="button" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true" class="text-white">x</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="row m-2">
									<div class="col-2 pr-0">
										<img class="img-profile rounded-circle"
											src="${pageContext.request.contextPath}/resources/img/undraw_profile.svg" width="50px">
									</div>
									<div class="col-5 pl-0">
										<span class="card border-primary px-2 d-inline text-primary">${vo.dept}</span><br>
										<span class="text-dark font-weight-bold">${vo.name}</span> <span
											class="text-xs font-weight-bold">${vo.position}</span>
									</div>
									<div class="col-5">${vo.sendDate}</div>
								</div>
								<div class="row m-3">
									<div
										class="col-12 card bg-gray-200 p-3 text-dark font-weight-bold messageContent" style="height:300px;">
										${vo.content}</div>
								</div>
							</div>
							<div class="modal-footer">
								<button class="btn btn-secondary" type="button"
									data-dismiss="modal">닫기</button>
								<form action="${pageContext.request.contextPath}/message/reply.do" method="post">
									<input type="hidden" name="sendUserId" value="${vo.userId}">
									<button type="submit" class="btn btn-primary">답장</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			
			<script>
			function msgReadNavFn(msgRNo, obj){
				$.ajax({
					url:"${pageContext.request.contextPath}/message/msgRead.do",
					data:{msgRNo:msgRNo},
					success:function(){
						let attr = $(obj).children().eq(1).attr('class');
						if(!attr == ""){
							$(obj).children().eq(1).attr('class', '');
							$('#msgBadge').html($('#msgBadge').html()-1);
							if($('#msgBadge').html() == 0){
								$('#msgBadge').remove();
							}
						}
					}
				});
			}
			</script>
			<!-- End of Topbar -->