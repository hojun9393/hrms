<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>
<link href="css/sign_view.css" rel="stylesheet">

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">결재</h1>
	</div>

	<div class="card o-hidden border-0 shadow-lg">
		<div class="card-body p-0">
			<!-- Nested Row within Card Body -->
			<div class="row">
				<div class="col-9">
					<div class="py-5 pl-5">
						<div class="my-4">
							<span class="d-inline bg-primary card text-white py-1 px-3">초과근무</span>
							<h1 class="d-inline h4 text-gray-900 font-weight-bold">
								<c:choose>
									<c:when test="${vo.dept eq 'M'}">
										[관리부]${vo.name}
									</c:when>
									<c:when test="${vo.dept eq 'D'}">
										[개발부]${vo.name}
									</c:when>
									<c:when test="${vo.dept eq 'S'}">
										[영업부]${vo.name}
									</c:when>
									<c:when test="${vo.dept eq 'P'}">
										[기획부]${vo.name}
									</c:when>
									<c:when test="${vo.dept eq 'H'}">
										[인사부]${vo.name}
									</c:when>
									<c:otherwise>
										[부서미정]${vo.name}
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${vo.position eq 'A'}">
										관리자
									</c:when>
									<c:when test="${vo.position eq 'C'}">
										대표
									</c:when>
									<c:when test="${vo.position eq 'D'}">
										부장
									</c:when>
									<c:when test="${vo.position eq 'L'}">
										팀장
									</c:when>
									<c:when test="${vo.position eq 'E'}">
										사원
									</c:when>
									<c:otherwise>
										직급미정
									</c:otherwise>
								</c:choose> ${vo.title}
							</h1>
						</div>
						<hr>
						<div class="py-2">
							<span class="d-inline font-weight-bold text-gray-800">작성자</span>
							|&nbsp; ${vo.name}
							<span class="d-inline font-weight-bold text-gray-800 ml-5">등록일</span>
							|&nbsp; ${vo.date}
						</div>
						<div class="py-2">
							<span class="d-inline font-weight-bold text-gray-800">초과근무 날짜</span> 
							|&nbsp; 2024-03-18 18:00 ~ 20:00
						</div>
						<hr>
						<div class="py-2">
							<span class="d-block font-weight-bold text-gray-800 mb-3">신청내용</span>
							${vo.content }
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="py-5 pr-5">
						<div class="row my-4">
							<div class="col">
								<h1 class="d-inline h4 text-gray-900 mb-4 font-weight-bold">
									결재 현황 <span class="d-inline text-primary font-weight-bold">1/3</span>
								</h1>
							</div>
							<div class="col-auto">
								<div class="d-inline card text-danger text-center px-3 py-1 border-danger font-weight-bold">진행</div>
							</div>
						</div>
						<div class="card px-3 py-2 my-2 bg-info font-weight-bold text-white">
							<div class="row">
								<span class="d-inline col">김팀장 팀장</span> 
								<span class="d-inline col-auto">승인</span>
							</div>
						</div>
						<div class="card text-danger px-3 py-2 my-2 border-danger font-weight-bold">
							<div class="row">
								<span class="d-inline col">이부장 부장</span> 
								<span class="d-inline col-auto">결재 대기</span>
							</div>
						</div>
						<div class="card text-secondary px-3 py-2 my-2 border-secondary font-weight-bold">
							<div class="row">
								<span class="d-inline col">박대표 대표</span> 
								<span class="d-inline col-auto">대기</span>
							</div>
						</div>
						<div class="card bg-dark px-3 py-2 my-2 font-weight-bold text-white">
							<div class="row">
								<span class="d-inline col">박대표 대표</span> 
								<span class="d-inline col-auto">반려</span>
							</div>
						</div>
						<hr>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col p-5 mt-5">
					<div class="mb-4 text-center">
						<hr>
						<a href="" class="btn btn-secondary btn-user"> 목록으로 </a> 
						<a href="" class="btn btn-primary btn-user"> 승인하기 </a> 
						<a href="" class="btn btn-dark btn-user"> 반려하기 </a>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- /.container-fluid -->
<%@ include file="../include/footer.jsp"%>