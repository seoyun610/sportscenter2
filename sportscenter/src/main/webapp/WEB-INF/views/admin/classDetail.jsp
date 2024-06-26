<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>강좌 상제 정보</title>
	<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="/js/script.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
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
	<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %> 
	<div class="page-content">
		<div class="page-content-wrapper border">
		   	<div class="row mb-3">
		    	<div class="col-12 d-sm-flex justify-content-between align-items-center">
					<h3 class="h3 mb-2 mb-sm-0" > 강좌 상세 정보 <span class="badge bg-orange bg-opacity-10 text-orange"> 총 ${count } 명</span></h3>
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
								<input class="form-control bg-body" type="searchWord" placeholder="이름 또는 이메일을 입력하세요." aria-label="Search" name="searchWord" value="${map.searchWord}">
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
									<th scope="col" class="border-0 rounded-start">이름</th>
									<th scope="col" class="border-0"> 연락처</th>
									<th scope="col" class="border-0"> 성별</th>
									<th scope="col" class="border-0"> 생년월일</th>
									<th scope="col" class="border-0 rounded-end"> 이메일</th>
								</tr>
							</thead>
							<!-- Table body START -->
							<tbody>
								<c:if test="${empty list }">
								<td class="first" colspan="5">수강 회원이 없습니다.</td>
								</c:if>
								
								<!-- Table row -->
								<c:forEach var="vo" items="${list }" >  
									<tr>
										<td>
											<div class="align-items-center position-relative">
												<!-- Title -->
												<h5 class="table-responsive-title mb-0 ms-2" >	
													<a>${vo.username }</a>
												</h5>
											</div>
										</td>
										<td>
											<div class="align-items-center">
												<h5 class="mb-0 fw-light">${vo.hp }</h5>
											</div>
										</td>
										<td>
											<div class="align-items-center">
												<h5 class="mb-0 fw-light">
												<c:choose>
									            	<c:when test="${vo.gender == 1}">남자</c:when>
									               	<c:when test="${vo.gender == 2}">여자</c:when>
								               	<c:otherwise /> </c:choose></h5>
											</div>
										</td>
										<td>
											<div class="align-items-center">
												<h5 class="mb-0 fw-light">${vo.birth }</h5>
											</div>
										</td>
										<td>
											<div class="align-items-center">
												<h5 class="mb-0 fw-light">${vo.email }</h5>
											</div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- Card body END -->
			</div>
			<!-- Card END -->
		</div>
	</div>
	<%@ include file="/WEB-INF/views/admin/topbar.jsp" %>
</body>
</html>