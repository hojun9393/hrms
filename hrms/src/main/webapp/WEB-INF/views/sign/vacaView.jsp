<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>

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
							<span class="d-inline bg-primary card text-white py-1 px-3">연차</span>
							<h1 class="d-inline h4 text-gray-900 font-weight-bold">
							[${vo.dept}] ${vo.name} ${vo.position}
							</h1>
						</div>
						<hr>
						<div class="py-2">
							<span class="d-inline font-weight-bold text-gray-800">작성자</span>
							|&nbsp; ${vo.name}
							<span class="d-inline font-weight-bold text-gray-800 ml-5">등록일</span>
							|&nbsp; ${vo.rdate}
						</div>
						<div class="py-2">
                        	<span class="d-inline font-weight-bold text-gray-800">연차 신청일</span> |&nbsp; ${vo.date} ${vo.startDate} ~ ${vo.endDate} ${vo.startTime} ~ ${vo.endTime}
                        </div>
						<hr>
						<div class="py-2">
							<span class="d-block font-weight-bold text-gray-800 mb-3">연차사유</span>
							${vo.reason}
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="py-5 pr-5">
						<div class="row my-4">
							<div class="col">
								<h1 class="d-inline h4 text-gray-900 mb-4 font-weight-bold">
									결재 현황 <span class="d-inline text-primary font-weight-bold">${vo.stateCount}/${fn:length(vo.signLineVO)}</span>
								</h1>
							</div>
							<div class="col-auto">
								<c:choose>
									<c:when test="${vo.mySignState eq '0'}">
										<div class="d-inline card text-secondary text-center px-3 py-1 border-secondary font-weight-bold">대기</div>
									</c:when>
									<c:when test="${vo.mySignState eq '1'}">
										<div class="d-inline card text-danger text-center px-3 py-1 border-danger font-weight-bold">진행</div>
									</c:when>
									<c:when test="${vo.mySignState eq '2'}">
										<div class="d-inline card text-white text-center px-3 py-1 bg-info font-weight-bold">승인</div>
									</c:when>
									<c:when test="${vo.mySignState eq '3'}">
										<div class="d-inline card text-white text-center px-3 py-1 bg-dark font-weight-bold">반려</div>
									</c:when>
									<c:otherwise>
										<div class="d-inline card text-white text-center px-3 py-1 bg-danger font-weight-bold">오류</div>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						
						<c:forEach items="${vo.signLineVO}" var="signLineVO">
						<c:choose>
							<c:when test="${signLineVO.state eq '0'}">
								<c:choose>
									<c:when test="${vo.mySignOrder eq signLineVO.signOrder || (vo.mySignState eq '2' && vo.mySignOrder < signLineVO.signOrder+1)}">
										<div class="card text-danger px-3 py-2 my-2 border-danger font-weight-bold">
											<div class="row">
												<span class="d-inline col">${signLineVO.name} ${signLineVO.position}</span>
												<span class="d-inline col-auto">결재 대기</span>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="card text-secondary px-3 py-2 my-2 border-secondary font-weight-bold">
											<div class="row">
												<span class="d-inline col">${signLineVO.name} ${signLineVO.position}</span>
												<span class="d-inline col-auto">대기</span>
											</div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:when test="${signLineVO.state eq '2'}">
								<div class="card px-3 py-2 my-2 bg-info font-weight-bold text-white">
									<div class="row">
										<span class="d-inline col">${signLineVO.name} ${signLineVO.position}</span>
										<span class="d-inline col-auto">승인</span>
									</div>
								</div>
							</c:when>
							<c:when test="${signLineVO.state eq '3'}">
								<div class="card bg-dark px-3 py-2 my-2 font-weight-bold text-white">
									<div class="row">
										<span class="d-inline col">${signLineVO.name} ${signLineVO.position}</span>
										<span class="d-inline col-auto">반려</span>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="card bg-danger px-3 py-2 my-2 font-weight-bold text-white">
									<div class="row">
										<span class="d-inline col">${signLineVO.name} ${signLineVO.position}</span>
										<span class="d-inline col-auto">오류 문의</span>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
						</c:forEach>
						<hr>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col p-5 mt-5">
					<div class="mb-4 text-center">
						<hr>
						<a href="main.do" class="btn btn-secondary btn-user"> 목록으로 </a>
						<button type="submit" form="approvedVaca" class="btn btn-primary btn-user"> 승인하기 </button>
						<button type="submit" form="rejectedVaca" class="btn btn-dark btn-user"> 반려하기 </button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<form action="approvedVaca.do" method="post" id="approvedVaca">
	<input type="hidden" name="vacaNo" value="${vo.vacaNo}" >
	<input type="hidden" name="mySignLineNo" value="${vo.mySignLineNo}" >
</form>
<form action="rejectedVaca.do" method="post" id="rejectedVaca">
	<input type="hidden" name="vacaNo" value="${vo.vacaNo}" >
	<input type="hidden" name="mySignLineNo" value="${vo.mySignLineNo}" >
</form>

<!-- /.container-fluid -->
<%@ include file="../include/footer.jsp"%>