<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>스피닝 상세페이지</title>
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
				<div class="card overflow-hidden h-400px h-xl-600px rounded-3" style="background-image:url(/resources/images/bg/bgSpinning.jpg); background-position: center left; background-size: cover;">
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
				<p style="font-size: 19px; color: grey;">줌바댄스는 라틴댄스에서 영감을 받은 댄스피트니스 프로그램으로 라틴음악 및 세계음악을 사용하여 역동적이고, 흥미롭고, 즐거우며, 효과적인 운동입니다. 줌바댄스를 배우는 동안 뛰어난 코어운동으로 복부와 전신의 근육강화를 돕고 높은 열량을 소비하게 되어 건강유지 및 다이어트에 효과적입니다.</p>
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
						                <span class="text-body">줌바댄스</span>
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
						                <span class="text-body">성인 및 청소년: 78,000</span><br>
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
						                 <span class="text-body">성인 및 청소년: 78,000</span><br>
						            </td>
						            
						        </tr>
								<!-- Table body END -->
							</table>
							<!-- Table END -->
							<p>*변동사항은 공지사항을 통해 확인해주세요.</p>
							
							<h3 style="font-weight: bold; line-height:250%; letter-spacing : 0.02em;">
							 <img src="/resources/images/element/circle.png" alt="동그라미 이미지" style="width: 30px; height: 30px; margin-right: 10px;">
							운동효과
							</h3>
							<P style="font-size: 19px; color: grey;">줌바댄스는 라틴댄스와 피트니스가 결합된 운동으로 신나는 라틴음악에 맞춰 간단한 동작을 반복함으로써 초보자도 쉽게 따라할 수 있어 청장년층으로부터 호응이 매우 높고, 신바람 실버 체조, 도구를 활용한 운동, 두뇌 활동에 좋은 손·유희 등 다양한 건강증진 프로그램운영으로 유연성과 근력강화가 가능한 운동입니다.</P>
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