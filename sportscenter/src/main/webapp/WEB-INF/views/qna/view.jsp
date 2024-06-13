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
</head> 
<body>
    <div class="sub">
        <div class="size">
            <h3 class="sub_title">Qna 게시판</h3>
            <div class="bbs">
                <div class="view">
                    <div class="title">
                        <dl>
                            <dt>${map.qnatitle }</dt>
                            <dd>${map.username }</dd>
                            <dd class="date">작성일 : <fmt:formatDate value="${map.qnadate }" pattern="YYYY-MM-dd"/> </dd>
                        </dl>
                    </div>
                    <div class="cont">${map.qnacontent }</div>
                    <c:if test="${!empty map.qnafilename_org}">
                    <dl class="file">
                        <dt>첨부파일 </dt>
                        <dd>
                            <a href="<c:url value="/qna/download.do"/>?uploadPath=/upload/qna&qnafilename_org=${URLEncoder.encode(map.qnafilename_org)}&qnafilename_real=${map.qnafilename_real}" target="_blank">${map.qnafilename_org}</a>
                        </dd>
                    </dl>
                    </c:if>
                    <div>
                        <a href="/qna/index.do?qnaid=${map.qnaid }" class="btn">목록</a>
                        <c:if test="${not empty login && login.usernum == map.usernum}">
						    <a href="/qna/delete.do?qnaid=${map.qnaid}" class="btn">게시글 삭제</a>
						</c:if>	
                    </div>
                </div>
            </div>
            <c:set var="isQnaidExist" value="false" />
			<c:forEach var="reply" items="${rmap }">
				<c:if test="${reply.qnaid == map.qnaid}">
				<div id="commentSection">
					<c:set var="isQnaidExist" value="true" />
				        <p>${reply.adminname}</p>
			            <p>작성일: <fmt:formatDate value="${reply.regdate}" pattern="YYYY-MM-dd"/></p>
			            <p>${reply.replycontent}</p>
			        </div>
				    </c:if>
			</c:forEach>
        </div>
    </div>
</body> 
</html>
