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
	<link href="${pageContext.request.contextPath}/resources/css/table.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/button.css" rel="stylesheet">
</head>
<body id="page-top">
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
								<div class="h5 mb-0 font-weight-bold text-gray-800">${overtimeTime }</div>
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
					<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
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
							<div class="mb-3 col">
								<input type="text" name="" value="" id="startDate" class="datepicker inp" placeholder="시작일 선택" readonly="true" onchange="reloadListFn(1)">
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(startDate)" style="cursor: pointer;"></i> ~ 
								<input type="text" name="" value="" id="endDate" class="datepicker inp" placeholder="종료일 선택" readonly="true"> 
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(endDate)" style="cursor: pointer;"></i>
							</div>
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
								<tbody class="outputBody1">
									<c:forEach var="item" items="${workList}">
										<tr>
											<td>${item.date }</td>
											<td>${item.start }</td>
											<td>${item.end }</td>
											<td>${item.overtime }</td>
											<td>${item.total }</td>
										</tr>
									</c:forEach>
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
								<tbody class="outputBody2">
									<c:forEach var="item" items="${overtimeList}">
										<tr>
											<td>${item.date }</td>
											<td>${item.start }</td>
											<td>${item.end }</td>
											<td>${item.total }</td>
											<td>${item.content }</td>
											<td>
												<c:choose>
													<c:when test="${item.state == 0}">
														<span class="btn btn-light btn-gradient2 mini">대기</span>
													</c:when>
													<c:when test="${item.state == 1 }">
														<span class="btn-gradient red mini">진행중</span>
													</c:when>
													<c:when test="${item.state == 2 }">
														<span class="btn-gradient green mini">승인</span>
													</c:when>
													<c:when test="${item.state == 3 }">
														<span class="btn-gradient mini btn-secondary">반려</span>
													</c:when>
												</c:choose>
											</td>
											<td>
												<a href="overtimeView.do">
													<img class="icon-box" src="${pageContext.request.contextPath}/resources/img/document_icon.png">
												</a>
											</td>
										</tr>
									</c:forEach>
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
						
	
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- End of Main Content -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/work_menu.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/clock.js"></script> --%>
<script>
	const menu1 = document.querySelector("#menu1");
	const menu2 = document.querySelector("#menu2");
	const menu3 = document.querySelector("#menu3");
	const overtimeReqDiv = document.querySelector("#overtimeReqDiv");
	const searchDiv = document.querySelector("#searchDiv");
	
	function displayFn(obj){
		if(obj==1){
			menu1.style.display = "block";
			menu2.style.display = "none";
			menu3.style.display = "none";
			overtimeReqDiv.style.display = "block";
			searchDiv.style.display = "none";
			$("#startDate").attr("onchange","reloadListFn(1)");
			
		}else if(obj==2){
			menu1.style.display = "none";
			menu2.style.display = "block";
			menu3.style.display = "none";
			overtimeReqDiv.style.display = "block";
			searchDiv.style.display = "none";
			$("#startDate").attr("onchange","reloadListFn(2)");
			
		}else if(obj==3){
			menu1.style.display = "none";
			menu2.style.display = "none";
			menu3.style.display = "block";
			overtimeReqDiv.style.display = "none";
			searchDiv.style.display = "block";
			$("#startDate").attr("onchange","reloadListFn(3)");
			
		}
	}
	
	function reloadListFn(obj){
		let startDate = $("#startDate").val();
		let endDate = $("#endDate").val();
		
		console.log(obj);
	
		$.ajax({
			url:"reloadList.do",
			data: {startDate : startDate, endDate : endDate},
			success:function(data){
				if(obj==1){
					let outputBody = $(".outputBody1");
					let html = "";
					for(let i=0; i<data.length; i++){
						html += "<tr>";
						html += "<td>"+data[i].date+"</td>";
						html += "<td>"+data[i].start+"</td>";
						html += "<td>"+data[i].end+"</td>";
						html += "<td>"+data[i].overtime+"</td>";
						html += "<td>"+data[i].total+"</td>";
						html += "</tr>";
					}
					outputBody.html(html);
				}
					
			}
		});
	}
</script>
<script>
	// 시계 표시
	const goToWorkClock = document.querySelector("#goToWorkClock");
	const leaveWorkClock = document.querySelector("#leaveWorkClock");
	
	let start = '${start}';
	let end = '${end}';
	
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
<script src="${pageContext.request.contextPath}/resources/js/calendar2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sign_main.js"></script>
<%@ include file="../include/footer.jsp"%>