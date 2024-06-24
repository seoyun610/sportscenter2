<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Eduport- LMS, Education and Course Theme"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="/js/script.js"></script>
    
    <!-- Dark mode -->
	<script>
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
	   <!-- Favicon -->
	<link rel="shortcut icon" href="/resources/images/favicon.ico">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap-icons/bootstrap-icons.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	
	<!-- bootstrap CSS 적용 시 필요 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	
   </head>
   

<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- **************** MAIN CONTENT START **************** -->
<main>
<!-- =======================
Page Banner START -->
<section class="bg-light py-5">
	<div class="container">
		<div class="row g-4 g-md-5 position-relative">
			

			<!-- Title and Search -->
			<div class="col-lg-10 mx-auto text-center position-relative">
				
				<!-- Title -->
				<h1 class="display-6" style="font-family: 'Noto Sans KR', sans-serif;">이용안내</h1>
			</div>
	<!-- Category START -->
      <div class="col-12">
				<div class="row g-4 text-center">
				  <p class="mb-0"></p>
					<!-- Category item -->
					<div class="col-sm-6 col-md-3">
						<div class="card card-body  p-0">
							<a class="p-3">
								<h2><i class="fas fa-street-view"></i></h2>
								<h6 class="mb-0">운영시간</h6>
							</a>
						</div>
					</div>

					<!-- Category item -->
					<div class="col-sm-6 col-md-3">
						<div class="card card-body card p-0">
							<a class="p-3">
								<h2><i class="fas fa-hands-helping"></i></h2>
								<h6 class="mb-0">운영안내</h6>
							</a>
						</div>
					</div>

					<!-- Category item -->
					<div class="col-sm-6 col-md-3">
						<div class="card card-body card p-0">
							<a class="p-3">
								<h2><i class="fas fa-exclamation-circle"></i></h2>
								<h6 class="mb-0">회원등록</h6>
							</a>
						</div>
					</div>

					<!-- Category item -->
					<div class="col-sm-6 col-md-3">
						<div class="card card-body card p-0">
							<a class="p-3">
								<h2><i class="fas fa-flag"></i></h2>
								<h6 class="mb-0">사물함/주차 이용</h6>
							</a>
						</div>
					</div>
				</div> <!-- Row END -->
      </div>
			<!-- Category END -->
		</div>
	</div>
</section> 
<!-- =======================
Page Banner END -->

<!-- =======================
Page content START -->
<section class="pt-5 pb-0 pb-lg-5" style="font-family: 'Noto Sans KR', sans-serif; vertical-align: middle;" >
	<div class="container">
		<h3 style="font-weight: bold;">
			<img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
				운영시간
				</h3>
					<!-- Table -->
				<div class="row mt-4">
					<div class="col-12">
						<div class="table-responsive-md border-0">
							<!-- Table START -->
