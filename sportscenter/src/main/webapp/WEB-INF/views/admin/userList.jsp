<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description" content="Eduport- LMS, Education and Course Theme">
	<script>
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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap">

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css" href="/resources/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" type="text/css" href="/resources/vendor/apexcharts/css/apexcharts.css">
<link rel="stylesheet" type="text/css" href="/resources/vendor/overlay-scrollbar/css/overlayscrollbars.min.css">

<!-- Theme CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>


<title>관리자 페이지</title>
</head>
<body>

<main>

<nav class="navbar sidebar navbar-expand-xl navbar-dark bg-dark">

	<!-- Navbar brand for xl START -->
	<div class="d-flex align-items-center">
		<a class="navbar-brand" href="index.html">
			<img class="navbar-brand-item" src="/resources/images/logo-light.svg" alt="img">
		</a>
	</div>
	<!-- Navbar brand for xl END -->
	
	<div class="offcanvas offcanvas-start flex-row custom-scrollbar h-100" data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar">
		<div class="offcanvas-body sidebar-content d-flex flex-column bg-dark">

			<!-- Sidebar menu START -->
			<ul class="navbar-nav flex-column" id="navbar-sidebar">
				
				<!-- Menu item 1 -->
				<li class="nav-item"><a href="" class="nav-link active"><i class="bi bi-house fa-fw me-2"></i>Dashboard</a></li>
				
				<!-- Title -->
				<li class="nav-item ms-2 my-2">Pages</li>

				<!-- menu item 2 회원관리 -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#collapsepage1" role="button" aria-expanded="false" aria-controls="collapsepage1">
						<i class="bi bi-basket fa-fw me-2"></i>Courses
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapsepage1" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="admin-course-list.html">All Courses</a></li>
					</ul>
				</li>

				<!-- menu item 3 강좌 관리 -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#collapsepage2" role="button" aria-expanded="false" aria-controls="collapsepage2">
						<i class="bi bi-basket fa-fw me-2"></i>Courses
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapsepage2" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="#">강좌 정보 관리</a></li>
						<li class="nav-item"> <a class="nav-link" href="classList.do">강좌 등록</a></li>
					</ul>
				</li>

				<!-- Menu item 4 게시판 관리-->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#collapseinstructors" role="button" aria-expanded="false" aria-controls="collapseinstructors">
						<i class="fas fa-user-tie fa-fw me-2"></i>Instructors
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapseinstructors" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="adminSubject.do">종목 안내</a></li>
						<li class="nav-item"> <a class="nav-link" href="adminNotice.do">공지사항</a></li>
						<li class="nav-item"> <a class="nav-link" href="adminQna.do">Q & A</a></li>
					</ul>
				</li>
			</ul>
			<!-- Sidebar footer START -->
			<div class="px-3 mt-auto pt-3">
				<div class="d-flex align-items-center justify-content-between text-primary-hover">
						<a class="h5 mb-0 text-body" href="admin-setting.html" data-bs-toggle="tooltip" data-bs-placement="top" title="Settings">
							<i class="bi bi-gear-fill"></i>
						</a>
						<a class="h5 mb-0 text-body" href="index.html" data-bs-toggle="tooltip" data-bs-placement="top" title="Home">
							<i class="bi bi-globe"></i>
						</a>
						<a class="h5 mb-0 text-body" href="logout.do" data-bs-toggle="tooltip" data-bs-placement="top" title="Sign out">
							<i class="bi bi-power"></i>
						</a>
				</div>
			</div>
			<!-- Sidebar footer END -->
			
		</div>
	</div>
</nav>
<div class="page-content">
	<nav class="navbar top-bar navbar-light border-bottom py-0 py-xl-3">
		<div class="container-fluid p-0">
			<div class="d-flex align-items-center w-100">

				<!-- Logo START -->
				<div class="d-flex align-items-center d-xl-none">
					<a class="navbar-brand" href="index.html">
						<img class="light-mode-item navbar-brand-item h-30px" src="assets/images/logo-mobile.svg" alt="">
						<img class="dark-mode-item navbar-brand-item h-30px" src="assets/images/logo-mobile-light.svg" alt="">
					</a>
				</div>
				<!-- Logo END -->

				<!-- Toggler for sidebar START -->
				<div class="navbar-expand-xl sidebar-offcanvas-menu">
					<button class="navbar-toggler me-auto" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar" aria-expanded="false" aria-label="Toggle navigation" data-bs-auto-close="outside">
						<i class="bi bi-text-right fa-fw h2 lh-0 mb-0 rtl-flip" data-bs-target="#offcanvasMenu"> </i>
					</button>
				</div>
				<!-- Toggler for sidebar END -->
			</div>
		</div>
	</nav>
</div>

</main>
</body>
</html>
