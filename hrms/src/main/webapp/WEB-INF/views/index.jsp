<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/navigator.jsp"%>
<!DOCTYPE html>
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">홈</h1>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-lg font-weight-bold text-primary text-uppercase mb-1">
								현재 시간
							</div>
							<div class="h5 mb-2 font-weight-bold text-gray-800">08:50:30</div>
						</div>
						<div class="col-auto">
							<a href="#" class="btn btn-primary btn-icon-split mini"> 
								<span class="text">출근</span>
							</a> 
							<a href="#" class="btn btn-danger btn-icon-split mini"> 
								<span class="text">퇴근</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-lg font-weight-bold text-success text-uppercase mb-1">
								결재 문서
							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">5건</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-file-signature fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-lg font-weight-bold text-info text-uppercase mb-1">
								금주 누적 근무
							</div>
							<div class="row no-gutters align-items-center">
								<div class="col-auto">
									<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">8:30:30</div>
								</div>
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-briefcase fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Pending Requests Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-lg font-weight-bold text-warning text-uppercase mb-1">
								금년 잔여 연차
							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">3일</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-plane fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Content Row -->

	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-8 col-lg-7">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">월별 연차현황</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="row">
						<div class="calendar col">
							<div class="header mb-3">
								<div class="year-month"></div>
								<div class="nav">
									<button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
									<button class="nav-btn go-today" onclick="goToday()">Today</button>
									<button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
								</div>
							</div>
							<div class="main">
								<div class="days">
									<div class="day">일</div>
									<div class="day">월</div>
									<div class="day">화</div>
									<div class="day">수</div>
									<div class="day">목</div>
									<div class="day">금</div>
									<div class="day">토</div>
								</div>
								<div class="dates"></div>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>

		<!-- Pie Chart -->
		<div class="col-xl-4 col-lg-5">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">연차 사원</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="h4 mb-3 ml-2 font-weight-bold text-gray-800 today-date">03월 12일</div>
					<div class="card mt-3 bg-light text-black">
						<div class="card-body">
							<div class="d-inline card bg-info text-white text-center px-2">사원</div>
							홍길동
							<div class="d-inline ml-5">연차 신청</div>
						</div>
					</div>
					<div class="card mt-3 bg-light text-black">
						<div class="card-body">
							<div class="d-inline card bg-info text-white text-center px-2">사원</div>
							홍길동
							<div class="d-inline ml-5">연차 신청</div>
						</div>
					</div>
				</div>
			</div>

			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="h5 mb-3 ml-2 font-weight-bold text-gray-800 today-date">안내드립니다.</div>
					<div class="card mt-3 bg-light text-black">
						<div class="card-body">
							<div class="d-inline card bg-danger text-white text-center px-2">공지</div>
							홍길동
							<div class="d-inline ml-5">연차 신청</div>
						</div>
					</div>
					<div class="card mt-3 bg-light text-black">
						<div class="card-body">
							<div class="d-inline card bg-warning text-white text-center px-2">안내</div>
							홍길동
							<div class="d-inline ml-5">연차 신청</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<script src="resources/js/calendar.js"></script>
<!-- /.container-fluid -->
<%@ include file="include/footer.jsp" %>