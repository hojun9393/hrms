<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!-- 데이트피커 { -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
	<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<!-- } -->
	
	<!-- 캘린더(데이트피커) 스타일 (jquery-ui.css 파일호출 보다 아래에 있어야 합니다.) { -->
	<link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet">
</head>
<body id="page-top">
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">결재</h1>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<div class="font-weight-bold text-primary py-1 mr-4 border-bottom-primary d-inline" id="docu" onclick="selectFn(this)">
					기안 0건
				</div>
				<div class="font-weight-bold text-secondary py-1 mr-4 d-inline" id="vaca" onclick="selectFn(this)">
					연차 3건
				</div>
				<div class="font-weight-bold text-secondary py-1 d-inline" id="over" onclick="selectFn(this)">
					초과근무 2건
				</div>
			</div>
			<div class="card-body">
				<div class="row">
					<!--datepicker{ -->
					<div class="mb-3 col">
						<input type="text" name="" value="" id="startDate" class="datepicker inp" placeholder="시작일 선택" readonly="true">
						<i class="fas fa-lg fa-calendar" onclick="iClickFn(startDate)"
							style="cursor: pointer;"></i> ~ <input type="text" name=""
							value="" id="endDate" class="datepicker inp" placeholder="종료일 선택"
							readonly="true"> <i class="fas fa-lg fa-calendar"
							onclick="iClickFn(endDate)" style="cursor: pointer;"></i>
					</div>
					<!-- } -->

					<div class="mb-3 col-auto">
						<select class="inp">
							<option>전체</option>
							<option>승인 완료</option>
							<option>반려</option>
							<option>결재 대기</option>
						</select> 
						<input type="text" name="" value="" id="search" class="inp" placeholder="이름을 입력하세요.">
						<div class="d-inline px-2 py-2 bg-secondary" onclick="" style="cursor: pointer; border-radius: 5px;">
							<i class="fas fa-lg fa-search text-white"></i>
						</div>
					</div>
				</div>				

				<div class="table-responsive">
					<table class="table table-bordered text-center docuTable" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th width="20%">작성자</th>
								<th width="40%">제목</th>
								<th width="20%">작성일</th>
								<th width="20%">결재상태</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list.docVO}" var="vo">
					 			<tr>
									<td>
										<c:choose>
											<c:when test="${vo.dept eq 'M'}">
												<div class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">관리부</div>
											</c:when>
											<c:when test="${vo.dept eq 'D'}">
												<div class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">개발부</div>
											</c:when>
											<c:when test="${vo.dept eq 'S'}">
												<div class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">영업부</div>
											</c:when>
											<c:when test="${vo.dept eq 'P'}">
												<div class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">기획부</div>
											</c:when>
											<c:when test="${vo.dept eq 'H'}">
												<div class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">인사부</div>
											</c:when>
											<c:otherwise>
												<div class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">부서미정</div>
											</c:otherwise>
										</c:choose>
										<span class="text-dark font-weight-bold">${vo.name}</span> 
										<c:choose>
											<c:when test="${vo.position eq 'A'}">
												<span class="text-xs font-weight-bold">관리자</span>
											</c:when>
											<c:when test="${vo.position eq 'C'}">
												<span class="text-xs font-weight-bold">대표</span>
											</c:when>
											<c:when test="${vo.position eq 'D'}">
												<span class="text-xs font-weight-bold">부장</span>
											</c:when>
											<c:when test="${vo.position eq 'L'}">
												<span class="text-xs font-weight-bold">팀장</span>
											</c:when>
											<c:when test="${vo.position eq 'E'}">
												<span class="text-xs font-weight-bold">사원</span>
											</c:when>
											<c:otherwise>
												<span class="text-xs font-weight-bold">직급미정</span>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:choose>
											<c:when test="${vo.position eq 'A'}">
												<div class="d-inline card text-white text-center px-2 mr-1 bg-info"></div>
											</c:when>
											<c:when test="${vo.position eq 'C'}">
												<div class="d-inline card text-white text-center px-2 mr-1 bg-info"></div>
											</c:when>
											<c:when test="${vo.position eq 'D'}">
												<div class="d-inline card text-white text-center px-2 mr-1 bg-info"></div>
											</c:when>
											<c:when test="${vo.position eq 'L'}">
												<div class="d-inline card text-white text-center px-2 mr-1 bg-info"></div>
											</c:when>
											<c:when test="${vo.position eq 'E'}">
												<div class="d-inline card text-white text-center px-2 mr-1 bg-info"></div>
											</c:when>
											<c:otherwise>
												<div class="d-inline card text-white text-center px-2 mr-1 bg-info"></div>
											</c:otherwise>
										</c:choose>
										<a href="view.do">AccountantAccountantAccountant</a>
									</td>
									<td>
										<div class="text-dark">${vo.date}</div>
									</td>
									<td>
										<div class="d-inline card bg-info text-white text-center px-3 py-1">승인 완료</div>
									</td>
								</tr>
					 		</c:forEach>
							<tr>
								<td>
									<div class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">기획부</div>
									<span class="text-dark font-weight-bold">김길동</span> 
									<span class="text-xs font-weight-bold">부장</span>
								</td>
								<td>
									<div class="d-inline card text-white text-center px-2 mr-1 bg-info">승인</div>
									<a href="view.do">AccountantAccountantAccountant</a>
								</td>
								<td>
									<div class="text-dark">2024-03-18</div>
								</td>
								<td>
									<div class="d-inline card bg-info text-white text-center px-3 py-1">승인 완료</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">인사부</div>
									<span class="text-dark font-weight-bold">홍길동</span> 
									<span class="text-xs font-weight-bold">팀장</span>
								</td>
								<td>
									<div class="d-inline card text-danger text-center px-2 mr-1 border-danger font-weight-bold">진행</div>
									AccountantAccountantAccountant
								</td>
								<td>
									<div class="text-dark">2024-03-18</div>
								</td>
								<td>
									<div class="d-inline card bg-danger text-white text-center px-3 py-1">
										<i class="fas fa-fw fa-file-signature"> </i>결재 대기
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<div class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">영업부</div>
									<span class="text-dark font-weight-bold">홍길옹</span> 
									<span class="text-xs font-weight-bold">팀원</span>
								</td>
								<td>
									<div class="d-inline card text-white text-center px-2 mr-1 bg-dark">반려</div>
									AccountantAccountantAccountant
								</td>
								<td>
									<div class="text-dark">2024-03-18</div>
								</td>
								<td>
									<div class="d-inline card bg-dark text-white text-center px-4 py-1">반려</div>
								</td>
							</tr>
							<tr>
								<td>Cedric Kelly</td>
								<td>Senior Javascript Developer</td>
								<td>Edinburgh</td>
								<td>22</td>
							</tr>
							<tr>
								<td>Paul Byrd</td>
								<td>Chief Financial Officer (CFO)</td>
								<td>New York</td>
								<td>64</td>
							</tr>
							<tr>
								<td>Gloria Little</td>
								<td>Systems Administrator</td>
								<td>New York</td>
								<td>59</td>
							</tr>
							<tr>
								<td>Donna Snider</td>
								<td>Customer Support</td>
								<td>New York</td>
								<td>27</td>
							</tr>
						</tbody>
					</table>
					<table class="table table-bordered text-center vacaTable d-none" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th width="20%">작성자</th>
								<th width="40%">제목</th>
								<th width="20%">작성일</th>
								<th width="20%">결재상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">기획부</div>
									<span class="text-dark font-weight-bold">홍길동</span> 
									<span class="text-xs font-weight-bold">팀장</span>
								</td>
								<td>System Architect</td>
								<td>Edinburgh</td>
								<td>
									<div class="d-inline card bg-info text-white text-center px-3 py-1">승인 완료</div>
								</td>
							</tr>
							<tr>
								<td>Garrett Winters</td>
								<td>Accountant</td>
								<td>Tokyo</td>
								<td>
									<div class="d-inline card bg-danger text-white text-center px-3 py-1">
										<i class="fas fa-fw fa-file-signature"> </i>결재 대기
									</div>
								</td>
							</tr>
							<tr>
								<td>Ashton Cox</td>
								<td>Junior Technical Author</td>
								<td>San Francisco</td>
								<td>
									<div class="d-inline card bg-secondary text-white text-center px-4 py-1">반려</div>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table table-bordered text-center overTable d-none" id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th width="20%">작성자</th>
								<th width="40%">제목</th>
								<th width="20%">작성일</th>
								<th width="20%">결재상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">기획부</div>
									<span class="text-dark font-weight-bold">홍길동</span> 
									<span class="text-xs font-weight-bold">팀장</span>
								</td>
								<td>System Architect</td>
								<td>Edinburgh</td>
								<td>
									<div class="d-inline card bg-info text-white text-center px-3 py-1">승인 완료</div>
								</td>
							</tr>
							<tr>
								<td>Garrett Winters</td>
								<td>Accountant</td>
								<td>Tokyo</td>
								<td>
									<div class="d-inline card bg-danger text-white text-center px-3 py-1">
										<i class="fas fa-fw fa-file-signature"> </i>결재 대기
									</div>
								</td>
							</tr>
							<tr>
								<td>Ashton Cox</td>
								<td>Junior Technical Author</td>
								<td>San Francisco</td>
								<td>
									<div class="d-inline card bg-secondary text-white text-center px-4 py-1">반려</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
<!-- 캘린더 옵션 { -->
<script src="${pageContext.request.contextPath}/resources/js/calendar2.js"></script>
<!-- /.container-fluid -->
<script src="${pageContext.request.contextPath}/resources/js/sign_main.js"></script>
<%@ include file="../include/footer.jsp"%>