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
	<link href="${pageContext.request.contextPath}/resources/css/pagination.css" rel="stylesheet">
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
								<button id="goToWorkButton" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="workFn('GO')">
									출근하기
								</button>
								<button id="leaveWorkButton" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" onclick="workFn('LEAVE')">
									퇴근하기
								</button>
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
										<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${myThisWeekTotalWorkTimePlusMyTotalOvertimeTime }</div>
									</div>
									<div class="col">
										<div class="progress progress-sm mr-2">
											<div class="progress-bar bg-info" role="progressbar"
												style="width:90%;" aria-valuenow="50" aria-valuemin="0"
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
								<div class="h5 mb-0 font-weight-bold text-gray-800">${myThisWeekTotalOvertimeTime }</div>
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
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<!-- 내 근무 -->
						<div id="menu1">
							<div class="mb-3 col">
								<input type="text" name="" value="" id="startDate1" class="datepicker inp" placeholder="시작일 선택" readonly="true" onchange="reloadListFn(1)">
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(startDate1)" style="cursor: pointer;"></i> ~ 
								<input type="text" name="" value="${today }" id="endDate1" class="datepicker inp" placeholder="종료일 선택" readonly="true" onchange="reloadListFn(1)"> 
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(endDate1)" style="cursor: pointer;"></i>
								<div class="float-right">
									<a onclick="overtime_aplicationFn()" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm small float-right">
										<i class="fas fa-fw fa-briefcase"></i> 초과근무 신청
									</a>
								</div>
							</div>
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
											<td>${item.date } ${item.dayOfWeek }</td>
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
							<div class="mb-3 col">
								<input type="text" name="" value="" id="startDate2" class="datepicker inp" placeholder="시작일 선택" readonly="true" onchange="reloadListFn(2)">
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(startDate2)" style="cursor: pointer;"></i> ~ 
								<input type="text" name="" value="${today }" id="endDate2" class="datepicker inp" placeholder="종료일 선택" readonly="true" onchange="reloadListFn(2)"> 
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(endDate2)" style="cursor: pointer;"></i>
								<div class="float-right">
									<a onclick="overtime_aplicationFn()" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm small float-right">
										<i class="fas fa-fw fa-briefcase"></i> 초과근무 신청
									</a>
								</div>
							</div>
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
											<td>${item.date } ${item.dayOfWeek }</td>
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
													<c:when test="${item.state == 9 }">
														<span class="btn-gradient mini btn-withdrawal">철회</span>
													</c:when>
												</c:choose>
											</td>
											<td>
												<a href="overtime_view.do?no=${item.overtimeNo }">
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
							<div class="mb-3 col">
								<input type="text" name="" value="" id="startDate3" class="datepicker inp" placeholder="시작일 선택" readonly="true" onchange="reloadListFn(3,1)">
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(startDate3)" style="cursor: pointer;"></i> ~ 
								<input type="text" name="" value="${today }" id="endDate3" class="datepicker inp" placeholder="종료일 선택" readonly="true" onchange="reloadListFn(3,1)"> 
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(endDate3)" style="cursor: pointer;"></i>
								<div id="searchDiv" class="float-right">
									<input type="text" id="searchInput">
									<button type="button" onclick="reloadListFn(3,1)">검색</button>
								</div>
							</div>
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
								<tbody class="outputBody3">
									<c:forEach var="item" items="${allWorkList }">
										<tr>
											<td>${item.date }  ${item.dayOfWeek }</td>
											<td>
												<span class="d-inline card bg-info text-white text-center px-2">${item.dept }</span>
												<span>${item.name }</span>
												<span class="text-xs font-weight-bold text-primary text-uppercase mb-1">${item.position }</span>
											</td>
											<td>${item.start }</td>
											<td>${item.end }</td>
											<td>${item.overtime }</td>
											<td>${item.total }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table><br>
							<!------- 페이징 ------->
							<div class="page_wrap">
   							<div class="page_nation">
   								<c:if test="${pagingVO.startPage > pagingVO.cntPage }">
										<a class="arrow prev" onclick="reloadListFn(3,${pagingVO.startPage-1})"></a>
									</c:if>
									<c:forEach var="p" begin="${pagingVO.startPage }" end="${pagingVO.endPage }">
										<c:choose>
											<c:when test="${p eq pagingVO.nowPage }">
												<a class="active" onclick="reloadListFn(3,${p}); pagingFn(this)">${p }</a>
											</c:when>
											<c:when test="${p ne pagingVO.nowPage }">
												<a onclick="reloadListFn(3,${p}); pagingFn(this)">${p }</a>
											</c:when>
										</c:choose>
									</c:forEach>
									<c:if test="${pagingVO.endPage < pagingVO.lastPage }">
										<a onclick="reloadListFn(${pagingVO.endPage+1})"></a>
									</c:if>
								</div>
							</div>
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
	
	const today = '${today}';
	
	window.onload = function(){
		let selMenu = '${selMenu}';
		if(selMenu=='2'){
			menu1.style.display = "none";
			menu2.style.display = "block";
			menu3.style.display = "none";
		}
		let goToWorkButton = $("#goToWorkButton");
		let leaveWorkButton = $("#leaveWorkButton");
		if('${start}' != null && '${start}' != ''){
			goToWorkButton.attr("class", "d-none d-sm-inline-block btn btn-sm btn-success shadow-sm");
		}
		if('${end}' != null && '${end}' != ''){
			leaveWorkButton.attr("class", "d-none d-sm-inline-block btn btn-sm btn-success shadow-sm");
		}
		
	}
	
	function displayFn(obj){
		if(obj==1){
			menu1.style.display = "block";
			menu2.style.display = "none";
			menu3.style.display = "none";
			
		}else if(obj==2){
			menu1.style.display = "none";
			menu2.style.display = "block";
			menu3.style.display = "none";
			
		}else if(obj==3){
			menu1.style.display = "none";
			menu2.style.display = "none";
			menu3.style.display = "block";
			
		}
	}
	
	function reloadListFn(obj, pNum){
		let startDate;
		let endDate;
		let searchInput;
		if(obj==1){
			startDate = $("#startDate1").val();
			endDate = $("#endDate1").val();
		}else if(obj==2){
			startDate = $("#startDate2").val();
			endDate = $("#endDate2").val();
		}else if(obj==3){
			startDate = $("#startDate3").val();
			endDate = $("#endDate3").val();
			searchInput = $("#searchInput").val();
		}
		
		$.ajax({
			url:"reloadList.do",
			data: {startDate : startDate, endDate : endDate, obj : obj, searchInput : searchInput, pNum : pNum},
			success:function(data){
				if(obj==1){
					let html = "";
					let outputBody = $(".outputBody1");
					for(let i=0; i<data.length; i++){
						html += "<tr>";
						html += "<td>"+data[i].date + " " + data[i].dayOfWeek+"</td>";
						html += "<td>"+data[i].start+"</td>";
						html += "<td>"+data[i].end+"</td>";
						html += "<td>"+data[i].overtime+"</td>";
						html += "<td>"+data[i].total+"</td>";
						html += "</tr>";
					}
					outputBody.html(html);
					
				}else if(obj==2){
					let html = "";
					let outputBody = $(".outputBody2");
					for(let i=0; i<data.length; i++){
						html += "<tr>";
						html += "<td>"+data[i].date + " " + data[i].dayOfWeek+"</td>";
						html += "<td>"+data[i].start+"</td>";
						html += "<td>"+data[i].end+"</td>";
						html += "<td>"+data[i].total+"</td>";
						html += "<td>"+data[i].content+"</td>";
						html += "<td>"
						if(data[i].state==0){
							html += '<span class="btn btn-light btn-gradient2 mini">대기</span>';
						}else if(data[i].state==1){
							html += '<span class="btn-gradient red mini">진행중</span>';
						}else if(data[i].state==2){
							html += '<span class="btn-gradient green mini">승인</span>';
						}else if(data[i].state==3){
							html += '<span class="btn-gradient mini btn-secondary">반려</span>';
						}else if(data[i].state==9){
							html += '<span class="btn-gradient mini btn-withdrawal">철회</span>';
						}
						html += "</td>"
						html += '<td><a href="overtime_view.do?no='+data[i].overtimeNo+'">';
						html += '<img class="icon-box" src="../resources/img/document_icon.png">';
						html += "</a></td>"
						html += "</tr>";
					}
					outputBody.html(html);
					
				}else if(obj==3){
					let html = "";
					let outputBody = $(".outputBody3");
					for(let i=0; i<data.list.length; i++){
						html += "<tr>";
						html += `<td>\${data.list[i].date} \${data.list[i].dayOfWeek}</td>`;
						html += "<td>";
						html += "<span class='d-inline card bg-info text-white text-center px-2'>"+data.list[i].dept+"</span>&nbsp;";
						html += "<span>"+data.list[i].name+"</span>&nbsp;";
						html += "<span class='text-xs font-weight-bold text-primary text-uppercase mb-1'>"+data.list[i].position+"</span>";
						html += "</td>";
						html += `<td>\${data.list[i].start}</td>`;
						html += "<td>"+data.list[i].end+"</td>";
						html += "<td>"+data.list[i].overtime+"</td>";
						html += "<td>"+data.list[i].total+"</td>";
					}
					outputBody.html(html);
					
					html = "";
					outputBody = $(".page_nation");
					
					if(data.pagingVO.startPage > data.pagingVO.cntPage){
						html += `<a class="arrow prev" onclick="reloadListFn(3,\${data.pagingVO.startPage-1})"></a>`
					}
					for(let i=data.pagingVO.startPage; i<=data.pagingVO.endPage; i++){
						if(i==data.pagingVO.nowPage){
							html += `<a class="active" onclick="reloadListFn(3,\${i}); pagingFn(this)">\${i}</a>`;
						}else{
							html += `<a onclick="reloadListFn(3,\${i}); pagingFn(this)">\${i}</a>`;
						}
					}
					if(data.pagingVO.endPage < data.pagingVO.lastPage){
						html += `<a onclick="reloadListFn(\${data.pagingVO.endPage+1})"></a>`;
					}
					
					outputBody.html(html);
				}
			}
			
		});
	}
	
	function pagingFn(obj){
		let otherA = $(".page_nation").children(".active");
		otherA.attr("class","");
		let thisA = $(obj);
		thisA.attr("class","active");
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
	
	function overtime_aplicationFn(){
		let isOvertimeApplicationToday = ${isOvertimeApplicationToday};
		if(isOvertimeApplicationToday>0){
			alert("오늘 이미 처리 진행중인 초과근무 건이 있습니다.");
		}else{
			location.href="overtime_application.do";
		}
	}
	
	
</script>
<script src="${pageContext.request.contextPath}/resources/js/calendar_max_0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sign_main.js"></script>
<%@ include file="../include/footer.jsp"%>