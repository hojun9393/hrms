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
					<span class="content-head">사원 정보 수정</span>
				</div>
			</div>
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<!-- Nested Row within Card Body -->
					<div class="row">
						<div class="col-lg-3 d-none d-lg-block"></div>
						<div class="col-lg-6">
							<div class="p-5">
								<form>
									<div class="row my-info-content">
										<span class="text-head2">사원번호</span>
										<span class="text-content">100001</span>
									</div>
									<div class="row my-info-content">
										<span class="text-head2">새 비밀번호</span>
										<input type="password" class="form-control-custom">
									</div>
									<div class="row my-info-content">
										<span class="text-head2">새 비밀번호 확인</span>
										<input type="password" class="form-control-custom">
									</div>
									<div class="row my-info-content">
										<span class="text-head2">연락처</span>
										<input type="text" class="form-control-custom">
									</div>
									<div class="row my-info-content">
										<span class="text-head2">이메일</span>
										<input type="text" class="form-control-custom">
									</div>
									<div class="row my-info-content">
										<span class="text-head2">주소</span>
										<input type="text" class="form-control-custom form-control-user">
									</div>
								<hr>
									
									
								<div class="row">
									<div class="col-lg-6">
										<a href="login.html" class="btn btn-secondary btn-user btn-block">뒤로가기</a> 
									</div>
									<div class="col-lg-6">
										<a href="login.html" class="btn btn-primary btn-user btn-block">수정완료</a> 
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