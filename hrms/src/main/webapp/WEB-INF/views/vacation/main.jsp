<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>
<head>
	<!-- 데이트피커 { -->
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
	<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<!-- } -->
	
	<link href="${pageContext.request.contextPath}/resources/css/table.css" rel="stylesheet">
	<!-- 캘린더(데이트피커) 스타일 (jquery-ui.css 파일호출 보다 아래에 있어야 합니다.) { -->
	<link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/button.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/pagination.css" rel="stylesheet">
</head>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">연차</h1>
		</div>

		<!-- Content Row -->
		<div class="row">

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-3 mb-3">
				<div class="card border-left-primary shadow h-200 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">최근 연차 신청</div>
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<div class="h5 mb-0 font-weight-bold text-black-bold">${myRecentVacaApplication.state }</div>
									<span class="content-text-small">
										${myRecentVacaApplication.startDate } ${myRecentVacaApplication.startTime } ~ <br>
										${myRecentVacaApplication.endDate } ${myRecentVacaApplication.endTime }
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-3 mb-3">
				<div class="card border-left-info shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold text-info text-uppercase mb-1">
									잔여 연차
								</div>
								<div class="row no-gutters align-items-center">
									<div class="col-auto">
										<div class="h5 mb-0 mr-3 font-weight-bold text-blue-bold">
											${user.keepVaca_day }일
											<span class="text-lg">(${user.keepVaca }시간)</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-3 mb-3">
				<div class="card border-left-success shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold text-success text-uppercase mb-1">
									사용 연차
								</div>
								<div class="h5 mb-0 font-weight-bold text-green-bold">
									${user.useVaca_day }일
									<span class="text-lg">(${user.useVaca }시간)</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Earnings (Monthly) Card Example -->
			<div class="col-xl-3 col-md-3 mb-3">
				<div class="card border-left-warning shadow h-100 py-2">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
							<div class="col mr-2">
								<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
									총 연차
								</div>
								<div class="h5 mb-0 font-weight-bold text-black-bold">
									<fmt:formatNumber type="number" maxFractionDigits="0" value="${(user.keepVaca + user.useVaca) / 8}" />일
									<span class="text-lg">(${user.keepVaca + user.useVaca }시간)</span>
								</div>
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
							<span class="menubar" onclick="displayFn(1)">내 연차</span> 
							<span class="menubar" onclick="displayFn(2)">연차 조회</span> 
						</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
					
						<!-- 내 연차 -->
						<div id="menu1">
							<div class="mb-3 col">
								<input type="text" name="" id="startDate1" class="datepicker inp" placeholder="연차 시작일" readonly="true" onchange="reloadListFn()">
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(startDate1)" style="cursor: pointer;"></i> ~ 
								<input type="text" name="" id="endDate1" class="datepicker inp" placeholder="연차 시작일" readonly="true" onchange="reloadListFn()"> 
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(endDate1)" style="cursor: pointer;"></i>
								<div class="float-right">
									<a href="application.do" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm small float-right">
										<i class="fas fa-fw fa-plane"></i> 연차 신청
									</a>
								</div>
							</div>
							<table>
								<thead>
									<tr>
										<th>기간</th>
										<th>일수</th>
										<th>시작 시간</th>
										<th>종료 시간</th>
										<th>총 사용 시간</th>
										<th>사유</th>
										<th>신청일</th>
										<th>상태</th>
										<th>내역</th>
									</tr>
								</thead>
								<tbody class="outputBody1">
									<c:forEach var="i" items="${myVacaList }">
										<tr>
											<td>${i.startDate } ${i.startDate_dayOfWeek} ~ ${i.endDate } ${i.endDate_dayOfWeek}</td>
											<td>${i.duration }일</td>
											<td>${i.startDate} ${i.startDate_dayOfWeek}<br>${i.startTime }</td>
											<td>${i.endDate} ${i.endDate_dayOfWeek}<br>${i.endTime }</td>
											<td>${i.useTime }</td>
											<td>${i.reason }</td>
											<td>${i.rdate}</td>
											<td>
												<c:if test="${i.state eq '대기'}">
													<span class="btn btn-light btn-gradient2 mini">대기</span>
												</c:if>
												<c:if test="${i.state eq '진행중'}">
													<span class="btn-gradient red mini">진행중</span>
												</c:if>
												<c:if test="${i.state eq '승인'}">
													<span class="btn-gradient green mini">승인</span>
												</c:if>
												<c:if test="${i.state eq '반려'}">
													<span class="btn-gradient mini btn-secondary">반려</span>
												</c:if>
												<c:if test="${i.state eq '사용 완료'}">
													<span class="btn-gradient green mini">사용 완료</span>
												</c:if>
												<c:if test="${i.state eq '철회'}">
													<span class="btn-gradient mini btn-secondary">철회</span>
												</c:if>
											</td>
											<td>
												<a href="view.do?no=${i.vacaNo }">
													<img class="icon-box" src="${pageContext.request.contextPath}/resources/img/document_icon.png">
												</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						
						<!-- 연차 조회(관리자) -->
						<div id="menu2" class="display-none">
							<div>
								2024-03-02 ~ 2024-03-13
								<i class="fas fa-calendar fa-2x text-gray-300" onclick="openModal()"></i>
								<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm small float-right">
									<i class="fas fa-fw fa-plane"></i> 연차 부여
								</a>
							</div>
							<table>
								<thead>
									<tr>
										<th>부서</th>
										<th>직급</th>
										<th>이름</th>
										<th>총 연차</th>
										<th>사용 연차</th>
										<th>잔여 연차</th>
										<th>내역</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>개발부</td>
										<td>사원</td>
										<td>김사원</td>
										<td>14일</td>
										<td>7일</td>
										<td>7일</td>
										<td><img id="modal-open" class="icon-box" src="${pageContext.request.contextPath}/resources/img/document_icon.png"></td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!--========================= 모달창 ======================-->
	<div class="popup-wrap" id="popup">
		<div class="popup">
			<div class="popup-head">
				<span class="head-title">??님의 연차 내역</span>
			</div>
			<div class="popup-body">
				<div class="body-content">
					<div class="body-contentbox">
						<div class="popup-content-box">
							<span class="text-head">2023-03-02~2023-03-03 </span>
							<span class="text-content">휴가</span>
							<span class="text-content-small">2일</span>
						</div>
						<div class="popup-content-box">
							<span class="text-head">2023-03-02~2023-03-03 </span>
							<span class="text-content">휴가</span>
							<span class="text-content-small">2일</span>
						</div>
						<div class="popup-content-box">
							<span class="text-head">2023-03-02~2023-03-03 </span>
							<span class="text-content">휴가</span>
							<span class="text-content-small">2일</span>
						</div>
					</div>
				</div>
			</div>
			<div class="popup-foot">
				<span class="pop-btn close float-right close-custom" id="close">창 닫기</span>
			</div>
		</div>
	</div>
	<!--========================= 모달창 ======================-->
							
<!-- End of Main Content -->

<script>
	function reloadListFn(obj){
		let startDate = $("#startDate1").val();
		let endDate = $("#endDate1").val();
		$.ajax({
			url:"reloadList.do",
			data: {startDate : startDate, endDate : endDate},
			success:function(data){
				let html = "";
				let outputBody = $(".outputBody1");
				for(let i=0; i<data.length; i++){
					html += "<tr>";
					html += `<td>\${data[i].startDate} ~ \${data[i].endDate}</td>`;
					html += `<td>\${data[i].duration}일</td>`;
					html += `<td>\${data[i].startDate}<br>\${data[i].startTime }</td>`;
					html += `<td>\${data[i].endDate}<br>\${data[i].endTime }</td>`;
					html += `<td>\${data[i].useTime }</td>`;
					html += `<td>\${data[i].reason }</td>`;
					html += `<td>\${data[i].rdate}</td>`
					html += "<td>";
					switch(data[i].state){
						case '대기':
							html += `<span class="btn btn-light btn-gradient2 mini">대기</span>`;
							break;
						case '진행중':
							html += `<span class="btn-gradient red mini">진행중</span>`;
							break;
						case '승인':
							html += `<span class="btn-gradient green mini">승인</span>`;
							break;
						case '반려':
							html += `<span class="btn-gradient mini btn-secondary">반려</span>`;
							break;
						case '사용 완료':
							html += `<span class="btn-gradient green mini">사용 완료</span>`;
							break;
						case '철회':
							html += `<span class="btn-gradient mini btn-secondary">철회</span>`;
							break;
					}
					html += "</td>";
					html += `<td><img class="icon-box" src="${pageContext.request.contextPath}/resources/img/document_icon.png"></td>`;
					html += "</tr>";
				}
					
				outputBody.html(html);
			}
		})
	}
</script>
<script src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/calendar_noMin_noMax.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/sign_main.js"></script> --%>
<%@ include file="../include/footer.jsp"%>