<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>
<head>
	<!-- 데이트피커 { -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
	<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<!-- } -->
	
	<!-- 캘린더(데이트피커) 스타일 (jquery-ui.css 파일호출 보다 아래에 있어야 합니다.) { -->
	<link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet">
</head>
<body id="page-top">
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
									<form class="user" onsubmit="return submitFn()">
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
											기간<br>
											<div class="mb-3 col">
												<input type="text" name="date" id="startDate" class="datepicker inp" placeholder="날짜 선택" readonly="true">
												<i class="fas fa-lg fa-calendar" onclick="iClickFn(startDate)" style="cursor: pointer;"></i>
												&nbsp;&nbsp;&nbsp;
												<select name="start" id="startTime">
													<option value="NONE">시작 시간</option>
													<option value="18:00">18:00</option>
													<option value="19:00">19:00</option>
													<option value="20:00">20:00</option>
													<option value="21:00">21:00</option>
													<option value="22:00">22:00</option>
													<option value="23:00">23:00</option>
												</select> ~ 
												<select name="end" id="endTime">
													<option value="NONE">종료 시간</option>
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
											<textarea class="resize-none form-control" name="content" placeholder="근무 내용을 입력하세요." required></textarea>
										</div>
										<hr>
										<div class="row">
											<div class="col-lg-6">
												<a href="main.do" class="btn btn-secondary btn-user btn-block">목록으로</a> 
											</div>
											<div class="col-lg-6">
												<button class="btn btn-primary btn-user btn-block">작성완료</button> 
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
<script>
	function submitFn(){
		let date = $("#startDate");
		let startTime = $("#startTime option:selected");
		let endTime = $("#endTime option:selected");
		console.log(startTime);
		if(date.val()===""){
			alert("날짜를 선택해주세요.");
			date.focus();
			return false;
		}
		if(startTime.val()==="NONE"){
			alert("시작 시간을 선택해주세요.");
			return false;
		}
		if(endTime.val()==="NONE"){
			alert("종료 시간을 선택해주세요.");
			return false;
		}
		let msg = confirm("추가근무를 신청하시겠습니까?");
		if(msg===true){
			return true;
		}
		return false;
	}
</script>
<script src="${pageContext.request.contextPath}/resources/js/calendar2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sign_main.js"></script>
<!-- /.container-fluid -->
<%@ include file="../include/footer.jsp"%>