<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    java.util.Calendar calendar = java.util.Calendar.getInstance();
	int currentYear = calendar.get(java.util.Calendar.YEAR);
	int nextMonth = calendar.get(java.util.Calendar.MONTH) + 2;
    int currentDay = calendar.get(java.util.Calendar.DAY_OF_MONTH);
   // pageContext.setAttribute("currentDay", currentDay);
%>
<%int cnt=0; %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수업관리</title>
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

	<!-- Select option -->
		<div class="page-content-wrapper border">
		<div class="row mb-3">
			<div class="col-12 d-sm-flex justify-content-between align-items-center mb-4">
				<h2 class="h3 mb-2 mb-sm-0">강좌 정보 관리</h2>
				<input type="button" value="개별 추가" onclick="registOne();" class="btn btn-sm btn-primary mb-0">
			</div>

			<div class="col-lg-8 col-xl-9">
				<!-- Select option -->
				<div class="row mb-4 align-items-center">
					<form method="get" name="searchForm" id="searchForm" action="list.do">
						<div class="row">
							<div class="col-md-3 mb-3">
								<div class="border rounded p-2">
									<select class="form-select form-select-sm js-choice border-0" aria-label=".form-select-sm" id="subtype" name="subtype">
										<c:forEach var="vo" items="${smap.list}">
											<option value="${vo.sportid}" ${vo.sportid == 99 ? 'selected disabled hidden' : ''}>${vo.sporttxt}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-md-3 mb-3">
								<div class="border rounded p-2">
									<select class="form-select form-select-sm js-choice border-0" aria-label=".form-select-sm" id="classtime" name="classtime">
										<c:forEach var="vo" items="${tmap.list}">
											<option value="${vo.timeid}" ${vo.timeid == 99 ? 'selected disabled hidden' : ''}>${vo.timetxt}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-md-3 mb-3">
								<div class="border rounded p-2">
									<select class="form-select form-select-sm js-choice border-0" aria-label=".form-select-sm" id="classlevel" name="classlevel">
										<c:forEach var="vo" items="${lmap.list}">
											<option value="${vo.levelid}" ${vo.levelid == 99 ? 'selected disabled hidden' : ''}>${vo.leveltxt}</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="col-md-2 mb-3 text-dark d-flex align-items-center">
								<input type="submit" id="sBtn" value="검색" title="검색" class="btn btn-sm btn-light mb-0 ms-auto">
							</div>
						</div>
					</form>
				</div>
			</div>

			
			

			<form method="get" action="modify.do" id="classForm" name="classForm">
				<table class="table table-dark-gray align-middle p-4 mb-4 table-hover" id="listTable" name="listTable">
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
				<tbody>
					<c:if test="${empty map.list }">
						<tr>
							<td colspan="11">불러올 과목이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="vo" items="${map.list }"> 
						<tr id="list<%=cnt %>" value="<%=cnt%>">
							<td><div class="align-items-center position-relative"> 
								<input type="checkbox" id="classid" name="classid" value="${vo.classid }" onclick="checkOnlyOnce(this)" />
							</div></td>
							<td><div class="align-items-center"><h5 class="mb-0 fw-light">${vo.classname }</h5></div></td>  
							<td><div class="align-items-center"><h5 class="mb-0 fw-light">${vo.subtypeName }</h5></div></td> 
							<td id="classday"><div class="align-items-center"><h5 class="mb-0 fw-light">${vo.classYoil }</h5></div></td>
							<td><div class="align-items-center"><h5 class="mb-0 fw-light">${vo.classyear }</h5></div></td>
							<td><div class="align-items-center"><h5 class="mb-0 fw-light">${vo.classmonth }</h5></div></td>
							<td><div class="align-items-center"><h5 class="mb-0 fw-light">${vo.formattedClasstime}</h5></div></td>
							<td><div class="align-items-center"><h5 class="mb-0 fw-light">${vo.classlevelName }</h5></div></td>
							<td><div class="align-items-center"><h5 class="mb-0 fw-light">${vo.classprice }</h5></div></td>
							<td><div class="align-items-center"><h5 class="mb-0 fw-light">${vo.classlimit }</h5></div></td>
							<td><div class="align-items-center"><h5 class="mb-0 fw-light">${vo.classcnt }</h5></div></td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
				<input type="submit" id="classBtn" value="선택수정" class="btn btn-primary mb-0"/>
				<input type="button" onclick="classDel();" value="선택삭제" class="btn btn-primary mb-0" >
			</form>
			
			
			<!-- Card footer START -->
			<div class="card-footer bg-transparent pt-0">
				<!-- Pagination START -->
				<div class="d-sm-flex justify-content-sm-between align-items-sm-center">
					<!-- Content -->
					<p class="mb-0 text-center text-sm-start"></p>
					<!-- Pagination -->
					<nav class="d-flex justify-content-center mb-0" aria-label="navigation">
						<ul class="pagination pagination-sm pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
							<c:if test="${map.prev }">
							<li class="page-item mb-0"><a class="page-link" href="list.do?page=${map.startPage-1 }" tabindex="-1"><i class="fas fa-angle-left"></i></a></li>
							</c:if>
							<c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
							<c:if test="${p == ClassVO.page}">
								   <li class="page-item mb-0 active"><a class="page-link" href='#;' class='current'>${p}</a></li>
							</c:if>
							<c:if test="${p != ClassVO.page}">
								 <li class="page-item mb-0"><a class="page-link" href='list.do?page=${p}&searchWord=${classVO.searchWord}'>${p}</a></li>
							</c:if>
							</c:forEach>
							<c:if test="${map.next }">
							<li class="page-item mb-0"><a href="list.do?page=${map.endPage+1 }&searchWord=${classVO.searchWord}" class="page-link"><i class="fas fa-angle-right"></i></a></li>
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
	</main>
	
<script type="text/javascript">
	var modal = document.getElementsByClassName('modal')[0];
	var modalOpen = document.getElementsByClassName('modal_btn');
	var modalClose = document.getElementsByClassName('close_btn');
	function openmodal(){
		console.log(modal);
		modal.style.display = 'block';
	}
    
	function closemodal(){
		console.log(modal);
		modal.style.display = 'none';
	}
	
    function registOne() {
        window.open("/admin/regist.do");
    }
        
    function registAll() {
    	var classyear = document.getElementById("currentYear").value;
    	var nextMonth = document.getElementById("nextMonth").value;
    	console.log(classyear);
    	console.log(nextMonth);
    	if(classyear != <%=currentYear%>) {
    		alert("년도가 정확하지 않습니다. 다시 확인해주세요.");
    	}
    	if(nextMonth != <%=nextMonth%>) {
    		alert("날짜가 정확하지 않습니다. 다시 확인해주세요.");
    	}
     	if(confirm('다음달 수업을 일괄 추가하시겠습니까?')) {
     		var classmonth = nextMonth - 1; 
     		location.href="/admin/addAll/"+classyear+"/"+classmonth;
     	}
    }
    
    function classDel() {
      	var classid = $("input:checkbox[name='classid']:checked").val();
       	console.log("값 확인: " + classid);
       	if(confirm("정말 강좌를 삭제하시겠습니까?")){
       		location.href="/admin/delete/" + classid;
       	}
    }
        
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
</body>
</html>
