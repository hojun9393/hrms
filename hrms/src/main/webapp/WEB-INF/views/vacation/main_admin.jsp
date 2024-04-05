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
								<div id="searchDiv" class="float-left">
									<select name="category_dept">
										<option value="">전체</option>
										<option value="D">개발부</option>
										<option value="S">영업부</option>
										<option value="P">기획부</option>
										<option value="H">인사부</option>
									</select>
									<select name="category_position">
										<option value="">전체</option>
										<option value="D">부장</option>
										<option value="L">대표</option>
										<option value="E">사원</option>
									</select>
									<input type="text" id="searchVal">
									<button type="button" onclick="reloadListFn(1)">검색</button>
								</div>
								<div class="float-right mb-2">
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
										<th>연차 부여</th>
									</tr>
								</thead>
								<tbody class="outputBody">
									<c:forEach var="i" items="${list}">
										<tr>
											<td>${i.dept }</td>
											<td>${i.position }</td>
											<td>${i.name }</td>
											<td>
												<span class="text-bold">
													<fmt:formatNumber type="number" maxFractionDigits="0" value="${(i.keepVaca + i.useVaca) / 8}" />일
												</span>
												<span class="text-sm text-blue">(${i.keepVaca + i.useVaca }시간)</span>
											</td>
											<td>
												<span class="text-bold">${i.useVaca_day }일</span>
												<span class="text-sm text-red">(${i.useVaca }시간)</span>
											</td>
											<td>
												<span class="text-bold">${i.keepVaca_day }일</span>
												<span class="text-sm text-green">(${i.keepVaca }시간)</span>
											</td>
											<td><a class="modal-open" href="#" onclick="viewFn('${i.userid}', '${i.name }')"><i class="far fa-id-card fa-lg"></i></a></td>
											<td><a href="#" onclick="giveVacaFn('${i.userid}', '${i.dept }', '${i.position }', '${i.name }')"><i class="fas fa-fw fa-plane fa-lg"></i></a></td>
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
	<!--==================== 페이징 =================-->
	<div class="page_wrap">
		<div class="page_nation">
			<c:if test="${pagingVO.startPage > pagingVO.cntPage }">
				<a class="arrow prev" onclick="reloadListFn(${pagingVO.startPage-1})"></a>
			</c:if>
			<c:forEach var="p" begin="${pagingVO.startPage }" end="${pagingVO.endPage }">
				<c:choose>
					<c:when test="${p eq pagingVO.nowPage }">
						<a class="active" onclick="reloadListFn(${p}); pagingFn(this)">${p }</a>
					</c:when>
					<c:when test="${p ne pagingVO.nowPage }">
						<a onclick="reloadListFn(${p}); pagingFn(this)">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${pagingVO.endPage < pagingVO.lastPage }">
				<a onclick="reloadListFn(${pagingVO.endPage+1})"></a>
			</c:if>
		</div>
	</div>

	<!--==================== 모달창 =================-->
	<div class="popup-wrap" id="popup">
		<div class="popup">
			<div class="popup-head">
				<span class="head-title"></span>
			</div>
			<div class="popup-body">
				<div class="body-content">
					<div class="body-contentbox">
					</div>
				</div>
			</div>
			<div class="popup-foot">
				<span class="pop-btn close float-right close-custom" id="close">창 닫기</span>
			</div>
		</div>
	</div>
	
	<!-- End of Main Content -->

