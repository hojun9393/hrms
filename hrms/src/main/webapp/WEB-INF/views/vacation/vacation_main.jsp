<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/navigator.jsp"%>
<!DOCTYPE html>
		<!-- Begin Page Content -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<div class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">연차</h1>
			</div>

			<!-- Content Row -->
			<div class="row">

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-3 mb-3">
					<div class="card border-left-primary shadow h-200 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">최근 연차 신청</div>
									<div class="h5 mb-0 font-weight-bold text-gray-800">
										<div class="h5 mb-0 font-weight-bold text-black-bold">대기</div>
										<span class="content-text-small">2024-03-10</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-3 mb-3">
					<div class="card border-left-info shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-info text-uppercase mb-1">
										잔여 연차
									</div>
									<div class="row no-gutters align-items-center">
										<div class="col-auto">
											<div class="h5 mb-0 mr-3 font-weight-bold text-red-bold">10일</div>
											<span class="content-text-small">D-47</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-3 mb-3">
					<div class="card border-left-success shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-success text-uppercase mb-1">
										사용 연차
									</div>
									<div class="h5 mb-0 font-weight-bold text-black-bold">7일</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- Earnings (Monthly) Card Example -->
				<div class="col-xl-3 col-md-3 mb-3">
					<div class="card border-left-warning shadow h-100 py-2">
						<div class="card-body">
							<div class="row no-gutters align-items-center">
								<div class="col mr-2">
									<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
										총 연차
									</div>
									<div class="h5 mb-0 font-weight-bold text-black-bold">14일</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

			<!-- Content Row -->
			<div class="row">

				<!-- Area Chart -->
				<div class="col-xl-12 col-lg-12">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
							<h6 class="m-0 font-weight-bold text-primary">
								<span class="menubar" onclick="displayFn(1)">내 연차</span> 
								<span class="menubar" onclick="displayFn(2)">연차 조회</span> 
							</h6>
							<div class="dropdown no-arrow">
								<a class="dropdown-toggle" href="#" role="button"
									id="dropdownMenuLink" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false">
									<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
								</a>
								<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
									<div class="dropdown-header">Dropdown Header:</div>
									<a class="dropdown-item" href="#">Action</a> 
									<a class="dropdown-item" href="#">Another action</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Something else here</a>
								</div>
							</div>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<!-- 내 연차 -->
							<div id="menu1">
								<div>
									2024-03-02 ~ 2024-03-13
									<i class="fas fa-calendar fa-2x text-gray-300" onclick="openModal()"></i>
									<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm small float-right">
										<i class="fas fa-fw fa-plane"></i> 연차 신청
									</a>
								</div>
								<table>
									<thead>
										<tr>
											<th>기간</th>
											<th>일수</th>
											<th>사유</th>
											<th>상태</th>
											<th>내역</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>2024-03-02 ~ 2024-03-03</td>
											<td>2</td>
											<td>휴식</td>
											<td><span class="btn btn-light btn-gradient2 mini">대기</span></td>
											<td><img class="icon-box" src="img/document_icon.png"></td>
										</tr>
										<tr>
											<td>2024-03-02 ~ 2024-03-03</td>
											<td>2</td>
											<td>휴식</td>
											<td><span class="btn-gradient red mini">진행중</span></td>
											<td><img class="icon-box" src="img/document_icon.png"></td>
										</tr>
										<tr>
											<td>2024-03-02 ~ 2024-03-03</td>
											<td>2</td>
											<td>휴식</td>
											<td><span class="btn-gradient green mini">승인</span></td>
											<td><img class="icon-box" src="img/document_icon.png"></td>
										</tr>
										<tr>
											<td>2024-03-02 ~ 2024-03-03</td>
											<td>2</td>
											<td>휴식</td>
											<td><span class="btn-gradient mini btn-secondary">철회</span></td>
											<td><img class="icon-box" src="img/document_icon.png"></td>
										</tr>
									</tbody>
								</table>
							</div>
							
							<!-- 연차 조회(관리자) -->
							<div id="menu2" class="display-none">
								<div>
									2024-03-02 ~ 2024-03-13
									<i class="fas fa-calendar fa-2x text-gray-300" onclick="openModal()"></i>
									<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm small float-right">
										<i class="fas fa-fw fa-plane"></i> 연차 부여
									</a>
								</div>
								<table>
									<thead>
										<tr>
											<th>부서</th>
											<th>직급</th>
											<th>이름</th>
											<th>총 연차</th>
											<th>사용 연차</th>
											<th>잔여 연차</th>
											<th>내역</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>개발부</td>
											<td>사원</td>
											<td>김사원</td>
											<td>14일</td>
											<td>7일</td>
											<td>7일</td>
											<td><img id="modal-open" class="icon-box" src="img/document_icon.png"></td>
										</tr>
									</tbody>
								</table>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

		
		<!-- ======================== 달력 ========================-->
		<div id="modal" class="modal-overlay" style="display:none;">
			<div class="modal-window calendar col">
				<div class="row">
					<div class="header col">
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
				<div id="close-area" class="close-area">닫기</div>
			</div>
		</div>
		<!-- ======================== 달력 ========================-->

		<!--========================= 모달창 ======================-->
		<div class="popup-wrap" id="popup">
			<div class="popup">
				<div class="popup-head">
					<span class="head-title">??님의 연차 내역</span>
				</div>
				<div class="popup-body">
					<div class="body-content">
						<div class="body-contentbox">
							<div class="popup-content-box">
								<span class="text-head">2023-03-02~2023-03-03 </span>
								<span class="text-content">휴가</span>
								<span class="text-content-small">2일</span>
							</div>
							<div class="popup-content-box">
								<span class="text-head">2023-03-02~2023-03-03 </span>
								<span class="text-content">휴가</span>
								<span class="text-content-small">2일</span>
							</div>
							<div class="popup-content-box">
								<span class="text-head">2023-03-02~2023-03-03 </span>
								<span class="text-content">휴가</span>
								<span class="text-content-small">2일</span>
							</div>
						</div>
					</div>
				</div>
				<div class="popup-foot">
					<span class="pop-btn close float-right close-custom" id="close">창 닫기</span>
				</div>
			</div>
		</div>
		<!--========================= 모달창 ======================-->
							
<!-- End of Main Content -->
<script src="js/jquery-3.7.1.min.js"></script>
<script src="js/menu.js"></script>
<script src="js/modal.js"></script>
<script src="js/modal2.js"></script>
<script src="js/calendar.js"></script>
<%@ include file="/include/footer.jsp"%>