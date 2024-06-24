<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>스쿼시 상세페이지</title>
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
		const storedTheme = localStorage.getItem('theme')
		
		const getPreferredTheme = () => {
			if (storedTheme) {
				return storedTheme
			}
			return window.matchMedia('(prefers-color-scheme: light)').matches ? 'light' : 'light'
		}
		
		const setTheme = function (theme) {
			if (theme === 'auto' && window.matchMedia('(prefers-color-scheme: dark)').matches) {
				document.documentElement.setAttribute('data-bs-theme', 'dark')
			} else {
				document.documentElement.setAttribute('data-bs-theme', theme)
			}
		}
		
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
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<!-- **************** MAIN CONTENT START **************** -->
<main>
<!-- **************** MAIN CONTENT START **************** -->
<main>
<!-- =======================
Main banner START -->
<section class="pt-0">
	<div class="container">
		<div class="row">
			<div class="col-12">
				<!-- Card item START -->
				<div class="card overflow-hidden h-400px h-xl-600px rounded-3" style="background-image:url(/resources/images/bg/bgSquash.jpg); background-position: center left; background-size: cover;">
					<!-- Background dark overlay -->
					<div class="bg-overlay bg-dark opacity-3"></div>
					
					<!-- Card image overlay -->
					<div class="card-img-overlay d-flex align-items-start flex-column">
						<!-- Card overlay bottom -->
						<div class="w-100 mt-auto">
							<div class="row p-0 p-sm-3">
								<div class="col-11 col-lg-7">
									<!-- Title -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Card item END -->
			</div>
		</div>
	</div>
</section>

	<div class="container">
		<div class="row">
			<div class="col-12" style="font-family: 'Noto Sans KR', sans-serif;">
				<!-- Content -->
				<h3 style="font-weight: bold; letter-spacing : 0.05em;">
				  <img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
				강좌 개요
				</h3>
				<p style="font-size: 19px; color: grey;">스쿼시는 실내 코트에서 빠른 반사 신경과 민첩성을 요구하는 라켓 스포츠입니다. 고강도의 운동으로 심혈관 건강과 근력을 효과적으로 향상시킬 수 있습니다.</p>
				<h3 style="font-weight: bold; letter-spacing : 0.05em; line-height:200%;">
				 <img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
				프로그램 안내
				</h3>
				<!-- Table -->
				<div class="row mt-4">
					<div class="col-12">
						<div class="table-responsive-md border-0">
							<!-- Table START -->
<table class="table table caption-top table-bordered align-middle p-4 mb-0">
    <!-- Table head -->
    <thead class="border-0">
        <tr class="border-top-0 table-border-color" style="font-family: 'Noto Sans KR', sans-serif; text-align: center; vertical-align: middle;">
            <th scope="col">강좌</th>
            <th scope="col">세부구분</th>
            <th scope="col">강습요일</th>
            <th scope="col">강습시간</th>
            <th scope="col">강습비</th>
        </tr>
    </thead>

	    <!-- Table body START -->
	    <tbody class="border-top-0" style="font-family: 'Noto Sans KR', sans-serif; text-align: center; vertical-align: middle;">
						        <!-- 성인수영 공통 데이터 -->
					        	<tr>
						            <td rowspan="2" style="text-align: center; vertical-align: middle;">
						                <span class="text-body">스쿼시</span>
						            </td>
						            <td><span class="text-body">주3일</span></td>
						            <td><span class="text-body">월,수,금</span></td>
						            <td style="text-align: center; vertical-align: middle;">
						                <span class="text-body">06:00~07:00</span><br>
						                <span class="text-body">07:00~8:00</span><br>
						                <span class="text-body">08:00~9:00</span><br>
						                <span class="text-body">9:00~10:00</span><br>
						                <span class="text-body">10:00~11:00</span><br>
						                <span class="text-body">11:00~12:00</span><br>
						                <span class="text-body">14:00~15:00</span><br>
						                <span class="text-body">15:00~16:00</span><br>
						                <span class="text-body">16:00~17:00</span><br>
						                <span class="text-body">17:00~18:00</span><br>
						                <span class="text-body">18:00~19:00</span><br>
						                <span class="text-body">19:00~20:00</span><br>
						                <span class="text-body">20:00~21:00</span>
						            </td>
						            <td>
						                <span class="text-body">성인: 78,000</span><br>
						                <span class="text-body">청소년: 55,000</span><br>
						                <span class="text-body">어린이: 40,000</span><br>
						            </td>
						            
						        </tr>
						        <tr>
						         
						            <td><span class="text-body">주2일</span></td>
						            <td><span class="text-body">화,목</span></td>
						            <td style="text-align: center; vertical-align: middle;">
						                <span class="text-body">06:00~07:00</span><br>
						                <span class="text-body">07:00~8:00</span><br>
						                <span class="text-body">08:00~9:00</span><br>
						                <span class="text-body">9:00~10:00</span><br>
						                <span class="text-body">10:00~11:00</span><br>
						                <span class="text-body">11:00~12:00</span><br>
						                <span class="text-body">14:00~15:00</span><br>
						                <span class="text-body">15:00~16:00</span><br>
						                <span class="text-body">16:00~17:00</span><br>
						                <span class="text-body">17:00~18:00</span><br>
						                <span class="text-body">18:00~19:00</span><br>
						                <span class="text-body">19:00~20:00</span><br>
						                <span class="text-body">20:00~21:00</span>
						            </td>
						            <td>
						                <span class="text-body">성인: 78,000</span><br>
						                <span class="text-body">청소년: 55,000</span><br>
						                <span class="text-body">어린이: 40,000</span><br>
						            </td>
						            
						        </tr>
								<!-- Table body END -->
							</table>
							<!-- Table END -->
							<p>준비물 : 운동복, 실내 운동화, 수건,샤워도구</p>
							<p>*변동사항은 공지사항을 통해 확인해주세요.</p>
							
							<h3 style="font-weight: bold; line-height:250%; letter-spacing : 0.02em;">
							 <img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
							강습특징, 기초부터 고난도 기술까지 체계적인 강습 제공
							</h3>
							<P style="font-size: 19px; color: grey;">스포츠센터는 국제공인 규격(가로 6.4m 세로 9.75m 높이 4.57m)의 스쿼시 코트 3개를 구비하고 성인과 청소년을 대상으로 스쿼시 강습 프로그램을 운영하고 있습니다. 선수 출신의 스쿼시 전문 지도강사를 기용해 포핸드 드라이브에서 발리, 드롭샷 등 고난도 기술에 이르기까지 체계적으로 지도해 드립니다.
