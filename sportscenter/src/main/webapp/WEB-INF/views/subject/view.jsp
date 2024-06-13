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
  
  <style>
    .navbar-nav{
      display: flex;
      justify-content: center;
      width: 100%;
    }
    
    .btn-outline-primary {
      color: #007bff;
      border-color: #007bff;
    }
  
    .btn-outline-primary:hover {
      color: #fff;
      background-color: #007bff;
      border-color: #007bff;
    }
    .body {
    	font-family: 'Noto Sans KR', sans-serif;
    }
}
  </style>
  <script>
//종목 데이터
  var subjects = [
      { subjectid: 1, subjectfilename_org: "", subjectfilename_real: "" alt="수영"},
      { subjectid: 2, subjectfilename_org: "", subjectfilename_real: "" alt="헬스"},
      { subjectid: 3, subjectfilename_org: "", subjectfilename_real: "" alt="스쿼시"},
      { subjectid: 4, subjectfilename_org: "", subjectfilename_real: "" alt="줌바댄스"},
      { subjectid: 5, subjectfilename_org: "", subjectfilename_real: "" alt="아쿠아로빅"},
      { subjectid: 6, subjectfilename_org: "", subjectfilename_real: "" alt="스피닝"},
      { subjectid: 7, subjectfilename_org: "", subjectfilename_real: "" alt="필라테스"},
      { subjectid: 8, subjectfilename_org: "", subjectfilename_real: "" alt="점핑 트램플린"},
      { subjectid: 9, subjectfilename_org: "", subjectfilename_real: "" alt="플라잉요가"},
      
  ];
  
//종목 데이터를 HTML에 표시하는 함수
  function displaySubjects() {
      var subjectContainer = document.getElementById('subject-container'); // 종목을 표시할 컨테이너

      // 각 종목 데이터에 대해 반복
      subjects.forEach(function(subject) {
          // 종목 아이템 생성
          var subjectItem = document.createElement('div');
          subjectItem.classList.add('col-sm-6', 'col-lg-4', 'col-xl-3');

          // 카드 생성
          var card = document.createElement('div');
          card.classList.add('card', 'shadow', 'h-100');

          // 카드 이미지와 첨부파일 추가
          var image = document.createElement('img');
          image.classList.add('card-img-top');
          image.setAttribute('src', '/resources/subject/' + subject.subjectfilename_org);
          image.setAttribute('alt', '종목 이미지');
          var realFilePath = '/resources/subject/' + subject.subjectfilename_real;

          // 카드 본문 추가
          var cardBody = document.createElement('div');
          cardBody.classList.add('card-body', 'px-3');
          var cardTitle = document.createElement('h5');
          cardTitle.classList.add('card-title', 'mb-0');
          var link = document.createElement('a');
          link.setAttribute('href', '/subject/index.do');
          link.classList.add('stretched-link');
          link.innerText = '종목명: ' + subject.subjectid;
          cardTitle.appendChild(link);
          cardBody.appendChild(cardTitle);

          // 카드 푸터 추가 (실제 파일 경로)
          var cardFooter = document.createElement('div');
          cardFooter.classList.add('card-footer', 'pt-0', 'px-3');
          var fileLink = document.createElement('a');
          fileLink.setAttribute('href', realFilePath);
          fileLink.innerText = '실제 파일 다운로드';
          cardFooter.appendChild(fileLink);

          // 카드에 이미지, 본문, 푸터 추가
          card.appendChild(image);
          card.appendChild(cardBody);
          card.appendChild(cardFooter);
          subjectItem.appendChild(card);

          // 종목 컨테이너에 추가
          subjectContainer.appendChild(subjectItem);
      });
  }

  // 페이지 로드 시 종목 표시
  window.addEventListener('DOMContentLoaded', function() {
      displaySubjects();
  });
  </script>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <!-- Navbar Toggler -->
      <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      
      <!-- Navbar Collapse -->
      <div class="collapse navbar-collapse justify-content-center" id="navbarCollapse">
        <!-- Nav Main menu START -->
        <ul class="navbar-nav">
          <!-- Nav item 1 종목 안내 -->
          <li class="nav-item" style="margin-right: 30px;">
            <a class="nav-link" href="/subject/view.do">종목 안내</a>
          </li> 
          <!-- Nav item 2 이용 안내 -->
          <li class="nav-item" style="margin-right: 30px;">
            <a class="nav-link" href="/subject/usageInfo.do">이용 안내</a>
          </li>
          <!-- Nav item 3 수업 신청 안내 -->
          <li class="nav-item" style="margin-right: 30px;">
            <a class="nav-link" href="/subject/registInfo.do">수업 신청 안내</a>
          </li>
        </ul>
        <!-- Nav Main menu END -->
  
        <!-- Nav Search START -->
        <form class="d-flex ms-auto">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-primary" type="submit">
            <i class="fas fa-search"></i>
          </button>
        </form>
        <!-- Nav Search END -->
  
        <!-- User Profile START -->
        <div class="nav-item dropdown ms-3">
          <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <img id="userAvatar" src="/resources/images/avatar/default.jpg" class="rounded-circle" alt="User Avatar" width="30" height="30">
          </a>
          <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="profileDropdown">
            <li><a class="dropdown-item" href="#">Profile</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li>
            <li><a class="dropdown-item" href="#">Logout</a></li>
          </ul>
        </div>
        <!-- User Profile END -->
      </div>
    </div>
  </nav>
