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

<title>Insert title here</title>
</head>
<body>
	<div class="size">
	<h3 class="sub_title">공지 게시판</h3>
	<div class="bbs">
		<div class="view">
			<div class="title">
				<dl>
					<dt>${vo.noticetitle }</dt>
					<dd> ${vo.adminname }</dd>
					<dd class="date">작성일 : <fmt:formatDate value="${vo.noticedate }" pattern="YYYY-MM-dd"/> </dd>
                </dl>
            </div>
            <div> ${vo.noticecontent } </div>
            <c:if test="${not empty vo.noticefilename_org}">
				<dl class="file">
					<dt>첨부파일 </dt>
					<dd>
					<a href='<c:url value="/notice/download.do" />?uploadPath=/upload/notice&noticefilename_org=${URLEncoder.encode(vo.noticefilename_org)}&noticefilename_real=${vo.noticefilename_real}' target="_blank">${vo.noticefilename_org}</a></dd>
                </dl>
            </c:if>                    
            <div>
				<div>
				<a href="adminNotice.do" class="btn">목록</a>
               	<a href="/notice/edit.do?noticeid=${vo.noticeid}" class="btn">수정</a>
                <a href="/notice/delete.do?noticeid=${vo.noticeid}" class="btn">삭제</a>
            	</div>
			</div>
         </div>
     </div>
	</div>

</body>
</html>