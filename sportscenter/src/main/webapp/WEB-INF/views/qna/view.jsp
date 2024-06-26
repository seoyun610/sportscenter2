<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>Qna 게시판</title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
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
</head> 
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
        <div class="size">
            <h1 style="text-align: center; margin-top: 50px; margin-bottom: 30px; font-weight: bold;">Qna 게시판</h1>
            <hr style="border-width: 4px; border-color: #000; width: 54%; margin: 0 auto;">
            <h5 style="text-align: center; margin-top: 30px; margin-bottom: 30px; font-weight: bold;">${map.qnatitle}</h5>
            <div class="container" style="margin-top: 30px; margin-bottom: 30px;">
			<hr style="border: 1px solid #ccc; width: 81%; margin: 0 auto;">
			<ul class="head" style="list-style-type: none; display: flex;justify-content:center;  background-color: #f1f3f5; width: 81%; margin: 0 auto; padding: 10px; border-radius: 5px;">
			    <li class="writer" style="margin-right: 10px;">
			       <strong>작성자: </strong>
			       <span>${map.username }</span> 
			    </li>
			    <li class="date" style="margin-right: 10px;">
			        <strong>작성일: </strong>
			        <span><fmt:formatDate value="${map.qnadate }" pattern="YYYY-MM-dd"/></span>
			    </li>
			    <li class="cont" style="margin-right: 10px;">
			        <strong>조회수: </strong>
			        <span>${map.qnacnt }</span>
			    </li>
			</ul>
			<hr style="border: 1px solid #ccc; width: 81%; margin: 0 auto;">
			 
			
			
         
                 <div class="cont" style="margin-top: 30px; margin-bottom: 30px; margin-left: 130px;">${map.qnacontent }</div> 
                    <c:if test="${!empty map.qnafilename_org}">
                   		<dl class="file" style="margin: 20px 0 20px 20px; padding: 10px; position: relative;"> 
                         <dt style="float: left; margin-left: 100px; margin-top: 120px;">첨부파일 </dt>
                        <dd style="margin-left: 30px; margin-top: 120px;">                              
                        <a href="<c:url value="/qna/download.do"/>?uploadPath=/upload/qna&qnafilename_org=${URLEncoder.encode(map.qnafilename_org)}&qnafilename_real=${map.qnafilename_real}" target="_blank">${map.qnafilename_org}</a> 
                         </dd>
                     </dl>
                     </c:if>
                    <hr style="border: 1px solid #ccc; width: 81%; margin: 0 auto; margin-top: 6px; margin-bottom: 50px;">
                    <div>
                     <a href="/qna/index.do?qnaid=${map.qnaid }" class="btn"
                     style="background-color: black; color: white; border: none; padding: 10px 20px; border-radius: 5px; float: right; margin-right: 120px;">목록</a> 
                         <c:if test="${not empty login && login.usernum == map.usernum}">
						    <a href="/qna/delete.do?qnaid=${map.qnaid}" class="btn"
						    style="background-color: black; color: white; border: none; padding: 10px 20px; border-radius: 5px; float: right; margin-right: 20px;">게시글 삭제</a> 
						</c:if>	
						  
                     </div>
                </div> 
             </div>
                <hr style="border: 1px solid #ccc; width: 53%; margin: 0 auto; margin-top: 140px; margin-bottom: 30px;">
             
             
             <c:set var="isQnaidExist" value="false" /> 
			<c:forEach var="reply" items="${rmap }"> 
 				<c:if test="${reply.qnaid == map.qnaid}"> 
 				<div id="commentSection"> 
 					<c:set var="isQnaidExist" value="true" /> 
 					<div style="display: flex; align-items: center;">
				        <p style="font-weight: bold; margin-left: 400px;">${reply.adminname}</p>
			            <p style="margin-left: 700px;">작성일: <fmt:formatDate value="${reply.regdate}" pattern="YYYY-MM-dd"/></p> 
 			        </div> 
 			        <div style="margin-left: 390px; margin-bottom: 80px; padding: 100px; background-color: #f8f9fa; width:53%">
 			        <p >${reply.replycontent}</p> 
 				    </div>
 				    </c:if> 
 			</c:forEach> 
          <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body> 
</html>
