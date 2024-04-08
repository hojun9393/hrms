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
<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Content Row -->
	<div class="row">

		<!-- Area Chart -->
		<div class="col-xl-12 col-lg-12">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">
						<span class="menubar" id="menubar1" onclick="displayFn(1)">내 기안</span> 
						<span class="menubar" id="menubar2" onclick="displayFn(2)">부서 기안</span>
					</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body">
				
					<!-- 내 기안 -->
					<div id="menu1">
						<div class="mb-3 col">
							<input type="text" name="" value="" id="startDate1" class="datepicker inp" placeholder="시작일 선택" readonly="true" onchange="reloadListFn(1)">
							<i class="fas fa-lg fa-calendar" onclick="iClickFn(startDate1)" style="cursor: pointer;"></i> ~ 
							<input type="text" name="" value="${today }" id="endDate1" class="datepicker inp" placeholder="종료일 선택" readonly="true" onchange="reloadListFn(1)"> 
							<i class="fas fa-lg fa-calendar" onclick="iClickFn(endDate1)" style="cursor: pointer;"></i>
							<div class="float-right">
								<a href="write.do" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm small float-right">
									<i class="fas fa-fw fa-briefcase"></i> 기안 작성
								</a>
							</div>
						</div>
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성일</th>
									<th>결재</th>
								</tr>
							</thead>
							<tbody id="outputBody1">
								<c:forEach var="i" items="${list_my}">
									<tr>
										<td>${i.rownum }</td>
										<td><a href="javascript:viewFn('${i.docNo }')">${i.title }</a></td>
										<td>${i.date }</td>
										<c:choose>
											<c:when test="${i.state eq '대기'}">
												<c:set var="className" value="btn btn-light btn-gradient2 mini" />
											</c:when>
											<c:when test="${i.state eq '진행중'}">
												<c:set var="className" value="btn-gradient red mini" />
											</c:when>
											<c:when test="${i.state eq '승인'}">
												<c:set var="className" value="btn-gradient green mini" />
											</c:when>
											<c:when test="${i.state eq '반려'}">
												<c:set var="className" value="btn-gradient mini btn-secondary" />
											</c:when>
											<c:when test="${i.state eq '철회'}">
												<c:set var="className" value="btn-gradient mini btn-withdrawal" />
											</c:when>
										</c:choose>
										<td><span class="${className}">${i.state }</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<!-- 부서 기안 -->
					<div id="menu2" style="display:none;">
						<div class="mb-3 col">
							<input type="text" name="" value="" id="startDate2" class="datepicker inp" placeholder="시작일 선택" readonly="true" onchange="reloadListFn(2)">
							<i class="fas fa-lg fa-calendar" onclick="iClickFn(startDate2)" style="cursor: pointer;"></i> ~ 
							<input type="text" name="" value="${today }" id="endDate2" class="datepicker inp" placeholder="종료일 선택" readonly="true" onchange="reloadListFn(2)"> 
							<i class="fas fa-lg fa-calendar" onclick="iClickFn(endDate2)" style="cursor: pointer;"></i>
							<div class="float-right">
								<select name="category">
									<option value="">전체</option>
									<option value="D">부장</option>
									<option value="L">팀장</option>
									<option value="E">사원</option>
								</select>
								<input type="text" name="searchVal" placeholder="이름을 입력해주세요.">
								<button onclick="reloadListFn(2)">검색</button>
							</div>
						</div>
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody id="outputBody2">
								<c:forEach var="i" items="${list_dept }">
									<tr>
										<td>${i.rownum }</td>
										<td><a href="javascript:viewFn('${i.docNo }')">${i.title }</a></td>
										<td>
											<span class="d-inline card bg-info text-white text-center px-2">${i.dept }</span>
											<span>${i.name }</span>
											<span class="text-xs font-weight-bold text-primary text-uppercase mb-1">${i.position }</span>
										</td>
										<td>${i.date }</td>
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
<!-- End of Main Content -->
<script>
	$('#startDate1').datepicker();
	$('#startDate1').datepicker("option", "maxDate", $("#endDate1").val());
	$('#startDate1').datepicker("option", "onClose", function ( selectedDate ) {
		$("#endDate1").datepicker("option", "minDate", selectedDate );
	});
	$('#endDate1').datepicker();
	$('#endDate1').datepicker("option", "minDate", $("#startDate1").val());
	$('#endDate1').datepicker("option", "onClose", function ( selectedDate ) {
		$("#startDate1").datepicker("option", "maxDate", selectedDate );
	});
	
	$('#startDate2').datepicker();
	$('#startDate2').datepicker("option", "maxDate", $("#endDate2").val());
	$('#startDate2').datepicker("option", "onClose", function ( selectedDate ) {
		$("#endDate2").datepicker("option", "minDate", selectedDate );
	});
	$('#endDate2').datepicker();
	$('#endDate2').datepicker("option", "minDate", $("#startDate2").val());
	$('#endDate2').datepicker("option", "onClose", function ( selectedDate ) {
		$("#startDate2").datepicker("option", "maxDate", selectedDate );
	});
</script>
<script>
	function reloadListFn(obj){
		let startDate;
		let endDate;
		let listType;
		let outputBody;
		let category_position = $("select[name=category] option:selected").val();
		let searchVal = $("input[name=searchVal]").val();
		if(obj==1){
			startDate = $("#startDate1").val();
			endDate = $("#endDate1").val();
			listType = "my";
			outputBody = $("#outputBody1");
		}else if(obj==2){
			startDate = $("#startDate2").val();
			endDate = $("#endDate2").val();
			listType = "dept";
			outputBody = $("#outputBody2");
		}
		
		$.ajax({
			url:"reloadList.do",
			data: {startDate : startDate, endDate : endDate, listType : listType, category_position : category_position, searchVal : searchVal},
			success:function(data){
				let html = "";
				if(obj==1){
					for(let i=0; i<data.length; i++){
						html += "<tr>";
						html += `<td>\${data[i].rownum}</td>`;
						html += `<td><a href="javascript:viewFn(\${data[i].docNo})">\${data[i].title}</a></td>`;
						html += `<td>\${data[i].date}</td>`;
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
						html += "</tr>";
					}
				}else if(obj==2){
					for(let i=0; i<data.length; i++){
						html += "<tr>";
						html += `<td>\${data[i].rownum }</td>`;
						html += `<td><a href="javascript:viewFn(\${data[i].docNo})">\${data[i].title}</a></td>`;
						html += "<td>";
						html += `<span class="d-inline card bg-info text-white text-center px-2">\${data[i].dept }</span>`
						html += `<span>\ \${data[i].name }\ </span>`;
						html += `<span class="text-xs font-weight-bold text-primary text-uppercase mb-1">\${data[i].position }</span>`
						html += "</td>";
						html += `<td>\${data[i].date }</td>`;
						html += "</tr>";
					}
				}
				
				outputBody.html(html);
			}
		})
	}

	function viewFn(obj){
		let f = document.createElement('form');
		let i = document.createElement('input');
		i.setAttribute('type', 'hidden');
		i.setAttribute('name', 'docNo');
		i.setAttribute('value', obj);
		f.appendChild(i);
		f.setAttribute('method', 'get');
		f.setAttribute('action', 'view.do');
		document.body.appendChild(f);
		f.submit();
	}
</script>
<script src="${pageContext.request.contextPath}/resources/js/calendar_noMin_noMax_Const.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/menu.js"></script>
<%@ include file="../include/footer.jsp"%>