<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    java.util.Calendar calendar = java.util.Calendar.getInstance();
	int currentYear = calendar.get(java.util.Calendar.YEAR);
	int nextMonth = (calendar.get(java.util.Calendar.MONTH) + 2) % 12;
    int currentDay = calendar.get(java.util.Calendar.DAY_OF_MONTH);
    pageContext.setAttribute("currentYear", currentYear);
    pageContext.setAttribute("nextMonth", nextMonth);
    pageContext.setAttribute("currentDay", currentDay);
%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>모든 수강정보</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="/js/script.js"></script>
    	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Eduport- LMS, Education and Course Theme">
    <!-- Favicon -->
	<link rel="shortcut icon" href="/resources/images/favicon.ico">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/choices/css/choices.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/apexcharts/css/apexcharts.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/overlay-scrollbar/css/overlayscrollbars.min.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
    tbody tr td {
        text-align: center;
        vertical-align: middle;
    }
</style>
</head> 
<body>
<main>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %> 
<div class="page-content">
<%@ include file="/WEB-INF/views/admin/topbar.jsp" %>

	<div class="page-content-wrapper border">
   	<div class="row mb-3">
			<div class="col-12 d-sm-flex justify-content-between align-items-center mb-4">
				<h2 class="h3 mb-2 mb-sm-0" >모든 수강정보</h2>
			</div>
	</div>
	<!-- Card START -->
	<div class="card bg-transparent border">

	<!-- Card header START -->
	<div class="card-header bg-light border-bottom">
	<!-- Search and select START -->
	<div class="row g-3 align-items-center justify-content-between">
	<!-- Search bar -->
	<div class="col-md-8">
	<form class="rounded position-relative">
	<input class="form-control bg-body" type="searchWord" placeholder="검색하고자 하는 수강생 이름을 입력하세요" aria-label="Search" name="searchWord" value="${PayVO.searchWord}">
		<button class="bg-transparent p-2 position-absolute top-50 end-0 translate-middle-y border-0 text-primary-hover text-reset" type="submit">
		<i class="fas fa-search fs-6 "></i>
	</button>
	</form>
	</div>
	</div>
	</div>
	<!-- Card header END -->
	
	<!-- Card body START -->
			<div class="card-body">
				<!-- Course table START -->
				<div class="table-responsive border-0 rounded-3">
					<!-- Table START -->
					<table class="table table-dark-gray align-middle p-4 mb-0 table-hover">
						<!-- Table head -->
						<thead>
							<tr style="text-align:center">
								<th scope="col" class="border-0 rounded-start">번호</th>
								<th scope="col" class="border-0"> 수강생</th>
								<th scope="col" class="border-0"> 수강 대상월</th>
								<th scope="col" class="border-0"> 종목</th>
								<th scope="col" class="border-0"> 요일</th>
								<th scope="col" class="border-0"> 시간</th>
								<th scope="col" class="border-0"> 등급</th>
								<th scope="col" class="border-0"> 결제 상태</th>
								<th scope="col" class="border-0 rounded-end"> 반 변경하기</th>
							</tr>
						</thead>
						<!-- Table body START -->
						<tbody>
							<c:if test="${empty map.list }">
							<td class="first" colspan="9">등록된 수강생이 없습니다.</td>
							</c:if>
						<c:forEach var="vo" items="${map.list }" varStatus="status">
						<tr style="height: 65px;">
							<td>  
								<div class="align-items-center position-relative">
								<h5 class="table-responsive-title mb-0 ms-2">
									<a>${(map.page-1) * 10 + status.index + 1}</a>
								</h5>
								</div>
							</td>
							<td>
								<div class="align-items-center">
										<h5 class="mb-0 fw-light">${vo.username }</h5>
								</div>
							</td>
							<td>
								<div class="align-items-center">
									<h5 class="mb-0 fw-light">${vo.classyear }-${vo.classmonth }</h5>
								</div>
							</td>
							<td>
								<div class="align-items-center">
									<h5 class="mb-0 fw-light">${vo.subtypeName }</h5>
								</div>
							</td>
							<td>
								<div class="align-items-center">
									<h5 class="mb-0 fw-light">${vo.classYoil }</h5>
								</div>
							</td>
							<td>
								<div class="align-items-center">
									<h5 class="mb-0 fw-light">${vo.formattedClasstime } </h5>
								</div>
							</td>
							<td>
								<div class="align-items-center">
									<h5 class="mb-0 fw-light"> ${vo.classlevelName }</h5>
								</div>
							</td>
							<td>
								<div class="align-items-center">
									<h5 class="mb-0 fw-light">
									<c:choose>
							        	<c:when test="${vo.paystate == 0}"> 미결제 </c:when>
							            <c:when test="${vo.paystate == 1}"> 
							            	<c:if test="${vo.refundstate == 1}"> 환불 완료 </c:if>
							               	<c:if test="${vo.refundstate != 1}"> 결제 완료 </c:if>
						                </c:when>
						                <c:otherwise></c:otherwise>
						            </c:choose></h5>
								</div>
							</td>
							<td>
								<div class="align-items-center">
									<c:choose>
						            <c:when test="${currentYear == vo.classyear && vo.paystate == 0 && vo.classmonth == nextMonth}">
						            	<h5 class="mb-0 fw-light"><a href="courseModify.do?payid=${vo.payid}&classyear=${vo.classyear}&classmonth=${vo.classmonth}" class="btn btn-sm btn-success-soft me-1 mb-1 mb-md-0" >변경하기</a></h5>
      								</c:when>
						            <c:otherwise />
						            </c:choose>
									</div>
								</div>
							</td>
						</tr>
						</c:forEach>	
						</tbody>
						</table>
						</div>
						</div>
						<!-- Card footer START -->
						<div class="card-footer bg-transparent pt-0">
							<!-- Pagination START -->
							<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
								<!-- Content -->
								<p class="mb-0 text-center text-sm-start">	${map.page }/${map.totalPage }페이지 </p>
								<!-- Pagination -->
								<nav class="d-flex justify-content-center mb-0" aria-label="navigation">
									<ul class="pagination pagination-sm pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
										<c:if test="${map.prev }">
										<li class="page-item mb-0"><a class="page-link" href="courseList.do?page=${map.startPage-1 }&searchWord=${PayVO.searchWord}" tabindex="-1"><i class="fas fa-angle-left"></i></a></li>
										</c:if>
										<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
										<c:if test="${p == PayVO.page}">
	                   						<li class="page-item mb-0 active"><a class="page-link" href='#;' class='current'>${p}</a></li>
	                					</c:if>
	                					<c:if test="${p != PayVO.page}">
	                    			 		<li class="page-item mb-0"><a class="page-link" href='courseList.do?page=${p}&searchWord=${PayVO.searchWord}'>${p}</a></li>
	                					</c:if>
	                					</c:forEach>
	                					<c:if test="${map.next }">
										<li class="page-item mb-0"><a href="courseList.do?page=${map.endPage+1 }&searchWord=${PayVO.searchWord}" class="page-link"><i class="fas fa-angle-right"></i></a></li>
										</c:if>
									</ul>
								</nav>
							</div>
							<!-- Pagination END -->
						</div>
						<!-- Card footer END -->	
			</div>
			</div>
     </div>
</body>
</html>