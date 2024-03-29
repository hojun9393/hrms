<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>
<!-- Begin Page Content -->
<div class="container-fluid">
	<div class="row">
		<!-- Area Chart -->
		<div class="col-xl-8 col-lg-7">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">제목</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="chart-area">
						작성자 : <br> 
						등록일 : <hr><br> 
						내용 : <br>
					</div>
				</div>
			</div>
		</div>

		<!-- Pie Chart -->
		<div class="col-xl-4 col-lg-5">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">결재현황</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="chart-area">
						결재내용
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-3"></div>
		<div class="col-lg-6 row">
			<div class="col-lg-3">
				<a href="login.html" class="btn btn-light btn-user btn-block">목록으로</a> 
			</div>
			<div class="col-lg-3">
				<a href="login.html" class="btn btn-secondary btn-user btn-block">철회하기</a> 
			</div>
			<div class="col-lg-3">
				<a href="login.html" class="btn btn-primary btn-user btn-block">승인하기</a> 
			</div>
			<div class="col-lg-3">
				<a href="login.html" class="btn btn-dark btn-user btn-block">반려하기</a> 
			</div>
		</div>
		<div class="col-lg-3"></div>
	</div>
</div>
<!-- /.container-fluid -->
<%@ include file="../include/footer.jsp"%>