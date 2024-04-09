<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
										<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${myThisWeekTotalWorkTime }</div>
									</div>
									<div class="col">
										<div class="progress progress-sm mr-2">
											<div id="workBar" class="progress-bar bg-info" role="progressbar"
												style="" aria-valuenow="50" aria-valuemin="0"
												aria-valuemax="100"></div>
										</div>
									</div>
								</div>
								<span class="text-lightgray"> / 52:00:00</span>
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
								<div class="h5 mb-0 font-weight-bold text-gray-800">${myThisWeekOvertimeTime }</div>
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
							<span id="myWork" class="menubar" onclick="displayFn(1)">내 근무</span> 
							<span id="myOvertime" class="menubar" onclick="displayFn(2)">내 초과근무</span> 
						<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CEO', 'ROLE_DIRECTOR', 'ROLE_LEADER')">
							<span id="allWork" class="menubar" onclick="displayFn(3)">근무 조회</span> 
						</sec:authorize>
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
											<td>
												<c:forEach var="i" begin="0" end="1">
													<c:set var="ot" value="${fn:split(item.overtime,',')[i]}" />
													<c:set var="ots" value="${fn:split(item.overtime_state,',')[i]}" />
													<c:choose>
														<c:when test="${ots eq '(결재 대기)'}">
															<c:set var="className" value="text-gray" />
														</c:when>
														<c:when test="${ots eq '(결재 진행중)'}">
															<c:set var="className" value="text-red" />
														</c:when>
														<c:when test="${ots eq '(승인)'}">
															<c:set var="className" value="text-green" />
														</c:when>
														<c:when test="${empty ots}">
															<c:set var="className" value="" />
														</c:when>
													</c:choose>
													<c:if test="${i==1 }"><br></c:if>
													<c:if test="${not empty ot}">
														<span class="${className }">${ot } ${ots}</span> 
													</c:if>
												</c:forEach>
											</td>
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
						<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_CEO', 'ROLE_DIRECTOR', 'ROLE_LEADER')">
							<div class="mb-3 col">
								<input type="text" name="" value="" id="startDate3" class="datepicker inp" placeholder="시작일 선택" readonly="true" onchange="reloadListFn(3,1)">
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(startDate3)" style="cursor: pointer;"></i> ~ 
								<input type="text" name="" value="${today }" id="endDate3" class="datepicker inp" placeholder="종료일 선택" readonly="true" onchange="reloadListFn(3,1)"> 
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(endDate3)" style="cursor: pointer;"></i>
								<div id="searchDiv" class="float-right">
									<input type="text" id="searchVal">
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
										<th>초과근무</th>
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
											<td>
												<c:forEach var="i" begin="0" end="1">
													<c:set var="ot" value="${fn:split(item.overtime,',')[i]}" />
													<c:set var="ots" value="${fn:split(item.overtime_state,',')[i]}" />
													<c:choose>
														<c:when test="${ots eq '(결재 대기)'}">
															<c:set var="className" value="text-gray" />
														</c:when>
														<c:when test="${ots eq '(결재 진행중)'}">
															<c:set var="className" value="text-red" />
														</c:when>
														<c:when test="${ots eq '(승인)'}">
															<c:set var="className" value="text-green" />
														</c:when>
														<c:when test="${empty ots}">
															<c:set var="className" value="" />
														</c:when>
													</c:choose>
													<c:if test="${i==1 }"><br></c:if>
													<c:if test="${not empty ot}">
														<span class="${className }">${ot } ${ots}</span> 
													</c:if>
												</c:forEach>
											</td>
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
						</sec:authorize>
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
	
	const myWork = document.querySelector("#myWork");
	const myOvertime = document.querySelector("#myOvertime");
	const allWork = document.querySelector("#allWork");
	
	window.onload = function(){
		let goToWorkButton = $("#goToWorkButton");
		let leaveWorkButton = $("#leaveWorkButton");
		if('${start}' != null && '${start}' != ''){
			goToWorkButton.attr("class", "d-none d-sm-inline-block btn btn-sm btn-success shadow-sm");
		}
		if('${end}' != null && '${end}' != ''){
			leaveWorkButton.attr("class", "d-none d-sm-inline-block btn btn-sm btn-success shadow-sm");
		}
		myWork.setAttribute("class","menubar text-decoration");
		
		const workBar = $("#workBar");
		let percent = '${myThisWeekTotalWorkTime}'.substring(0,2)/52*100+"%";
		workBar.attr("style",`width:\${percent}`);
	}
	
	function displayFn(obj){
		if(obj==1){
			menu1.style.display = "block";
			menu2.style.display = "none";
			menu3.style.display = "none";
			myWork.setAttribute("class","menubar text-decoration");
			myOvertime.setAttribute("class","menubar");
			if(allWork!=null) allWork.setAttribute("class","menubar");
			
		}else if(obj==2){
			menu1.style.display = "none";
			menu2.style.display = "block";
			menu3.style.display = "none";
			myWork.setAttribute("class","menubar");
			myOvertime.setAttribute("class","menubar text-decoration");
			if(allWork!=null) allWork.setAttribute("class","menubar");
			
		}else if(obj==3){
			menu1.style.display = "none";
			menu2.style.display = "none";
			menu3.style.display = "block";
			myWork.setAttribute("class","menubar");
			myOvertime.setAttribute("class","menubar");
			if(allWork!=null) allWork.setAttribute("class","menubar text-decoration");
		}
	}
	
	function reloadListFn(obj, pNum){
		let startDate;
		let endDate;
		let searchVal;
		if(obj==1){
			startDate = $("#startDate1").val();
			endDate = $("#endDate1").val();
		}else if(obj==2){
			startDate = $("#startDate2").val();
			endDate = $("#endDate2").val();
		}else if(obj==3){
			startDate = $("#startDate3").val();
			endDate = $("#endDate3").val();
			searchVal = $("#searchVal").val();
		}
		
		$.ajax({
			url:"reloadList.do",
			data: {startDate : startDate, endDate : endDate, obj : obj, searchVal : searchVal, pNum : pNum},
			success:function(data){
				if(obj==1){
					let html = "";
					let outputBody = $(".outputBody1");
					for(let i=0; i<data.length; i++){
						html += "<tr>";
						html += "<td>"+data[i].date + " " + data[i].dayOfWeek+"</td>";
						html += "<td>"+data[i].start+"</td>";
						html += "<td>"+data[i].end+"</td>";
						html += "<td>";
						if(data[i].overtime.includes(',')){
							for(let j=0; j<2; j++){
								let ot = data[i].overtime.split(',')[j];
								let ots = data[i].overtime_state.split(',')[j];
								let className = "";
								switch(ots){
									case '(결재 대기)' : className = "text-gray"; break;
									case '(결재 진행중)' : className = "text-red"; break;
									case '(승인)' : className = "text-green"; break;
									case null : className = ""; break;
								}
								if(j==1){html += "<br>";}
								html += "<span class='"+className+"'>"+ot+" "+ots+"</span>";
							}
						}else{
							switch(data[i].overtime_state){
								case '(결재 대기)' : className = "text-gray"; break;
								case '(결재 진행중)' : className = "text-red"; break;
								case '(승인)' : className = "text-green"; break;
								case null : className = ""; break;
							}
							html += `<span class='\${className}'>\${data[i].overtime} `
							if(data[i].overtime_state!=null){
								html += `\${data[i].overtime_state}`;
							}
							html += "</span>";
						}
						html += "</td>"
						
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
						html += "<td>";
						if(data.list[i].overtime.includes(',')){
							for(let j=0; j<2; j++){
								let ot = data.list[i].overtime.split(',')[j];
								let ots = data.list[i].overtime_state.split(',')[j];
								let className = "";
								switch(ots){
									case '(결재 대기)' : className = "text-gray"; break;
									case '(결재 진행중)' : className = "text-red"; break;
									case '(승인)' : className = "text-green"; break;
									case null : className = ""; break;
								}
								if(j==1){html += "<br>";}
								html += "<span class='"+className+"'>"+ot+" "+ots+"</span>";
							}
						}else{
							switch(data.list[i].overtime_state){
								case '(결재 대기)' : className = "text-gray"; break;
								case '(결재 진행중)' : className = "text-red"; break;
								case '(승인)' : className = "text-green"; break;
								case null : className = ""; break;
							}
							html += `<span class='\${className}'>\${data.list[i].overtime} `
							if(data.list[i].overtime_state!=null){
								html += `\${data.list[i].overtime_state}`;
							}
							html += "</span>";
						}
						html += "</td>"
						html += "<td>"+data.list[i].total+"</td>";
					}
					outputBody.html(html);
					
					// 페이징
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
					type:"POST",
					data: {date : dateStr, time : timeStr, goOrLeave : goOrLeave},
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
//				clearInterval(clockVar);
				let goOrLeave = "LEAVE";
			   $.ajax({
					url:"workInsert.do",
					type:"POST",
					data: {date : dateStr, time : timeStr, goOrLeave : goOrLeave},
					success:function(data){
						if(data=="SUCCESS"){
							alert("퇴근 처리 되었습니다.");
							location.href="main.do";
						}else{
							let message = "금일 \n";
							for(let i=0; i<data.length; i++){
								if(data[i]!==null){
									message += data[i].start+"시 ~ "+data[i].end+"시 \n";
								}							
							}
							message += "까지 초과근무를 신청하셨습니다. \n지금 퇴근처리 하시겠습니까?";
							let choice = confirm(message);
							if(choice){
								$.ajax({
									url:"updateOvertime.do",
									type:"POST",
									data: {date : dateStr, time : timeStr},
									success:function(data){
										alert("퇴근 처리 되었습니다.");
										location.href="main.do";
									}
								})
							}
						}
					}
				});
			}
		}
	   
	}
	
	function overtime_aplicationFn(){
		
		let ovoAppArr = '${ovoAppArr}';
		if(ovoAppArr !== ""){
			alert("오늘 이미 처리 진행중인 초과근무 건이 있습니다.");
		}else{
			location.href="overtime_application.do";
		}
	}
	
</script>
<script src="${pageContext.request.contextPath}/resources/js/calendar_noMin_noMax_Const.js"></script>
<script>
	$("#startDate1").datepicker({
		  dateFormat: 'yy-mm-dd',
		  maxDate: 0,
		  onClose: function(selectedDate) {
			  $('#endDate1').datepicker('destroy'); 
			  $("#endDate1").val("");
			  let minD = new Date(selectedDate);
			  minD.setDate(minD.getDate()+1);
		  
		    $("#endDate1").datepicker({
		      dateFormat: 'yy-mm-dd',
		      minDate: minD,
		      maxDate: 0
		    })
		  }
	});
	$("#startDate2").datepicker({
		  dateFormat: 'yy-mm-dd',
		  maxDate: 0,
		  onClose: function(selectedDate) {
			  $('#endDate2').datepicker('destroy'); 
			  $("#endDate2").val("");
			  let minD = new Date(selectedDate);
			  minD.setDate(minD.getDate()+1);
		  
		    $("#endDate2").datepicker({
		      dateFormat: 'yy-mm-dd',
		      minDate: minD,
		      maxDate: 0
		    })
		  }
	});
	$("#startDate3").datepicker({
		  dateFormat: 'yy-mm-dd',
		  maxDate: 0,
		  onClose: function(selectedDate) {
			  $('#endDate3').datepicker('destroy'); 
			  $("#endDate3").val("");
			  let minD = new Date(selectedDate);
			  minD.setDate(minD.getDate()+1);
		  
		    $("#endDate3").datepicker({
		      dateFormat: 'yy-mm-dd',
		      minDate: minD,
		      maxDate: 0
		    })
		  }
	});
</script>
<%@ include file="../include/footer.jsp"%>