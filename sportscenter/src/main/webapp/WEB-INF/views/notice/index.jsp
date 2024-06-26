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
    <title></title>
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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
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
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<main>

<h1 style="text-align: center; margin-top: 50px; font-weight: bold;">공지 게시판</h1>
<div class="container-fluid mt-5" style="font-family: 'Noto Sans KR', sans-serif;">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div>
                <div class="row mb-3">
                    <div class="col-12 d-sm-flex justify-content-between align-items-center mb-4">
                    </div>
                </div>
                 <hr style="border-width: 3px; border-color: black; margin: 40px auto; width: 97%;">
                <!-- 페이지 표시 및 검색 부분 -->
                    <div>
                        <!-- Pagination and Search START -->
                        <div class="d-flex align-items-center justify-content-between">
                            <!-- Page Info -->
                            <div class="flex-grow-1 ms-3 ms-md-5">
                            	<p class="mb-0"><strong>총 ${map.count }개</strong>  | ${NoticeVO.page} ${map.totalPage} 페이지</p>
                            </div>       
                <!-- Search Form -->
                        <div class="flex-grow-1">
                            <div class="row mb-0 align-items-center">
                                <form method="get" name="searchForm" id="searchForm" action="/notice/index.do">
                                    <div class="d-flex align-items-center ms-auto" style="width: 50%;">
                                        <div class="me-2" style="flex-grow: 0; width: 50%; height: 38px;">
                                            
                                            <div class="border rounded p-2" style="height: 100%; box-sizing: border-box;">
                                                <select class="form-select form-select-sm js-choice border-0" aria-label=".form-select-sm" id="stype" name="searchType" style="width: 100%; height: 130%;  font-size: 0.9rem;  padding-top: 2.5px; margin-right: 20px;" >
                                                    <option value="all">전체</option>
                                                    <option value="noticetitle" <c:if test="${NoticeVO.searchType == 'noticetitle'}">selected</c:if>>제목</option>
                                                    <option value="noticecontent" <c:if test="${NoticeVO.searchType == 'noticecontent'}">selected</c:if>>내용</option>
                                                </select>
                                            </div>
                                        </div>
                                        <input class="form-control me-2" type="text" placeholder="검색어를 입력하세요" aria-label="Search" name="searchWord" value="${NoticeVO.searchWord}" style="flex-grow: 1; height: 38px; padding: 0.375rem 0.75rem; font-size: 1rem; line-height: 1.5; border-radius: 0.25rem; box-sizing: border-box;">
                                        <button class="btn btn-primary" type="submit" style="height: 36px; padding: 0.375rem 0.75rem; font-size: 1rem; line-height: 1.5; border-radius: 0.25rem; box-sizing: border-box; margin-right: 20px;">
                                         <i class="fas fa-search" style="margin-right: 20px;"></i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <hr style="border-width: 3px; border-color: #080402; margin: 40px auto; width: 97%;">
             
                    <!-- Card body START -->
                    <div class="card-body">
                        <!-- Course table START -->
                        <div class="table-responsive border-0 rounded-3">
                            <!-- Table START -->
                            <table class="table table-hover">
                                <!-- Table head -->
                                <thead>
                                    <tr style="text-align:center; font-size: 20px;">
                                        <th scope="col" class="border-0 rounded-start">번호</th>
                                        <th scope="col" class="border-0">제목</th>
                                        <th scope="col" class="border-0">작성자</th>
                                        <th scope="col" class="border-0">조회수</th>
                                        <th scope="col" class="border-0 rounded-end">작성일</th>
                                    </tr>
                                </thead>
                                
                                <!-- Table body START -->
                                <tbody>
                                    <c:if test="${empty map.list}">
                                        <td class="first" colspan="5">등록된 글이 없습니다.</td>
                                    </c:if>
                                    <c:forEach var="vo" items="${map.list}" varStatus="status">
                                        <tr style="height: 65px;">
                                            <td>
                                                <div class="align-items-center">
                                                    <h5 class="table-responsive-title mb-0 ms-2"  style="font-size: 0.999rem; margin-top: 0.5rem;">
                                                        <a>${(map.page) * 10 + status.index + 1}</a>
                                                    </h5>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="align-items-center">
                                                    <h5 class="mb-0 fw-light" style="font-size: 0.999rem; margin-top: 0.5rem;"><a href="view.do?noticeid=${vo.noticeid}">${vo.noticetitle}</a></h5>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="align-items-center">
                                                    <h5 class="mb-0 fw-light" style="font-size: 0.999rem; margin-top: 0.5rem;">${vo.adminname}</h5>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="align-items-center">
                                                    <h5 class="mb-0 fw-light" style="font-size: 0.999rem; margin-top: 0.5rem;">${vo.noticeregcnt}</h5>
                                                </div>
                                            </td>
                                            <td class="date">
                                                <div class="align-items-center">
                                                    <h5 class="mb-0 fw-light" style="font-size: 0.999rem; margin-top: 0.5rem;"><fmt:formatDate value="${vo.noticedate}" pattern="YYYY-MM-dd"/></h5>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                
                    <!-- Pagination -->
                            <nav class="d-flex justify-content-center mb-0" aria-label="navigation">
                                <ul class="pagination pagination-sm pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
                                    <c:if test="${map.prev}">
                                        <li class="page-item mb-0"><a class="page-link" href="/notice/view.do?page=${map.startPage-1}&searchWord=${PayVO.searchWord}" tabindex="-1"><i class="fas fa-angle-left"></i></a></li>
                                    </c:if>
                                    <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
                                        <c:if test="${p == NoticeVO.page}">
                                            <li class="page-item mb-0 active"><a class="page-link" href='#;' class='current'>${p}</a></li>
                                        </c:if>
                                        <c:if test="${p != NoticeVO.page}">
                                            <li class="page-item mb-0"><a class="page-link" href='/notice/view.do?page=${p}&searchWord=${NoticeVO.searchWord}'>${p}</a></li>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${map.next}">
                                        <li class="page-item mb-0"><a href="/notice/view.do?page=${map.endPage+1}&searchWord=${NoticeVO.searchWord}" class="page-link"><i class="fas fa-angle-right"></i></a></li>
                                    </c:if>
                                </ul>
                            </nav>
                </div>
            </div>
        </div>
	  <%@ include file="/WEB-INF/views/common/footer.jsp" %>


<script>
document.addEventListener('DOMContentLoaded', function() { 
var dropdownItems = document.querySelectorAll('.dropdown-item');
var selectElement = document.getElementById('stype');
 var dropdownToggle = document.getElementById('navbarDropdown'); 

dropdownItems.forEach(function(item) { 
item.addEventListener('click', function(event) { 
 event.preventDefault();          
 var value = item.getAttribute('data-value'); 
 selectElement.value = value; 
dropdownToggle.textContent = item.textContent;
 });        
 }); 

Set initial dropdown text based on the selected option in the hidden select element
   var selectedOption = selectElement.querySelector('option[selected]');
    if (selectedOption) {
        dropdownToggle.textContent = selectedOption.textContent;
    }
 });
</script>




</body>
</html>