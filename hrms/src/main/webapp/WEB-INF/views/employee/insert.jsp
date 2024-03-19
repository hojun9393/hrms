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
					<span class="content-head">사원 등록</span>
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
										<span class="text-head2">이름</span>
										<input type="text" class="form-control-custom">
									</div>
									<div class="row my-info-content">
										<span class="text-head2">부서</span>
										<select>
											<option>개발부</option>
											<option>영업부</option>
											<option>기획부</option>
										</select>
									</div>
									<div class="row my-info-content">
										<span class="text-head2">직급</span>
										<select>
											<option>사원</option>
											<option>팀장</option>
											<option>부장</option>
										</select>
									</div>
									<div class="row my-info-content">
										<span class="text-head2">상태</span>
										<select>
											<option>재직</option>
											<option>휴직</option>
											<option>퇴사</option>
										</select>
									</div>
									<div class="row my-info-content">
										<span class="text-head2">입사일</span>
										<i class="fas fa-calendar fa-2x text-gray-300" onclick="openModal()"></i>
									</div>
									<div class="row my-info-content">
										<span class="text-head2">비밀번호</span>
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
											<a href="login.html" class="btn btn-primary btn-user btn-block">사원등록</a> 
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

	</div>
</div>

<script src="resources/js/modal2.js"></script>
<script src="resources/js/calendar.js"></script>
<!-- /.container-fluid -->
<%@ include file="../include/footer.jsp"%>