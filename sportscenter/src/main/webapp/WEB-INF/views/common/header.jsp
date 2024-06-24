<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- Bootstrap CSS -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
  <link rel="shortcut icon" href="resources/images/favicon.ico">
  
  	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap-icons/bootstrap-icons.css">

	<!-- 구글 웹 폰트 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	
	<!-- bootstrap CSS 적용 시 필요 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Header START -->
 <header class="navbar-light navbar-sticky header-static text-center">
	<!-- Nav START -->
	<nav class="navbar navbar-expand-xl">
		<div class="container-fluid px-3 px-xl-5">
			<!-- Logo START -->
			<a class="navbar-brand" href="http://localhost:8090/home.do" > 
				<img class="light-mode-item navbar-brand-item " src="/resources/images/logo.png" alt="logo" style="margin-left: 250px;">
				<img class="dark-mode-item navbar-brand-item" src="/resources/images/logo-light.svg" alt="logo">
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
			<div class="navbar-collapse w-100 collapse" style="margin-left: 300px; text-align: center;" >

					
				<!-- Nav Main menu START -->
				<ul class="navbar-nav navbar-nav-scroll me-auto">
					<!-- Nav item 1 종목/안내 -->
						<li class="nav-item dropdown">
							<a class="nav-link href="" style="font-size: 18px; font-weight: bold; color: #000;">센터소개</a>
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
				<div class="nav my-3 my-xl-0 px-4 flex-nowrap align-items-center" >
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
			<div class="dropdown ms-1 ms-lg-0" style="margin-right:170px;">
				<a class="avatar avatar-sm p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
					<img class="avatar-img rounded-circle" src="/resources/images/avatar/01.jpg" alt="avatar">
				</a>
				<ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3" aria-labelledby="profileDropdown"  >
					<!-- Profile info -->
					<li class="px-3 mb-3">
						<div class="d-flex align-items-center" >
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


