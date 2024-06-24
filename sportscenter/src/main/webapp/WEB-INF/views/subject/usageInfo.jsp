<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <title>수강 신청 안내</title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Eduport- LMS, Education and Course Theme">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="/js/script.js">
    </script>
	<script>
	const storedTheme = localStorage.getItem('theme')
	 
	const getPreferredTheme = () => {
		if (storedTheme) {
			return storedTheme
		}
		return window.matchMedia('(prefers-color-scheme: light)').matches ? 'light' : 'light'
	}

	const setTheme = function (theme) {
		if (theme === 'auto' && window.matchMedia('(prefers-color-scheme: dark)').matches) {
			document.documentElement.setAttribute('data-bs-theme', 'dark')
		} else {
			document.documentElement.setAttribute('data-bs-theme', theme)
		}
	}

	setTheme(getPreferredTheme())

	window.addEventListener('DOMContentLoaded', () => {
	    var el = document.querySelector('.theme-icon-active');
		if(el != 'undefined' && el != null) {
			const showActiveTheme = theme => {
			const activeThemeIcon = document.querySelector('.theme-icon-active use')
			const btnToActive = document.querySelector(`[data-bs-theme-value="${theme}"]`)
			const svgOfActiveBtn = btnToActive.querySelector('.mode-switch use').getAttribute('href')

			document.querySelectorAll('[data-bs-theme-value]').forEach(element => {
				element.classList.remove('active')
			})

			btnToActive.classList.add('active')
			activeThemeIcon.setAttribute('href', svgOfActiveBtn)
		}

		window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
			if (storedTheme !== 'light' || storedTheme !== 'dark') {
				setTheme(getPreferredTheme())
			}
		})

		showActiveTheme(getPreferredTheme())

		document.querySelectorAll('[data-bs-theme-value]')
			.forEach(toggle => {
				toggle.addEventListener('click', () => {
					const theme = toggle.getAttribute('data-bs-theme-value')
					localStorage.setItem('theme', theme)
					setTheme(theme)
					showActiveTheme(theme)
				})
			})

		}
	})
	</script>	

    
     <!-- Favicon -->
	<link rel="shortcut icon" href="/resources/images/favicon.ico">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap-icons/bootstrap-icons.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	
	<!-- bootstrap CSS 적용 시 필요 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">


   </head>
   
 <!-- header와 네비게이션 바 --> 	
<body>
<!-- Header -->
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<main>
<main>
<!-- =======================
Page Banner START -->
<section class="bg-light py-5">
	<div class="container">
		<div class="row g-4 g-md-5 position-relative">
			

			<!-- Title and Search -->
			<div class="col-lg-10 mx-auto text-center position-relative">
				
				<!-- Title -->
				<h1 class="display-6" style="font-family: 'Noto Sans KR', sans-serif; margin-bottom: 20px;">수강 신청</h1>
			</div>
			<div class="container d-flex justify-content-center align-items-center">
					<!-- Category item -->
					<div class="col-sm-6 col-md-3">
						<div class="card card-body card p-0">
							<a class="p-3" href="/class/list.do">
								<h6 class="mb-0" style="text-align: center;">온라인 수강신청 바로가기</h6>
							</a>
						</div>
					</div>
				</div> <!-- Row END -->
      </div>
			<!-- Category END -->
		
</section> 
<!-- =======================
Page Banner END -->

<!-- =======================
Page content START -->
<section class="pt-5 pb-0 pb-lg-5" style="font-family: 'Noto Sans KR', sans-serif; vertical-align: middle;" >
	<div class="container">
		<h3 style="font-weight: bold;">
			<img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
				신청안내
				</h3>
					<p style="margin-bottom: 50px;">방문 신청 또는 온라인 신청</p>
						
				<h3 style="font-weight: bold;">
		        	<img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
		        	신청기간
		    	</h3>
		    
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">기존회원 :</p>
		        <p style="margin: 0 0 0 5px;">매월 21일부터 26일</p>
		    </div>
		    <p style="margin: 0 0 0 5px;">※ 방문 접수 가능 시간: 평일 06:00 ~ 21:00</p>
		    <p style="margin: 0 0 0 5px; margin-bottom: 10px;">※ 온라인 접수 가능 시간:  매월 21일 00:10부터 26일 23:50까지</p>
		    
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">신규회원 :</p>
		        <p style="margin: 0 0 0 5px;"> 27일부터 말일까지</p>
		    </div>
		    <p style="margin: 0 0 0 5px;">※ 방문 접수 가능 시간: 평일 06:00 ~ 21:00</p>
		    <p style="margin: 0 0 0 5px; margin-bottom: 10px;">※ 온라인 접수 가능 시간:  매월 27일 00:10부터 말일 23:50까지</p>
		    <p style="color: #ec5353; margin-bottom: 50px;">※접수기간은 센터사정에 따라 매월 변경될수 있으니, 공지사항을 꼭 확인하시기 바랍니다.<br/>  
		    ※프로그램별 최소 인원 미만 접수시 합반 또는 변경(폐강) 될 수 있습니다.</p>
		    
		    <h3 style="font-weight: bold;">
		        	<img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
		        	온라인 수강신청
		    	</h3>
		    
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">기존회원 :</p>
		        <p style="margin: 0 0 0 5px;">매월 21일(00:10)~26일(23:50)까지(매일 23:50~00:10까지는 온라인시스템 정산으로 등록불가)</p>
		    </div>
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">신규회원 :</p>
		        <p style="margin: 0 0 0 5px;">매월 27일(00:10)~말일(23:50)까지(매일 23:50~00:10까지는 온라인시스템 정산으로 등록불가)</p>
		    </div>
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="margin: 0;">등록기간 강좌별 등록가능인원(잔여인원)은 매달 20일부터 익월 5일까지 홈페이지 [실시간등록현황]을 통해 확인가능</p>
		    </div>
		    
		   <p style="color: #ec5353; margin-bottom: 50px;">※매일 23:50~00:10까지는 온라인시스템 정산으로 등록불가<br/>  
		  ※단, 온라인 수강신청은 말일까지만 가능하며 이후 등록은 방문접수만 가능<br/>
		  ※홈페이지 가입 필수/ 수강 마감 시 온라인 등록 불가
		  </p>
		  
		  <h3 style="font-weight: bold;">
		        	<img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
		        	환불안내
		    	</h3>
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">개강 전까지:</p>
		        <p style="margin: 0 0 0 5px;">100% 환불</p>
		    </div>
		    
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">매달 10일까지:</p>
		        <p style="margin: 0 0 0 5px;">50% 환불</p>
		    </div>
		    
		      <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">매달 11일 이후:</p>
		        <p style="margin: 0 0 0 5px;">취소 및 환불 불가</p>
		    </div>
		    
</section>
<!-- =======================
Page content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Template Functions -->
<script src="assets/js/functions.js"></script>	


</body>
</html>