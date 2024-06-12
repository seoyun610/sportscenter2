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
    
    <style> 
	/* 기본 스타일 */
	body {
	    font-family: Arial, sans-serif;
	    margin: 0;
	    padding: 0;
	}
	
	/* 네비게이션 바 스타일 */
	nav {
	    background-color: #000; /* 네비게이션 바 배경 색상 */
	    padding: 1rem; /* 내부 여백 */
	    border-radius: 10px;
	}
	
	nav ul {
	    list-style-type: none; /* 리스트 스타일 제거 */
	    margin: 0;
	    padding: 0;
	    display: flex; /* 가로 정렬 */
	    justify-content: center; /* 가운데 정렬 */
	}
	
	nav ul li {
	    margin: 0 1rem; /* 리스트 아이템 간격 */
	}
	
	nav ul li a {
	    color: #fff; /* 링크 글자 색상 */
	    text-decoration: none; /* 밑줄 제거 */
	    font-size: 1rem; /* 글자 크기 */
	}
	
	nav ul li a:hover {
	    text-decoration: underline; /* 마우스 오버 시 밑줄 표시 */
	}
	
	   .box {
            /*border: 2px solid #fff;*/
            padding: 20px;
            margin: 20px;
            border-radius: 10px;
            background-color:#EBEBEB;
        }

        .box h2 {
            font-size: 1.5rem;
            margin-bottom: 10px;
        }

        .box p {
            margin-bottom: 5px;
        }
    </style>
   </head>
   
 <!-- header와 네비게이션 바 --> 	
<body>
<header>
		<h1><p style="text-align:center;">종목/ 안내</p></h1>
	</header>
	 <nav>
        <ul>
            <li><a href="/subject/view.do">종목 안내</a></li>
            <li><a href="/subject/usageInfo.do">이용 안내</a></li>
            <li><a href="/subject/registInfo.do">수업 신청 안내</a></li>
        </ul>
    </nav>

<main> 
	<section class="usage-info">
	
		<div class="box">
		 	<h2>회원등록</h2>
		 	<p>회원 등록 및 수강신청 방법과 시기, 구비서류 등을 안내해 드립니다.</p>
		 	<p>회원안내실 이용시간: 평일 6시 ~ 21시 30분, 토일, 공휴일9시~17시 30분(동절기 12~2월 16시 30분까지)</p>
		 	<p>※매월 두번째 일요일은 휴관입니다.</p>
		</div>
		
	    <h2><p>회원등록 안내</p></h2>
	</section>

</main>

</body>
</html>