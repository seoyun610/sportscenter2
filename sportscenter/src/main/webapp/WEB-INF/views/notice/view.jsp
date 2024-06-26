<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="/js/script.js">
    </script>
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

<title>공지사항</title>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
			<div class="size">
			<h1 style="text-align: center; margin-top: 50px; margin-bottom: 30px; font-weight: bold;">공지 게시판</h1>
			<hr style="border-width: 4px; border-color: #000; width: 60%; margin: 0 auto;">
			<h5 style="text-align: center; margin-top: 30px; margin-bottom: 30px; font-weight: bold;">${vo.noticetitle}</h5>
			<div class="container" style="margin-top: 30px; margin-bottom: 30px;">
			<hr style="border: 1px solid #ccc; width: 95%; margin: 0 auto;">
			<ul class="head" style="list-style-type: none; display: flex;justify-content:center;  background-color: #f1f3f5; width: 95%; margin: 0 auto; padding: 10px; border-radius: 5px;">
			    <li class="writer" style="margin-right: 10px;">
			       <strong>작성자: </strong>
			       <span>관리자</span> 
			    </li>
			    <li class="date" style="margin-right: 10px;">
			        <strong>작성일: </strong>
			        <span><fmt:formatDate value="${vo.noticedate }" pattern="YYYY-MM-dd"/></span>
			    </li>
			    <li class="cnt" style="margin-right: 10px;">
			        <strong>조회수: </strong>
			        <span>${vo.noticeregcnt }</span>
			    </li>
			</ul>
			<hr style="border: 1px solid #ccc; width: 95%; margin: 0 auto;">
            <div style="margin-bottom: 10px; line-height: 1.6; text-align: center; margin-top: 30px; margin-bottom: 30px;"> ${vo.noticecontent } </div>
            <c:if test="${not empty vo.noticefilename_org}">
				<dl class="file" style="margin-bottom: 10px;">
					<dt style="font-weight: bold;">첨부파일 </dt>
					<dd>
					<a href='<c:url value="/notice/download.do" />?uploadPath=/upload/notice&noticefilename_org=${URLEncoder.encode(vo.noticefilename_org)}&noticefilename_real=${vo.noticefilename_real}' target="_blank">${vo.noticefilename_org}</a></dd>
                </dl>
            </c:if>  
            <hr style="border: 1px solid #ccc; width: 95%; margin: 0 auto; margin-top: 30px; margin-bottom: 30px;">                 
            <div>
				<div style="text-align: center;">
				<a href="index.do" class="btn" style="display: inline-block; padding: 10px 60px; background-color: #000000; color: #fff; text-decoration: none; border-radius: 5px;">목록</a>
            	</div>
			</div>
         </div>
     </div>
	</div>
	  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>