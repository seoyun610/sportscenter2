<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- =======================
Footer START -->
<footer class="pt-5">
	<div class="container">
		<!-- Row START -->
		<div class="row g-4">

			<!-- Widget 1 START -->
			<div class="col-lg-3">
				<!-- log -->
				<a class="me-0" href="http://localhost:8090/home.do">
					<img class="light-mode-item h-40px" src="/resources/images/logo.png" alt="logo">
					<img class="dark-mode-item h-40px" src="/resources/images/logo-light.svg" alt="logo">
				</a>
				<p class="my-3">스포츠를 사랑하고 배우고자 하는 모든 이들을 위해 만들어 졌습니다. 함께 스포츠를 즐기며 배우고 성장할 수 있는 공간, 그것이 바로 우리의 목표입니다.</p>
			</div>
			<!-- Widget 1 END -->

			<!-- Widget 2 START -->
			<div class="col-lg-6">
				<div class="row g-4">
					<!-- Link block -->
					<div class="col-6 col-md-4">
						<h3 class="mb-2 mb-md-4">센터소개</h3>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="/center/facility.do">시설 안내</a></li>
							<li class="nav-item"><a class="nav-link" href="/center/centerHp.do">업무별 연락처</a></li>
						</ul>
					</div>
									
					<!-- Link block -->
					<div class="col-6 col-md-4">
						<h3 class="mb-2 mb-md-4">종목/소개</h3>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="/subject/index.do">종목 안내</a></li>
							<li class="nav-item"><a class="nav-link" href="/subject/registInfo.do">이용 안내</a></li>
							<li class="nav-item"><a class="nav-link" href="/subject/usageInfo.do">수강 신청 안내</a></li>
						</ul>
					</div>

					<!-- Link block -->
					<div class="col-6 col-md-4">
						<h3 class="mb-2 mb-md-4">커뮤니티</h3>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="/notice/index.do">공지사항</a></li>
							<li class="nav-item"><a class="nav-link" href="/qna/index.do">QnA</a></li>
						</ul>
					</div>
				</div>
			</div> 
			<!-- Widget 2 END -->

			<!-- Widget 3 START -->
			<div class="col-lg-3">
				<h3 class="mb-2 mb-md-4">문의</h3>
				<!-- Time -->
				<p class="mb-2">
					TEL:<span class="h6 fw-light ms-2">02-6392-0044</span>
					<span class="d-block small">문의 가능 시간: 평일 9:00 ~ 18:00 (점심시간 13:00 ~ 14:00)</span>
				</p>

				<p class="mb-0">Email:<span class="h6 fw-light ms-2">shds.edu03@gmail.com</span></p>

				<div class="row g-2 mt-2">
				</div> <!-- Row END -->
			</div> 
			<!-- Widget 3 END -->
		</div><!-- Row END -->

		<!-- Divider -->
		<hr class="mt-4 mb-0">

		<!-- Bottom footer -->
		<div class="py-3">
			<div class="container px-0">
				<div class="d-lg-flex justify-content-between align-items-center py-3 text-center text-md-left">
					<!-- copyright text -->
					<div class="text-body text-primary-hover"> Copyrights ©2024 SportsCenter. Build by <a href="#" target="_blank" class="text-body">ShinhanDS</a></div>
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
Footer END -->

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