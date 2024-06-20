<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 한글 깨지는 거 방지(아래) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Eduport- LMS, Education and Course Theme">
	<title>메인페이지</title>
	<!-- Favicon -->
	<link rel="shortcut icon" href="resources/images/favicon.ico">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap">
	
	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="resources/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="resources/vendor/tiny-slider/tiny-slider.css">
	<link rel="stylesheet" type="text/css" href="resources/vendor/glightbox/css/glightbox.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="resources/css/style.css">
	
	<!-- Dark mode -->
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

	
</head>

<body>

<!-- Header START -->
<header class="navbar-light navbar-sticky header-static text-center">
	<!-- Nav START -->
	<nav class="navbar navbar-expand-xl">
		<div class="container-fluid px-3 px-xl-5">
			<!-- Logo START -->
			<a class="navbar-brand" href="#">
				<img class="light-mode-item navbar-brand-item" src="resources/images/logo.png" alt="logo">
				<img class="dark-mode-item navbar-brand-item" src="resources/images/logo-light.svg" alt="logo">
			</a>
			<!-- Logo END -->

			<!-- Responsive navbar toggler -->
			<button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-animation">
					<span></span>
					<span></span>
					<span></span>
				</span>
			</button>
			
			<!-- Main navbar START -->
			<div class="navbar-collapse w-100 collapse" style="float: none; margin:0 auto;">

					
				<!-- Nav Main menu START -->
				<ul class="navbar-nav navbar-nav-scroll me-auto">
					<!-- Nav item 2 종목/안내 -->
						<li class="nav-item dropdown">
							<a class="nav-link" href="" style="font-size: 18px; font-weight: bold; color: #000;">센터소개</a>
							<ul class="dropdown-menu" aria-labelledby="demoMenu">
								<li> <a class="dropdown-item active" href="#">About Us</a></li>
								<li> <a class="dropdown-item" href="#">Contact Us</a></li>
						</ul>
						</li>

					<!-- Nav item 2 종목/안내 -->
					<li class="nav-item dropdown">
						<a class="nav-link" href="" style="font-size: 18px; font-weight: bold; color: #000;" >종목/안내</a>
						<ul class="dropdown-menu" aria-labelledby="demoMenu">
							<li> <a class="dropdown-item active" href="/subject/index.do">종목 안내</a></li>
							<li> <a class="dropdown-item" href="/subject/registInfo.do">이용 안내</a></li>
							<li> <a class="dropdown-item" href="/subject/usageInfo.do">수강 신청</a></li>
							
						</ul>
					</li>

					<!-- Nav item 3 수강 신청 -->
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="pagesMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 18px; font-weight: bold; color: #000;">수강신청</a>
						<ul class="dropdown-menu" aria-labelledby="pagesMenu">
							<!-- Dropdown submenu -->
							<li class="dropdown-submenu dropend">
								<a class="dropdown-item active" href="/class/list.do">온라인 수강신청</a>
							</li>
						</ul>
					</li>

					<!-- Nav item 4 커뮤니티 -->
					<li class="nav-item dropdown">
						<a class="nav-link" href="#" id="accounntMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 18px; font-weight: bold; color: #000;">커뮤니티</a>
						<ul class="dropdown-menu" aria-labelledby="accounntMenu">
							<!-- Dropdown submenu -->
							<li class="dropdown-submenu dropend">
								<a class="dropdown-item active" href="/notice/index.do">공지사항</a>
								<a class="dropdown-item" href="/qna/index.do">QnA</a>
							</li>
						</ul>
					</li>
				</ul>
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
			</div>
			<!-- Main navbar END -->

			<!-- Profile START -->
			<!-- 동작 이슈...  -->
			<div class="dropdown ms-1 ms-lg-0">
				<a class="avatar avatar-sm p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
					<img class="avatar-img rounded-circle" src="resources/images/avatar/01.jpg" alt="avatar">
				</a>
				<ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3" aria-labelledby="profileDropdown">
					<!-- Profile info -->
					<li class="px-3 mb-3">
						<div class="d-flex align-items-center">
							<!-- Avatar -->
							<div class="avatar me-3">
								<img class="avatar-img rounded-circle shadow" src="resources/images/avatar/01.jpg" alt="avatar">
							</div>
							<div>
								<a class="h6" href="#">Lori Ferguson</a>
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
			<!-- Profile START -->
		</div>
	</nav>
	<!-- Nav END -->
</header>
<!-- Header END -->

<!-- **************** MAIN CONTENT START **************** -->
<main>
	