짧은 시간에 많은 운동량을 소화할 수 있는 경제적인 스포츠, 스쿼시로 체력도 기르고 자신감도 되찾아보세요.</P>
							
							<h3 style="font-weight: bold; line-height:200%; letter-spacing : 0.02em;">
							 <img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
							운동효과, 1분당 칼로리 소모량 15㎉… 체중감량 효과 ‘최고’
							</h3>
							<P style="font-size: 19px; color: grey;">벽에 맞아 튀어나오는 공을 받아치기 위해서는 신체의 모든 부분을 이용해야 하므로, 근력과 지구력, 민첩성, 심폐기능 향상 등 종합적인 체력증진 효과를 볼 수 있습니다.
특히 1분당 칼로리 소모량이 15㎉에 달해 체중감량 효과가 뛰어난 스쿼시는 다이어트에 관심이 집중되는 요즘, 현대인들이 가장 선호하는 스포츠로 손꼽히고 있습니다.
							</P>
							<a href="/subject/view.do" style="display: inline-block; padding: 18px 30px; font-size: 16px; font-family: 'Noto Sans KR', sans-serif; color: #fff; background-color: #000; border: none; border-radius: 0px; text-decoration: none; text-align: center; transition: background-color 0.3s ease; margin-left:42%;">
					            목록으로
					        </a>
						</div>
					</div>
				</div>
<!-- =======================
Action Box START-->
<section class="pt-0" style="margin-top: 5%;">
	<div class="container position-relative" >
		<!-- SVG decoration START -->
		<figure class="position-absolute top-50 start-50 translate-middle ms-2">
			<svg>
				<path class="fill-white opacity-4" d="m496 22.999c0 10.493-8.506 18.999-18.999 18.999s-19-8.506-19-18.999 8.507-18.999 19-18.999 18.999 8.506 18.999 18.999z"></path>
				<path class="fill-white opacity-4" d="m775 102.5c0 5.799-4.701 10.5-10.5 10.5-5.798 0-10.499-4.701-10.499-10.5 0-5.798 4.701-10.499 10.499-10.499 5.799 0 10.5 4.701 10.5 10.499z"></path>
				<path class="fill-white opacity-4" d="m192 102c0 6.626-5.373 11.999-12 11.999s-11.999-5.373-11.999-11.999c0-6.628 5.372-12 11.999-12s12 5.372 12 12z"></path>
				<path class="fill-white opacity-4" d="m20.499 10.25c0 5.66-4.589 10.249-10.25 10.249-5.66 0-10.249-4.589-10.249-10.249-0-5.661 4.589-10.25 10.249-10.25 5.661-0 10.25 4.589 10.25 10.25z"></path>
			</svg>
		</figure>
		<!-- SVG decoration END -->
		
		<div class="row">
			<div class="col-12">
				<div class="bg-danger p-4 p-sm-5 rounded-3">
					<div class="row position-relative">
						<!-- Svg decoration -->
						<figure class="fill-white opacity-1 position-absolute top-50 start-0 translate-middle-y">
							<svg width="141px" height="141px">
								<path d="M140.520,70.258 C140.520,109.064 109.062,140.519 70.258,140.519 C31.454,140.519 -0.004,109.064 -0.004,70.258 C-0.004,31.455 31.454,-0.003 70.258,-0.003 C109.062,-0.003 140.520,31.455 140.520,70.258 Z"></path>
							</svg>
						</figure>
						<!-- Action box -->
						<div class="col-11 mx-auto position-relative">
							<div class="row align-items-center">
								<!-- Title -->
								<div class="col-lg-7">
									<h3 class="text-white">프로그램에 더 궁금한 게 있으신가요?</h3>
									<p class="text-white mb-3 mb-lg-0">궁금하신 사항은 QnA 게시판을 통해 문의해주세요.</p>
								</div>
								<!-- Content and input -->
								<div class="col-lg-5 text-lg-end">
									<a href="/qna/index.do" class="btn btn-warning mb-0">QnA</a>
								</div>
							</div>
						</div>
					</div> <!-- Row END -->
				</div>
			</div>
		</div> <!-- Row END -->
	</div>
</section>
<!-- =======================
Action Box END-->

</main>
<!-- **************** MAIN CONTENT END **************** -->





<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>