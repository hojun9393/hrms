<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">공지사항</h1>
	</div>

	<div class="card o-hidden border-0 shadow-lg">
		<div class="card-body p-0">
			<!-- Nested Row within Card Body -->
			<div class="row">
				<div class="col">
					<div class="p-5">
						<div class="my-4">
							<span class="d-inline bg-primary card text-white py-1 px-3">공지사항</span>
							<h1 class="d-inline h4 text-gray-900 font-weight-bold">
							${vo.title}
							</h1>
						</div>
						<hr>
						<div class="py-2">
							<span class="d-inline font-weight-bold text-gray-800">작성자</span>
							|&nbsp; 
							<c:choose>
								<c:when test="${vo.userId eq '99000'}">
									대표<br>
								</c:when>
								<c:when test="${vo.userId eq '99001'}">
									관리자<br>
								</c:when>
								<c:otherwise>
									오류<br>
								</c:otherwise>
							</c:choose>
							<span class="d-inline font-weight-bold text-gray-800">등록일</span>
							|&nbsp; ${vo.rdate}
						</div>
						<hr>
						<div class="py-2">
							<span class="d-block font-weight-bold text-gray-800 mb-3">공지사항 내용</span>
							${vo.content}
						</div>
						<a href="#" class="d-none d-sm-inline-block border-primary text-primary btn btn-sm btn-light shadow-sm"><i class="fas fa-download fa-sm text-primary"></i> 파일이름.pdf</a>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col p-5 mt-5">
					<div class="mb-4 text-center">
						<hr>
						<a href="main.do/" class="btn btn-secondary btn-user">목록으로</a> 
						<a href="modify.do?noticeNo=${vo.noticeNo}" class="btn btn-primary btn-user">수정하기</a> 
						<a href="login.html" class="btn btn-dark btn-user">삭제하기</a> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- /.container-fluid -->
<%@ include file="../include/footer.jsp"%>