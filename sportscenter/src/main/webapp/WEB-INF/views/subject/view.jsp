<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="/js/script.js">
    </script>

<title>종목 안내</title>
</head>
<body>
	<div class="login">  
    	<ul class="nav">
     		<li><a href="user/login"><span>로그인</span></a></li>
     		<li><a href="user/join"><span>회원가입</span></a></li>                      
    	</ul>
    </div>
    
	<div class="size">
	<h3 class="sub_title">${vo.subjecttype }</h3>
	<div class="bbs">
		<div class="view">
			<div class = "mainimg"></div>
				<c:if test="${not empty vo.subjectfilename_org}">
				    <dl class="file">
				        <dd>
				            <pre>
				                <img src='/upload/subject/${vo.subjectfilename_real}' />
				            </pre>
				        </dd>
				    </dl>
				</c:if>
			</div>				
            <div> ${vo.subjectcontent } </div>    
            <div>
				<div>
				<a href="index.do" class="btn">목록</a>
                <c:if test="${not empty adminLogin}">
                	<a href="edit.do?subjectid=${vo.subjectid}" class="btn">수정</a>
                    <a href="delete.do?subjectid=${vo.subjectid}" class="btn">삭제</a>
                </c:if>
            	</div>
			</div>
         </div>
     </div>
</body>
</html>