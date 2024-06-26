<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>시설 안내</title>
<META name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description"
	content="Eduport- LMS, Education and Course Theme">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="/js/script.js"></script>
<!-- Favicon -->
<link rel="shortcut icon" href="/resources/images/favicon.ico">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet">
<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/bootstrap-icons/bootstrap-icons.css">

<!-- Theme CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">

<!-- bootstrap CSS 적용 시 필요 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
/* 기존 스타일 */
ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

.list_box.col3 .contact-list {
	margin: 0 auto;
	width: 80%;
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between; /* Space out the items evenly */
	padding: 0;
	list-style-type: none;
}

.list_box.col3 .contact-item {
	background: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	width: calc(31% - 10px); /* 3열 레이아웃을 위한 설정 */
	margin-bottom: 20px;
}

.list_box.col3 .contact-item .img_box {
	width: 100%;
	overflow: hidden;
}

.list_box.col3 .contact-item .img_box img {
	width: 100%;
	height: auto;
	display: block;
}

.list_box.col3 .contact-item .text_box {
	padding: 15px;
}

.list_box.col3 .contact-item .text_box .title {
	font-size: 1.5em;
	font-weight: bold;
	margin-bottom: 10px;
	color: #333;
	margin-left: 10px;
}

.list_box.col3 .contact-item .text_box ul {
	padding-left: 15px;
}

.list_box.col3 .contact-item .text_box ul li {
	display: flex;
	margin-bottom: 10px;
}

.list_box.col3 .contact-item .text_box ul li span.divi {
	font-weight: bold;
	color: #555;
	margin-right: 2px;
	width: 90px; /* 고정 너비 설정 */
}

.list_box.col3 .contact-item .text_box ul li span.cont {
	color: #777;
	flex-grow: 1; /* 남은 공간을 채우도록 설정 */
}

.list_box.col3 .contact-item2 {
	background: #f9f9f9;
	border: 1px solid #ddd;
	border-radius: 8px;
	overflow: hidden;
	box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
	width: calc(31% - 10px); /* 3열 레이아웃을 위한 설정 */
	margin-bottom: 20px;
	margin-top: 60px;
}

.list_box.col3 .contact-item2 .img_box {
	width: 100%;
	overflow: hidden;
}

.list_box.col3 .contact-item2 .img_box img {
	width: 100%;
	height: auto;
	display: block;
}

.list_box.col3 .contact-item2 .text_box {
	padding: 15px;
}

.list_box.col3 .contact-item2 .text_box .title {
	font-size: 1.5em;
	font-weight: bold;
	margin-bottom: 10px;
	color: #333;
	margin-left: 10px;
}

.list_box.col3 .contact-item2 .text_box ul {
	padding-left: 15px;
}

.list_box.col3 .contact-item2 .text_box ul li {
	display: flex;
	margin-bottom: 10px;
}

.list_box.col3 .contact-item2 .text_box ul li span.divi {
	font-weight: bold;
	color: #555;
	margin-right: 2px;
	width: 90px; /* 고정 너비 설정 */
}

.list_box.col3 .contact-item2 .text_box ul li span.cont {
	color: #777;
	flex-grow: 1; /* 남은 공간을 채우도록 설정 */
}

/* 새로운 스타일 */
.total_page_container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.total_page {
    margin-left: 130px; /* contact-item의 text_box .title의 left margin과 일치시킴 */ 
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<main>
		<!-- Title -->
		<h2 style="font-family: 'Noto Sans KR', sans-serif; font-weight: bold; text-align: center; margin-top: 40px;">시설 안내</h2>
		<div class="col-12"> 
			<!-- Search option START -->
				<div class="total_page_container">
					<!-- Title -->
					<div class="col-md-4" style="padding-top:100px; padding-bottom: 5px;"> 
						<span class="total_page"
							style="font-family: 'Noto Sans KR', sans-serif;">총&nbsp<strong>6</strong>개의 시설이 있습니다.
						</span>
					</div>
				</div>
		</div>
		<div class="list_box col3"
			style="padding-bottom: 100px;">
			<ul class="contact-list">
				<li class="contact-item">
					<div class="img_box">
						<img src="/resources/images/faci_a1.jpg">
					</div>
					<div class="text_box">
						<p class="title">문화교실 I관</p>
						<ul>
							<li><span class="divi">면적 </span> <span class="cont">218.45㎡</span>
							</li>
							<li><span class="divi">운영강좌 </span> <span class="cont">스쿼시,
									줌바댄스, 플라잉요가</span></li>
						</ul>
					</div>
				</li>
				<li class="contact-item">
					<div class="img_box">
						<img src="/resources/images/faci_a3.jpg">
					</div>
					<div class="text_box">
						<p class="title">수영장</p>
						<ul>
							<li><span class="divi">경영풀 </span> <span class="cont">50m
									X 25m</span></li>
							<li><span class="divi">운영종목 </span> <span class="cont">수영,
									아쿠아로빅</span></li>
						</ul>
					</div>
				</li>
				<li class="contact-item">
					<div class="img_box">
						<img src="/resources/images/faci_a4.jpg">
					</div>
					<div class="text_box">
						<p class="title">스피닝바이크룸</p>
						<ul>
							<li><span class="divi">면적 </span> <span class="cont">82.20㎡</span>
							</li>
							<li><span class="divi">기구 </span> <span class="cont">바이크
									41대</span></li>
						</ul>
					</div>
				</li>
				<li class="contact-item2">
					<div class="img_box">
						<img src="/resources/images/faci_a6.jpg">
					</div>
					<div class="text_box">
						<p class="title">점핑트램폴린룸</p>
						<ul>
							<li><span class="divi">면적 </span> <span class="cont">670㎡</span>
							</li>
							<li><span class="divi">기구 </span> <span class="cont">26대</span>
							</li>
						</ul>
					</div>
				</li>
				<li class="contact-item2">
					<div class="img_box">
						<img src="/resources/images/faci_a7.jpg">
					</div>
					<div class="text_box">
						<p class="title">필라테스룸</p>
						<ul>
							<li><span class="divi">면적 </span> <span class="cont">81㎡</span>
							</li>
							<li><span class="divi">운영강좌 </span> <span class="cont">필라테스(매트/기구)</span>
							</li>
						</ul>
					</div>
				</li>
				<li class="contact-item2">
					<div class="img_box">
						<img src="/resources/images/faci_a8.jpg">
					</div>
					<div class="text_box">
						<p class="title">헬스장</p>
						<ul>
							<li><span class="divi">면적 </span> <span class="cont">252.03㎡</span>
							</li>
							<li><span class="divi">기구 </span> <span class="cont">34종</span>
							</li>
						</ul>
					</div>
				</li>
			</ul>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>
