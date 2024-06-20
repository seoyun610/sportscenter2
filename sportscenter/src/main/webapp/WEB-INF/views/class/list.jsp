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

	<!-- Favicon -->
	<link rel="shortcut icon" href="/resources/images/favicon.ico">
    
    <style>
    	.table-container {
        display: flex;
        justify-content: center;
        width: 100%;
	    }
	    table {
	        margin: 20px 0; /* Optional: Add some margin for spacing */
	    }
	    tbody tr td {
	        text-align: center;
	        vertical-align: middle;
	    }
	    .card-footer {
	        background-color: #f8f9fa; /* 회색 배경 */
	        color: #6c757d; /* 회색 텍스트 */
	    }
	    .card-footer .page-link {
	        color: #6c757d; /* 회색 페이지 링크 */
	        border-color: #dee2e6; /* 회색 경계 */
	    }
	    .card-footer .page-item.active .page-link {
	        background-color: #6c757d; /* 활성화된 페이지 회색 배경 */
	        border-color: #6c757d; /* 활성화된 페이지 회색 경계 */
	        color: #fff; /* 활성화된 페이지 흰색 텍스트 */
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
	<div class="wrap">
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<div class="table-container">
			<div class="sub" style="width: 80%;">
				<div class="clsSearch">
					<form method="get" name="searchForm" id="searchForm" action="list.do">
						<span class="srchSelect">
							<select id="subtype" name="subtype" size="1">
								<c:forEach var="vo" items="${smap.list }">
									<option value="${vo.sportid }" ${vo.sportid == 99 ? 'selected disabled hidden' : ''}>${vo.sporttxt }</option>
								</c:forEach>
							</select>
							<select id="classtime" name="classtime" size="1">
								<c:forEach var="vo" items="${tmap.list }">
									<option value="${vo.timeid }" ${vo.timeid == 99 ? 'selected disabled hidden' : ''}>${vo.timetxt }</option>
								</c:forEach>
							</select>
							<select id="classlevel" name="classlevel" size="1">
								<c:forEach var="vo" items="${lmap.list }">
									<option value="${vo.levelid }" ${vo.levelid == 99 ? 'selected disabled hidden': ''}>${vo.leveltxt}</option>
								</c:forEach>
							</select>
							<input type="hidden" id="classyear" name="classyear" value="<%=currentYear %>">
							<input type="hidden" id="classmonth" name="classmonth" value="<%=nextMonth%>">
							<input type="submit" id="sBtn" value="검색" title="검색">
						</span>
					</form>
				</div>
				<table border="1">
					<tbody>
						<tr>
							<th>강좌명</th>
							<th>종목</th>
							<th>요일</th>
							<th>시간</th>
							<th>등급</th>
							<th>가격</th>
							<th>정원</th>
							<th>현원</th>
						</tr>
						<c:if test="${empty map.list }">
							<tr>
								<td colspan="9">등록된 과목이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="vo" items="${map.list }"> 
							<tr>
								<td rowspan="2">${vo.classname }</td>  
								<td>${vo.subtypeName }</td>
								<td>${vo.classday } </td>
								<td>${vo.formattedClasstime}</td>
								<td>${vo.classlevelName }</td>
								<td>${vo.classprice }</td>
								<td>${vo.classlimit }</td>
								<td>${vo.classcnt }</td>
								<c:choose>
									<c:when test="${currentDay >= 20 && currentDay <= 26}">
										<c:choose>
											<c:when test="${vo.classlimit > vo.classcnt }">
												<td>신청 가능</td>
											</c:when>
											<c:otherwise>
												<td>신청 불가</td>
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<td>신청 불가</td>
									</c:otherwise>
								</c:choose>
								<td> <input type="button" id="btn" onclick="classSelection(${vo.classid}, ${vo.classlimit}, ${vo.classcnt})" value="신청"></td>
							</tr>
							<tr>
								<td colspan = "9"> graph </td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
								<li><a href="list.do?page=${map.startPage-1 }"> << </a></li>
							</c:if>
							<c:forEach var="p" begin="${map.startPage }" end="${map.endPage }">
								<c:if test="${p == ClassVO.page }">
								<li><a href='#'; class='current'>${p}</a></li>
								</c:if>
								<c:if test="${p != ClassVO.page }">
								<li><a href="list.do?page=${p}">${p }</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${map.next }">
								<li><a href="list.do?page=${map.endPage+1 }"> >> </a></li>
							</c:if>
						</ul>
					</nav>
				</div>
				<!-- Pagination END -->
			</div>
			<!-- Card footer END -->
		</div>
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>