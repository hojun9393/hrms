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
					<b>연차 신청</b>
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
												<input type="text" class="form-control form-control-user" placeholder="이팀장" disabled>
											</div>
											<div class="col-sm-2 mb-3 mb-sm-0">
												<input type="text" class="form-control form-control-user" placeholder="김부장" disabled>
											</div>
											<div class="col-sm-2 mb-3 mb-sm-0">
												<input type="text" class="form-control form-control-user" placeholder="박대표" disabled>
											</div>
										</div>
									</div>
									<div class="form-group">
										날짜
										<div class="row">
											<div class="col-5">
												<div class="form-control form-control-user img-box-custom">
													<img onclick="openModal()" class="icon-box" src="img/calendar_icon.png">
													<span>2023-03-07</span>
												</div>
											</div>~
											<div class="col-5">
												<div class="form-control form-control-user img-box-custom">
													<img onclick="openModal()" class="icon-box" src="img/calendar_icon.png">
													<span>2023-03-08</span>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										내용
										<textarea class="resize-none form-control"></textarea>
									</div>
									<hr>
									<div class="row">
										<div class="col-lg-6">
											<a href="login.html" class="btn btn-secondary btn-user btn-block">뒤로가기</a> 
										</div>
										<div class="col-lg-6">
											<a href="login.html" class="btn btn-primary btn-user btn-block">연차신청</a> 
										</div>
									</div>
								</form>
								<hr>
							</div>
						</div>
						<div class="col-lg-3 d-none d-lg-block"></div>
						
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
			</div>

		</div>

	</div>
</div>
<!-- /.container-fluid -->
<script src="js/modal2.js"></script>
<script src="js/calendar.js"></script>
<%@ include file="include/footer.jsp"%>