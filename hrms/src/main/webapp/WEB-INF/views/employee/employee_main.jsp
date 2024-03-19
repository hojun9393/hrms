<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/navigator.jsp"%>
<!DOCTYPE html>
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
						<span class="menubar" onclick="displayFn(1)">사원 조회</span> 
						<span class="menubar" onclick="displayFn(2)">내 정보</span>
					</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<!-- 메뉴1 사원 정보 -->
					<div id="menu1">
						<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm small float-right">
							<i class="fas fa-fw fa-users"></i> 사원 등록
						</a>
						<select>
							<option>전체</option>
							<option>기획부</option>
							<option>개발부</option>
							<option>영업부</option>
						</select>
						<select>
							<option>전체</option>
							<option>부장</option>
							<option>팀장</option>
							<option>사원</option>
						</select>
						<input type="text">
						<button>검색</button>
						<table>
							<thead>
								<tr>
									<th>이름</th>
									<th>연락처</th>
									<th>이메일</th>
									<th>쪽지</th>
									<th>조회</th>
									<th>수정</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<span class="d-inline card bg-info text-white text-center px-2">기획부</span>
										김부장
										<span class="small-grade">부장</span>
									</td>
									<td>010-0000-0000</td>
									<td>rlaqnwkd@naver.com</td>
									<td><img class="icon-box" src="img/msg_icon.png"></td>
									<td><img id="modal-open" class="icon-box" src="img/userinfo_icon.png"></td>
									<td><img class="icon-box" src="img/userinfo_modify_icon2.png"></td>
								</tr>
								<tr>
									<td>
										<span class="d-inline card bg-info text-white text-center px-2">기획부</span>
										김사원
										<span class="small-grade">사원</span>
									</td>
									<td>010-0000-0000</td>
									<td>rlatkdnj@naver.com</td>
									<td><img class="icon-box" src="img/msg_icon.png"></td>
									<td><img class="icon-box" src="img/userinfo_icon.png"></td>
									<td><img class="icon-box" src="img/userinfo_modify_icon2.png"></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<!-- 메뉴2 내 정보 -->
					<div id="menu2" style="display:none;">
						<div class="row">
							<div class="col-lg-3"> </div>
							<div class="col-lg-6 my-info">
								<div class="my-info-content">
									<span class="text-head">사원번호</span>
									<span class="text-content">100001</span>
								</div>
								<div class="my-info-content">
									<span class="text-head">이름</span>
									<span class="text-content">김사원</span>
								</div>
								<div class="my-info-content">
									<span class="text-head">부서</span>
									<span class="text-content">개발부</span>
								</div>
								<div class="my-info-content">
									<span class="text-head">직급</span>
									<span class="text-content">사원</span>
								</div>
								<div class="my-info-content">
									<span class="text-head">상태</span>
									<span class="text-content">재직</span>
								</div>
								<div class="my-info-content">
									<span class="text-head">입사일</span>
									<span class="text-content">2024-03-02</span>
								</div>
								<div class="my-info-content">
									<span class="text-head">연락처</span>
									<span class="text-content">010-1234-1234</span>
								</div>
								<div class="my-info-content">
									<span class="text-head">이메일</span>
									<span class="text-content">rlatkdnjs@naver.com</span>
								</div>
								<div class="my-info-content">
									<span class="text-head">주소</span>
									<span class="text-content">전주시 덕진구</span>
								</div>
							</div>
							<div class="col-lg-3"></div>
						</div>
						<div class="text-center">
							<a href="#" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm small">
							정보 수정
							</a>
						</div>
					</div>
					
					<!--================== 모달창 ==================-->
					<div class="popup-wrap" id="popup">
						<div class="popup">
							<div class="popup-head">
								<span class="head-title">사원 정보</span>
							</div>
							<div class="popup-body">
								<div class="body-content">
									<div class="body-contentbox">
										<div class="popup-content-box">
											<span class="text-head">이름 </span>
											<span class="text-content"> 김부장</span>
										</div>
										<div class="popup-content-box">
											<span class="text-head">부서 </span>
											<span class="text-content"> 개발부</span>
										</div>
										<div class="popup-content-box">
											<span class="text-head">직급 </span>
											<span class="text-content"> 부장</span>
										</div>
										<div class="popup-content-box">
											<span class="text-head">상태 </span>
											<span class="text-content"> 재직</span>
										</div>
										<div class="popup-content-box">
											<span class="text-head">입사일 </span>
											<span class="text-content"> 2010-03-02</span>
										</div>
										<div class="popup-content-box">
											<span class="text-head">연락처 </span>
											<span class="text-content"> 010-1234-1234</span>
										</div>
										<div class="popup-content-box">
											<span class="text-head">주소 </span>
											<span class="text-content"> 전주시 덕진구</span>
										</div>
									</div>
								</div>
							</div>
							<div class="popup-foot">
								<span class="pop-btn close float-right close-custom" id="close">창 닫기</span>
							</div>
						</div>
					</div>
	

				</div>
			</div>
		</div>

	</div>

</div>

<!-- End of Main Content -->

<script src="js/menu.js"></script>
<script src="js/jquery-3.7.1.min.js"></script>
<script src="js/modal.js"></script>
<%@ include file="/include/footer.jsp"%>