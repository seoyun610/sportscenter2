<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar sidebar navbar-expand-xl navbar-dark bg-dark">
	<!-- Navbar brand for xl START -->
	<div class="d-flex align-items-center">
		<a class="navbar-brand">
			<img class="navbar-brand-item" src="/resources/images/logo-light.svg" alt="img">
		</a>
	</div>
	<!-- Navbar brand for xl END -->
	<div class="offcanvas offcanvas-start flex-row custom-scrollbar h-100" data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar">
		<div class="offcanvas-body sidebar-content d-flex flex-column bg-dark">

			<!-- Sidebar menu START -->
			<ul class="navbar-nav flex-column" id="navbar-sidebar">
				
				<!-- Menu item 1 -->
				<li class="nav-item"><a href="/mypage/classView.do" class="nav-link active"><i class="bi bi-house fa-fw me-2"></i> 수강 중인 강좌 </a></li>
				<!-- Menu item 1 -->
				<li class="nav-item"><a href="/mypage/verifyPassword.do" class="nav-link active"><i class="bi bi-house fa-fw me-2"></i> 개인 정보 수정 </a></li>
				<!-- Menu item 1 -->
				<li class="nav-item"><a href="#" class="nav-link active"><i class="bi bi-house fa-fw me-2"></i> 수강 내역 확인 </a></li>
				
			</ul>
		</div>
	</div>
</nav>