<!-- =======================
Main Banner START -->
<section class="position-relative overflow-hidden pt-5 pt-lg-3">
	<!-- SVG START -->
	<figure class="position-absolute top-50 start-0 translate-middle-y ms-n7 d-none d-xxl-block">
		<svg class="rotate-74 fill-danger opacity-1">
			<circle cx="180.4" cy="15.5" r="7.7" />
			<path d="m159.9 22.4c-3.8 0-6.9-3.1-6.9-6.9s3.1-6.9 6.9-6.9 6.9 3.1 6.9 6.9-3.1 6.9-6.9 6.9z" />
			<ellipse transform="matrix(.3862 -.9224 .9224 .3862 71.25 138.08)" cx="139.4" cy="15.5" rx="6.1" ry="6.1" />
			<circle cx="118.9" cy="15.5" r="5.4" />
			<path d="m98.4 20.1c-2.5 0-4.6-2.1-4.6-4.6s2.1-4.6 4.6-4.6 4.6 2.1 4.6 4.6-2.1 4.6-4.6 4.6z" />
			<path d="m77.9 19.3c-2.1 0-3.8-1.7-3.8-3.8s1.7-3.8 3.8-3.8 3.8 1.7 3.8 3.8-1.7 3.8-3.8 3.8z" />
			<path d="m57.3 18.6c-1.7 0-3.1-1.4-3.1-3.1s1.4-3.1 3.1-3.1 3.1 1.4 3.1 3.1-1.4 3.1-3.1 3.1z" />
			<path d="m36.8 17.8c-1.3 0-2.3-1-2.3-2.3s1-2.3 2.3-2.3 2.3 1 2.3 2.3-1 2.3-2.3 2.3z" />
			<circle cx="16.3" cy="15.5" r="1.6" />
			<circle cx="180.4" cy="38.5" r="7.7" />
			<path d="m159.9 45.3c-3.8 0-6.9-3.1-6.9-6.9s3.1-6.9 6.9-6.9 6.9 3.1 6.9 6.9-3.1 6.9-6.9 6.9z" />
			<ellipse transform="matrix(.8486 -.5291 .5291 .8486 .7599 79.566)" cx="139.4" cy="38.5" rx="6.1" ry="6.1" />
			<circle cx="118.9" cy="38.5" r="5.4" />
			<path d="m98.4 43.1c-2.5 0-4.6-2.1-4.6-4.6s2.1-4.6 4.6-4.6 4.6 2.1 4.6 4.6-2.1 4.6-4.6 4.6z" />
			<circle cx="77.9" cy="38.5" r="3.8" />
			<path d="m57.3 41.5c-1.7 0-3.1-1.4-3.1-3.1s1.4-3.1 3.1-3.1 3.1 1.4 3.1 3.1c0 1.8-1.4 3.1-3.1 3.1z" />
			<path d="m36.8 40.8c-1.3 0-2.3-1-2.3-2.3s1-2.3 2.3-2.3 2.3 1 2.3 2.3-1 2.3-2.3 2.3z" />
			<circle cx="16.3" cy="38.5" r="1.6" />
			<circle cx="180.4" cy="61.4" r="7.7" />
			<path d="m159.9 68.3c-3.8 0-6.9-3.1-6.9-6.9s3.1-6.9 6.9-6.9 6.9 3.1 6.9 6.9-3.1 6.9-6.9 6.9z" />
			<ellipse transform="matrix(.3862 -.9224 .9224 .3862 28.902 166.26)" cx="139.4" cy="61.4" rx="6.1" ry="6.1" />
			<circle cx="118.9" cy="61.4" r="5.4" />
			<path d="m98.4 66c-2.5 0-4.6-2.1-4.6-4.6s2.1-4.6 4.6-4.6 4.6 2.1 4.6 4.6c0 2.6-2.1 4.6-4.6 4.6z" />
			<path d="m77.9 65.2c-2.1 0-3.8-1.7-3.8-3.8s1.7-3.8 3.8-3.8 3.8 1.7 3.8 3.8-1.7 3.8-3.8 3.8z" />
			<path d="m57.3 64.5c-1.7 0-3.1-1.4-3.1-3.1s1.4-3.1 3.1-3.1 3.1 1.4 3.1 3.1-1.4 3.1-3.1 3.1z" />
			<path d="m36.8 63.7c-1.3 0-2.3-1-2.3-2.3s1-2.3 2.3-2.3 2.3 1 2.3 2.3-1 2.3-2.3 2.3z" />
			<circle cx="16.3" cy="61.4" r="1.6" />
			<circle cx="180.4" cy="84.4" r="7.7" />
			<path d="m159.9 91.3c-3.8 0-6.9-3.1-6.9-6.9s3.1-6.9 6.9-6.9 6.9 3.1 6.9 6.9-3.1 6.9-6.9 6.9z" />
			<path	d="m139.4 90.5c-3.4 0-6.1-2.7-6.1-6.1s2.7-6.1 6.1-6.1 6.1 2.7 6.1 6.1c0 3.3-2.7 6.1-6.1 6.1z" />
			<circle cx="118.9" cy="84.4" r="5.4" />
			<path d="m98.4 89c-2.5 0-4.6-2.1-4.6-4.6s2.1-4.6 4.6-4.6 4.6 2.1 4.6 4.6-2.1 4.6-4.6 4.6z" />
			<path d="m77.9 88.2c-2.1 0-3.8-1.7-3.8-3.8s1.7-3.8 3.8-3.8 3.8 1.7 3.8 3.8-1.7 3.8-3.8 3.8z" />
			<path d="m57.3 87.4c-1.7 0-3.1-1.4-3.1-3.1s1.4-3.1 3.1-3.1 3.1 1.4 3.1 3.1c0 1.8-1.4 3.1-3.1 3.1z" />
			<path d="m36.8 86.7c-1.3 0-2.3-1-2.3-2.3s1-2.3 2.3-2.3 2.3 1 2.3 2.3-1 2.3-2.3 2.3z" />
			<circle cx="16.3" cy="84.4" r="1.6" />
			<circle cx="180.4" cy="107.3" r="7.7" />
			<path d="m159.9 114.2c-3.8 0-6.9-3.1-6.9-6.9s3.1-6.9 6.9-6.9 6.9 3.1 6.9 6.9-3.1 6.9-6.9 6.9z" />
			<path d="m139.4 113.4c-3.4 0-6.1-2.7-6.1-6.1s2.7-6.1 6.1-6.1 6.1 2.7 6.1 6.1-2.7 6.1-6.1 6.1z" />
			<circle cx="118.9" cy="107.3" r="5.4" />
			<path d="m98.4 111.9c-2.5 0-4.6-2.1-4.6-4.6s2.1-4.6 4.6-4.6 4.6 2.1 4.6 4.6c0 2.6-2.1 4.6-4.6 4.6z" />
			<path d="m77.9 111.2c-2.1 0-3.8-1.7-3.8-3.8s1.7-3.8 3.8-3.8 3.8 1.7 3.8 3.8-1.7 3.8-3.8 3.8z" />
			<path d="m57.3 110.4c-1.7 0-3.1-1.4-3.1-3.1s1.4-3.1 3.1-3.1 3.1 1.4 3.1 3.1-1.4 3.1-3.1 3.1z" />
			<path d="m36.8 109.6c-1.3 0-2.3-1-2.3-2.3s1-2.3 2.3-2.3 2.3 1 2.3 2.3c0.1 1.3-1 2.3-2.3 2.3z" />
			<circle cx="16.3" cy="107.3" r="1.6" />
			<circle cx="180.4" cy="130.3" r="7.7" />
			<path d="m159.9 137.2c-3.8 0-6.9-3.1-6.9-6.9s3.1-6.9 6.9-6.9 6.9 3.1 6.9 6.9-3.1 6.9-6.9 6.9z" />
			<ellipse transform="matrix(.3862 -.9224 .9224 .3862 -34.62 208.52)" cx="139.4" cy="130.3" rx="6.1" ry="6.1" />
			<circle cx="118.9" cy="130.3" r="5.4" />
			<path d="m98.4 134.9c-2.5 0-4.6-2.1-4.6-4.6s2.1-4.6 4.6-4.6 4.6 2.1 4.6 4.6-2.1 4.6-4.6 4.6z" />
			<path d="m77.9 134.1c-2.1 0-3.8-1.7-3.8-3.8s1.7-3.8 3.8-3.8 3.8 1.7 3.8 3.8-1.7 3.8-3.8 3.8z" />
			<path d="m57.3 133.4c-1.7 0-3.1-1.4-3.1-3.1s1.4-3.1 3.1-3.1 3.1 1.4 3.1 3.1-1.4 3.1-3.1 3.1z" />
			<path d="m36.8 132.6c-1.3 0-2.3-1-2.3-2.3s1-2.3 2.3-2.3 2.3 1 2.3 2.3-1 2.3-2.3 2.3z" />
			<circle cx="16.3" cy="130.3" r="1.6" />
			<circle cx="180.4" cy="153.2" r="7.7" />
			<path d="m159.9 160.1c-3.8 0-6.9-3.1-6.9-6.9s3.1-6.9 6.9-6.9 6.9 3.1 6.9 6.9-3.1 6.9-6.9 6.9z" />
			<ellipse transform="matrix(.3862 -.9224 .9224 .3862 -55.794 222.61)" cx="139.4" cy="153.2" rx="6.1" ry="6.1" />
			<circle cx="118.9" cy="153.2" r="5.4" />
			<path d="m98.4 157.8c-2.5 0-4.6-2.1-4.6-4.6s2.1-4.6 4.6-4.6 4.6 2.1 4.6 4.6c0 2.6-2.1 4.6-4.6 4.6z" />
			<circle cx="77.9" cy="153.2" r="3.8" />
			<path d="m57.3 156.3c-1.7 0-3.1-1.4-3.1-3.1s1.4-3.1 3.1-3.1 3.1 1.4 3.1 3.1-1.4 3.1-3.1 3.1z" />
			<path d="m36.8 155.5c-1.3 0-2.3-1-2.3-2.3s1-2.3 2.3-2.3 2.3 1 2.3 2.3-1 2.3-2.3 2.3z" />
			<circle cx="16.3" cy="153.2" r="1.6" />
			<circle cx="180.4" cy="176.2" r="7.7" />
			<path d="m159.9 183.1c-3.8 0-6.9-3.1-6.9-6.9s3.1-6.9 6.9-6.9 6.9 3.1 6.9 6.9-3.1 6.9-6.9 6.9z" />
			<ellipse transform="matrix(.3862 -.9224 .9224 .3862 -76.968 236.7)" cx="139.4" cy="176.2" rx="6.1" ry="6.1" />
			<circle cx="118.9" cy="176.2" r="5.4" />
			<path d="m98.4 180.8c-2.5 0-4.6-2.1-4.6-4.6s2.1-4.6 4.6-4.6 4.6 2.1 4.6 4.6-2.1 4.6-4.6 4.6z" />
			<path d="m77.9 180c-2.1 0-3.8-1.7-3.8-3.8s1.7-3.8 3.8-3.8 3.8 1.7 3.8 3.8-1.7 3.8-3.8 3.8z" />
			<path d="m57.3 179.3c-1.7 0-3.1-1.4-3.1-3.1s1.4-3.1 3.1-3.1 3.1 1.4 3.1 3.1-1.4 3.1-3.1 3.1z" />
			<path d="m36.8 178.5c-1.3 0-2.3-1-2.3-2.3s1-2.3 2.3-2.3 2.3 1 2.3 2.3-1 2.3-2.3 2.3z" />
			<circle cx="16.3" cy="176.2" r="1.6" />
		</svg>
	</figure>
	<!-- SVG END -->

	<!-- SVG START -->
	<span class="position-absolute top-50 end-0 translate-middle-y mt-5 me-n5 d-none d-xxl-inline-flex">
		<svg class="fill-warning rotate-186 opacity-8">
			<path d="m35.4 54.2c0 0.6 0 1.1-0.1 1.7-0.9 9.3-9.2 16.1-18.5 15.1-4.5-0.4-8.5-2.6-11.4-6.1-2.8-3.5-4.2-7.9-3.7-12.4 0.9-9.3 9.2-16.1 18.5-15.1 4.5 0.4 8.5 2.6 11.4 6.1 2.4 3 3.8 6.8 3.8 10.7zm-33.4 0c0 3.8 1.3 7.5 3.8 10.4 2.8 3.4 6.8 5.5 11.2 6 9.1 0.9 17.2-5.8 18.1-14.8 0.4-4.4-0.9-8.7-3.7-12.1s-6.8-5.5-11.2-6c-9.2-0.8-17.3 5.8-18.2 14.9v1.6z" />
			<path d="m39 54.1c0 1.1-0.1 2.2-0.3 3.3-1.8 9.8-11.2 16.2-21 14.4-4.7-0.8-8.8-3.5-11.5-7.4-2.7-4-3.7-8.7-2.8-13.5 1.8-9.8 11.2-16.2 21-14.4 4.7 0.9 8.8 3.6 11.5 7.5 2.1 3 3.1 6.6 3.1 10.1zm-35.6 0.1c0 3.5 1.1 7 3.1 9.9 2.7 3.9 6.7 6.5 11.3 7.4 9.6 1.8 18.8-4.5 20.6-14.1 0.9-4.6-0.1-9.3-2.8-13.2s-6.7-6.5-11.3-7.4c-9.6-1.8-18.8 4.5-20.6 14.1-0.2 1.1-0.3 2.2-0.3 3.3z" />
			<path d="m42.8 54.2c0 1.7-0.2 3.3-0.7 5-2.7 10.2-13.3 16.3-23.5 13.6-5-1.3-9.1-4.5-11.7-8.9-2.5-4.5-3.2-9.7-1.9-14.7 2.7-10.2 13.3-16.3 23.5-13.6 5 1.3 9.1 4.5 11.7 8.9 1.7 3 2.6 6.3 2.6 9.7zm-38.1 0c0 3.3 0.9 6.5 2.5 9.4 2.5 4.4 6.6 7.5 11.5 8.8 10 2.7 20.4-3.3 23.1-13.4 1.3-4.9 0.6-9.9-1.9-14.3s-6.6-7.5-11.5-8.8c-10-2.6-20.4 3.4-23 13.4-0.5 1.6-0.7 3.3-0.7 4.9z" />
			<path d="m46.7 54.2c0 2.2-0.4 4.5-1.1 6.6-3.6 10.7-15.3 16.5-26.1 12.8-5.2-1.8-9.4-5.4-11.8-10.4-2.4-4.9-2.8-10.5-1-15.7 3.6-10.6 15.3-16.4 26-12.8l-0.1 0.2 0.1-0.2c5.2 1.8 9.4 5.4 11.8 10.4 1.5 2.9 2.2 6 2.2 9.1zm-40.8 0c0 3.1 0.7 6.1 2.1 8.9 2.4 4.8 6.5 8.4 11.6 10.2 10.5 3.6 22-2.1 25.6-12.6 1.7-5.1 1.4-10.6-1-15.4s-6.5-8.4-11.6-10.2c-10.5-3.6-22 2.1-25.6 12.6-0.7 2.1-1.1 4.3-1.1 6.5z" />
			<path d="m50.7 54.2c0 2.8-0.5 5.6-1.6 8.2-4.5 11.2-17.4 16.6-28.6 12.1-5.4-2.2-9.7-6.4-12-11.8s-2.3-11.4-0.1-16.8c4.5-11.2 17.4-16.6 28.6-12.1 5.4 2.2 9.7 6.4 12 11.8 1.1 2.8 1.7 5.7 1.7 8.6zm-43.6 0c0 2.8 0.6 5.7 1.7 8.4 2.2 5.3 6.4 9.4 11.8 11.6 11 4.5 23.6-0.9 28.1-11.9 2.2-5.3 2.1-11.2-0.1-16.5s-6.4-9.4-11.8-11.6c-11-4.5-23.6 0.9-28.1 11.9-1.1 2.6-1.6 5.3-1.6 8.1z" />
			<path d="m54.7 54.2c0 3.4-0.7 6.7-2.2 9.9-5.5 11.7-19.5 16.7-31.2 11.3-5.7-2.6-10-7.3-12.1-13.2s-1.8-12.2 0.8-17.9c5.5-11.7 19.4-16.8 31.1-11.3 5.7 2.6 10 7.3 12.1 13.2 1 2.6 1.5 5.3 1.5 8zm-46.5 0c0 2.7 0.5 5.3 1.4 7.9 2.1 5.8 6.3 10.4 11.9 13 11.5 5.4 25.3 0.4 30.6-11.1 2.6-5.6 2.9-11.8 0.8-17.6s-6.3-10.4-11.9-13l0.1-0.2-0.1 0.1c-11.5-5.4-25.3-0.4-30.6 11.1-1.5 3.1-2.2 6.5-2.2 9.8z" />
			<path d="m58.7 54.2c0 4-1 7.9-2.8 11.5-6.4 12.2-21.5 16.9-33.6 10.6-6-3.1-10.3-8.3-12.3-14.6s-1.4-13.1 1.7-19c6.3-12.2 21.4-17 33.6-10.6 5.9 3.1 10.3 8.3 12.3 14.6 0.8 2.5 1.1 5 1.1 7.5zm-49.5 0c0 2.5 0.4 5 1.1 7.4 2 6.3 6.3 11.4 12.1 14.4 12 6.3 26.9 1.6 33.1-10.4 3-5.8 3.6-12.5 1.7-18.7-2-6.3-6.3-11.4-12.1-14.4-12-6.3-26.9-1.6-33.1 10.4-1.9 3.5-2.8 7.4-2.8 11.3z" />
			<path d="m62.9 54.2c0 4.6-1.2 9.1-3.5 13.1-7.3 12.7-23.6 17.1-36.2 9.9-6.1-3.5-10.5-9.2-12.4-16s-0.9-14 2.6-20.1c7.3-12.7 23.5-17.1 36.2-9.8l-0.1 0.2 0.1-0.2c6.1 3.5 10.5 9.2 12.4 16 0.5 2.3 0.9 4.6 0.9 6.9zm-52.7-0.1c0 2.3 0.3 4.6 0.9 6.9 1.8 6.7 6.2 12.3 12.2 15.8 12.5 7.2 28.5 2.9 35.7-9.6 3.5-6.1 4.4-13.1 2.5-19.8-1.8-6.7-6.2-12.3-12.2-15.8-12.5-7.2-28.5-2.8-35.7 9.7-2.2 3.9-3.4 8.3-3.4 12.8z" />
			<path d="m67 54.2c0 5.2-1.4 10.3-4.2 14.8-8.2 13.2-25.5 17.2-38.7 9-6.4-4-10.8-10.2-12.5-17.5s-0.5-14.8 3.5-21.2c8.2-13.2 25.5-17.2 38.7-9 6.4 4 10.8 10.2 12.5 17.5 0.5 2.1 0.7 4.3 0.7 6.4zm-55.9-0.1c0 2.1 0.2 4.3 0.7 6.4 1.7 7.2 6.1 13.3 12.4 17.2 13 8.1 30.1 4.1 38.2-8.9 3.9-6.3 5.1-13.7 3.4-20.9s-6.1-13.3-12.4-17.2c-13-8.1-30.1-4.1-38.2 8.9-2.6 4.4-4.1 9.4-4.1 14.5z" />
			<path d="m71.2 54.2c0 5.8-1.7 11.5-5 16.4-9.1 13.7-27.6 17.4-41.2 8.3-6.6-4.4-11.1-11.1-12.7-18.9s0-15.7 4.4-22.3c9.1-13.6 27.6-17.4 41.2-8.3 6.6 4.4 11.1 11.1 12.7 18.9 0.4 2 0.6 4 0.6 5.9zm-59.1-0.1c0 1.9 0.2 3.9 0.6 5.9 1.5 7.7 6 14.3 12.5 18.6 13.5 9 31.7 5.3 40.7-8.2 4.3-6.5 5.9-14.4 4.3-22-1.5-7.7-6-14.3-12.5-18.6-13.5-9-31.7-5.3-40.7 8.2-3.3 4.8-4.9 10.4-4.9 16.1z" />
			<path d="m75.4 54.3c0 6.4-2 12.7-5.8 18-10 14.1-29.6 17.5-43.7 7.5-6.9-4.8-11.4-12-12.8-20.3s0.5-16.6 5.3-23.4c9.9-14.1 29.6-17.5 43.7-7.5 6.8 4.8 11.4 12 12.8 20.3 0.3 1.8 0.5 3.6 0.5 5.4zm-62.4-0.2c0 1.8 0.2 3.6 0.5 5.3 1.4 8.2 5.9 15.3 12.7 20.1 14 9.9 33.4 6.5 43.2-7.4 4.8-6.8 6.6-15 5.2-23.1-1.4-8.2-5.9-15.3-12.7-20.1-14-9.9-33.4-6.5-43.2 7.4-3.8 5.3-5.7 11.5-5.7 17.8z" />
			<path d="m79.6 54.3c0 7.1-2.3 13.9-6.5 19.7-10.9 14.6-31.6 17.7-46.3 6.8-7.1-5.3-11.7-13-13-21.7s0.9-17.4 6.2-24.5c10.9-14.6 31.6-17.7 46.3-6.8 7.1 5.3 11.7 13 13 21.7 0.2 1.5 0.3 3.1 0.3 4.8zm-65.8-0.2c0 1.6 0.1 3.2 0.4 4.8 1.3 8.7 5.8 16.3 12.8 21.5 14.5 10.8 35 7.7 45.7-6.7 5.2-7 7.4-15.6 6.1-24.2s-5.8-16.3-12.8-21.5l0.1-0.1v0.1c-14.5-10.8-35-7.7-45.7 6.7-4.3 5.7-6.6 12.4-6.6 19.4z" />
			<path d="m83.9 54.3c0 7.7-2.5 15.1-7.4 21.3-11.8 15.1-33.7 17.8-48.8 6-7.3-5.7-12-13.9-13.1-23.1s1.4-18.3 7.1-25.6c11.8-15.1 33.7-17.8 48.8-6 7.3 5.7 12 13.9 13.1 23.1 0.2 1.4 0.3 2.8 0.3 4.3zm-69.2-0.2c0 1.4 0.1 2.9 0.3 4.3 1.1 9.1 5.7 17.2 13 22.9 15 11.7 36.6 9 48.3-6 5.7-7.2 8.1-16.2 7-25.4-1.1-9.1-5.7-17.2-13-22.9-15-11.7-36.6-9-48.3 6-4.8 6.1-7.3 13.5-7.3 21.1z" />
			<path d="m88.1 54.3c0 8.3-2.8 16.4-8.2 22.9-12.7 15.6-35.7 18-51.3 5.3-7.6-6.1-12.3-14.9-13.3-24.5-1-9.7 1.8-19.2 8-26.7 12.7-15.6 35.7-18 51.3-5.3 7.6 6.1 12.3 14.9 13.3 24.5 0.2 1.2 0.2 2.5 0.2 3.8zm-72.6-0.2c0 1.2 0.1 2.5 0.2 3.8 1 9.6 5.6 18.2 13.1 24.3 15.5 12.5 38.3 10.2 50.9-5.2 6.1-7.5 8.9-16.9 7.9-26.5s-5.6-18.2-13.1-24.3c-15.5-12.6-38.3-10.2-50.9 5.2-5.2 6.5-8.1 14.5-8.1 22.7z" />
			<path d="m92.4 54.2c0 9-3.1 17.6-9 24.6-13.6 16.1-37.7 18.1-53.8 4.5-7.8-6.6-12.6-15.8-13.4-26-0.9-10.2 2.3-20 8.9-27.8 13.5-16 37.7-18.1 53.8-4.5 7.8 6.6 12.6 15.8 13.4 26 0.1 1.1 0.1 2.2 0.1 3.2zm-76-0.1c0 1.1 0 2.1 0.1 3.2 0.8 10.1 5.6 19.2 13.3 25.7 15.9 13.5 39.8 11.4 53.3-4.5 6.5-7.7 9.7-17.5 8.8-27.6-0.8-9.9-5.6-19.1-13.3-25.6-15.9-13.5-39.8-11.4-53.3 4.5-5.8 6.9-8.9 15.4-8.9 24.3z" />
			<path d="m96.7 54.2c0 9.7-3.5 18.9-9.9 26.2-14.5 16.6-39.8 18.3-56.3 3.8-8-7-12.8-16.7-13.6-27.4-0.7-10.6 2.8-20.9 9.8-28.9 14.5-16.6 39.8-18.2 56.3-3.8l-0.1 0.1 0.1-0.1c8 7 12.8 16.7 13.6 27.4 0.1 0.9 0.1 1.8 0.1 2.7zm-79.5-0.1c0 0.9 0 1.8 0.1 2.7 0.7 10.6 5.4 20.2 13.4 27.1 16.4 14.4 41.5 12.7 55.8-3.7 7-7.9 10.4-18.1 9.7-28.7-0.7-10.5-5.4-20.1-13.4-27.1-16.4-14.3-41.5-12.7-55.8 3.8-6.4 7.2-9.8 16.4-9.8 25.9z" />
			<path d="m101 54.2c0 10.3-3.8 20.1-10.7 27.9-15.4 17.1-41.8 18.4-58.9 3-8.3-7.5-13.1-17.7-13.7-28.8s3.2-21.8 10.7-30c15.4-17.1 41.8-18.4 58.9-3 8.3 7.5 13.1 17.7 13.7 28.8v2.1zm-83-0.1c0 0.7 0 1.4 0.1 2.2 0.6 11 5.4 21.1 13.6 28.5 16.9 15.3 43.1 13.9 58.4-3 7.4-8.2 11.2-18.8 10.6-29.8s-5.4-21.1-13.6-28.5c-16.9-15.3-43.1-13.9-58.4 3-7 7.7-10.7 17.4-10.7 27.6z" />
			<path d="m105.3 54.2c0 11-4.1 21.4-11.6 29.5-16.3 17.5-43.9 18.6-61.4 2.3-8.5-7.9-13.4-18.6-13.8-30.2-0.5-11.6 3.6-22.7 11.5-31.2 16.3-17.5 43.9-18.5 61.4-2.2 8.5 7.9 13.4 18.6 13.8 30.2 0.1 0.5 0.1 1.1 0.1 1.6zm-86.5-0.1v1.6c0.4 11.5 5.3 22.1 13.7 30 17.4 16.2 44.7 15.2 60.9-2.2 7.8-8.4 11.9-19.4 11.5-30.9s-5.3-22.1-13.7-30l0.1-0.1-0.1 0.1c-17.4-16.1-44.7-15.1-60.9 2.3-7.5 8-11.5 18.3-11.5 29.2z" />
			<path d="m109.6 54.2c0 11.7-4.4 22.7-12.5 31.2-17.2 18-45.9 18.7-63.9 1.5-8.7-8.3-13.7-19.6-14-31.6-0.3-12.1 4.2-23.6 12.5-32.3 17.2-18 45.9-18.7 63.9-1.5 8.7 8.3 13.7 19.6 14 31.6v1.1zm-90 0v1.1c0.3 12 5.2 23.1 13.9 31.4 17.9 17.1 46.3 16.4 63.4-1.5 8.3-8.7 12.7-20 12.4-32s-5.3-23.2-13.9-31.4c-17.9-17.1-46.4-16.4-63.4 1.5-8.1 8.4-12.4 19.3-12.4 30.9z" />
			<path d="m113.9 54.2c0 12.3-4.7 24-13.4 32.8-18.1 18.5-47.9 18.9-66.4 0.8-9-8.8-14-20.5-14.1-33-0.2-12.5 4.6-24.4 13.4-33.4 18.1-18.6 47.9-18.9 66.4-0.8l-0.1 0.1 0.1-0.1c9 8.8 14 20.5 14.1 33v0.6zm-93.6 0v0.5c0.1 12.4 5.1 24.1 14 32.8 18.4 18 48 17.6 65.9-0.7 8.7-8.9 13.4-20.7 13.3-33.1s-5.1-24.1-14-32.8c-18.4-18-48-17.6-65.9 0.7-8.6 8.8-13.3 20.3-13.3 32.6z" />
			<path d="m118.3 54.2c0 13-5.1 25.3-14.3 34.5-19 19-50 19-69 0-9.2-9.2-14.3-21.4-14.3-34.5 0-13 5.1-25.3 14.3-34.5 19-19 50-19 69 0l-0.1 0.1 0.1-0.1c9.2 9.2 14.3 21.5 14.3 34.5zm-97.2 0c0 12.9 5 25.1 14.2 34.2 18.9 18.9 49.6 18.9 68.4 0 9.1-9.1 14.2-21.3 14.2-34.2s-5-25.1-14.2-34.2c-18.8-18.9-49.5-18.9-68.4 0-9.2 9.1-14.2 21.3-14.2 34.2z" />
		</svg>
	</span>
	<!-- SVG END -->



	<!-- Content START -->
	<div class="container">
		<!-- Title -->
		<div class="row align-items-center g-5">
			<!-- Left content START -->
			<div class="col-lg-5 col-xl-6 position-relative z-index-1 text-center text-lg-start mb-7 mb-sm-0">
				
				<!-- Title -->
				<h1 class="mb-0 display-6">스포츠 문화 센터</h1>
				
				<!-- Content -->
				<p class="my-4 lead">스포츠 문화 센터에 오신 걸 환영합니다. 최상의 시설과 다양한 프로그램으로 여러분의 건강과 활력을 책임집니다. 지금 가입하고 더 나은 내일을 만들어보세요!</p>

				<div class="d-sm-flex align-items-center justify-content-center justify-content-lg-start">
					<!-- Button -->
					<a href="/subject/view.do" class="btn btn-lg btn-danger-soft me-2 mb-4 mb-sm-0">시작하기</a>
				</div>
			</div>
			<!-- Left content END -->

			<!-- Right content START -->
			<div class="col-lg-7 col-xl-6 text-center position-relative">
				<!-- Image -->
				<div class="position-relative ms-sm-4">
					<img src="resources/images/subject/swim.jpg" alt="" style="width: 100%; height: 400px;">
				</div>
			</div>
			<!-- Right content END -->
		</div>
	</div>
	<!-- Content END -->
