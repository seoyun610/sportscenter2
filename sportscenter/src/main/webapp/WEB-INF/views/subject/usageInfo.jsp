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
<header class="navbar-light navbar-sticky">
<!-- Logo Nav START -->
	<nav class="navbar navbar-expand-xl">
		<div class="container">
			<!-- Logo START -->
			<a class="navbar-brand" href="">
				<img class="light-mode-item navbar-brand-item" src="/resources/images/logo.svg" alt="logo">
			</a>
			
			<!-- Responsive navbar toggler -->
			<!--  -->
				<span class="navbar-toggler-animation">
					<span></span>
					<span></span>
					<span></span>
				</span>
			
			<!-- Main navbar START -->
			<div class="navbar-collapse w-100 collapse" id="navbarCollapse">

            <!-- Nav Main menu START -->
				<ul class="navbar-nav navbar-nav-scroll mx-auto">
					<!-- 종목 안내 -->
					<li>
						<a class="nav-link"  href="/subject/index.do">종목 안내</a>
					</li>
				
					<!--이용 안내 -->
					<li>
						<a class="nav-link" href="/subject/registInfo.do">이용안내</a>
					</li>

					<!-- Nav item 3 Account -->
					<li>
						<a class="nav-link" href="/subject/usageInfo.do">수강 신청 안내</a>
					</li>
					</ul>	
				</div>
				<!-- Nav Search START -->
				<div class="nav my-3 my-xl-0 px-4 flex-nowrap align-items-center">
					<div class="nav-item w-100">
						<form class="position-relative">
							<input class="form-control pe-5 bg-transparent" type="search" placeholder="Search" aria-label="Search">
							<button class="bg-transparent p-2 position-absolute top-50 end-0 translate-middle-y border-0 text-primary-hover text-reset" type="submit">
								<i class="fas fa-search fs-6 "></i>
							</button>
						</form>
					</div>
				</div>
				<!-- Nav Search END -->
				
				<!-- Profile START -->
			<div class="dropdown ms-1 ms-lg-0">
				<a class="avatar avatar-sm p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
					<img class="avatar-img rounded-circle" src="/resources/images/avatar/01.jpg" alt="avatar">
				</a>
				<ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3" aria-labelledby="profileDropdown">
					<!-- Profile info -->
					<li class="px-3 mb-3">
						<div class="d-flex align-items-center">
							<!-- Avatar -->
							<div class="avatar me-3">
								<img class="avatar-img rounded-circle shadow" src="/resources/images/avatar/01.jpg" alt="avatar">
							</div>
							<div>
								<a class="h6" href="#">Shinhan</a>
								<p class="small m-0">example@gmail.com</p>
							</div>
						</div>
					</li>
          <li> <hr class="dropdown-divider"></li>
					<!-- Links -->
					<li><a class="dropdown-item" href="#"><i class="bi bi-person fa-fw me-2"></i>Edit Profile</a></li>
					<li><a class="dropdown-item" href="#"><i class="bi bi-gear fa-fw me-2"></i>Account Settings</a></li>
					<li><a class="dropdown-item" href="#"><i class="bi bi-info-circle fa-fw me-2"></i>Help</a></li>
					<li><a class="dropdown-item bg-danger-soft-hover" href="#"><i class="bi bi-power fa-fw me-2"></i>Sign Out</a></li>
					<li> <hr class="dropdown-divider"></li>
				</ul>
			</div>
		</div>
	</nav>
</header>
<!-- **************** MAIN CONTENT START **************** -->
<main>
	
<!-- =======================
Main Content START -->
<section class="pb-0 pt-4 pb-md-5">
	<div class="container">
		<div class="row">
			<div class="col-12">
<!-- Content -->
					<div >
						<!-- Title -->
						<h2 class="mt-2 mb-0 display-5" style="font-weight: bold;">수강 신청 안내</h2>
						<!-- 등록기간 -->
						<h3 class="mt-2" style="line-height:50px; font-weight: bold;font"> 등록 기간 </h3>
						<li style="font-size: 18px;">기존회원(당월회원): 매월 20일(00:10)~26일(23:50)까지(매일 23:50~00:10까지는 온라인시스템 정산으로 등록불가)
							<p style="line-height:10px; font-size: 18px;">※ 단, 수영 신규기초반(수영을 처음 배우시는 분) 및 신설강습반의 경우는 매월 20일부터 말일까지 가능</p>
						</li>
						<li style="font-size: 18px;">온라인등록: 재등록은 매월 20일 00:10부터 26일 23:50까지 / 신규등록은 매월 27일 00:10부터 말일 23:50까지
							<p style="line-height:10px; font-size: 18px;">※ 단, 매일 23:50~00:10까지는 온라인시스템 정산으로 일시 등록불가</p>
						</li>
						<li style="font-size: 18px;">현장등록: 회원안내실 운영시간에 접수가능하며 평일 06:00~21:30
					</div>
					
					<div >
						<!-- 온라인 수강신청 -->
						<h3 class="mt-2" style="line-height:50px; font-weight: bold;font"> 온라인 수강신청 </h3>
							<li style="font-size: 18px;">기존회원(당월회원): 매월 20일(00:10)~26일(23:50)까지(매일 23:50~00:10까지는 온라인시스템 정산으로 등록불가)</li>
							<li style="font-size: 18px;">신규회원 및 결원보충: 매월 27일(00:10)~말일(23:50)까지(매일 23:50~00:10까지는 온라인시스템 정산으로 등록불가) <p>※ 신설강습반은 20일(00:10)부터 선착순 접수</p></li>
							<li style="font-size: 18px;">등록기간 강좌별 등록가능인원(잔여인원)은 매달 20일부터 익월 5일까지 올림픽수영장 홈페이지 [실시간등록현황]을 통해 확인가능 <p>※ 단, 온라인 수강신청은 말일까지만 가능하며 이후 등록은 방문접수만 가능</p></li>
							<li style="font-size: 18px;">사물함은 재등록만 가능(사물함 배정은 회원안내실로 문의)</li>
							<li style="font-size: 18px;">홈페이지 가입 필수<p>※ 수강 마감 시 온라인 등록 불가</p></li>
					</div>
					<h2 class="mt-2 mb-0 display-5" style="font-weight: bold;">수강신청은 본인 명의로만 가능합니다. </h2>
				</div>
				<!-- Title and Info END -->	


</body>
</html>