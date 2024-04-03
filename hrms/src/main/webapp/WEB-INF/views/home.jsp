<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/navigator.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<head>
	<link href="${pageContext.request.contextPath}/resources/css/etc.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/calendar.css" rel="stylesheet">
</head>
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
							<div class="h5 mb-2 font-weight-bold text-gray-800">
								<span id="goToWorkClock"></span> ~
								<span id="leaveWorkClock"></span>
							</div>
						</div>
						<div class="col-auto">
							<a class="btn btn-primary btn-icon-split"> 
								<span id="goToWorkButton" onclick="workFn('GO')" class="text">출근</span>
							</a> 
							<a class="btn btn-danger btn-icon-split"> 
								<span id="leaveWorkButton" onclick="workFn('LEAVE')" class="text">퇴근</span>
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
									<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${myThisWeekTotalWorkTimePlusMyTotalOvertimeTime }</div>
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
							<div class="h5 mb-0 font-weight-bold text-gray-800">
								${user.keepVaca_day }일
								<span class="text-md">(${user.keepVaca }시간)</span>
							</div>
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
			<button onclick="getDatesStartToLast('2024-01-01','2024-02-03')">테스트버튼</button>
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
<!-- <script src="resources/js/calendar_home.js"></script> -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>

<!-- 달력 스크립트 -->
<script>
	let date = new Date();
	
	const renderCalender = () => {
		const viewYear = date.getFullYear();
		const viewMonth = date.getMonth();
		
		document.querySelector('.year-month').textContent = viewYear + "년 " + (viewMonth + 1) + "월";
	
		const prevLast = new Date(viewYear, viewMonth, 0);
		const thisLast = new Date(viewYear, viewMonth + 1, 0);
	
		const PLDate = prevLast.getDate();
		const PLDay = prevLast.getDay();
	
		const TLDate = thisLast.getDate();
		const TLDay = thisLast.getDay();
	
		const prevDates = [];
		const thisDates = [...Array(TLDate + 1).keys()].slice(1);
		const nextDates = [];
	
		if (PLDay !== 6) {
			for (let i = 0; i < PLDay + 1; i++) {
				prevDates.unshift(PLDate - i);
			}
		}
	
		for (let i = 1; i < 7 - TLDay; i++) {
			nextDates.push(i);
		}
	
		const dates = prevDates.concat(thisDates, nextDates);
		const firstDateIndex = dates.indexOf(1);
		const lastDateIndex = dates.lastIndexOf(TLDate);
	
		var list = '${list}';
		var listArr = list.split("VacaVO");
		listArr.splice(0,1);
		
		dates.forEach((date, i) => {
			
			var startDate;
			var endDate;
			if(i<listArr.length){
				startDate = listArr[i].match(/[0-9]{4}-[0-9]{2}-[0-9]{2}/g)[1];
				endDate = listArr[i].match(/[0-9]{4}-[0-9]{2}-[0-9]{2}/g)[2];
			}
			
			var format = viewYear+"-"+(("00"+(viewMonth+1).toString()).slice(-2))+"-"+(("00"+date.toString()).slice(-2));
			
			
			
			const condition = i >= firstDateIndex && i < lastDateIndex + 1
				? 'this'
				: 'other';
	
			dates[i] = '<div class="date">'
				+ '<span class="' + condition + '">' + date + '</span>'
				+ '<div onclick="clickFn()" class="card bg-info text-white text-center shadow cursor-pointer">'
				+ '연차 1건'
				+ '</div>'
				+ '</div>';
	
		});
	
		document.querySelector('.dates').innerHTML = dates.join('');
	
		const today = new Date();
		if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
			for (let date of document.querySelectorAll('.this')) {
				if (+date.innerText === today.getDate()) {
					date.classList.add('today');
					break;
				}
			}
		}
	};
	
	renderCalender();
	
	const prevMonth = () => {
		date.setMonth(date.getMonth() - 1);
		renderCalender();
	};
	
	const nextMonth = () => {
		date.setMonth(date.getMonth() + 1);
		renderCalender();
	};
	
	const goToday = () => {
		date = new Date();
		renderCalender();
	};
</script>

<!-- 테스트 -->
<script>
	function getDatesStartToLast(startDate, lastDate) {
		var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
		if(!(regex.test(startDate) && regex.test(lastDate))) return "Not Date Format";
		
		var result = [];
		var curDate = new Date(startDate);
		while(curDate <= new Date(lastDate)) {
			result.push(curDate.toISOString().split("T")[0]);
			curDate.setDate(curDate.getDate() + 1);
		}
		console.log(result);
		return result;
	}
	
</script>


<!-- 달력 클릭 함수 (연차자 표시) -->
<script>
	function clickFn(){
		console.log("ㅇㅇ");
	}

</script>

<!-- 온로드 함수 -->
<script>
	window.onload = function(){
		let goToWorkButton = $("#goToWorkButton");
		let leaveWorkButton = $("#leaveWorkButton");
		if('${start}' != null && '${start}' != ''){
			goToWorkButton.parent().attr("class", "btn btn-success btn-icon-split");
		}
		if('${end}' != null && '${end}' != ''){
			leaveWorkButton.parent().attr("class", "btn btn-success btn-icon-split");
		}
	}
</script>

<!-- 출퇴근버튼 스크립트 -->
<script>
	//시계 표시
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
					url:"work/workInsert.do",
					type:"POST",
					data: {dateStr : dateStr, timeStr : timeStr, goOrLeave : goOrLeave},
					success:function(data){
						alert("출근 처리 되었습니다.");
						location.href='${pageContext.request.contextPath}';
					}
				});
			   
			}else{
				alert("이미 출근 처리되었습니다.");
			}
			
		}else if(obj=="LEAVE"){
			if(start==""){
				alert("출근 처리가 완료되지 않았습니다.");
			}else{
	//			clearInterval(clockVar);
				let goOrLeave = "LEAVE";
			   $.ajax({
					url:"work/workInsert.do",
					type:"POST",
					data: {dateStr : dateStr, timeStr : timeStr, goOrLeave : goOrLeave},
					success:function(data){
						console.log(data);
					
						if(data=="SUCCESS"){
							alert("퇴근 처리 되었습니다.");
							location.href='${pageContext.request.contextPath}';
							
						}else{
							let message = "금일 \n";
							if(data.afternoon != null){
								message += data.afternoon[0]+"시 ~ "+data.afternoon[1]+"시 \n";
							}
							if(data.evening != null){
								message += data.evening[0]+"시 ~ "+data.evening[1]+"시 \n";
							}
							if(data.afternoon != null || data.evening != null){
								message += "까지 초과근무를 신청하셨습니다. \n지금 퇴근처리 하시겠습니까?";
							}
							let choice = confirm(message);
							if(choice){
								$.ajax({
									url:"updateOvertime.do",
									type:"POST",
									data: {dateStr : dateStr},
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
</script>
<!-- /.container-fluid -->
<%@ include file="include/footer.jsp" %>