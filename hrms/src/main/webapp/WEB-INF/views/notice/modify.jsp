<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Content Row -->
	<div class="row">

		<!-- Border Bottom Utilities -->
		<div class="col-lg-12">

			<div class="card mb-4 py-3 border-bottom-primary">
				<div class="card-body">
					<b>공지 수정</b>
				</div>
			</div>
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-3 d-none d-lg-block"></div>
						<div class="col-lg-6">
							<div class="p-5">
								<form class="user" action="modify.do" method="post">
								<input type="hidden" name="noticeNo" value="${vo.noticeNo}">
									<div class="form-group">
										<div class="row">
											<div class="col-sm-12 mb-3 mb-sm-0">
												제목 : <input type="text" name="title" class="form-control form-control-user" id="exampleFirstName" value="${vo.title}">												
											</div>
										</div>
									</div>
									<div class="form-group">
										내용 : <textarea style="height:20rem" name="content" class="form-control">${vo.content}</textarea>
									</div>
									<div>
										첨부파일 : 
									</div>
									<hr>
									<div class="row">
										<div class="col-lg-6">
											<a type="reset" href="main.do/" class="btn btn-secondary btn-user btn-block">취소</a> 
										</div>
										<div class="col-lg-6">
											<input type="submit" class="btn btn-primary btn-user btn-block" value="수정완료">
										</div>
									</div>
								</form>
								<hr>
							</div>
						</div>
						<div class="col-lg-3 d-none d-lg-block"></div>
					</div>
				</div>
			</div>

		</div>

	</div>
</div>
<!-- /.container-fluid -->
<%@ include file="../include/footer.jsp"%>