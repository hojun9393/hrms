<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- 데이트피커 { -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<!-- } -->

<link href="${pageContext.request.contextPath}/resources/css/message.css" rel="stylesheet" type="text/css">
</head>

<body id="page-top">

	<!-- Begin Page Content -->
	<div class="container-fluid">
		<!-- Page Heading -->
		<h1 class="h3 mb-4 text-gray-800">쪽지</h1>

		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<div
					class="font-weight-bold text-primary py-1 mr-4 border-bottom-primary d-inline"
					id="received" onclick="selectFn(this)">받은 쪽지</div>
				<div class="font-weight-bold text-secondary py-1 d-inline" id="sent"
					onclick="selectFn(this)">보낸 쪽지</div>
			</div>
			<div class="card-body">
				<div class="row">
					<div class="mb-3 col">
						<a href="write.do" class="btn btn-primary btn-icon-split">
							<span class="text"><i class="fas fa-pen"></i> 쪽지 쓰기</span>
						</a>
					</div>
					<div class="mb-3 col-auto">
						<select class="inp">
							<option>전체</option>
							<option>기획부</option>
							<option>인사부</option>
							<option>영업부</option>
						</select> <select class="inp">
							<option>전체</option>
							<option>사원</option>
							<option>팀장</option>
							<option>부장</option>
							<option>대표</option>
						</select> <input type="text" name="" value="" id="search" class="inp"
							placeholder="이름을 입력하세요.">
						<div class="d-inline px-2 py-2 bg-secondary" onclick=""
							style="cursor: pointer; border-radius: 5px;">
							<i class="fas fa-lg fa-search text-white"></i>
						</div>
					</div>
				</div>

				<div class="table-responsive">
					<table class="table table-bordered text-center received"
						id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th width="20%">보낸사람</th>
								<th width="60%">내용</th>
								<th width="20%">날짜</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list}" var="vo">
								<tr>
									<td>
										<div
											class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">${vo.dept}</div>
										<span class="text-dark font-weight-bold">${vo.name}</span> <span
										class="text-xs font-weight-bold">${vo.position}</span>
									</td>
									<c:choose>
										<c:when test="${vo.state eq '0'}">
											<td>
												<a class="text-dark font-weight-bold" data-toggle="modal" data-target="#messageModal${vo.msgNo}" id="msg${vo.msgRNo}" href="#" onclick="msgReadFn(${vo.msgRNo},this)">
												${vo.content}</a> 
												<span class="d-inline rounded-circle text-white text-center px-1 bg-danger text-xs">N</span>
											</td>
										</c:when>
										<c:otherwise>
											<td>
												<a class="text-gray-700" data-toggle="modal" data-target="#messageModal${vo.msgNo}" href="#">
												${vo.content}</a>
											</td>
										</c:otherwise>
									</c:choose>
									<td>
										<div class="text-dark">${vo.sendDate}</div>
									</td>
								</tr>								
							</c:forEach>
						</tbody>
					</table>
					<table class="table table-bordered text-center sent d-none"
						id="dataTable" width="100%" cellspacing="0">
						<thead>
							<tr>
								<th width="15%">받은사람</th>
								<th width="45%">내용</th>
								<th width="15%">날짜</th>
								<th width="10%">수신여부</th>
								<th width="10%">발신취소</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${recList}" var="vo">
								<tr>
									<td>
										<div
											class="d-inline card text-primary text-center px-1 mr-1 border-primary font-weight-bold">기획부</div>
										<span class="text-dark font-weight-bold">${vo.name}</span> <span
										class="text-xs font-weight-bold">${vo.position}</span>
									</td>
									<td><a class="text-dark" data-toggle="modal" data-target="#messageCancelModal${vo.msgRNo}" href="#">${vo.content}</a></td>
									<td>
										<div class="text-dark">${vo.sendDate}</div>
									</td>
									
										<c:choose>
											<c:when test="${vo.state eq '1'}">
												<td>
													<span class="card d-inline text-white py-1 px-4 bg-info font-weight-bold">읽음</span>
												</td>
												<td>
													<i class="fas fa-fw fa-ban text-gray-500"></i>
												</td>
											</c:when>
											<c:otherwise>
												<td>
													<span class="card d-inline text-danger py-1 px-2 border-danger font-weight-bold">읽지않음</span>
												</td>
												<td>
													<a class="text-dark font-weight-bold" data-toggle="modal" data-target="#messageCancelModal${vo.msgRNo}" href="#">
													<i class="fas fa-fw fa-trash-alt"></i></a>
												</td>
											</c:otherwise>
										</c:choose>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<c:forEach items="${list}" var="vo">
		<div class="modal fade" id="messageModal${vo.msgNo}" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header bg-primary text-white">
						<h5 class="modal-title" id="exampleModalLabel">쪽지 읽기</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true" class="text-white">x</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row m-2">
							<div class="col-2 pr-0">
								<img class="img-profile rounded-circle"
									src="${pageContext.request.contextPath}/resources/img/undraw_profile.svg" width="50px">
							</div>
							<div class="col-5 pl-0">
								<span class="card border-primary px-2 d-inline text-primary">${vo.dept}</span><br>
								<span class="text-dark font-weight-bold">${vo.name}</span> <span
									class="text-xs font-weight-bold">${vo.position}</span>
							</div>
							<div class="col-5">${vo.sendDate}</div>
						</div>
						<div class="row m-3">
							<div
								class="col-12 card bg-gray-200 p-3 text-dark font-weight-bold messageContent">
								${vo.content}</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">닫기</button>
						<form action="reply.do" method="post">
							<input type="hidden" name="sendUserId" value="${vo.userId}">
							<button type="submit" class="btn btn-primary">답장</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	
	<c:forEach items="${recList}" var="vo">
		<div class="modal fade" id="messageCancelModal${vo.msgRNo}" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header bg-primary text-white">
						<h5 class="modal-title" id="exampleModalLabel">쪽지 읽기</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true" class="text-white">x</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row m-2">
							<div class="col-2 pr-0">
								<img class="img-profile rounded-circle"
									src="${pageContext.request.contextPath}/resources/img/undraw_profile.svg" width="50px">
							</div>
							<div class="col-5 pl-0">
								<span class="card border-primary px-2 d-inline text-primary">${vo.dept}</span><br>
								<span class="text-dark font-weight-bold">${vo.name}</span> <span
									class="text-xs font-weight-bold">${vo.position}</span>
							</div>
							<div class="col-5">${vo.sendDate}</div>
						</div>
						<div class="row m-3">
							<div
								class="col-12 card bg-gray-200 p-3 text-dark font-weight-bold messageContent">
								${vo.content}</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">닫기</button>
						<c:if test="${vo.state eq '0'}">
							<a class="btn btn-primary" onclick="msgCancelFn(${vo.msgRNo})">발신취소</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!-- 캘린더 옵션 { -->
	<script src="${pageContext.request.contextPath}/resources/js/calendar_noMin_noMax.js"></script>

	<script src="${pageContext.request.contextPath}/resources/js/message_main.js"></script>
	
	<script>
	function msgCancelFn(msgRNo){
		if(confirm("발신 취소하시겠습니까?")){
			location.href='msgCancel.do?msgRNo='+msgRNo;
		}
	}
	
	function msgReadFn(msgRNo, obj){
		$.ajax({
			url:"msgRead.do",
			data:{msgRNo:msgRNo},
			success:function(){
				$(obj).attr('class', 'text-gray-700');
				$(obj).next().remove();
				let attr = $('#msgNav'+msgRNo).children().eq(1).attr('class');
				if(!attr == ""){
					$('#msgNav'+msgRNo).children().eq(1).attr('class', '');
					$('#msgBadge').html($('#msgBadge').html()-1);
					if($('#msgBadge').html() == 0){
						$('#msgBadge').remove();
					}
				}
			}
		});
	}

	</script>
	<%@ include file="../include/footer.jsp"%>