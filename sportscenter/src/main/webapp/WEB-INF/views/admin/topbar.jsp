<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar top-bar navbar-light border-bottom py-0 py-xl-3">
    <div class="container-fluid p-0">
        <div class="d-flex align-items-center w-100">

            <!-- Logo START -->
            <div class="d-flex align-items-center d-xl-none">
                <a class="navbar-brand" href="userList.do">
                    <img class="light-mode-item navbar-brand-item h-30px" src="/resources/images/sportscenter.png" alt="">
                    <img class="dark-mode-item navbar-brand-item h-30px" src="/resources/images/sportscenter.png" alt="">
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
            
            <!-- Top bar left -->
            <div class="navbar-expand-lg ms-auto ms-xl-0">
                
                <!-- Toggler for menubar END -->

                <!-- Topbar menu START -->
                <div class="collapse navbar-collapse w-100" id="navbarTopContent">
                </div>
                <!-- Topbar menu END -->
            </div>
            <!-- Top bar left END -->
            
            <!-- Top bar right START -->
            <div class="ms-xl-auto">
                <ul class="navbar-nav flex-row align-items-center">
                    <!-- Profile dropdown START -->
                    <li class="nav-item ms-2 ms-md-3 dropdown">
                        <!-- Avatar -->
                        <a class="avatar avatar-sm p-0" href="#" id="profileDropdown" role="button" data-bs-auto-close="outside" data-bs-display="static" data-bs-toggle="dropdown" aria-expanded="false">
                            <img class="avatar-img rounded-circle" src="/resources/images/4784d49297c9d28059214b49443a2bae.jpg" alt="avatar">
                        </a>

                        <!-- Profile dropdown START -->
                        <ul class="dropdown-menu dropdown-animation dropdown-menu-end shadow pt-3" aria-labelledby="profileDropdown">
                            <!-- Profile info -->
                            <li class="px-3">
                                <div class="d-flex align-items-center">
                                    <!-- Avatar -->
                                    <div class="avatar me-3 mb-3">
                                        <img class="avatar-img rounded-circle shadow" src="/resources/images/4784d49297c9d28059214b49443a2bae.jpg" alt="avatar">
                                    </div>
                                    <div>
                                        <a class="h6 mt-2 mt-sm-0" href="#">관리자</a>
                                    </div>
                                </div>
                            </li>
            				<li> <hr class="dropdown-divider"></li>
                            <!-- Links -->
                            <li><a class="dropdown-item bg-danger-soft-hover" href="logout.do"><i class="bi bi-power fa-fw me-2"></i>Log Out</a></li>
                            <li> <hr class="dropdown-divider"></li>
                        </ul>
                        <!-- Profile dropdown END -->
                    </li>
                    <!-- Profile dropdown END -->
                </ul>
            </div>
            <!-- Top bar right END -->
        </div>
    </div>
</nav>