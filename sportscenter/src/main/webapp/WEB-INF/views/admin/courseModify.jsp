<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    java.util.Calendar calendar = java.util.Calendar.getInstance();
	int currentYear = calendar.get(java.util.Calendar.YEAR);
	int nextMonth = calendar.get(java.util.Calendar.MONTH) + 2;
    int currentDay = calendar.get(java.util.Calendar.DAY_OF_MONTH);
   // pageContext.setAttribute("currentDay", currentDay);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>course modify</title>
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script type="text/javascript">
	function checkOnlyOnce(currentCheckbox) {
	   	const checkboxes = document.getElementsByName("classid");
	   	let checkedCnt = 0;
	   	for(let i=0; i<checkboxes.length;i++){
	   		if(checkboxes[i].checked) {
	   			checkedCnt++;
	   			if(checkboxes[i] != currentCheckbox) {
	   				checkboxes[i].checked = false;
	   			}
	   		}
	   	}
	   	if(checkedCnt === 0) {
	   		currentCheckbox.checked = true;
	   	}
	}
</script>
<style>
    tbody tr td {
        text-align: center;
        vertical-align: middle;
    }
</style>
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
</head>
<body>
<main>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %> 
<div class="page-content">
<%@ include file="/WEB-INF/views/admin/topbar.jsp" %>
	<div class="page-content-wrapper border">
		<div class="row mb-3">
			<div class="col-12 d-sm-flex justify-content-between align-items-center">
				<h3 class="h3 mb-2 mb-sm-0" > 변경 가능 목록 </h3>
			</div>
		</div>
		
		<!-- Card header START -->
		<div class="col-12">
			<div class="card bg-transparent border h-100">
			<div class="card-header bg-light border-bottom">
			<h5 class="card-header-title mb-0">기존 수강생의 반을 확인 후 변경해주세요. </h5>
			</div>
		
		<form method="post" action="courseModify.do" id="mclass" name="mclass">
		<div class="card-body">
			<!-- Course table START -->
			<div class="table-responsive border-0 rounded-3">
				<!-- Table START -->
				<table class="table table-dark-gray align-middle p-4 mb-2 table-hover">
					<!-- Table head -->
					<thead>
						<tr style="text-align:center">
							<th scope="col" class="border-0 rounded-start">선택</th>
							<th scope="col" class="border-0">반이름</th>
							<th scope="col" class="border-0">종목</th>
							<th scope="col" class="border-0">요일</th>
							<th scope="col" class="border-0">년도</th>
							<th scope="col" class="border-0">월</th>
							<th scope="col" class="border-0">시간</th>
							<th scope="col" class="border-0">등급</th>
							<th scope="col" class="border-0">가격</th>
							<th scope="col" class="border-0">정원</th>
							<th scope="col" class="border-0 rounded-end">현원</th>
						</tr>
					</thead>
		
					<!-- Table body START -->
					<tbody>
						<c:if test="${empty cmap }">
							<tr><td class="first" colspan="9">변경 가능한 과목이 없습니다.</td></tr>
						</c:if>
						<c:if test="${not empty cmap }">
						<c:forEach var="vo" items="${cmap }"> 
							<tr>
								<td>
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input" id="classid" name="classid" value="${vo.classid }" onclick="checkOnlyOnce(this)" />
								</div>
								</td>
								<td>
									<div class="align-items-center">
										<h6 class="mb-0 fw-light">${vo.classname }</h6>
									</div>
								</td>
								<td>
									<div class="align-items-center">
										<h6 class="mb-0 fw-light">${vo.subtypeName }</h6>
									</div>
								</td>
								<td>
									<div class="align-items-center">
										<h6 class="mb-0 fw-light" id="classday">${vo.classYoil }</h6>
									</div>
								</td>
								<td>
									<div class="align-items-center">
										<h6 class="mb-0 fw-light">${vo.classyear }</h6>
									</div>
								</td>
								<td>
									<div class="align-items-center">
										<h6 class="mb-0 fw-light">${vo.classmonth }</h6>
									</div>
								</td>
								<td>
									<div class="align-items-center">
										<h6 class="mb-0 fw-light">${vo.formattedClasstime}</h6>
									</div>
								</td>
								<td>
									<div class="align-items-center">
										<h6 class="mb-0 fw-light">${vo.classlevelName }</h6>
									</div>
								</td>
								<td>
									<div class="align-items-center">
										<h6 class="mb-0 fw-light">${vo.classprice }</h6>
									</div>
								</td>
								<td>
									<div class="align-items-center">
										<h6 class="mb-0 fw-light">${vo.classlimit }</h6>
									</div>
								</td>
								<td>
									<div class="align-items-center">
										<h6 class="mb-0 fw-light">${vo.classcnt }</h6>
									</div>
								</td>
							</tr>
						</c:forEach>
						</c:if>
					</tbody>
				</table>
			</div>
			<input type="hidden" value="${payid }" id="payid" name="payid">	
			<div class="d-sm-flex justify-content-end text-dark">
				<button type="submit" class="btn btn-sm btn-light mb-0 ms-auto"> 변경하기 </button> 
			</div>
		</div>
		</form>
	</div>
	</div>
	</div>
	</div>
</main>
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>
</body>
</html>