<table class="table table caption-top table-bordered align-middle p-4 mb-0">
    <!-- Table head -->
    <thead class="border-0">
        <tr class="border-top-0 table-border-color">
            <th scope="col" style="text-align: center; vertical-align: middle;" >월~금</th>
        </tr>
    </thead>

	    <!-- Table body START -->
	    <tbody class="border-top-0">
						        <!-- 성인수영 공통 데이터 -->
					        	<tr>
						            <td rowspan="2" style="text-align: center; vertical-align: middle;">
						                <span class="text-body">6:00 ~ 21:00</span>
						            </td>
						        </tr>
								<!-- Table body END -->
							</table>
							<!-- Table END -->
						<p style="color: #ec5353; margin-bottom: 5px;">※휴관일 : 일요일, 법정공휴일, 임시공휴일, 법정휴일, 대체공휴일 등</p>
						<p style="margin-top: 5px; margin-bottom: 50px;">*센터 사정에 따라 휴관일은 변경될 수 있습니다.</p> 
	
				
				<h3 style="font-weight: bold;">
		        	<img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
		        	운영안내
		    	</h3>
		    
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">강습 :</p>
		        <p style="margin: 0 0 0 5px;">1시간 강습</p>
		    </div>
		    
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">헬스 :</p>
		        <p style="margin: 0 0 0 5px;">1일 1회 입장 (수강신청 시간만 이용 가능)</p>
		    </div>
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">준비물 :</p></div>
		        <p style="margin: 0 0 0 5px;">
		        -공통: 개인샤워도구<br/>
		        -헬스: 운동복,실내운동화 <br/>
		        -수영: 수영복, 수영모자, 수경 <br/>
		       ※비키니, 반팔, 반바지 등 물놀이 시설에서 착용하는 비강습용 복장은 제한됩니다.<br/>
		       	-기타 수강종목별 개인장비 등 <br/>
		       </p>
		    </div>
		    <p style="color: #ec5353; margin-bottom: 5px; margin-bottom: 50px;">※프로그램별 최소 인원 미만 접수시 합반 또는 변경(폐강)될 수 있습니다.</p> 
			</div>
			
			
			<h3 style="font-weight: bold;">
		        	<img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
		        	회원등록안내
		    	</h3>
		    
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;"> 기존회원 :</p>
		        <p style="margin: 0 0 0 5px;"> 매월 21일부터 26일, 신규회원은 27일부터 말일까지</p>
		    </div>
		    
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;"> 수영 신규기초반  및 신설강습반 :</p>
		        <p style="margin: 0 0 0 5px;">매월 20일부터 말일까지 가능</p>
		    </div>
		    
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;"> 온라인 등록:</p>
		        <p style="margin: 0 0 0 5px;"> 재등록은 매월 21일 00:10부터 26일 23:50까지 / 신규등록은 매월 27일 00:10부터 말일 23:50까지</p>
		    </div>
				<p style="color: #ec5353; margin: 0 0 0 5px;"> ※ 단, 매일 23:50~00:10까지는 온라인시스템 정산으로 일시 등록불가</p>
		    	<p style="margin: 0 0 0 5px; margin-bottom: 50px;"> ※ 자세한 사항은 수강 신청 안내 페이지 참고</p>	
		   
		   <h3 style="font-weight: bold;">
		        	<img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
		        	사물함 이용
		    	</h3>
		    
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">이용방법 :</p>
		        <p style="margin: 0 0 0 5px;">회원안내실 직원에게 신청(여분이 없을 경우 대기자 신청)</p>
		    </div>
		    
		      <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">개인사물함 :</p>
		        <p style="margin: 0 0 0 5px;">월 5,000원 (보증금 10,000원 별도)</p>
		    </div>				
				<p style="color: #ec5353; margin: 0 0 0 5px;"> ※ 반납 시 보증금 환불, 2개월 미수강시 이용불가(사물함 반납) </p>
			<div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="margin: 0 0 0 5px;">강습을 하지 않을 때에도 이용료는 지불</p>
		    </div>	
		    <p style="margin: 0 0 0 5px;"> ※ 2개월 미수강 회원께서는 사물함 사용이 제한되오니, 방문하셔서 보증금 환불을 받으시기 바랍니다.</p>	
			<p style="margin: 0 0 0 5px; margin-bottom: 50px;"> ※ 사물함 이용 중단, 종료 시에 회원안내실에 통보하지 않을 경우 계속 사용하는 것으로 간주되어월이용료가 부과됨으로 꼭 반납 및 통보하여 주시기 바랍니다.</p>
			
			<h3 style="font-weight: bold;">
		        	<img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
		        	주차 안내
		    	</h3>
		    
		    <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">주차요금 :</p>
		        <p style="margin: 0 0 0 5px;">: 1종목당 3시간, 강습요일에 한해 무료주차(2종목 이상 이용 시 강습개수에 맞춰 무료주차)</p>
		    </div>
		    
		      <div style="margin-bottom: 5px; display: flex; align-items: center;">
		        <img src="/resources/images/element/circle.png" alt="목록 동그라미" style="width: 10px; height: 10px; margin-right: 5px;">
		        <p style="font-weight: bold; margin: 0;">준비서류 :</p>
		        <p style="margin: 0 0 0 5px;">차량등록증(가족명의일 경우 가족관계증명서 등 관련 증빙서류)</p>
		    </div>				
				<p style= "margin: 0 0 0 5px;"> ※ 본인 등록요일 외 주차, 미 지정차량 이용 시 주차요금 징수 </p>
				<p style= "margin: 0 0 0 5px;"> ※ 1인당 1차량만 등록 가능 </p>
				<p style= "margin: 0 0 0 5px;"> ※ 헬스에 한해 1회 4시간 </p>
		    </div>	
</section>
<!-- =======================
Page content END -->

</main>
<!-- **************** MAIN CONTENT END **************** -->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Template Functions -->
<script src="assets/js/functions.js"></script>
</body>
</html>