</section>
<!-- =======================
Main Banner END -->

<!-- =======================
Popular course START -->
<section>
	<div class="container">
		<!-- Title -->
		<div class="row mb-4">
			<div class="col-lg-8 mx-auto text-center">
				<h2 class="fs-1">추천 강좌</h2>
			</div>
		</div>

		<!-- Tabs content START -->
		<div class="tab-content" id="course-pills-tabContent">
			<!-- Content START -->
			<div class="tab-pane fade show active" id="course-pills-tabs-1" role="tabpanel" aria-labelledby="course-pills-tab-1">
				<div class="row g-4">

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/subject/수영.jpg" class="card-img-top" alt="course image">
							<!-- Card body -->
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-purple bg-opacity-10 text-purple">인기</a>
									<a href="#" class="h6 mb-0"><i class="far fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">수영</a></h5>
								<p class="mb-2 text-truncate-2">수영은 육상 운동과 달리 체중의 대부분을 지지할 필요가 없어 체격 제한 없이 남녀노소 누구나 쉽게 즐길 수 있는 운동입니다.</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="far fa-star text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.0/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>50min</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/subject/헬스.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-purple bg-opacity-10 text-purple">인기</a>
									<a href="#" class="text-danger"><i class="fas fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">헬스</a></h5>
								<p class="mb-2 text-truncate-2">지구력, 근력, 유연성, 체력증대를 기르고 다이어트에 도움이 됩니다.</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star-half-alt text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.5/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between ">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>free</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/subject/필라테스.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-success bg-opacity-10 text-success">추천</a>
									<a href="#" class="h6 fw-light mb-0"><i class="far fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">필라테스</a></h5>
								<p class="mb-2 text-truncate-2">필라테스(Pilates)는 제1차 세계대전 당시 영국 랭커스터 포로수용소에서 인턴으로 근무하던 독일의 스포츠 연구가, 요제프 필라테스가 포로들의 운동부족과 재활치료, 정신수련을 위해 고안한 근육강화 운동입니다.</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star-half-alt text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.5/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>50min</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/subject/점핑트램폴린.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-success bg-opacity-10 text-success">추천</a>
									<a href="#" class="text-danger"><i class="fas fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">점핑트램폴린</a></h5>
								<p class="mb-2 text-truncate-2">점핑트램폴린은 트램폴린 위에서 다양한 점핑 응용동작을 하면서 칼로리 소모 및 코어근육과 하체를 단련하는 운동입니다.</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="far fa-star text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.0/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>50min</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

				
				</div> <!-- Row END -->
			</div>
			<!-- Content END -->

			<!-- Content START -->
			<div class="tab-pane fade" id="course-pills-tabs-2" role="tabpanel" aria-labelledby="course-pills-tab-2">
				<div class="row g-4">
					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/courses/4by3/05.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-success bg-opacity-10 text-success">Beginner</a>
									<a href="#" class="h6 fw-light mb-0"><i class="far fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">The Complete Web Development in python</a></h5>
								<p class="text-truncate-2 mb-2">Mention Mr manners opinion if garrets enabled.</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star-half-alt text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.5/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between mt-2">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>10h 00m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>26 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/courses/4by3/06.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-info bg-opacity-10 text-info">Intermediate</a>
									<a href="#" class="h6 fw-light mb-0"><i class="far fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">Angular – The Complete Guider</a></h5>
								<p class="text-truncate-2 mb-2">Rooms oh fully taken by worse do. Points afraid but may end.</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star-half-alt text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.5/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between mt-2">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>9h 32m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>42 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow">
							<!-- Image -->
							<img src="resources/images/courses/4by3/07.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-success bg-opacity-10 text-success">Beginner</a>
									<a href="#" class="text-danger"><i class="fas fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">Deep Learning with React-Native</a></h5>
								<p class="text-truncate-2 mb-2">Far advanced settling say finished raillery. Offered chiefly farther</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="far fa-star text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.0/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>18h 56m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>99 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/courses/4by3/09.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-purple bg-opacity-10 text-purple">All level</a>
									<a href="#" class="h6 fw-light mb-0"><i class="far fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">JavaScript: Full Understanding</a></h5>
								<p class="text-truncate-2 mb-2">Far advanced settling say finished raillery. Offered chiefly farther</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">5.0/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>35h 20m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>89 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/courses/4by3/10.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-info bg-opacity-10 text-info">Intermediate</a>
									<a href="#" class="text-danger"><i class="fas fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">Bootstrap 5 From Scratch</a></h5>
								<p class="text-truncate-2 mb-2">Far advanced settling say finished raillery. Offered chiefly farther</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star-half-alt text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.5/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between mt-2">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>25h 56m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>38 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/courses/4by3/13.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-success bg-opacity-10 text-success">Beginner</a>
									<a href="#" class="h6 fw-light mb-0"><i class="far fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">PHP with - CMS Project</a></h5>
								<p class="text-truncate-2 mb-2">Far advanced settling say finished raillery. Offered chiefly farther</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="far fa-star text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.0/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>21h 22m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>30 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->
				</div>
			</div>
			<!-- Content END -->

			<!-- Content START -->
			<div class="tab-pane fade" id="course-pills-tabs-3" role="tabpanel" aria-labelledby="course-pills-tab-3">
				<div class="row g-4">
					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/courses/4by3/08.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-purple bg-opacity-10 text-purple">All level</a>
									<a href="#" class="h6 fw-light mb-0"><i class="far fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">Sketch from A to Z: for app designer</a></h5>
								<p class="text-truncate-2 mb-2">Proposal indulged no do sociable he throwing settling</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="far fa-star text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.0/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>12h 56m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>15 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/courses/4by3/04.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-purple bg-opacity-10 text-purple">All level</a>
									<a href="#" class="text-danger"><i class="fas fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">Learn Invision</a></h5>
								<p class="mb-2">Arrived off she elderly beloved him Course regard to up he hardly.</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star-half-alt text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="far fa-star text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">3.5/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between mt-2">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>6h 56m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>82 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/courses/4by3/02.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-success bg-opacity-10 text-success">Beginner</a>
									<a href="#" class="text-danger"><i class="fas fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">Graphic Design Masterclass</a></h5>
								<p class="text-truncate-2 mb-2">Rooms oh fully taken by worse do. Points afraid but may end.</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star-half-alt text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.5/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>9h 56m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>65 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/courses/4by3/03.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-success bg-opacity-10 text-success">Beginner</a>
									<a href="#" class="h6 fw-light mb-0"><i class="far fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">Create a Design System in Figma</a></h5>
								<p class="text-truncate-2 mb-2">Rooms oh fully taken by worse do. Points afraid but may end.</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star-half-alt text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.5/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>5h 56m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>32 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->
				</div>
			</div>
			<!-- Content END -->

			<!-- Content START -->
			<div class="tab-pane fade" id="course-pills-tabs-4" role="tabpanel" aria-labelledby="course-pills-tab-4">
				<div class="row g-4">
					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/courses/4by3/01.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-success bg-opacity-10 text-success">Beginner</a>
									<a href="#" class="text-danger"><i class="fas fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">Digital Marketing Masterclass</a></h5>
								<p class="text-truncate-2 mb-2">Delivered dejection necessary objection do Mr prevailed.</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star-half-alt text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.5/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>6h 56m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>82 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/courses/4by3/08.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-purple bg-opacity-10 text-purple">All level</a>
									<a href="#" class="h6 fw-light mb-0"><i class="far fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">Sketch from A to Z: for app designer</a></h5>
								<p class="text-truncate-2 mb-2">Proposal indulged no do sociable he throwing settling.</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="far fa-star text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">4.0/5.0</li>
								</ul>
							</div>	
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>12h 56m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>15 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->
				</div>
			</div>
			<!-- Content END -->

			<!-- Content START -->
			<div class="tab-pane fade" id="course-pills-tabs-5" role="tabpanel" aria-labelledby="course-pills-tab-5">
				<div class="row g-4">
					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/courses/4by3/04.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-purple bg-opacity-10 text-purple">All level</a>
									<a href="#" class="text-danger"><i class="fas fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">Learn Invision</a></h5>
								<p class="text-truncate-2 mb-2">Arrived off she elderly beloved him Course regard to up he hardly.</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star-half-alt text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="far fa-star text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">3.5/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>6h 56m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>82 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<!-- Image -->
							<img src="resources/images/courses/4by3/09.jpg" class="card-img-top" alt="course image">
							<div class="card-body pb-0">
								<!-- Badge and favorite -->
								<div class="d-flex justify-content-between mb-2">
									<a href="#" class="badge bg-purple bg-opacity-10 text-purple">All level</a>
									<a href="#" class="h6 fw-light mb-0"><i class="far fa-heart"></i></a>
								</div>
								<!-- Title -->
								<h5 class="card-title fw-normal"><a href="#">JavaScript: Full Understanding</a></h5>
								<p class="text-truncate-2 mb-2">Far advanced settling say finished raillery. Offered chiefly farther.</p>
								<!-- Rating star -->
								<ul class="list-inline mb-0">
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
									<li class="list-inline-item ms-2 h6 fw-light mb-0">5.0/5.0</li>
								</ul>
							</div>
							<!-- Card footer -->
							<div class="card-footer pt-0 pb-3">
								<hr>
								<div class="d-flex justify-content-between">
									<span class="h6 fw-light mb-0"><i class="far fa-clock text-danger me-2"></i>35h 20m</span>
									<span class="h6 fw-light mb-0"><i class="fas fa-table text-orange me-2"></i>89 lectures</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->
				</div>
			</div>
			<!-- Content END -->
		</div>
		<!-- Tabs content END -->
	</div>
