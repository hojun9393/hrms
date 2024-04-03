<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/user.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">사원</h1>
	</div>

	<div class="card o-hidden border-0 shadow-lg">
		<div class="card-body p-0">
			<!-- Nested Row within Card Body -->
			<div class="row">
				<div class="col-12">
					<div class="px-5 pt-5">
						<div class="my-4">
							<h1 class="d-inline h4 text-gray-900 font-weight-bold">
							내 정보 수정
							</h1>
						</div>
						<hr>
					</div>
					<div class="row">
						<div class="col-lg-3 d-none d-lg-block"></div>
						<div class="col-lg-6">
							<div class="p-1 text-left">
								<form action="modify.do" method="post">
									<div class="row m-3">
										<div class="col-3 align-self-center">
										<span class="text-dark font-weight-bold">사원번호</span>
										</div>
										<input type="text" class="inp2" value="${loginUser.userid}" disabled>
									</div>
									<div class="row m-3">
										<div class="col-3 align-self-center">
										<span class="text-dark font-weight-bold">현재 비밀번호</span>
										</div>
										<input type="password" class="inp2" name="password">
									</div>
									<div class="row m-3">
										<div class="col-3 align-self-center">
										<span class="text-dark font-weight-bold">새 비밀번호</span>
										</div>
										<input type="password" class="inp2">
									</div>
									<div class="row m-3">
										<div class="col-3 align-self-center">
										<span class="text-dark font-weight-bold">새 비밀번호 확인</span>
										</div>
										<input type="password" class="inp2">
									</div>
									<div class="row m-3">
										<div class="col-3 align-self-center">
										<span class="text-dark font-weight-bold">연락처</span>
										</div>
										<input type="text" class="inp2" value="${loginUser.phoneNumber}">
									</div>
									<div class="row m-3">
										<div class="col-3 align-self-center">
										<span class="text-dark font-weight-bold">이메일</span>
										</div>
										<input type="text" class="inp2" value="${loginUser.email}">
									</div>
									<div class="row m-3">
										<div class="col-3 align-self-center">
										<span class="text-dark font-weight-bold">주소</span>
										</div>
										<input type="text" class="inp2" value="${loginUser.addr}">
									</div>
									<div class="row m-5">
										<div class="col-12 text-center">
											<a href="main.do" class="btn btn-secondary btn-user">뒤로가기</a> 
											<button type="submit" class="btn btn-primary btn-user">수정완료</button> 
										</div>
									</div>
								</form>
							</div>
						</div>
						<div class="col-lg-3 d-none d-lg-block"></div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../include/footer.jsp"%>