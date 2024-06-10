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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <link rel="stylesheet" href="/css/contents.css"/>
    <script src="/js/script.js"></script>
    <script>
    function del() {
    	if (confirm('삭제하시겠습니까?')) {
    		location.href='delete.do?qnaid=${vo.qnaid}';
    	}
    }
    
//    function getComment(page) {
//		$.ajax({
//			url: "/reply/view.do",
//			data: {
//				qnaid: ${vo.qnaid},
//				page: page
//			},
//			success: function(res) {
//				$("#commentArea").html(res);
//			}
//		});
//	}
	
//	$(function() {
//		getComment(1);
//	});

	

//	}
    </script>
</head> 
<body>
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">Qna 게시판</h3>
                <div class="bbs">
                    <div class="view">
                        <div class="title">
                            <dl>
                                <dt>${vo.qnatitle }</dt>
                                <dd class="date">작성일 : <fmt:formatDate value="${vo.qnadate }" pattern="YYYY-MM-dd HH:mm:ss"/> </dd>
                            </dl>
                        </div>
                        <div class="cont">${vo.qnacontent }</div>
                        <c:if test="${!empty vo.qnafilename_org}">
                        <dl class="file">
                            <dt>첨부파일 </dt>
                            <dd>
                            <a href="<c:url value="/download.do"/>?uploadPath=/upload/qna&qnafilename_org=${URLEncoder.encode(vo.qnafilename_org)}&qnafilename_real=${vo.qnafilename_real}" target="_blank">${vo.qnafilename_org}</a></dd>
                        </dl>
                		</c:if>                    
                            <div>
                            	<a href="index.do" class="btn">목록</a>
                            	<c:if test="${!empty login and login.usernum == vo.usernum}">
                            	<a href="edit.do?qnaid=${vo.qnaid}" class="btn">수정</a>
                            	<a href="javascript:del();" class="btn">삭제</a>
                            	</c:if>
                            </div>
                        </div>
                
                    </div>
                    </div>
                </div>
</body> 
</html>