<script>
	function reloadListFn(pNum){
		let category_dept = $("select[name=category_dept]").val();
		let category_position = $("select[name=category_position]").val();
		let searchVal = $("#searchVal").val();
		
		$.ajax({
			url:"reloadList_admin.do",
			data: {searchVal : searchVal, category_dept : category_dept, category_position : category_position, pNum : pNum},
			success:function(data){
				let html = "";
				let outputBody = $(".outputBody");
				for(let i=0; i<data.list.length; i++){
					html += "";
					html += `<tr>`;
					html += `<td>\${data.list[i].dept }</td>`;
					html += `<td>\${data.list[i].position }</td>`;
					html += `<td>\${data.list[i].name }</td>`;
					html += `<td>`;
					html += `<span class="text-bold">`;
					html += ((data.list[i].keepVaca + data.list[i].useVaca) / 8) + '일';
					html += `</span>`;
					html += '<span class="text-sm text-blue"> ('+(data.list[i].keepVaca + data.list[i].useVaca)+'시간)</span>';
					html += `</td>`;
					html += `<td>`;
					html += `<span class="text-bold">\${data.list[i].useVaca_day }일\ </span>`;
					html += `<span class="text-sm text-red">(\${data.list[i].useVaca }시간)</span>`;
					html += `</td>`;
					html += `<td>`;
					html += `<span class="text-bold">\${data.list[i].keepVaca_day }일\ </span>`;
					html += `<span class="text-sm text-green">(\${data.list[i].keepVaca }시간)</span>`;
					html += `</td>`;
					html += `<td><a class="modal-open" href="#" onclick="viewFn('\${data.list[i].userid}', '\${data.list[i].name }')"><i class="far fa-id-card fa-lg"></i></a></td>`;
					html += `<td><a href="#" onclick="giveVacaFn('\${data.list[i].userid}', '\${data.list[i].dept }', '\${data.list[i].position }', '\${data.list[i].name }')"><i class="fas fa-fw fa-plane fa-lg"></i></a></td>`;
					html += `</tr>`;
				}
				outputBody.html(html);
				
				// 페이징
				html = "";
				outputBody = $(".page_nation");
				
				if(data.pagingVO.startPage > data.pagingVO.cntPage){
					html += `<a class="arrow prev" onclick="reloadListFn(\${data.pagingVO.startPage-1})"></a>`
				}
				for(let i=data.pagingVO.startPage; i<=data.pagingVO.endPage; i++){
					if(i==data.pagingVO.nowPage){
						html += `<a class="active" onclick="reloadListFn(\${i}); pagingFn(this)">\${i}</a>`;
					}else{
						html += `<a onclick="reloadListFn(\${i}); pagingFn(this)">\${i}</a>`;
					}
				}
				if(data.pagingVO.endPage < data.pagingVO.lastPage){
					html += `<a onclick="reloadListFn(\${data.pagingVO.endPage+1})"></a>`;
				}
				
				outputBody.html(html);
			}
			
		});
	}

	function viewFn(userid, name){
		$.ajax({
			url: "view_admin.do",
			type: "POST",
			data: {userid : userid},
			success: function(data){
				let headTitle = $(".head-title");
				headTitle.html(name+"님의 연차 내역");
				let bodyContentbox = $(".body-contentbox");
				let html = "";
				
				if(data.length === 0){
					html = "연차 내역이 없습니다.";
				}else{
					for(let i=0; i<data.length; i++){
						let state;
						let className;
						switch(data[i].state){
							case "2" : 
								state = "(승인)"; 
								className = "text-content-approved"; break;
							case "7" : 
								state = "(사용완료)"; 
								className = "text-content-use"; break;
						}
						html += `<div class="popup-content-box">`;
						html += `<span class="text-head3">`;
						html += `\${data[i].startDate}\ <span class="text-md2">(\${data[i].startTime})</span>\ ~\ `;
						html += `\${data[i].endDate}\ <span class="text-md2">(\${data[i].endTime})</span>`;
						html += `</span>`;
						html += `<span class="text-content2">&nbsp;&nbsp;\${data[i].reason}</span>`;
						html += `<span class="\${className}">&nbsp;\${state}</span>`;
						html += `</div>`;
					}
				}
				bodyContentbox.html(html);
			}
		})
	}
	
	function pagingFn(obj){
		let otherA = $(".page_nation").children(".active");
		otherA.attr("class","");
		let thisA = $(obj);
		thisA.attr("class","active");
	}
	
	function giveVacaFn(userid, dept, position, name){
		let hour = prompt("연차 부여 시간 입력", "hhh or -hhh");
		if(hour==null) return false;
		
		let regex = /^-?[0-9]{1,3}$/;
		let test = regex.test(hour);
		if(test){
			let conf = confirm("사원번호: " + userid + ": " + dept + " " + position + " "  + name + "님에게 연차 " + hour + "시간을 부여하시겠습니까?");
			if(conf){
				$.ajax({
					url: "giveVaca_admin.do",
					type: "POST",
					data: {userid : userid, hour : hour},
					success: function(data){
						if(data>0){
							alert("처리 완료되었습니다.");
							location.reload(true);
						}else{
							alert("오류가 발생하였습니다.");
							location.reload(true);
						}
					},
					error: function(){
						alert("통신 오류");
					}
				})
			}
		}else{
			alert("시간 형식이 올바르지 않습니다.");
		}
	}
</script>
<script src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/modal.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/calendar_noMin_noMax.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/sign_main.js"></script> --%>
<%@ include file="../include/footer.jsp"%>