<!-- =======================
Page Banner START -->
<section class="py-0">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="bg-light p-4 rounded-3 position-relative overflow-hidden">

					<!-- Svg decoration -->
					<figure class="position-absolute top-0 end-0 mt-5">
						<svg width="566.3px" height="353.7px" viewBox="0 0 566.3 353.7"	>
							<path stroke="#17a2b8" fill="none" d="M525.1,4c8.1,0.7,14.9,7.2,17.9,14.8c3,7.6,3,16,2.1,24.1c-4.7,44.3-32.1,84.7-69.4,108.9 c-37.4,24.2-83.7,32.8-127.9,27.6c-32.3-3.8-63.5-14.5-95.9-16.6c-21.6-1.4-45.6,2.1-60.1,18.3c-7.7,8.5-11.8,19.6-14.8,30.7 c-7.9,29.5-9,60.8-19.7,89.5c-5.5,14.8-14,29.1-27.1,38c-15.6,10.5-35.6,12-54.2,9.5c-18.6-2.5-36.5-8.6-55-12.1"/>
							<path stroke="#F99D2B" fill="none" d="M560.7,0.2c10,18.3,3.7,41.1-5,60.1c-11.8,25.9-28,50.3-50.2,68.2c-29,23.3-66.3,34-103.2,38.6 c-36.9,4.6-74.3,3.8-111.3,7.2c-22.3,2-45.3,5.9-63.5,19c-26.8,19.2-39,55.3-68.3,70.4c-38.2,19.6-89.7-4.9-125.6,18.8 c-22.6,15-30.7,44.2-33.3,71.2"/>
						</svg>
					</figure>

					<div class="row position-relative align-items-center">

						<!-- Content -->
						<div class="col-md-6 px-md-5">
							<!-- Title -->
							<h1 class="mb-3">스포츠 문화센터에 오신 걸 환영합니다!</h1>
							<p class="mb-3"> 저희의 목표는 모두가 행복하고 활기찬 삶을 살 수 있는 환경을 조성하는 것입니다. 함께 운동하며 즐겨보아요:)</p>

							<!-- Search -->
							<form class="bg-body rounded p-2">
								<div class="input-group">
									<input class="form-control border-0 me-1" type="search" placeholder="종목 검색">
									<button type="button" class="btn btn-primary mb-0 rounded">Search</button>
								</div>
							</form>
						</div>

						<!-- Image -->
						<div class="col-md-6 text-center">
							<img src="resources/images/book/book-bg.svg" alt="">
						</div>
					</div> <!-- Row END -->
				</div>
			</div>
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Page Banner END -->
<!-- =======================
Page content START -->
<section class="py-5">
	<div class="container">
		<div class="row">
			<!-- Main content START -->
			<div class="col-12">

				<!-- Search option START -->
				<div class="row mb-4 align-items-center">

					<!-- Title -->
					<div class="col-md-4">
						<h5 class="mb-0">종목</h5>
					</div>

					<!-- Select option -->
					<div class="col-md-4 mt-3 mt-xl-0">
						<form class="border-bottom p-2 input-borderless">
							<select class="js-choice">
								<option value="">카테고리</option>
								<option>수영</option>
								<option>헬스</option>
								<option>스쿼시</option>
								<option>줌바댄스</option>
								<option>아쿠아로빅</option>
								<option>스피닝</option>
								<option>필라테스</option>
								<option>점핑 트램플린</option>
								<option>플라잉요가</option>
							</select>
						</form>
					</div>

				</div>
				<!-- Search option END -->

				<!-- Subject Grid START -->
				<div class="row g-4">

					<!-- Subject item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="/resources/subject/수영.jpg" class="card-img-top" alt="수영">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3">
									<!-- Subject overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
										<!-- Subject format icon -->
										<div class="icon-md bg-dark rounded-circle fs-5">
											<a href="#" class="text-white"><i class="bi bi-book"></i></a>
										</div>
									</div>
								</div>
							</div>

							<!-- Subject body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="/subject/index.do" class="stretched-link">수영</a>
								</h5>
							</div>

							<!-- Subject footer -->
							<div class="card-footer pt-0 px-3">
								<div class="d-flex justify-content-between align-items-center">
									<span class="h6 fw-light mb-0">수영은..</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Subject item END -->

					<!-- Subject item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="/resources/subject/헬스.jpg" class="card-img-top" alt="헬스">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3">
									<!-- Subject overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
										<!-- Subject format icon -->
										<div class="icon-md bg-dark rounded-circle fs-5">
											<a href="#" class="text-white"><i class="bi bi-soundwave"></i></a>
										</div>
									</div>
								</div>
							</div>

							<!-- Subject body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="" class="stretched-link">헬스</a>
								</h5>
							</div>

							<!-- Subject footer -->
							<div class="card-footer pt-0 px-3">
								<div class="d-flex justify-content-between align-items-center">
									<span class="h6 fw-light mb-0">헬스는..</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Subject item END -->

					<!-- Subject item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="" class="card-img-top" alt="스쿼시">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3">
									<!-- Card overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
										<!-- Card format icon -->
										<div class="icon-md bg-dark rounded-circle fs-5">
											<a href="#" class="text-white"><i class="bi bi-file-earmark-pdf"></i></a>
										</div>
									</div>
								</div>
							</div>

							<!-- Card body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="" class="stretched-link">스쿼시</a>
								</h5>
							</div>

							<!-- Card footer -->
							<div class="card-footer pt-0 px-3">
								<div class="d-flex justify-content-between align-items-center">
									<span class="h6 fw-light mb-0">스쿼시는..</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="" class="card-img-top" alt="줌바댄스">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3">
									<!-- Card overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
										<!-- Card format icon -->
										<div class="icon-md bg-dark rounded-circle fs-5">
											<a href="#" class="text-white"><i class="bi bi-book"></i></a>
										</div>
									</div>
								</div>
							</div>

							<!-- Card body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0 ">
									<a href="" class="stretched-link">줌바댄스</a>
								</h5>
							</div>

							<!-- Card footer -->
							<div class="card-footer pt-0 px-3">
								<div class="d-flex justify-content-between align-items-center">
									<span class="h6 fw-light mb-0">줌바댄스는..</span>
									<!-- Price -->
									<h5 class="text-success mb-0"></h5>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="" class="card-img-top" alt="아쿠아로빅">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3">
									<!-- Card overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
										<!-- Card format icon -->
										<div class="icon-md bg-dark rounded-circle fs-5">
											<a href="#" class="text-white"><i class="bi bi-book"></i></a>
										</div>
									</div>
								</div>
							</div>

							<!-- Card body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="" class="stretched-link">아쿠아로빅</a>
								</h5>
							</div>

							<!-- Card footer -->
							<div class="card-footer pt-0 px-3">
								<div class="d-flex justify-content-between align-items-center">
									<span class="h6 fw-light mb-0">아쿠아로빅은..</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="" class="card-img-top" alt="스피닝">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3">
									<!-- Card overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
										<!-- Card format icon -->
										<div class="icon-md bg-dark text-white rounded-circle fs-5">
											<a href="#" class="text-white"><i class="bi bi-file-earmark-pdf"></i></a>
										</div>
									</div>
								</div>
							</div>

							<!-- Card body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title ,b-0">
									<a href="shop-product-detail.html" class="stretched-link">스피닝</a>
								</h5>
							</div>

							<!-- Card footer -->
							<div class="card-footer pt-0 px-3">
								<div class="d-flex justify-content-between align-items-center">
									<span class="h6 fw-light mb-0">스피닝은..</span>
									<!-- Price -->
									<h5 class="text-success mb-0"></h5>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="" class="card-img-top" alt="필라테스">
								<!-- Overlay -->
								<div class="card-img-overlay d-flex z-index-0 p-3">
									<!-- Card overlay Top -->
									<div class="w-100 mb-auto d-flex justify-content-end">
										<!-- Card format icon -->
										<div class="icon-md bg-dark rounded-circle fs-5">
											<a href="#" class="text-white"><i class="bi bi-book"></i></a>
										</div>
									</div>
								</div>
							</div>

							<!-- Card body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="shop-product-detail.html" class="stretched-link">필라테스</a>
								</h5>
							</div>

							<!-- Card footer -->
							<div class="card-footer pt-0 px-3">
								<div class="d-flex justify-content-between align-items-center">
									<span class="h6 fw-light mb-0">필라테스는..</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Card item END -->

					<!-- Card item START -->
					<div class="col-sm-6 col-lg-4 col-xl-3">
						<div class="card shadow h-100">
							<div class="position-relative">
								<!-- Image -->
								<img src="" class="card-img-top" alt="점핑 트랜플린">
									<!-- Overlay -->
									<div class="card-img-overlay d-flex z-index-0 p-3">
										<!-- Card overlay Top -->
										<div class="w-100 mb-auto d-flex justify-content-end">
											<!-- Card format icon -->
											<div class="icon-md bg-dark rounded-circle fs-5">
												<a href="#" class="text-white"><i class="bi bi-soundwave"></i></a>
											</div>
										</div>
									</div>
								</div>
							<!-- Card body -->
							<div class="card-body px-3">
								<!-- Title -->
								<h5 class="card-title mb-0">
									<a href="shop-product-detail.html" class="stretched-link">점핑 트램플린</a>
								</h5>
							</div>

							<!-- Card footer -->
							<div class="card-footer pt-0 px-3">
								<div class="d-flex justify-content-between align-items-center">
									<span class="h6 fw-light mb-0">점핑 트램플린</span>
								</div>
							</div>
						</div>
					</div>
					<!-- Subject item END -->

				</div>
				<!-- Book Grid END -->

				<!-- Pagination START -->
				<div class="col-12">
					<nav class="mt-4 d-flex justify-content-center" aria-label="navigation">
						<ul class="pagination pagination-primary-soft d-inline-block d-md-flex rounded mb-0">
							<li class="page-item mb-0"><a class="page-link" href="#" tabindex="-1"><i class="fas fa-angle-double-left"></i></a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">1</a></li>
							<li class="page-item mb-0 active"><a class="page-link" href="#">2</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">..</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#">6</a></li>
							<li class="page-item mb-0"><a class="page-link" href="#"><i class="fas fa-angle-double-right"></i></a></li>
						</ul>
					</nav>
				</div>
				<!-- Pagination END -->
			</div>
			<!-- Main content END -->
		</div><!-- Row END -->
	</div>
