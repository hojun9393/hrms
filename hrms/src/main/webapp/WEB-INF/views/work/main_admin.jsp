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
	<sec:authorize access="hasRole('ROLE_ADMIN')">
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
							<span class="menubar">근무 관리</span> 
						</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
					
						<div class="mb-3 col">
							<div class="float-left mb-2">
								<input type="text" name="" value="" id="startDate" class="datepicker inp" placeholder="시작일 선택" readonly="true" onchange="reloadListFn(3,1)">
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(startDate)" style="cursor: pointer;"></i> ~ 
								<input type="text" name="" value="${today }" id="endDate" class="datepicker inp" placeholder="종료일 선택" readonly="true" onchange="reloadListFn(3,1)"> 
								<i class="fas fa-lg fa-calendar" onclick="iClickFn(endDate)" style="cursor: pointer;"></i>
							</div>
							<div id="searchDiv" class="float-right">
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
							<tbody class="outputBody">
								<c:forEach var="item" items="${allWorkList }">
									<tr>
										<td>${item.date }  ${item.dayOfWeek }</td>
										<td>
											<span class="d-inline card bg-info text-white text-center px-2">${item.dept }</span>
											<span>${item.name }</span>
											<span class="text-xs font-weight-bold text-primary text-uppercase mb-1">${item.position }</span>
										</td>
										<td>${item.start }</td>
										<c:if test="${item.end eq '-' }">
											<td><a href="#"><i class="fas fa-clock fa-lg" onclick="leaveWork_admin('${item.wNo}')"></i></a></td>
										</c:if>
										<c:if test="${item.end ne '-' }">
											<td>${item.end }</td>
										</c:if>
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
					</div>
				</div>
			</div>
		</div>
	</div>
	</sec:authorize>
	
	<!-- 관리자용 퇴근시키기 버튼 -->
	<script>
		function leaveWork_admin(wNo){
			let end = prompt("퇴근시간 입력","18:00:00");
			if(end==null) return false;
			
			let regex = /^[0-2]{1}[0-9]{1}\:[0-5]{1}[0-9]{1}\:[0-5]{1}[0-9]{1}$/;
			let test = regex.test(end);
			if(test){
				let conf = confirm("근무번호 "+wNo+"의 퇴근시간을 "+end+"로 입력하시겠습니까?");
				if(conf){
					$.ajax({
						url: "workInsert_admin.do",
						type: "POST",
						data: {wNo : wNo, end : end},
						success: function(data){
							console.log(typeof data);
							console.log(data);
							if(data>0){
								alert("퇴근 처리 되었습니다.");
								location.reload(true);
							}else{
								alert("오류가 발생하였습니다.");
								location.reload(true);
							}
						}
						
					})
				}
			}else{
				alert("시간 형식이 올바르지 않습니다.");
			}
		}
	</script>

<!-- End of Main Content -->
<%-- <script src="${pageContext.request.contextPath}/resources/js/work_menu.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath}/resources/js/clock.js"></script> --%>
<script>
	const today = '${today}';
	
	function reloadListFn(obj, pNum){
		let startDate = $("#startDate").val();
		let endDate = $("#endDate").val();
		let category_dept = $("select[name=category_dept]").val();
		let category_position = $("select[name=category_position]").val();
		let searchVal = $("#searchVal").val();
		
		$.ajax({
			url:"reloadList.do",
			data: {startDate : startDate, endDate : endDate, obj : obj, searchVal : searchVal, category_dept : category_dept, category_position : category_position, pNum : pNum},
			success:function(data){
			
				let html = "";
				let outputBody = $(".outputBody");
				for(let i=0; i<data.list.length; i++){
					html += "<tr>";
					html += `<td>\${data.list[i].date} \${data.list[i].dayOfWeek}</td>`;
					html += "<td>";
					html += "<span class='d-inline card bg-info text-white text-center px-2'>"+data.list[i].dept+"</span>&nbsp;";
					html += "<span>"+data.list[i].name+"</span>&nbsp;";
					html += "<span class='text-xs font-weight-bold text-primary text-uppercase mb-1'>"+data.list[i].position+"</span>";
					html += "</td>";
					html += `<td>\${data.list[i].start}</td>`;
					if(data.list[i].end == "-"){
						html += `<td><a href="#"><i class="fas fa-clock fa-lg" onclick="leaveWork_admin('\${data.list[i].wNo}')"></i></a></td>`;
					}else{
						html += `<td>\${data.list[i].end}</td>`
					}
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
			
		});
	}
	
	function pagingFn(obj){
		let otherA = $(".page_nation").children(".active");
		otherA.attr("class","");
		let thisA = $(obj);
		thisA.attr("class","active");
	}
</script>
<script src="${pageContext.request.contextPath}/resources/js/calendar_max_0.js"></script>
<script>
	/* $(".datepicker").datepicker({
		 
	}); */
</script>
<%@ include file="../include/footer.jsp"%>