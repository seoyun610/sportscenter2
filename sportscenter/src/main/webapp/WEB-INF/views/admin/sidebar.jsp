<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar sidebar navbar-expand-xl navbar-dark bg-dark">
	<!-- Navbar brand for xl START -->
	<div class="d-flex align-items-center">
		<a class="navbar-brand">
			<img class="navbar-brand-item" src="/resources/images/sportscenter.png" alt="img">
		</a>
	</div>
	<!-- Navbar brand for xl END -->
	<div class="offcanvas offcanvas-start flex-row custom-scrollbar h-100" data-bs-backdrop="true" tabindex="-1" id="offcanvasSidebar">
		<div class="offcanvas-body sidebar-content d-flex flex-column bg-dark">

			<!-- Sidebar menu START -->
			<ul class="navbar-nav flex-column" id="navbar-sidebar">
				
				<!-- Menu item 1 -->
				<li class="nav-item"><a href="userList.do" class="nav-link active"><i class="bi bi-house fa-fw me-2"></i> 회원 관리 </a></li>
				
				<!-- Title -->
				<li class="nav-item ms-2 my-2">Pages</li>


				<!-- menu item 2 강좌 관리 -->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#collapsepage2" role="button" aria-expanded="false" aria-controls="collapsepage2">
						<i class="bi bi-basket fa-fw me-2"></i> 강좌 관리
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapsepage2" data-bs-parent="#navbar-sidebar">
						<li class="nav-item"> <a class="nav-link" href="courseList.do">수강 정보 관리</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/list.do">강좌 정보 관리</a></li>
						<li class="nav-item"> <a class="nav-link" href="/admin/offRegist.do">현장 등록</a></li>
					</ul>
				</li>

				<!-- Menu item 3 게시판 관리-->
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="collapse" href="#collapseinstructors" role="button" aria-expanded="false" aria-controls="collapseinstructors">
						<i class="fas fa-user-tie fa-fw me-2"></i>게시판 관리
					</a>
					<!-- Submenu -->
					<ul class="nav collapse flex-column" id="collapseinstructors" data-bs-parent="#navbar-sidebar">
						<!-- <li class="nav-item"> <a class="nav-link" href="adminSubject.do">종목 안내</a></li> -->
						<li class="nav-item"> <a class="nav-link" href="adminNotice.do">공지사항</a></li>
						<li class="nav-item"> <a class="nav-link" href="adminQna.do">Q & A</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>