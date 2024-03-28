<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/navigator.jsp"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/message_write.css" rel="stylesheet" type="text/css">
</head>
<body id="page-top">

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">쪽지</h1>
		</div>

		<div class="card o-hidden border-0 shadow-lg">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col p-5 mx-5">
						<div class="my-4">
							<h1 class="d-inline h4 text-gray-900 font-weight-bold">쪽지 쓰기</h1>
						</div>
						<hr>
						<div class="row text-center pt-5">
							<div
								class="d-inline col-3 text-dark font-weight-bold text-right align-self-center">
								받는 사람<br></div>
							<div
								class="d-inline col-6 text-dark font-weight-bold text-left">
								<div class="row p-0 m-0">
									<div class="receiver p-2 mx-1 mb-1 d-inline">
										<div
											class="d-inline card text-primary text-center px-1 border-primary font-weight-bold">인사부</div>
										<span class="text-gray-900">홍길동</span> <span
											class="text-xs font-weight-bold">팀장</span> <a href="#" onclick="receiverDelFn(this)"><i
											class="fas fa-times"></i></a>
									</div>
	
									<div class="receiver p-2 mx-1 mb-1 d-inline">
										<div
											class="d-inline card text-primary text-center px-1 border-primary font-weight-bold">인사부</div>
										<span class="text-gray-900">홍길동</span> <span
											class="text-xs font-weight-bold">팀장</span> <a href="#" onclick="receiverDelFn(this)"><i
											class="fas fa-times"></i></a>
									</div>
	
									<div class="receiver p-2 mx-1 mb-1 d-inline">
										<div
											class="d-inline card text-primary text-center px-1 border-primary font-weight-bold">인사부</div>
										<span class="text-gray-900">홍길동</span> <span
											class="text-xs font-weight-bold">팀장</span> <a href="#" onclick="receiverDelFn(this)"><i
											class="fas fa-times"></i></a>
									</div>
	
									<div class="receiver p-2 mx-1 mb-1 d-inline">
										<div
											class="d-inline card text-primary text-center px-1 border-primary font-weight-bold">인사부</div>
										<span class="text-gray-900">홍길동</span> <span
											class="text-xs font-weight-bold">팀장</span> <a href="#" onclick="receiverDelFn(this)"><i
											class="fas fa-times"></i></a>
									</div>
	
									<div class="receiver p-2 mx-1 mb-1 d-inline">
										<div
											class="d-inline card text-primary text-center px-1 border-primary font-weight-bold">인사부</div>
										<span class="text-gray-900">홍길동</span> <span
											class="text-xs font-weight-bold">팀장</span> <a href="#" onclick="receiverDelFn(this)"><i
											class="fas fa-times"></i></a>
									</div>
									
									<div class="p-2 mx-1 mb-1 d-inline">
										<a href="#" onclick="receiverPlusFn()" data-toggle="modal" data-target="#receiverModal"><i
										class="fas fa-user-plus"></i></a>
									</div>
								</div>
							</div>
							<div class="col-auto align-self-center">
								
							</div>
						</div>
						<div class="row text-center pt-5">
							<div class="d-inline col-3 text-dark font-weight-bold text-right">
								쪽지 내용</div>
							<div class="d-inline col-6 text-dark font-weight-bold text-left">
								<textarea class="msgContent" placeholder="내용을 입력해 주세요."></textarea>
							</div>
						</div>

					</div>
				</div>
				<div class="row">
					<div class="col p-5 mt-5 mx-5">
						<div class="mb-4 text-center">
							<hr>
							<a href="main.do" class="btn btn-secondary btn-user"> 돌아가기 </a> <a
								href="writeOk.do" class="btn btn-primary btn-user"> 작성완료 </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="receiverModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="text-white">x</span>
                    </button>
                </div>
                <div class="modal-body">
                	<div class="row m-2">
                		<h5 class="modal-title text-gray-900 font-weight-bold" id="exampleModalLabel">사원 목록</h5>
                	</div>
                	<div class="row m-2">
                		<div class="col-12 card border-secondary p-3 text-dark font-weight-bold">
                			<div class="row">
                				<div class="col-6 border-right border-secondary">
                					<div class="row dept m-1">
	                					<div class="font-weight-bold p-2 m-1 col">
	                						전체
	                					</div>
	                					<span class="text-primary font-weight-bold d-inline p-2 m-1 col-auto">50</span>
                					</div>
                					<hr class="m-2">
                					<div class="row m-1">
	                					<div class="font-weight-bold p-2 m-1 col">
	                						전체
	                					</div>
	                					<span class="text-primary font-weight-bold d-inline p-2 m-1 col-auto">50</span>
                					</div>
                					<hr class="m-2">
                					<div class="row m-1">
	                					<div class="font-weight-bold p-2 m-1 col">
	                						전체
	                					</div>
	                					<span class="text-primary font-weight-bold d-inline p-2 m-1 col-auto">50</span>
                					</div>
                					<hr class="m-2">
                					<div class="row m-1">
	                					<div class="font-weight-bold p-2 m-1 col">
	                						전체
	                					</div>
	                					<span class="text-primary font-weight-bold d-inline p-2 m-1 col-auto">50</span>
                					</div>
                					<hr class="m-2">
                				</div>
                				<div class="col-6 deptEmpl">
                					<div class="font-weight-bold px-2 py-1 m-1">
                						<input type="checkbox"> <span class="text-gray-900">전체 선택</span>
                					</div>
                					<hr class="m-2">
                					<div class="font-weight-bold px-2 py-1 m-1">
                						<input type="checkbox"> <span class="text-gray-900">홍길동</span> <span class="text-xs font-weight-bold">팀장</span><br>
                						<input type="checkbox"> <span class="text-gray-900">홍길동</span> <span class="text-xs font-weight-bold">팀장</span><br>
                						<input type="checkbox"> <span class="text-gray-900">홍길동</span> <span class="text-xs font-weight-bold">팀장</span><br>
                						<input type="checkbox"> <span class="text-gray-900">홍길동</span> <span class="text-xs font-weight-bold">팀장</span><br>
                						<input type="checkbox"> <span class="text-gray-900">홍길동</span> <span class="text-xs font-weight-bold">팀장</span><br>
                						<input type="checkbox"> <span class="text-gray-900">홍길동</span> <span class="text-xs font-weight-bold">팀장</span><br>
                						<input type="checkbox"> <span class="text-gray-900">홍길동</span> <span class="text-xs font-weight-bold">팀장</span><br>
                						<input type="checkbox"> <span class="text-gray-900">홍길동</span> <span class="text-xs font-weight-bold">팀장</span><br>
                						<input type="checkbox"> <span class="text-gray-900">홍길동</span> <span class="text-xs font-weight-bold">팀장</span><br>
                						<input type="checkbox"> <span class="text-gray-900">홍길동</span> <span class="text-xs font-weight-bold">팀장</span><br>
                						<input type="checkbox"> <span class="text-gray-900">홍길동</span> <span class="text-xs font-weight-bold">팀장</span><br>
                						<input type="checkbox"> <span class="text-gray-900">홍길동</span> <span class="text-xs font-weight-bold">팀장</span><br>
                						<input type="checkbox"> <span class="text-gray-900">홍길동</span> <span class="text-xs font-weight-bold">팀장</span><br>
                					</div>
                				</div>
                			</div>
                		</div>
                	</div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
                    <a class="btn btn-primary" href="login.html">추가</a>
                </div>
            </div>
        </div>
    </div>
    
<script>
function receiverDelFn(obj){
	$(obj).parent().remove();
}

function receiverPlusFn(){
	$.ajax({
		url:"receiverPlus.do",
		success:function(data){
			console.log(data);
		}
	});
}
</script>
<%@ include file="../include/footer.jsp"%>