<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>subject_view</title>
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
  

  <script>
  

  </script>
</head>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<body>
	<div>
	<h2 style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; text-align: center; margin-top: 40px;">종목 소개</h2>
	</div>
	<!--Page content START -->
		<section class="py-5">
			<div class="container">
				<div class="row">
					<!-- Main content START -->
					<div class="col-12">
		
						<!-- Search option START -->
						<div class="row mb-4 align-items-center">
		
							<!-- Title -->
							<div class="col-md-4">
								<span class="total_page" style="font-family: 'Noto Sans KR', sans-serif;">총&nbsp<strong>9</strong>개의 강좌가 있습니다.</span>
							</div>
		
									<!-- Select option -->
									<div class="col-md-4 mt-3 mt-xl-0"></div>
								</div>
							</div>
						</div>
						<!-- Search option END -->
				
					
				<!-- Subject Grid START -->
				<div class="row g-4">
					<!-- Subject item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
					    <div class="card shadow h-100" >
					        <div class="position-relative">
					            <!-- Image -->
					            <img src="/resources/images/subject/수영.jpg" class="card-img-top" alt="수영">
					            <!-- Overlay -->
					            <div class="card-img-overlay d-flex z-index-0 p-3 flex-column justify-content-between">
					                <!-- Subject overlay Top -->
					                <div class="w-100 d-flex justify-content-end">
					                    <span class="badge bg-purple text-white"  style="position:absolute;top:97%;right:87%;">인기</span>
					                </div>
					                <!-- Subject overlay Bottom -->
					                <div class="w-100">
					                </div>
					            </div>
					        </div>
					
					        <!-- Subject body -->
					        <div class="card-body px-3">
					            <!-- Title -->
					            <h5 class="card-title mb-0">
					                <a href="/subject/swimDetail.do" class="stretched-link" style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 24px;">수영</a>
					            </h5>
					            <!-- Description -->
					            <p class="card-text mt-2" style="font-family: 'Noto Sans KR', sans-serif;">수영은 육상 운동과 달리 체중의 대부분을 지지할 필요가 없어 체격 제한 없이 남녀노소 누구나 쉽게 즐길 수 있는 운동입니다.</p>
					        </div>
					
					        <!-- Subject footer -->
					        <div class="pt-0 px-3" style="border-top: none; padding-top: 1rem; padding-bottom: 1rem;">
					            <div class="d-flex justify-content-between align-items-center">
					                <!-- Footer content if needed -->
					            </div>
					        </div>
					    </div>
				</div>
				
			


					<!-- Subject item 헬스 -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="/resources/images/subject/헬스.jpg" class="card-img-top" alt="헬스">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3 flex-column justify-content-between">
									<!-- Subject overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
										<span class="badge bg-purple text-white"  style="position:absolute;top:97%;right:87%;">인기</span>
									</div>
									<!-- Subject overlay Bottom -->
					                <div class="w-100">
								</div>
							</div>
						</div>
							<!-- Subject body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="/subject/healthDetail.do" class="stretched-link" style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 24px;">헬스</a>
								</h5>
							<!-- Description -->
					            <p class="card-text mt-2" style="font-family: 'Noto Sans KR', sans-serif;">헬스는 지구력, 근력, 유연성, 체력증대를 기르고 다이어트에 도움이 됩니다.</p>
					        </div>
							<!-- Subject footer -->
							<div class="pt-0 px-3"style="border-top: none; padding-top: 1rem; padding-bottom: 1rem;">
								<div class="d-flex justify-content-between align-items-center">
								</div>
							</div>
						</div>
					</div>
					<!-- Subject item 헬스 -->
					

					<!-- Subject item 스쿼시 시작 -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="/resources/images/subject/스쿼시.jpg" class="card-img-top" alt="스쿼시">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3 flex-column justify-content-between">
									<!-- Subject overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
										<span class="badge bg-success bg-opacity-10 text-white" style="position:absolute;top:97%;right:87%;">추천</span>
									</div>
									<!-- Subject overlay Bottom -->
					                <div class="w-100">
								</div>
							</div>
						</div>
							<!-- Subject body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="/subject/squashDetail.do" class="stretched-link" style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 24px;">스쿼시</a>
								</h5>
								<!-- Description -->
								<p class="card-text mt-2" style="font-family: 'Noto Sans KR', sans-serif;">스쿼시는 실내 코트에서 빠른 반사 신경과 민첩성을 요구하는 라켓 스포츠입니다.</p>
							</div>
							<!-- Subject footer -->
							<div class="pt-0 px-3" style="border-top: none; padding-top: 1rem; padding-bottom: 1rem;">
								<div class="d-flex justify-content-between align-items-center">
								</div>
							</div>
						</div>
					</div>
					<!-- Subject item 스쿼시 끝-->

					<!-- Subject item 줌바댄스 -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="/resources/images/subject/줌바댄스.jpg" class="card-img-top" alt="줌바댄스">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3 flex-column justify-content-between">
									<!-- Subject overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
									</div>
								</div>
							</div>

							<!-- Subject body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="/subject/zumbaDetail.do" class="stretched-link" style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 24px;">줌바댄스</a>
								</h5>
								<!-- Description -->
								<p class="card-text mt-2" style="font-family: 'Noto Sans KR', sans-serif;">줌바댄스는 라틴 음악을 바탕으로 한 신나는 운동입니다.</p>
							</div>
							<!-- Subject footer -->
							<div class="pt-0 px-3" style="border-top: none; padding-top: 1rem; padding-bottom: 1rem;">
								<div class="d-flex justify-content-between align-items-center">
								</div>
							</div>
						</div>
					</div>
					<!-- Subject item END -->

					<!-- Subject item 아쿠아로빅 -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="/resources/images/subject/아쿠아로빅.jpg" class="card-img-top" alt="아쿠아로빅">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3 flex-column justify-content-between">
									<!-- Subject overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
									</div>
								</div>
							</div>

							<!-- Card body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="/subject/aquacizeDetail.do" class="stretched-link" style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 24px;">아쿠아로빅</a>
								</h5>
								<!-- Description -->
								<p class="card-text mt-2" style="font-family: 'Noto Sans KR', sans-serif;">아쿠아로빅은 물속에서 즐기는 건강체조입니다.</p>
							</div>

							<!--  Subject footer -->
							<div class="pt-0 px-3" style="border-top: none; padding-top: 1rem; padding-bottom: 1rem;">
								<div class="d-flex justify-content-between align-items-center">
								</div>
							</div>
						</div>
					</div>
					<!-- Subject item 아쿠아로빅 -->

					<!-- Subject item 스피닝 -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="/resources/images/subject/스피닝.jpg" class="card-img-top" alt="스피닝">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3 flex-column justify-content-between">
									<!-- Subject overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
									</div>
								</div>
							</div>

							<!--Subject body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="/subject/spinningDetail.do" class="stretched-link" style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 24px;">스피닝</a>
								</h5>
								<!-- Description -->
								<p class="card-text mt-2" style="font-family: 'Noto Sans KR', sans-serif;">스피닝은 고정된 바이크 위에서 페달을 밟으며 신나는 음악에 맞춰 율동을 하는 다이내믹한 운동입니다.</p>
							</div>

							<!-- Subject footer -->
							<div class="pt-0 px-3" style="border-top: none; padding-top: 1rem; padding-bottom: 1rem;">
								<div class="d-flex justify-content-between align-items-center">
								</div>
							</div>
						</div>
					</div>
					<!-- Subject item 스피닝 -->

					<!-- Subject item 필라테스 시작 -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="/resources/images/subject/필라테스.jpg" class="card-img-top" alt="필라테스">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3 flex-column justify-content-between">
									<!-- Subject overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
										<span class="badge bg-success bg-opacity-10 text-white" style="position:absolute;top:97%;right:87%;">추천</span>
									</div>
									   <!-- Subject overlay Bottom -->
              							  <div class="w-100">
									</div>
								</div>
							</div>

							<!-- Subject body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="/subject/pilatesDetail.do" class="stretched-link" style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 24px;">필라테스</a>
								</h5>
								 <!-- Description -->
            					<p class="card-text mt-2" style="font-family: 'Noto Sans KR', sans-serif;">필라테스는 운동부족과 재활치료, 정신수련을 위해 고안한 근육강화 운동입니다.</p>
							</div>

							<!-- Card footer -->
							<div class="pt-0 px-3" style="border-top: none; padding-top: 1rem; padding-bottom: 1rem;">
								<div class="d-flex justify-content-between align-items-center">
								</div>
							</div>
						</div>
					</div>
					<!-- Card item 필라테스 끝 -->

					<!-- Subject item 점핑트램폴린 시작 -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="/resources/images/subject/점핑트램폴린.jpg" class="card-img-top" alt="점핑트램폴린">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3 flex-column justify-content-between">
									<!-- Subject overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
										<span class="badge bg-success bg-opacity-10 text-white" style="position:absolute;top:97%;right:87%;">추천</span>
									</div>
									   <!-- Subject overlay Bottom -->
              							  <div class="w-100">
									</div>
								</div>
							</div>

							<!-- Subject body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="/subject/jumpingDetail.do" class="stretched-link" style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 24px;">점핑트램폴린</a>
								</h5>
								 <!-- Description -->
            					<p class="card-text mt-2" style="font-family: 'Noto Sans KR', sans-serif;">점핑트램폴린은 트램폴린 위에서 다양한 점핑 응용동작을 하면서 칼로리 소모 및 코어근육과 하체를 단련하는 운동입니다.</p>
							</div>

							<!-- Card footer -->
							<div class="pt-0 px-3" style="border-top: none; padding-top: 1rem; padding-bottom: 1rem;">
								<div class="d-flex justify-content-between align-items-center">
								</div>
							</div>
						</div>
					</div>
					<!-- Card item 필라테스 끝 -->
					
					
					<!-- Subject item 플라잉요가 시작 -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="/resources/images/subject/플라잉요가.jpg" class="card-img-top" alt="플라잉요가">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3 flex-column justify-content-between">
									<!-- Subject overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
										<span class="badge bg-success bg-opacity-10 text-white" style="position:absolute;top:97%;right:87%;">추천</span>
									</div>
									   <!-- Subject overlay Bottom -->
              							  <div class="w-100">
									</div>
								</div>
							</div>

							<!-- Subject body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="/subject/flyingDetail.do" class="stretched-link" style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: 24px;">플라잉요가</a>
								</h5>
								 <!-- Description -->
            					<p class="card-text mt-2" style="font-family: 'Noto Sans KR', sans-serif;">플라잉 요가는 해먹을 사용해 공중에서 다양한 요가 동작을 수행하는 운동입니다.</p>
							</div>

							<!-- Card footer -->
							<div class="pt-0 px-3" style="border-top: none; padding-top: 1rem; padding-bottom: 1rem;">
								<div class="d-flex justify-content-between align-items-center">
								</div>
							</div>
						</div>
					</div>
					<!-- Card item 필라테스 끝 -->
				</div>
				<!-- Book Grid END -->
		<div class="col-12">
    <nav class="mt-4 d-flex justify-content-center" aria-label="navigation">
        <ul class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
			<!-- Main content END -->
		</div><!-- Row END -->
	</div>
</section>
<!-- =======================
Page content END -->

</main>
<!-- 구분선-->
	<hr width="100%" color="adb5bd" style="width: 65%; margin: 0 auto;" noshade/>
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
Footer END -->

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="resources/vendor/choices/js/choices.min.js"></script>

<!-- Template Functions -->
<script src="resources/js/functions.js"></script>

</body>
</html>