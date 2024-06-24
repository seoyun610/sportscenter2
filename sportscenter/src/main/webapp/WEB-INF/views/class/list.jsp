<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    java.util.Calendar calendar = java.util.Calendar.getInstance();
	int currentYear = calendar.get(java.util.Calendar.YEAR);
	int nextMonth = calendar.get(java.util.Calendar.MONTH) + 2;
    int currentDay = calendar.get(java.util.Calendar.DAY_OF_MONTH);
    pageContext.setAttribute("currentDay", currentDay);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수강신청</title>
	<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="/js/script.js"></script>
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
	<link rel="stylesheet" type="text/css" href="/resources/css/list.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
    	tbody tr td {
	        text-align: center;
	        vertical-align: middle;
	    }
		@media (min-width: 1000px) {
	        .page-content {
	            margin: 1.5rem 5rem !important;
	        }
	    }
	    .mb-3 {
		  margin: 1rem !important;
		}
		.card-footer {
		  padding: var(--bs-card-cap-padding-y) var(--bs-card-cap-padding-x);
		  color: var(--bs-card-cap-color);
		  background-color: var(--bs-card-cap-bg);
		  border-top: none !important;
		}
    </style>
	<script>
		// var load = false;
		/* window.addEventListener('DOMContentLoaded', function() {
			var today = new Date(); 
			var year = today.getFullYear(); 
			var month = today.getMonth() + 2;
			$("classyear").val(year);
			$("classmonth").val(month);
			$("#searchForm").submit();
		}); 
		*/
		/*
		$(function() {
			var today = new Date(); 
			var year = today.getFullYear(); 
			var month = today.getMonth() + 2;
			$("classyear").val(year);
			$("classmonth").val(month);
			if(load == false){
				$("#searchForm").submit();
				load == true;
			}
		});*/
		
	/* 	window.onload = function() {
			var today = new Date(); 
			var year = today.getFullYear(); 
			var month = today.getMonth() + 2;
			$("classyear").val(year);
			$("classmonth").val(month);
			$("#searchForm").submit();
		} */
		/* function initSubmit(){
			var today = new Date(); 
			var year = today.getFullYear(); 
			var month = today.getMonth() + 2;
			$("classyear").val(year);
			$("classmonth").val(month);
			$("#searchForm").submit();
		} */
		function classSelection(classId, classLimit, classCnt) {
			const today = new Date();
		    const day = today.getDate();
			console.log(classId);
			if (day >= 01 && day <= 29) {
				if (classLimit > classCnt){
					location.href = '/class/payCheck.do?retake=0&classid=' + classId;
				} else {
					alert ('잔여석이 없습니다.')
				}
		    } else {
		    	if( day >= 20 && day < 25 ){
		    		alert('재수강 기간입니다. \n 마이페이지에서 재수강 여부 확인하세요.');
		    	} else { 
		    		alert('신청 기간이 아닙니다.');
		    	}
		    }
		}
	</script>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content"> 
		<div class="page-content-wrapper border">
			<!-- Title -->
			<div class="row mb-3">
				<div class="col-12 d-sm-flex justify-content-between align-items-center mb-4">
					<h3 class="h3 mb-2 mb-sm-0" style="font-family: 'Noto Sans KR', sans-serif;">수강신청</h3>
				</div>
				<!-- Select START -->
				<div class="col-lg-8 col-xl-9">
					<!-- Select option -->
					<div class="row mb-4 align-items-center">
						<form method="get" name="searchForm" id="searchForm" action="list.do" class="rounded position-relative">
							<div class="row">
								<div class="col-md-2 mb-2">
									<div class="border rounded p-2">
										<select id="subtype" name="subtype" size="1" class="form-select form-select-sm js-choice border-0" aria-label=".form-select-sm">
											<c:forEach var="vo" items="${smap.list }">
												<option value="${vo.sportid }" ${vo.sportid == 99 ? 'selected disabled hidden' : ''}>${vo.sporttxt }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-2 mb-2">
									<div class="border rounded p-2">
										<select id="classtime" name="classtime" size="1" class="form-select form-select-sm js-choice border-0" aria-label=".form-select-sm">
											<c:forEach var="vo" items="${tmap.list }">
												<option value="${vo.timeid }" ${vo.timeid == 99 ? 'selected disabled hidden' : ''}>${vo.timetxt }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-2 mb-2">
									<div class="border rounded p-2">
										<select id="classlevel" name="classlevel" size="1" class="form-select form-select-sm js-choice border-0" aria-label=".form-select-sm">
											<c:forEach var="vo" items="${lmap.list }">
												<option value="${vo.levelid }" ${vo.levelid == 99 ? 'selected disabled hidden': ''}>${vo.leveltxt}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<input type="hidden" id="classyear" name="classyear" value="<%=currentYear %>">
								<input type="hidden" id="classmonth" name="classmonth" value="<%=nextMonth%>">
								<div class="col-md-2 mb-2 text-dark d-flex align-items-center">
									<input type="submit" id="sBtn" value="검색" title="검색" class="btn btn-primary mt-2 mb-1">
								</div>
							</div>
						</form>
					</div>
				</div>
				<!-- Select END -->
				
				<!-- Table START -->
				<table class="table table-dark-gray align-middle p-4 mb-0 table-hover">
					<!-- Table head -->
					<thead style="width:100%; justify-content: space-between;">
						<tr style="text-align:center; width:100%; justify-content: space-between;">
							<th scope="col" class="border-0 rounded-start">강좌명</th>
							<th scope="col" class="border-0">종목</th>
							<th scope="col" class="border-0">진행 월</th>
							<th scope="col" class="border-0">요일</th>
							<th scope="col" class="border-0">시간</th>
							<th scope="col" class="border-0">등급</th>
							<th scope="col" class="border-0">가격</th>
							<th scope="col" class="border-0">정원</th>
							<th scope="col" class="border-0">현원</th>
							<th scope="col" class="border-0">신청가능 여부</th>
							<th scope="col" class="border-0 rounded-end">신청</th>
						</tr>
					</thead>
								
					<!-- Table body START -->
					<tbody>
						<c:if test="${empty map.list }">
							<tr>
								<td colspan="9">등록된 과목이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="vo" items="${map.list }"> 
							<!-- Table row -->
							<tr>
								<!-- Table data start -->
								<td rowspan="2" class="align-content-center position-relative">
									<div class="align-items-center position-relative">
										${vo.classname }
									</div>
								</td>  
								<td>
									<div class="align-items-center">
										${vo.subtypeName }	
									</div>
								</td>
								<td>
									<div class="align-items-center">
										${vo.classmonth }	
									</div>
								</td>
								<td>
									<div class="align-items-center">
										${vo.classYoil }	
									</div>
								</td>
								<td>
									<div class="align-items-center">
										${vo.formattedClasstime}	
									</div>
								</td>
								<td>
									<div class="align-items-center">
										${vo.classlevelName }	
									</div>
								</td>
								<td>
									<div class="align-items-center">
										${vo.classprice }	
									</div>
								</td>
								<td>
									<div class="align-items-center">
										${vo.classlimit }	
									</div>
								</td>
								<td>
									<div class="align-items-center">
										${vo.classcnt }	
									</div>
								</td>
								<td>
									<div class="align-items-center">
										<c:choose>
											<c:when test="${currentDay >= 20 && currentDay <= 26}">
												<c:choose>
													<c:when test="${vo.classlimit > vo.classcnt }">
														신청 가능
													</c:when>
													<c:otherwise>
														신청 불가
													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
												<td>신청 불가</td>
											</c:otherwise>
										</c:choose>
									</div>
								</td>
								<td> 
									<div class="align-items-center">
										<input type="button" id="btn" onclick="classSelection(${vo.classid}, ${vo.classlimit}, ${vo.classcnt})" value="신청">
									</div>
								</td>
								<!-- Table data end -->
							</tr>
							<tr>
								<c:set var="classcntval" value="${vo.classcnt }"/> <c:set var="classlimitval" value="${vo.classlimit }"/>
								<c:set var="percentVal" value="${classcntval / classlimitval * 100}"/>
								<td colspan = "10"> 
									<div class="d-flex align-items-center">
										<progress id="percentage" style="width: 100%;" min="0" max="100" value="${percentVal}"></progress>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- Card footer START -->
				<div class="card-footer bg-transparent mt-3 pt-0">
					<!-- Pagination START -->
					<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
					    <!-- Content -->
						<p class="mb-0 text-center text-sm-start">	${map.page }/${map.totalPage }페이지 </p>
						<!-- Pagination -->
						<nav class="d-flex justify-content-center mb-0" aria-label="navigation">
							<ul class="pagination pagination-sm pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
								<c:if test="${map.prev }">
									<li class="page-item mb-0"><a class="page-link" href="list.do?page=${map.startPage-1 }"> << </a></li>
								</c:if>
								<c:forEach var="p" begin="${map.startPage }" end="${map.endPage }">
									<c:if test="${p == ClassVO.page }">
										<li class="page-item mb-0 active"><a class="page-link" href='#'; class='current'>${p}</a></li>
									</c:if>
									<c:if test="${p != ClassVO.page }">
										<li class="page-item mb-0"><a class="page-link" href="list.do?page=${p}">${p}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${map.next }">
									<li class="page-item mb-0 active"><a class="page-link" href="list.do?page=${map.endPage+1 }"> >> </a></li>
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
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>