</section>
<!-- =======================
Popular course END -->

<!-- =======================
Action box START -->
<section class="pt-0 pt-lg-5">
	<div class="container position-relative">
		<!-- SVG decoration START -->
		<figure class="position-absolute top-50 start-50 translate-middle ms-2">
			<svg>
				<path class="fill-white opacity-4" d="m496 22.999c0 10.493-8.506 18.999-18.999 18.999s-19-8.506-19-18.999 8.507-18.999 19-18.999 18.999 8.506 18.999 18.999z"/>
				<path class="fill-white opacity-4" d="m775 102.5c0 5.799-4.701 10.5-10.5 10.5-5.798 0-10.499-4.701-10.499-10.5 0-5.798 4.701-10.499 10.499-10.499 5.799 0 10.5 4.701 10.5 10.499z"/>
				<path class="fill-white opacity-4" d="m192 102c0 6.626-5.373 11.999-12 11.999s-11.999-5.373-11.999-11.999c0-6.628 5.372-12 11.999-12s12 5.372 12 12z"/>
				<path class="fill-white opacity-4" d="m20.499 10.25c0 5.66-4.589 10.249-10.25 10.249-5.66 0-10.249-4.589-10.249-10.249-0-5.661 4.589-10.25 10.249-10.25 5.661-0 10.25 4.589 10.25 10.25z"/>
			</svg>
		</figure>
		<!-- SVG decoration END -->
		
		<div class="row">
			<div class="col-12">
				<div class="bg-info p-4 p-sm-5 rounded-3">
					<div class="row position-relative">
						<!-- Svg decoration -->
						<figure class="fill-white opacity-1 position-absolute top-50 start-0 translate-middle-y">
							<svg width="141px" height="141px">
								<path	d="M140.520,70.258 C140.520,109.064 109.062,140.519 70.258,140.519 C31.454,140.519 -0.004,109.064 -0.004,70.258 C-0.004,31.455 31.454,-0.003 70.258,-0.003 C109.062,-0.003 140.520,31.455 140.520,70.258 Z"/>
							</svg>
						</figure>
						<!-- Action box -->
						<div class="col-11 mx-auto position-relative">
							<div class="row align-items-center">
								<!-- Title -->
								<div class="col-lg-7">
									<h3 class="text-white">문의할 게 있으신가요?</h3>
									<p class="text-white mb-3 mb-lg-0">스포츠 문화 센터를 이용하시면서 궁금한 점이 있으면 Q&A 게시판을 이용해주세요.</p>
								</div>
								<!-- Content and input -->
								<div class="col-lg-5 text-lg-end">
									<a href="/qna/index.do" class="btn btn-outline-warning mb-0">QnA</a>
								</div>
							</div>
						</div>
					</div> <!-- Row END -->
				</div>
			</div>
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Action box END -->
<div class="contents_section">
    <section class="section section02">
        <h2 class="sr-only">section02</h2>
        <div class="container">
            <article class="group notice">
                <h3 class="title">공지사항</h3>
                <ul class="list">
	
		<!--		<fmt:parseDate value="${rs.reg_date}" var="reg_date" pattern="yyyyMMdd"/>-->
		<li>
			<a href="">
				<strong>
					2024년 7월 헬스·헬스PT 프로그램 회원모집
				</strong>
				
					<i class="new">새 글</i>
				
				<span>
					2024-06-17
				</span>
			</a>
		</li>
		<li>
			<a href="">
				<strong>
					2024년 7월 수영 신설반 및 결원보충 인원
				</strong>
				
					<i class="new">새 글</i>
				
				<span>
					2024-06-17
				</span>
			</a>
		</li>
		<li>
			<a href="">
				<strong>
					2024년 7월 문화교실 및 스포츠 프로그램 회원모집
				</strong>
				
					<i class="new">새 글</i>
				
				<span>
					2024-06-17
				</span>
			</a>
		</li>
		<li>
			<a href="">
				<strong>
					2024년 7월 스포츠 및 수중스포츠 프로그램 회원모집
				</strong>
				
					<i class="new">새 글</i>
				
				<span>
					2024-06-17
				</span>
			</a>
		</li>
	
