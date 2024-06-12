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
	<section class="regist-info">
		<div class="box">
		 	<h2>수업 신청 안내</h2>
		 	<p>강좌명을 클릭하시면 강좌 세부내용 및 수강신청을 하실 수 있습니다.</p>
		 	<p>온라인 등록은 선착순으로 운영됩니다.</p>
		 	<p>수강신청하신 강좌는 ‘수강 내역 확인’ 에서 확인하실 수 있습니다.</p>
		</div>
	
	</section>
</main>

</body>
</html>