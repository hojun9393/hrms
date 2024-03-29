<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/navigator.jsp"%>

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
						<span class="menubar">공지사항</span> 
					</h6>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<a href="write.do" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm small float-right">
						<i class="fas fa-fw fa-bullhorn"></i> 공지 작성
					</a>
					<!-- 공지사항 -->
					<div class="table-responsive">
						<table class="dataTables_wraper table text-secondary text-center px-3 py-1 border-secondary" >
							<thead>
								<tr class="shadow mb-1">
									<th>작성자</th>
									<th>제목</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${list}" var="vo">
								<tr>
									<c:choose>
										<c:when test="${vo.userId eq '99000'}">
											<td>대표</td>
										</c:when>
										<c:when test="${vo.userId eq '99001'}">
											<td>관리자</td>
										</c:when>
										<c:otherwise>
											<td>오류</td>
										</c:otherwise>
									</c:choose>
									<td><a href="view.do?noticeNo=${vo.noticeNo}">${vo.title}</a></td>
									<td class="small">${vo.rdate}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
												
						<ul class="pagination">
							<li class="paginate_button page-item previous disabled"
							id="dataTable_previous">
							<a href="#" aria-controls="dataTable" data-dt-idx="0"
							tabindex="0" class="page-link">Previous</a>
							</li> 
							
							<li class="paginate_button page-item active">
							<a href="#" aria-controls="dataTable" data-dt-idx="1"
							tabindex="0" class="page-link">1</a>
							</li>
							<li class="paginate_button page-item">
							<a href="#" aria-controls="dataTable" data-dt-idx="2"
							tabindex="0" class="page-link">2</a>
							</li>
							<li class="paginate_button page-item">
							<a href="#" aria-controls="dataTable" data-dt-idx="3"
							tabindex="0" class="page-link">3</a>
							</li>
							<li class="paginate_button page-item">
							<a href="#" aria-controls="dataTable" data-dt-idx="4"
							tabindex="0" class="page-link">4</a>
							</li>
							<li class="paginate_button page-item">
							<a href="#" aria-controls="dataTable" data-dt-idx="5"
							tabindex="0" class="page-link">5</a>
							</li>							
							<li class="paginate_button page-item next id="dataTable_next">
							<a href="#" aria-controls="dataTable" data-dt-idx="6"
							tabindex="0" class="page-link">next</a>
							</li>
						</ul>
					</div>
					
				</div>
			</div>
		</div>

	</div>

</div>

<!-- End of Main Content -->
	
<%@ include file="../include/footer.jsp"%>