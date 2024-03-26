<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- 데이트피커 { -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<!-- } -->

<link href="${pageContext.request.contextPath}/resources/css/message.css" rel="stylesheet" type="text/css">
</head>

<body id="page-top">

	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">쪽지</h1>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<div
					class="font-weight-bold text-primary py-1 mr-4 border-bottom-primary d-inline"
					id="received" onclick="selectFn(this)">받은 쪽지</div>
				<div class="font-weight-bold text-secondary py-1 d-inline" id="sent"
					onclick="selectFn(this)">보낸 쪽지</div>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="mb-3 col">
						<a href="write.do" class="btn btn-primary btn-icon-split">
							<span class="text"><i class="fas fa-pen"></i> 쪽지 쓰기</span>
						</a>
					</div>
					<div class="mb-3 col-auto">
						<select class="inp">
							<option>전체</option>
							<option>기획부</option>
							<option>인사부</option>
							<option>영업부</option>
						</select> <select class="inp">
							<option>전체</option>
							<option>사원</option>
							<option>팀장</option>
							<option>부장</option>
							<option>대표</option>
						</select> <input type="text" name="" value="" id="search" class="inp"
							placeholder="이름을 입력하세요.">
						<div class="d-inline px-2 py-2 bg-secondary" onclick=""
							style="cursor: pointer; border-radius: 5px;">
							<i class="fas fa-lg fa-search text-white"></i>
						</div>
					</div>
				</div>

				<div class="table-responsive">
					<table class="table table-bordered text-center received"
						id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th width="20%">보낸사람</th>
								<th width="60%">내용</th>
								<th width="20%">날짜</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div
										class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">기획부</div>
									<span class="text-dark font-weight-bold">김길동</span> <span
									class="text-xs font-weight-bold">부장</span>
								</td>
								<td><a class="text-dark font-weight-bold"
									data-toggle="modal" data-target="#messageModal" href="#">
										새로운 안읽은 메시지 </a> <span
									class="d-inline rounded-circle text-white text-center px-1 bg-danger text-xs">N</span>
								</td>
								<td>
									<div class="text-dark">2024-03-18 12:28</div>
								</td>
							</tr>
							<tr>
								<td>
									<div
										class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">인사부</div>
									<span class="text-dark font-weight-bold">홍길동</span> <span
									class="text-xs font-weight-bold">팀장</span>
								</td>
								<td><a class="text-dark font-weight-bold"
									href="signView.jsp">새로운 안읽은 메시지</a> <span
									class="d-inline rounded-circle text-white text-center px-1 bg-danger text-xs">N</span>
								</td>
								<td>
									<div class="text-dark">2024-03-18 12:28</div>
								</td>
							</tr>
							<tr>
								<td>
									<div
										class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">영업부</div>
									<span class="text-dark font-weight-bold">홍길옹</span> <span
									class="text-xs font-weight-bold">팀원</span>
								</td>
								<td><a class="text-dark font-weight-bold"
									href="signView.jsp">그냥 안읽은 메시지</a></td>
								<td>
									<div class="text-dark">2024-03-18 12:28</div>
								</td>
							</tr>
							<tr>
								<td>
									<div
										class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">영업부</div>
									<span class="text-dark font-weight-bold">홍길옹</span> <span
									class="text-xs font-weight-bold">팀원</span>
								</td>
								<td><a class="text-gray-700" href="signView.jsp">읽은 메시지</a>
								</td>
								<td>
									<div class="text-dark">2024-03-18 12:28</div>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table table-bordered text-center sent d-none"
						id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th width="15%">받은사람</th>
								<th width="45%">내용</th>
								<th width="15%">날짜</th>
								<th width="10%">수신여부</th>
								<th width="10%">발신취소</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<div
										class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">기획부</div>
									<span class="text-dark font-weight-bold">김길동</span> <span
									class="text-xs font-weight-bold">부장</span>
								</td>
								<td><a class="text-dark" href="signView.jsp">보낸 메시지</a></td>
								<td>
									<div class="text-dark">2024-03-18 12:28</div>
								</td>
								<td><span
									class="card d-inline text-danger py-1 px-2 border-danger font-weight-bold">읽지않음</span>
								</td>
								<td><a class="text-dark font-weight-bold"
									data-toggle="modal" data-target="#messageCancelModal" href="#"><i
										class="fas fa-fw fa-trash-alt"></i></a></td>
							</tr>
							<tr>
								<td>
									<div
										class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">인사부</div>
									<span class="text-dark font-weight-bold">홍길동</span> <span
									class="text-xs font-weight-bold">팀장</span>
								</td>
								<td><a class="text-dark" href="signView.jsp">보낸 메시지</a></td>
								<td>
									<div class="text-dark">2024-03-18 12:28</div>
								</td>
								<td><span
									class="card d-inline text-white py-1 px-4 bg-info font-weight-bold">읽음</span>
								</td>
								<td><i class="fas fa-fw fa-ban text-gray-500"></i></td>
							</tr>
							<tr>
								<td>
									<div
										class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">영업부</div>
									<span class="text-dark font-weight-bold">홍길옹</span> <span
									class="text-xs font-weight-bold">팀원</span>
								</td>
								<td><a class="text-dark" href="signView.jsp">보낸 메시지</a></td>
								<td>
									<div class="text-dark">2024-03-18 12:28</div>
								</td>
								<td><span
									class="card d-inline text-white py-1 px-4 bg-info font-weight-bold">읽음</span>
								</td>
								<td><i class="fas fa-fw fa-ban text-gray-500"></i></td>
							</tr>
							<tr>
								<td>
									<div
										class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">영업부</div>
									<span class="text-dark font-weight-bold">홍길옹</span> <span
									class="text-xs font-weight-bold">팀원</span>
								</td>
								<td><a class="text-dark" href="signView.jsp">보낸 메시지</a></td>
								<td>
									<div class="text-dark">2024-03-18 12:28</div>
								</td>
								<td><span
									class="card d-inline text-white py-1 px-4 bg-info font-weight-bold">읽음</span>
								</td>
								<td><i class="fas fa-fw fa-ban text-gray-500"></i></td>
							</tr>
							<tr>
								<td>
									<div
										class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">기획부</div>
									<span class="text-dark font-weight-bold">김길동</span> <span
									class="text-xs font-weight-bold">부장</span>
								</td>
								<td><a class="text-dark" href="signView.jsp">보낸 메시지</a></td>
								<td>
									<div class="text-dark">2024-03-18 12:28</div>
								</td>
								<td><span
									class="card d-inline text-danger py-1 px-2 border-danger font-weight-bold">읽지않음</span>
								</td>
								<td><i class="fas fa-fw fa-trash-alt"></i></td>
							</tr>
							<tr>
								<td>
									<div
										class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">기획부</div>
									<span class="text-dark font-weight-bold">김길동</span> <span
									class="text-xs font-weight-bold">부장</span>
								</td>
								<td><a class="text-dark" href="signView.jsp">보낸 메시지</a></td>
								<td>
									<div class="text-dark">2024-03-18 12:28</div>
								</td>
								<td><span
									class="card d-inline text-danger py-1 px-2 border-danger font-weight-bold">읽지않음</span>
								</td>
								<td><i class="fas fa-fw fa-trash-alt"></i></td>
							</tr>
							<tr>
								<td>
									<div
										class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">기획부</div>
									<span class="text-dark font-weight-bold">김길동</span> <span
									class="text-xs font-weight-bold">부장</span>
								</td>
								<td><a class="text-dark" href="signView.jsp">보낸 메시지</a></td>
								<td>
									<div class="text-dark">2024-03-18 12:28</div>
								</td>
								<td><span
									class="card d-inline text-danger py-1 px-2 border-danger font-weight-bold">읽지않음</span>
								</td>
								<td><i class="fas fa-fw fa-trash-alt"></i></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
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
							<span class="card border-primary px-2 d-inline text-primary">관리부</span><br>
							<span class="text-dark font-weight-bold">김아무개</span> <span
								class="text-xs font-weight-bold">관리자</span>
						</div>
						<div class="col-5">2024-03-18 16:08</div>
					</div>
					<div class="row m-3">
						<div
							class="col-12 card bg-gray-200 p-3 text-dark font-weight-bold messageContent">
							쪽지 내용입니다.</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">닫기</button>
					<a class="btn btn-primary" href="login.html">답장</a>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="messageCancelModal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
							<span class="card border-primary px-2 d-inline text-primary">관리부</span><br>
							<span class="text-dark font-weight-bold">김아무개</span> <span
								class="text-xs font-weight-bold">관리자</span>
						</div>
						<div class="col-5">2024-03-18 16:08</div>
					</div>
					<div class="row m-3">
						<div
							class="col-12 card bg-gray-200 p-3 text-dark font-weight-bold messageContent">
							쪽지 내용입니다.</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">닫기</button>
					<a class="btn btn-primary" href="login.html">발신취소</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 캘린더 옵션 { -->
	<script src="${pageContext.request.contextPath}/resources/js/calendar_noMin_noMax.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/message_main.js"></script>
	<%@ include file="../include/footer.jsp"%>