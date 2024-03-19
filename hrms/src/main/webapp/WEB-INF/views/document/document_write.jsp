<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/navigator.jsp"%>
<!DOCTYPE html>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Content Row -->
	<div class="row">

		<!-- Border Bottom Utilities -->
		<div class="col-lg-12">

			<div class="card mb-4 py-3 border-bottom-primary">
				<div class="card-body">
					<b>기안 작성</b>
				</div>
			</div>
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-3 d-none d-lg-block"></div>
						<div class="col-lg-6">
							<div class="p-5">
								<form class="user">
									<div class="form-group">
										결재
										<div class="row">
											<div class="col-sm-2 mb-3 mb-sm-0">
												<input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="이팀장" disabled>
											</div>
											<div class="col-sm-2 mb-3 mb-sm-0">
												<input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="김부장" disabled>
											</div>
											<div class="col-sm-2 mb-3 mb-sm-0">
												<input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="박대표" disabled>
											</div>
											<div class="col-sm-12 mb-3 mb-sm-0">
												제목 <input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="제목">
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											작성자 
										</div>
									</div>
									<div class="form-group">
										내용 <textarea class="resize-none form-control"></textarea>
									</div>
									<div class="form-group">
										첨부파일 
									</div>
									<hr>
									<div class="row">
										<div class="col-lg-6">
											<a href="login.html" class="btn btn-secondary btn-user btn-block">목록으로</a> 
										</div>
										<div class="col-lg-6">
											<a href="login.html" class="btn btn-primary btn-user btn-block">작성완료</a> 
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
<%@ include file="include/footer.jsp"%>