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
					<b>초과 근무 신청</b>
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
										</div>
									</div>
									<div class="form-group">
										기간
										<div class="row">
											2024-03-14 
											<i class="fas fa-calendar fa-2x text-gray-300" onclick="openModal()"></i> &nbsp;&nbsp;&nbsp;
											<select name="startTime">
												<option value="18:00">18:00</option>
												<option value="19:00">19:00</option>
												<option value="20:00">20:00</option>
												<option value="21:00">21:00</option>
												<option value="22:00">22:00</option>
												<option value="23:00">23:00</option>
											</select> ~ 
											<select name="endTime">
												<option value="19:00">19:00</option>
												<option value="20:00">20:00</option>
												<option value="21:00">21:00</option>
												<option value="22:00">22:00</option>
												<option value="23:00">23:00</option>
												<option value="24:00">24:00</option>
											</select> 
										</div>
									</div>
									<div class="form-group">
										내용
										<input type="email" class="form-control form-control-user" id="exampleInputEmail">
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

<script src="js/modal2.js"></script>
<script src="js/calendar.js"></script>
<!-- /.container-fluid -->
<%@ include file="include/footer.jsp"%>