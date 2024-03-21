<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>
<link href="${pageContext.request.contextPath}/resources/css/table.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/button.css" rel="stylesheet">
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">근무</h1>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-200 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">오늘 근무 시간</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">
								<span id="goToWorkClock"></span> ~
								<span id="leaveWorkClock"></span>
							</div>
							<c:if test="${start == null}">
								<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="workFn('GO')">
									출근하기
								</button>
							</c:if>
							<c:if test="${start != null}">
								<button class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm" onclick="workFn('GO')">
									출근하기
								</button>
							</c:if>
							<c:if test="${end == null }">
								<button class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="workFn('LEAVE')">
									퇴근하기
								</button>
							</c:if>
							<c:if test="${end != null }">
								<button class="d-none d-sm-inline-block btn btn-sm btn-success shadow-sm" onclick="workFn('LEAVE')">
									퇴근하기
								</button>
							</c:if>
						</div>
						<div class="col-auto">
							<i class="fas fa-calendar fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-info shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-info text-uppercase mb-1">
								금주 누적 근무
							</div>
							<div class="row no-gutters align-items-center">
								<div class="col-auto">
									<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${workTime }</div>
								</div>
								<div class="col">
									<div class="progress progress-sm mr-2">
										<div class="progress-bar bg-info" role="progressbar"
											style="width:50%;" aria-valuenow="90" aria-valuemin="0"
											aria-valuemax="100"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-4 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-success text-uppercase mb-1">
								금주 누적 초과근무
							</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">1시간</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
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
						<span class="menubar" onclick="displayFn(1)">내 근무</span> 
						<span class="menubar" onclick="displayFn(2)">내 초과근무</span> 
						<span class="menubar" onclick="displayFn(3)">근무 조회</span> 
					</h6>
					<div class="dropdown no-arrow">
						<a class="dropdown-toggle" href="#" role="button"
							id="dropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">
							<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
							aria-labelledby="dropdownMenuLink">
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
					<div>
						2024-03-02 ~ 2024-03-13
						<i class="fas fa-calendar fa-2x text-gray-300" onclick="openModal()"></i>
						<div id="overtimeReqDiv" class="float-right">
							<a href="overtimeApplication.do" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm small float-right">
								<i class="fas fa-fw fa-briefcase"></i> 초과근무 신청
							</a>
						</div>
						<div id="searchDiv" class="float-right display-none">
							<form>
								<input type="text">
								<button>검색</button>
							</form>
						</div>
					</div>
					<!-- 내 근무 -->
					<div id="menu1">
						<table>
							<thead>
								<tr>
									<th>날짜</th>
									<th>출근</th>
									<th>퇴근</th>
									<th>초과근무</th>
									<th>총 근무</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2024-03-02 (월)</td>
									<td>09:00</td>
									<td>18:00</td>
									<td>-</td>
									<td>09:00</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- 내 초과근무 -->
					<div id="menu2" class="display-none">
						<table>
							<thead>
								<tr>
									<th>날짜</th>
									<th>시작</th>
									<th>종료</th>
									<th>근무시간</th>
									<th>사유</th>
									<th>결재 상태</th>
									<th>조회</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2024-03-02 (월)</td>
									<td>18:00</td>
									<td>20:00</td>
									<td>02:00</td>
									<td>회의</td>
									<td></td>
									<td></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- 근무 조회 -->
					<div id="menu3" class="display-none">
						<table>
							<thead>
								<tr>
									<th>날짜</th>
									<th>이름</th>
									<th>출근</th>
									<th>퇴근</th>
									<th>초과</th>
									<th>총 근무</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2024-03-02 (월)</td>
									<td>
										<span class="d-inline card bg-info text-white text-center px-2">기획부</span>
										<span>이사원</span>
										<span class="text-xs font-weight-bold text-primary text-uppercase mb-1">사원</span>
									</td>
									<td>09:00</td>
									<td>20:00</td>
									<td>02:00</td>
									<td>10:00</td>
								</tr>
							</tbody>
						</table>
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
		</div>
	</div>
</div>

<!-- End of Main Content -->
<script src="${pageContext.request.contextPath}/resources/js/work_menu.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/clock.js"></script> --%>
<script>
	// 시계 표시
	const goToWorkClock = document.querySelector("#goToWorkClock");
	const leaveWorkClock = document.querySelector("#leaveWorkClock");
	
	let start = '${start}';
	let end = '${end}';
	
	console.log(start);
	console.log(end);
	
	function getClock() {
	   const date = new Date();
	   const hours = String(date.getHours()).padStart(2, "0");
	   const min = String(date.getMinutes()).padStart(2, "0");
	   const sec = String(date.getSeconds()).padStart(2, "0");
	   //clock.innerText = `${hours}:${min}:${sec}`;
	   if(start==""){
	   	goToWorkClock.innerText = hours+":"+min+":"+sec;
	   }else{
	   	goToWorkClock.innerText = start;
		   if(end==""){
		   	leaveWorkClock.innerText = hours+":"+min+":"+sec;
		   }else{
			   leaveWorkClock.innerText = end;
		   }
	   }
	}
	
	getClock();
	let clockVar = setInterval(getClock, 1000);
	
	function workFn(obj){
		const date = new Date();
		const year = date.getFullYear();
		const month = ('0' + (date.getMonth() + 1)).slice(-2);
		const day = ('0' + date.getDate()).slice(-2);
	   const hours = String(date.getHours()).padStart(2, "0");
	   const min = String(date.getMinutes()).padStart(2, "0");
	   const sec = String(date.getSeconds()).padStart(2, "0");
	   
		const dateStr = year+"-"+month+"-"+day;
		const timeStr = hours+":"+min+":"+sec;
		
		if(obj=="GO"){
			if(start==""){
				clearInterval(clockVar);
				let goOrLeave = "GO";
			   $.ajax({
					url:"workInsert.do",
					data: {dateStr : dateStr, timeStr : timeStr, goOrLeave : goOrLeave},
					success:function(data){
						alert("출근 처리 되었습니다.");
						location.href="main.do";
					}
				});
			   
			}else{
				alert("이미 출근 처리되었습니다.");
			}
			
		}else if(obj=="LEAVE"){
			if(start==""){
				alert("출근 처리가 완료되지 않았습니다.");
			}else{
				clearInterval(clockVar);
				let goOrLeave = "LEAVE";
			   $.ajax({
					url:"workInsert.do",
					data: {dateStr : dateStr, timeStr : timeStr, goOrLeave : goOrLeave},
					success:function(data){
						alert("퇴근 처리 되었습니다.");
						location.href="main.do";
					}
				});
			}
		}
	   
	}
	
	
</script>

<script src="${pageContext.request.contextPath}/resources/js/modal2.js"></script>
<%@ include file="../include/footer.jsp"%>