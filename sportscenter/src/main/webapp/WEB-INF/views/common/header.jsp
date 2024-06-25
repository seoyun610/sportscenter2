<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head></head>
<!-- Header START -->
<header class="navbar-light navbar-sticky header-static text-center">
    <!-- Nav START -->
    <nav class="navbar navbar-expand-xl">
        <div class="container-fluid px-3 px-xl-5">
            <!-- Logo START -->
            <a class="navbar-brand" href="http://localhost:8090/home.do">
                <img class="light-mode-item navbar-brand-item" src="/resources/images/logo.png" alt="logo">
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
            <div class="navbar-collapse w-100 collapse" style="float: none; margin:0 auto;">
                <!-- Nav Main menu START -->
                <ul class="navbar-nav navbar-nav-scroll me-auto">
                    <!-- Nav item 1 센터소개 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link" style="font-size: 18px; font-weight: bold; color: #000;">센터소개</a>
                        <ul class="dropdown-menu" aria-labelledby="demoMenu">
                            <li> <a class="dropdown-item active" href="#">About Us</a></li>
                            <li> <a class="dropdown-item" href="#">Contact Us</a></li>
                        </ul>
                    </li>

                    <!-- Nav item 2 종목/안내 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link" style="font-size: 18px; font-weight: bold; color: #000;">종목/안내</a>
                        <ul class="dropdown-menu" aria-labelledby="demoMenu">
                            <li> <a class="dropdown-item active" href="/subject/view.do">종목 안내</a></li>
                            <li> <a class="dropdown-item" href="/subject/registInfo.do">이용 안내</a></li>
                            <li> <a class="dropdown-item" href="/subject/usageInfo.do">수강 신청</a></li>
                        </ul>
                    </li>

                    <!-- Nav item 3 수강 신청 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link" id="pagesMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 18px; font-weight: bold; color: #000;">수강신청</a>
                        <ul class="dropdown-menu" aria-labelledby="pagesMenu">
                            <!-- Dropdown submenu -->
                            <li class="dropdown-submenu dropend">
                                <a class="dropdown-item active" href="/class/list.do">온라인 수강신청</a>
                            </li>
                        </ul>
                    </li>

                    <!-- Nav item 4 커뮤니티 -->
                    <li class="nav-item dropdown">
                        <a class="nav-link" id="accounntMenu" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="font-size: 18px; font-weight: bold; color: #000;">커뮤니티</a>
                        <ul class="dropdown-menu" aria-labelledby="accounntMenu">
                            <!-- Dropdown submenu -->
                            <li class="dropdown-submenu dropend">
                                <a class="dropdown-item active" href="/notice/index.do">공지사항</a>
                                <a class="dropdown-item" href="/qna/index.do">QnA</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <div class="user-options dropdown ms-1 ms-lg-0">
                    <c:choose>
                        <c:when test="${not empty sessionScope.login}">
                            <a href="/mypage/classView.do">마이페이지</a>
                            <a href="/user/logout.do">로그아웃</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/user/login.do">로그인</a>
                            <a href="/user/join.do">회원가입</a>
                        </c:otherwise>
                    </c:choose>
                </div>

            </div>
            <!-- Main navbar END -->

        </div>
    </nav>
    <!-- Nav END -->
</header>
<!-- Header END -->


<body>

</body>
</html>