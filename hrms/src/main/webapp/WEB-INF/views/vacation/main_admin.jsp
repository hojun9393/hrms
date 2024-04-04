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
	
	<!-- 캘린더(데이트피커) 스타일 (jquery-ui.css 파일호출 보다 아래에 있어야 합니다.) { -->
	<link href="${pageContext.request.contextPath}/resources/css/sign.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/button.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/pagination.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/table.css" rel="stylesheet">
</head>
	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">연차</h1>
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
							<span class="menubar" id="menubar1">연차 조회</span> 
						</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
					
						<!-- 연차 조회(관리자) -->
						<div id="menu1">
							<div class="mb-3 col">
								<input type="text" name="" id="startDate" class="datepicker inp" placeholder="연차 시작일" readonly="true" onchange="reloadListFn()">
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(startDate)" style="cursor: pointer;"></i> ~ 
								<input type="text" name="" id="endDate" class="datepicker inp" placeholder="연차 시작일" readonly="true" onchange="reloadListFn()"> 
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(endDate)" style="cursor: pointer;"></i>
								<div class="float-right">
									<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm small float-right">
										<i class="fas fa-fw fa-plane"></i> 연차 부여
									</a>
								</div>
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
									<c:forEach var="i" items="${list}">
										<tr>
											<td>${i.dept }</td>
											<td>${i.position }</td>
											<td>${i.name }</td>
											<td>
												
											</td>
											<td>
												${i.useVaca_day }
												${i.useVaca }
											</td>
											<td>
												${i.keepVaca_day }
												${i.keepVaca }
											</td>
											<td><img id="modal-open" class="icon-box" src="${pageContext.request.contextPath}/resources/img/document_icon.png"></td>
										</tr>
									</c:forEach>
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
		let startDate = $("#startDate").val();
		let endDate = $("#endDate").val();
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