</ul>
               
<!-- =======================
Reviews START -->
<section class="bg-light">
	<div class="container">
		<div class="row g-4 g-lg-5 align-items-center">
			<div class="col-xl-7 order-2 order-xl-1">
				<div class="row mt-0 mt-xl-5">
					<!-- Review -->
					<div class="col-md-7 position-relative mb-0 mt-0 mt-md-5">
						<!-- SVG -->
						<figure class="fill-danger opacity-2 position-absolute top-0 start-0 translate-middle mb-3">
							<svg width="211px" height="211px">
								<path d="M210.030,105.011 C210.030,163.014 163.010,210.029 105.012,210.029 C47.013,210.029 -0.005,163.014 -0.005,105.011 C-0.005,47.015 47.013,-0.004 105.012,-0.004 C163.010,-0.004 210.030,47.015 210.030,105.011 Z"></path>
							</svg>
						</figure>

						<div class="bg-body shadow text-center p-4 rounded-3 position-relative mb-5 mb-md-0">
							<!-- Avatar -->
							<div class="avatar avatar-xl mb-3">
								<img class="avatar-img rounded-circle" src="resources/images/avatar/01.jpg" alt="avatar">
							</div>
							<!-- Content -->
							<blockquote>
								<p>
									<span class="me-1 small"><i class="fas fa-quote-left"></i></span>
										수영 수업은 매우 유익했습니다. 친절한 강사님과 깨끗한 시설 덕분에 더 많이 배우고 자신감을 얻을 수 있었습니다. 다음 방문이 기대됩니다!
									<span class="ms-1 small"><i class="fas fa-quote-right"></i></span>
								</p>
							</blockquote>
							<!-- Rating -->
							<ul class="list-inline mb-2">
								<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
								<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
								<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
								<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
								<li class="list-inline-item me-0 small"><i class="fas fa-star-half-alt text-warning"></i></li>
							</ul>
							<!-- Info -->
							<h6 class="mb-0">김OO</h6>
						</div>
					</div>

					<!-- Mentor list -->
					<div class="col-md-5 mt-5 mt-md-0 d-none d-md-block">
						<div class="bg-body shadow p-4 rounded-3 d-inline-block position-relative">
							<!-- Title -->
							<h6 class="mb-3">50명 이상의 인증된 강사</h6>
							<!-- Mentor Item -->
							<div class="d-flex align-items-center mb-3">
								<!-- Avatar -->
								<div class="avatar avatar-sm">
									<img class="avatar-img rounded-1" src="resources/images/avatar/09.jpg" alt="avatar">
								</div>
								<!-- Info -->
								<div class="ms-2">
									<h6 class="mb-0">강OO</h6>
									<p class="mb-0 small">필라테스 강사</p>
								</div>
							</div>

							<!-- Mentor Item -->
							<div class="d-flex align-items-center mb-3">
								<!-- Avatar -->
								<div class="avatar avatar-sm">
									<img class="avatar-img rounded-1" src="resources/images/avatar/04.jpg" alt="avatar">
								</div>
								<!-- Info -->
								<div class="ms-2">
									<h6 class="mb-0">박OO</h6>
									<p class="mb-0 small">헬스 강사</p>
								</div>
							</div>

							<!-- Mentor Item -->
							<div class="d-flex align-items-center">
								<!-- Avatar -->
								<div class="avatar avatar-sm">
									<img class="avatar-img rounded-1" src="resources/images/avatar/02.jpg" alt="avatar">
								</div>
								<!-- Info -->
								<div class="ms-2">
									<h6 class="mb-0">김OO</h6>
									<p class="mb-0 small">스쿼시 강사</p>
								</div>
							</div>
						</div>
					</div>
				</div> <!-- Row END -->

				<div class="row mt-5 mt-xl-0">
					<!-- Rating -->
					<div class="col-7 mt-0 mt-xl-5 text-end position-relative z-index-1 d-none d-md-block">
						<!-- SVG -->
						<figure	class="fill-danger position-absolute top-0 start-50 mt-n7 ms-6 ps-3 pt-2 z-index-n1 d-none d-lg-block">
							<svg enable-background="new 0 0 160.7 159.8" height="180px">
								<path d="m153.2 114.5c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2-0.1-1.2 0.9-2.2 2.1-2.2z" />
								<path d="m116.4 114.5c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<path d="m134.8 114.5c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<path d="m135.1 96.9c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<path d="m153.5 96.9c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2-0.1-1.2 0.9-2.2 2.1-2.2z" />
								<path d="m98.3 96.9c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<ellipse cx="116.7" cy="99.1" rx="2.1" ry="2.2" />
								<path d="m153.2 149.8c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2-0.1-1.3 0.9-2.2 2.1-2.2z" />
								<path d="m135.1 132.2c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2 0-1.3 0.9-2.2 2.1-2.2z" />
								<path d="m153.5 132.2c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2-0.1-1.3 0.9-2.2 2.1-2.2z" />
								<path d="m80.2 79.3c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s1-2.2 2.1-2.2z" />
								<path d="m117 79.3c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<path d="m98.6 79.3c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<path d="m135.4 79.3c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<path d="m153.8 79.3c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<path d="m80.6 61.7c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2-0.1-1.2 0.9-2.2 2.1-2.2z" />
								<ellipse cx="98.9" cy="63.9" rx="2.1" ry="2.2" />
								<path d="m117.3 61.7c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<ellipse cx="62.2" cy="63.9" rx="2.1" ry="2.2" />
								<ellipse cx="154.1" cy="63.9" rx="2.1" ry="2.2" />
								<path d="m135.7 61.7c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<path d="m154.4 44.1c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<path d="m80.9 44.1c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2-0.1-1.2 0.9-2.2 2.1-2.2z" />
								<path d="m44.1 44.1c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2-0.1-1.2 0.9-2.2 2.1-2.2z" />
								<path d="m99.2 44.1c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s1-2.2 2.1-2.2z" />
								<ellipse cx="117.6" cy="46.3" rx="2.1" ry="2.2" />
								<path d="m136 44.1c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<path d="m62.5 44.1c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2-0.1-1.2 0.9-2.2 2.1-2.2z" />
								<path d="m154.7 26.5c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<path d="m62.8 26.5c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2-0.1-1.2 0.9-2.2 2.1-2.2z" />
								<ellipse cx="136.3" cy="28.6" rx="2.1" ry="2.2" />
								<path d="m99.6 26.5c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2-0.1-1.2 0.9-2.2 2.1-2.2z" />
								<path d="m117.9 26.5c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s1-2.2 2.1-2.2z" />
								<path d="m81.2 26.5c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2-0.1-1.2 0.9-2.2 2.1-2.2z" />
								<path d="m26 26.5c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2c-1.2 0-2.1-1-2.1-2.2s0.9-2.2 2.1-2.2z" />
								<ellipse cx="44.4" cy="28.6" rx="2.1" ry="2.2" />
								<path d="m136.6 13.2c-1.2 0-2.1-1-2.1-2.2s1-2.2 2.1-2.2c1.2 0 2.1 1 2.1 2.2 0.1 1.2-0.9 2.2-2.1 2.2z" />
								<path d="m155 13.2c-1.2 0-2.1-1-2.1-2.2s1-2.2 2.1-2.2c1.2 0 2.1 1 2.1 2.2 0.1 1.2-0.9 2.2-2.1 2.2z" />
								<path d="m26.3 13.2c-1.2 0-2.1-1-2.1-2.2s1-2.2 2.1-2.2c1.2 0 2.1 1 2.1 2.2s-0.9 2.2-2.1 2.2z" />
								<path d="m81.5 13.2c-1.2 0-2.1-1-2.1-2.2s1-2.2 2.1-2.2c1.2 0 2.1 1 2.1 2.2s-0.9 2.2-2.1 2.2z" />
								<path d="m63.1 13.2c-1.2 0-2.1-1-2.1-2.2s1-2.2 2.1-2.2c1.2 0 2.1 1 2.1 2.2s-0.9 2.2-2.1 2.2z" />
								<path d="m44.7 13.2c-1.2 0-2.1-1-2.1-2.2s1-2.2 2.1-2.2c1.2 0 2.1 1 2.1 2.2s-0.9 2.2-2.1 2.2z" />
								<path d="m118.2 13.2c-1.2 0-2.1-1-2.1-2.2s1-2.2 2.1-2.2c1.2 0 2.1 1 2.1 2.2 0.1 1.2-0.9 2.2-2.1 2.2z" />
								<path d="m7.9 13.2c-1.2 0-2.1-1-2.1-2.2s1-2.2 2.1-2.2c1.2 0 2.1 1 2.1 2.2 0.1 1.2-0.9 2.2-2.1 2.2z" />
								<path d="m99.9 13.2c-1.2 0-2.1-1-2.1-2.2s1-2.2 2.1-2.2c1.2 0 2.1 1 2.1 2.2s-1 2.2-2.1 2.2z" />
							</svg>
						</figure>

						<div class="p-3 bg-primary d-inline-block rounded-4 shadow-lg text-center" style="background:url(resources/images/pattern/02.png) no-repeat center center; background-size:cover;">
							<!-- Info -->
							<h5 class="text-white mb-0">4.5/5.0</h5>
							<!-- Rating -->
							<ul class="list-inline mb-2">
								<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
								<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
								<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
								<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
								<li class="list-inline-item me-0 small"><i class="fas fa-star-half-alt text-warning"></i></li>
							</ul>
							<p class="text-white mb-0">수업 후기 평균 평점</p>
						</div>
					</div>

					<!-- Review -->
					<div class="col-md-5 mt-n6 mb-0 mb-md-5">
						<div class="bg-body shadow text-center p-4 rounded-3">
							<!-- Avatar -->
							<div class="avatar avatar-xl mb-3">
								<img class="avatar-img rounded-circle" src="resources/images/avatar/03.jpg" alt="avatar">
							</div>
							<!-- Content -->
							<blockquote>
								<p>
									<span class="me-1 small"><i class="fas fa-quote-left"></i></span> 
										헬스쌤의 전문적인 지도와 다양한 운동 프로그램으로 몸과 마음 모두에 좋은 변화를 느낄 수 있었습니다. 강력 추천해요!
									<span class="ms-1 small"><i class="fas fa-quote-right"></i></span>
								</p>
							</blockquote>
							<!-- Rating -->
							<ul class="list-inline mb-2">
								<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
								<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
								<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
								<li class="list-inline-item me-0 small"><i class="fas fa-star text-warning"></i></li>
								<li class="list-inline-item me-0 small"><i class="fas fa-star-half-alt text-warning"></i></li>
							</ul>
							<!-- Info -->
							<h6 class="mb-0">이OO</h6>
						</div>
					</div>
				</div> <!-- Row END -->
			</div>
			<div class="col-xl-5 order-1 text-center text-xl-start">
				<!-- Title -->
				<h2 class="fs-1">후기가 보여주는 수업 만족도</h2>
				<p>퀄리티 높은 수업과 열정 가득한 강사가 있는 스포츠 센터의 강좌를 수강하고 싶다면 온라인 수강 신청을 이용해주세요.</p>
				<a href="/class/list.do" class="btn btn-primary mb-0">수강 신청</a>
			</div>
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Reviews END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- =======================
Footer START -->
<footer class="pt-5">
	<div class="container">
		<!-- Row START -->
		<div class="row g-4">

			<!-- Widget 1 START -->
			<div class="col-lg-3">
				<!-- logo -->
				<a class="me-0" href="/home.do">
					<img class="light-mode-item h-40px" src="resources/images/logo.png" alt="logo">
				
				</a>
				<p class="my-3" style="font-family: 'Noto Sans KR', sans-serif;">스포츠를 사랑하고 배우고자 하는 모든 이들을 위해 만들어 졌습니다. 함께 스포츠를 즐기며 배우고 성장할 수 있는 공간, 그것이 바로 우리의 목표입니다.</p>
			</div>
			<!-- Widget 1 END -->

			<!-- Widget 2 START -->
			<div class="col-lg-6">
				<div class="row g-4">
					<!-- Link block -->
					<div class="col-6 col-md-4">
						<h3 class="mb-2 mb-md-4"style="font-family: 'Noto Sans KR', sans-serif;">센터소개</h3>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="#" style="font-family: 'Noto Sans KR', sans-serif;">About us</a></li>
							<li class="nav-item"><a class="nav-link" href="#" style="font-family: 'Noto Sans KR', sans-serif;">Contact us</a></li>
						</ul>
					</div>
									
					<!-- Link block -->
					<div class="col-6 col-md-4">
						<h3 class="mb-2 mb-md-4" style="font-family: 'Noto Sans KR', sans-serif;">종목/소개</h3>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="/subject/index.do" style="font-family: 'Noto Sans KR', sans-serif;">종목 안내</a></li>
							<li class="nav-item"><a class="nav-link" href="/subject/registInfo.do" style="font-family: 'Noto Sans KR', sans-serif;">이용 안내</a></li>
							<li class="nav-item"><a class="nav-link" href="/subject/usageInfo.do" style="font-family: 'Noto Sans KR', sans-serif;">수강 신청 안내</a></li>
						</ul>
					</div>

					<!-- Link block -->
					<div class="col-6 col-md-4">
						<h3 class="mb-2 mb-md-4" style="font-family: 'Noto Sans KR', sans-serif;">커뮤니티</h3>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="/notice/index.do" style="font-family: 'Noto Sans KR', sans-serif;">공지사항</a></li>
							<li class="nav-item"><a class="nav-link" href="/qna/index.do" style="font-family: 'Noto Sans KR', sans-serif;">QnA</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- Widget 2 END -->

			<!-- Widget 3 START -->
			<div class="col-lg-3">
				<h3 class="mb-2 mb-md-4" style="font-family: 'Noto Sans KR', sans-serif;">문의</h3>
				<!-- Time -->
				<p class="mb-2">
					TEL:<span class="h6 fw-light ms-2" style="font-family: 'Noto Sans KR', sans-serif;">02-6392-0044</span>
					<span class="d-block small" style="font-family: 'Noto Sans KR', sans-serif;">문의 가능 시간: 평일 9:00 ~ 18:00 (점심시간 13:00 ~ 14:00)</span>
				</p>

				<p class="mb-0">Email:<span class="h6 fw-light ms-2" style="font-family: 'Noto Sans KR', sans-serif;">shds.edu03@gmail.com</span></p>

				<div class="row g-2 mt-2">
				</div> <!-- Row END -->
			</div> 
			<!-- Widget 3 END -->
		</div><!-- Row END -->

		<!-- 구분선-->
		<hr width="100%" color="adb5bd" noshade/>

		<!-- Bottom footer -->
		<div class="py-3">
			<div class="container px-0">
				<div class="d-lg-flex justify-content-between align-items-center py-3 text-center text-md-left">
					<!-- copyright text -->
					<div class="text-body text-primary-hover" style="font-family: 'Noto Sans KR', sans-serif;"> Copyrights ©2024 SportsCenter. Build by <a href="#" target="_blank" class="text-body">ShinhanDS</a></div>
					<!-- copyright links-->
					<div class="justify-content-center mt-3 mt-lg-0">
						<ul class="nav list-inline justify-content-center mb-0">
							<li class="list-inline-item">
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<!-- =======================
Footer END --

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="assets/vendor/tiny-slider/tiny-slider.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.js"></script>
<script src="assets/vendor/purecounterjs/dist/purecounter_vanilla.js"></script>

<!-- Template Functions -->
<script src="assets/js/functions.js"></script>

</body>
</html>