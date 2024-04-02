<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>
<head>
	<!-- 데이트피커 { -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
	<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<!-- } -->
	
	<link href="${pageContext.request.contextPath}/resources/css/table.css" rel="stylesheet">
	<!-- 캘린더(데이트피커) 스타일 (jquery-ui.css 파일호출 보다 아래에 있어야 합니다.) { -->
	<link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/button.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/pagination.css" rel="stylesheet">
</head>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Content Row -->
	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 col-lg-12">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">
						<span class="menubar" onclick="displayFn(1)">내 기안</span> 
						<span class="menubar" onclick="displayFn(2)">부서 기안</span>
					</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div>
						2024-03-02 ~ 2024-03-13
						<i class="fas fa-calendar fa-2x text-gray-300" onclick="openModal()"></i>
						<a href="write.do" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm small float-right">
							<i class="fas fa-fw fa-briefcase"></i> 기안 작성
						</a>
					</div>
					<!-- 내 기안 -->
					<div id="menu1">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성일</th>
									<th>결재</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>4</td>
									<td>기안입니다</td>
									<td>2024-03-02</td>
									<td><span class="btn btn-light btn-gradient2 mini">대기</span></td>
								</tr>
								<tr>
									<td>3</td>
									<td>기안입니다</td>
									<td>2024-03-02</td>
									<td><span class="btn-gradient red mini">진행중</span></td>
								</tr>
								<tr>
									<td>2</td>
									<td>기안입니다</td>
									<td>2024-03-02</td>
									<td><span class="btn-gradient green mini">승인</span></td>
								</tr>
								<tr>
									<td>1</td>
									<td>기안입니다</td>
									<td>2024-03-02</td>
									<td><span class="btn-gradient mini btn-secondary">반려</span></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- 부서 기안 -->
					<div id="menu2" style="display:none;">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>4</td>
									<td>기안입니다</td>
									<td>
										<span class="d-inline card bg-info text-white text-center px-2">기획부</span>
										<span>이사원</span>
										<span class="text-xs font-weight-bold text-primary text-uppercase mb-1">사원</span>
									</td>
									<td>2024-03-02</td>
								</tr>
								<tr>
									<td>3</td>
									<td>기안입니다</td>
									<td>
										<span class="d-inline card bg-info text-white text-center px-2">기획부</span>
										<span>김팀장</span>
										<span class="text-xs font-weight-bold text-primary text-uppercase mb-1">팀장</span>
									</td>
									<td>2024-03-02</td>
								</tr>
								<tr>
									<td>2</td>
									<td>기안입니다</td>
									<td>
										<span class="d-inline card bg-info text-white text-center px-2">기획부</span>
										<span>김사원</span>
										<span class="text-xs font-weight-bold text-primary text-uppercase mb-1">사원</span>
									</td>
									<td>2024-03-02</td>
								</tr>
								<tr>
									<td>1</td>
									<td>기안입니다</td>
									<td>
										<span class="d-inline card bg-info text-white text-center px-2">기획부</span>
										<span>김사원</span>
										<span class="text-xs font-weight-bold text-primary text-uppercase mb-1">사원</span>
									</td>
									<td>2024-03-02</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					

				</div>
			</div>
		</div>
	</div>
</div>

<!-- End of Main Content -->
<script src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
<%@ include file="../include/footer.jsp"%>