</section>
<!-- =======================
Page content END -->



</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- =======================
Footer START -->
<footer class="pt-5 bg-light">
	<div class="container">
		<!-- Row START -->
		<div class="row g-4">

			<!-- Widget 1 START -->
			<div class="col-lg-3">
				<!-- logo -->
				<a class="me-0" href="/home.do"> <!-- href 링크 메인 화면으로 설정 -->
					<img class="light-mode-item h-40px" src="/resources/images/logo.svg" alt="logo">
				</a>
				<p class="my-3">스포츠를 사랑하고 배우고자 하는 모든 이들을 위해 만들어 졌습니다. 함께 스포츠를 즐기며 배우고 성장할 수 있는 공간, 그것이 바로 우리의 목표입니다.</p>
			</div>
			<!-- Widget 1 END -->

			<!-- Widget 2 START -->
			<div class="col-lg-6">
				<div class="row g-4">
					<!-- Link block -->
					<div class="col-6 col-md-4">
						<h5 class="mb-2 mb-md-4">종목 / 안내</h5>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="#">종목 안내</a></li>
							<li class="nav-item"><a class="nav-link" href="#">이용 안내</a></li>
							<li class="nav-item"><a class="nav-link" href="#">수강신청</a></li>
						</ul>
					</div>
									
					<!-- Link block -->
					<div class="col-6 col-md-4">
						<h5 class="mb-2 mb-md-4">수강신청</h5>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="#">온라인 수강신청</a></li>
						</ul>
					</div>

					<!-- Link block -->
					<div class="col-6 col-md-4">
						<h5 class="mb-2 mb-md-4">커뮤니티</h5>
						<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="#">공지사항</a></li>
							<li class="nav-item"><a class="nav-link" href="#">QnA 게시판</a></li>
						</ul>
					</div>
				</div>
			</div>
			<!-- Widget 2 END -->

			<!-- Widget 3 START -->
			<div class="col-lg-3">
				<h5 class="mb-2 mb-md-4">문의</h5>
				<!-- Time -->
				<p class="mb-2">
					TEL:<span class="h6 fw-light ms-2">02-6392-0044</span>
					<span class="d-block small">문의 가능 시간: 평일 10:00 ~ 17:00 (점심시간 13:00 ~ 14:00)</span>
				</p>

				<p class="mb-0">Email:<span class="h6 fw-light ms-2">shds.edu03@gmail.com</span></p>

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
					<div class="text-body text-primary-hover"> Copyrights ©2024 SportsCenter. Build by <a href="" target="_blank" class="text-body">ShihanDS_Project1</a></div>
					<!-- copyright links-->
					<div class="justify-content-center mt-3 mt-lg-0">
						<ul class="nav list-inline justify-content-center mb-0">
							<li class="list-inline-item">
							<li class="list-inline-item"><a class="nav-link" href="#">이용약관</a></li>
							<li class="list-inline-item"><a class="nav-link pe-0" href="#">개인정보처리방침</a></li>
						</ul>
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
<script src="assets/vendor/choices/js/choices.min.js"></script>

<!-- Template Functions -->
<script src="assets/js/functions.js"></script>

</body>
</html>
