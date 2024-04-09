<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/navigator.jsp"%>
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

	<sec:authorize access="!hasRole('ROLE_ADMIN')">
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
									<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${myThisWeekTotalWorkTime }</div>
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
	</sec:authorize>

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
				<!-- 연차자 명단 출력 div -->
				<div id="vaca-list" class="card-body">
					<div id="vaca-date" class="h4 mb-3 ml-2 font-weight-bold text-gray-800 today-date">${today}</div>
					<c:if test="${!empty todayList }">
						<c:forEach var="i" items="${todayList }">
							<div class="card mt-3 bg-light text-black">
								<div class="card-body">
									<div id="vaca-dept" class="d-inline card bg-info text-white text-center px-2">${i.dept}</div>
										<span id="vaca-name">${i.name}</span>
										<span class="text-xs font-weight-bold text-primary text-uppercase mb-1" id="vaca-position">${i.position}</span>
									<!-- <div id="vaca-state" class="d-inline ml-5">${i.state}</div> -->
								</div>
							</div>
						</c:forEach>
					</c:if>
					<c:if test="${empty todayList }">
						<div class="h4 mb-3 ml-2 font-weight-bold text-lightgray">연차자 없음 <i class="fas fa-user-alt-slash"></i></div>
					</c:if>
				</div>
			</div>
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

<!-- 날짜 계산 -->
<script>
	function isDateBetweenStartToEnd(startDate, endDate, paramDate) {
		var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
		if(!(regex.test(startDate) && regex.test(endDate))) return "Not Date Format";
		
		var curDate = new Date(paramDate);
		var text;
		if(curDate>=new Date(startDate)){
			if(curDate<=new Date(endDate)){
				return true;
			}
		}
		return false;
	}
	
	function getDayOfWeek(yyyyMMdd){
		
	    const dayOfWeek = new Date(yyyyMMdd).getDay(); 
	    
	    //0:일, 1:월, 2:화, 3:수, 4:목, 5:금, 6:토
	    return dayOfWeek;
	}
</script>

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
			
			const condition = i >= firstDateIndex && i < lastDateIndex + 1 ? 'this' : 'other';
			
			var formatDate = viewYear+"-";
			if(condition==='this'){
				formatDate += (("00"+(viewMonth+1).toString()).slice(-2))+"-";
			}else{
				if(i < lastDateIndex + 1){
					formatDate += (("00"+(viewMonth).toString()).slice(-2))+"-";
				}else{
					formatDate += (("00"+(viewMonth+2).toString()).slice(-2))+"-";
				}
			}
			formatDate += (("00"+date.toString()).slice(-2));
			
			// 출력할 연차자 담을 배열
			var view = [];
			// formatDate 가 listArr 돌면서 포함되는 날 있는지 찾고 배열에 담는다
			for(let j=0; j<listArr.length; j++){
				var startDate = listArr[j].match(/[0-9]{4}-[0-9]{2}-[0-9]{2}/g)[1];
				var endDate = listArr[j].match(/[0-9]{4}-[0-9]{2}-[0-9]{2}/g)[2];
				
				var dept = listArr[j].match(/dept=.*/)[0].split(',')[0].substring(5);
				var name = listArr[j].match(/name=.*/)[0].split(',')[0].substring(5);
				var position = listArr[j].match(/position=.*/)[0].split(',')[0].substring(9);
				
				var obj = {dept, name, position, formatDate};
				
				var flag = isDateBetweenStartToEnd(startDate, endDate, formatDate);
				if(flag==true){
					view.push(obj);
				}
			}
			
			let viewJSON = JSON.stringify(view);
			
			let dayOfWeek = getDayOfWeek(formatDate);
	
			dates[i] = '<div class="date">'
						+ '<span class="' + condition + '">' + date + '</span>';
			if(view.length>0 && (dayOfWeek!=0 && dayOfWeek !=6)) {
				dates[i] += "<div onclick='clickFn("+viewJSON+", this)' class='card bg-info text-white text-center shadow cursor-pointer'>"
							+ '연차 ' + view.length + '건' + '</div>';
			}
			dates[i]	+= '</div>';
	
		});
	
		document.querySelector('.dates').innerHTML = dates.join('');
	
		const today = new Date();
		if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
			for (let date of document.querySelectorAll('.this')) {
				if (+date.innerText === today.getDate()) {
					date.classList.add('today');
					let sibling = date.nextElementSibling;
					if(sibling==null){
						date.setAttribute("style","cursor:pointer");
						date.setAttribute("onclick","todayVacaFn()");
					}
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

<!-- 달력 클릭 함수 (연차자 표시) -->
<script>
	function clickFn(obj, t){
		const vacaDiv = $("#vaca-list");
		let html = "";
		html += `<div id="vaca-date" class="h4 mb-3 ml-2 font-weight-bold text-gray-800 today-date">\${obj[0].formatDate}</div>`;
		for(let i=0; i<obj.length; i++){
			html += `<div class="card mt-3 bg-light text-black">`;
			html += `<div class="card-body">`;
			html += `<div id="vaca-dept" class="d-inline card bg-info text-white text-center px-2">\${obj[i].dept}</div>`;
			html += `<span id="vaca-name">\ \${obj[i].name}\ </span>`;
			html += `<span class="text-xs font-weight-bold text-primary text-uppercase mb-1" id="vaca-position">\${obj[i].position}</span>`;
//			html += `<div id="vaca-state" class="d-inline ml-5">\${obj[i].state}</div>`;
			html += `</div>`;
			html += `</div>`;
		}
		vacaDiv.html(html);
		
		const sAll = $(".calendar.col").find("span");
		sAll.removeClass("selectDate");
		const s = $(t).prev();
		s.addClass("selectDate");
	}
	
	function todayVacaFn(){
		const vacaDiv = $("#vaca-list");
		const list = `${todayList}`;
		if(list=="[]"){
			let html = `<div id="vaca-date" class="h4 mb-3 ml-2 font-weight-bold text-gray-800 today-date">${today}</div>`;
			html += `<div class="h4 mb-3 ml-2 font-weight-bold text-lightgray">연차자 없음 <i class="fas fa-user-alt-slash"></i></div>`;
			vacaDiv.html(html);
		}
	}

</script>

<sec:authorize access="!hasRole('ROLE_ADMIN')">
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
</sec:authorize>
<!-- /.container-fluid -->
<%@ include file="include/footer.jsp" %>