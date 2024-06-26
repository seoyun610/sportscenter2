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
    
<title>Insert title here</title>
</head>
<body>
<main>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %> 
<%@ include file="/WEB-INF/views/admin/topbar.jsp" %>
<<div class="size" style="margin-left:400px; margin-right: 200px; margin-top: 100px; height: 500px; padding: 20px; border: 1px solid #ccc; border-radius: 5px; background-color: #f5f5f5;">

    <h3 class="sub_title" style="font-size: 24px; margin-bottom: 10px;">공지 게시판</h3>
    
    <div class="bbs">
        <div class="view" style="height: 400px; padding: 10px; background-color: #fff; border: 1px solid #e1e1e1; border-radius: 3px; box-shadow: 0 1px 2px rgba(0,0,0,0.1);">
        
            <div class="title" style="margin-bottom: 10px;">
                <dl>
                    <dt style="font-weight: bold; font-size: 18px;">${vo.noticetitle }</dt>
                    <dd style="color: #666;">${vo.adminname }</dd>
                    <dd class="date" style="font-size: 12px; color: #999;">작성일 : <fmt:formatDate value="${vo.noticedate }" pattern="YYYY-MM-dd"/></dd>
                </dl>
            </div>
            
            <div style="margin-bottom: 20px;">${vo.noticecontent }</div>
            
            <c:if test="${not empty vo.noticefilename_org}">
                <dl class="file" style="margin-bottom: 10px;">
                    <dt style="font-weight: bold; color: #333;">첨부파일</dt>
                    <dd>
                        <a href='<c:url value="/notice/download.do" />?uploadPath=/upload/notice&noticefilename_org=${URLEncoder.encode(vo.noticefilename_org)}&noticefilename_real=${vo.noticefilename_real}' target="_blank" style="color: #007bff; text-decoration: none;">${vo.noticefilename_org}</a>
                    </dd>
                </dl>
            </c:if>
            
            <div>
                <div style="margin-top: 360px; margin-left: 850px;">
                    <a href="adminNotice.do" class="btn" style="background-color: black; color: #fff; padding: 5px 10px; margin-right: 10px; text-decoration: none; border-radius: 3px;">목록</a>
                    <a href="/notice/edit.do?noticeid=${vo.noticeid}" class="btn" style="background-color: black; color: #fff; padding: 5px 10px; margin-right: 10px; text-decoration: none; border-radius: 3px;">수정</a>
                    <a href="/notice/delete.do?noticeid=${vo.noticeid}" class="btn" style="background-color: black; color: #fff; padding: 5px 10px; text-decoration: none; border-radius: 3px;">삭제</a>
                </div>
            </div>
            
        </div>
    </div>
    
</div>

	

</body>
</html>