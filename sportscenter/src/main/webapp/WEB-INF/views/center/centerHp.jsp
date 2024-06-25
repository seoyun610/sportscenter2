<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
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
</head>
<style>
.work_call {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 100px; /* 이미지와 텍스트 박스 사이의 간격 조절 */
}

.img_box img {
    width: 500px; /* 이미지를 원하는 크기로 설정 */
    height: auto; /* 이미지 비율 유지 */
}

.text_box {
    display: flex;
    flex-direction: column;
}

.title {
    font-size: 50px;
    font-weight: bold;
}

.call {
    margin-top: 10px;
    color: rgb(49, 105, 196); /* 연락처 크기 조절 */
}

.small {
    font-family: "Noto Sans KR";
    font-size: 16px;
}

hr.line {
    width: 80%;
    color: black;
    border: 3px solid #000000;
    margin: 0 auto;
}

.img_box2 img {
    width: 100px; /* 이미지를 원하는 크기로 설정 */
    height: auto; /* 이미지 비율 유지 */
}

.text_box2 {
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.list_box.col3 {
    margin-top: 70px;
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
    flex: 0 1 calc(28% - 10px);
    justify-content: center;
    box-sizing: border-box;
    display: flex;
    align-items: center; /* Center items vertically */
    gap: 40px;
    margin-top: 10px;
    margin-bottom: 10px;
    border: 1px solid #888888; /* Change border color to gray */
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    border-bottom-right-radius: 15px;
    padding: 20px 10px; /* Increase padding */
    height: 150px; /* Set a fixed height */
}

.list_box.col3 .contact-item2 {
    flex: 0 1 calc(28% - 10px);
    justify-content: center;
    box-sizing: border-box;
    display: flex;
    align-items: center; /* Center items vertically */
    gap: 40px;
    margin-top: 60px;
    margin-bottom: 10px;
    border: 1px solid #888888; /* Change border color to gray */
    border-top-left-radius: 15px;
    border-top-right-radius: 15px;
    border-bottom-right-radius: 15px;
    padding: 20px 10px; /* Increase padding */
    height: 150px; /* Set a fixed height */
}

.list_box.col3 .contact-item .img_box2 {
    flex-shrink: 0; /* Prevent the image from shrinking */
}

 .text_box2 {
    text-align: left;
}

.text_box2 .txt {
	font-family: "Noto Sans KR";
    margin-bottom: -16px;
    font-weight: bolder;
    font-size: 22px;
    margin-top: 15px; /* 추가된 부분: 실장 글씨를 아래로 내리기 */
}

.text_box2 .desc {
	font-family: "Malgun Gothic";
    padding-top: 10px; /* 기존의 여백 */
    margin-top: 10px; /* 추가된 부분: 번호를 아래로 내리기 */
}
</style>
  

<body>
    <%@ include file="/WEB-INF/views/common/header.jsp"%>
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
                        <h1 class="display-6"
                            style="font-family: 'Noto Sans KR', sans-serif;">업무별 연락처</h1>
                    </div>
                </div>
            </div>
        </section>
        <div class="work_call">
            <div class="img_box">
                <img src="/resources/images/상담사 사진.png">
            </div>
            <div class="text_box">
                <h2 class="title">스포츠센터 고객센터</h2>
                <h6 class="small">매주 일요일은 휴관일입니다.</h6>
                <h2 class="call">02-1680-3733~4</h2>
            </div>
        </div>
        <hr class="line">
        <div class="list_box col3" style="padding-bottom: 100px;">
            <ul class="contact-list">
                <li class="contact-item">
                    <div class="img_box2">
                        <img src="/resources/images/call_1.png">
                    </div>
                    <div class="text_box2">
                        <p class="txt">실장</p>
                        <p class="desc">02-1644-2584</p>
                    </div>
                </li>
                <li class="contact-item">
                    <div class="img_box2">
                        <img src="/resources/images/call_1.png">
                    </div>
                    <div class="text_box2">
                        <p class="txt">팀장</p>
                        <p class="desc">02-1644-1674</p>
                    </div>
                </li>
                <li class="contact-item">
                    <div class="img_box2">
                        <img src="/resources/images/call_3.png">
                    </div>
                    <div class="text_box2">
                        <p class="txt">운영사무실</p>
                        <p class="desc">02-1644-1687</p>
                    </div>
                </li>
                <li class="contact-item2">
                    <div class="img_box2">
                        <img src="/resources/images/call_1.png">
                    </div>
                    <div class="text_box2">
                        <p class="txt">수석주임</p>
                        <p class="desc">02-1644-7852</p>
                    </div>
                </li>
                <li class="contact-item2">
                    <div class="img_box2">
                        <img src="/resources/images/call_5.png">
                    </div>
                    <div class="text_box2">
                        <p class="txt">강습상담</p>
                        <p class="desc">02-1678-3732</p>
                    </div>
                </li>
                <li class="contact-item2">
                    <div class="img_box2">
                        <img src="/resources/images/call_6.png">
                    </div>
                    <div class="text_box2">
                        <p class="txt">헬스상담</p>
                        <p class="desc">02-1644-3756</p>
                    </div>
                </li>
                <li class="contact-item2">
                    <div class="img_box2">
                        <img src="/resources/images/call_7.png">
                    </div>
                    <div class="text_box2">
                        <p class="txt">회원안내실</p>
                        <p class="desc">02-1647-3743~4</p>
                    </div>
                </li>
                <li class="contact-item2">
                    <div class="img_box2">
                        <img src="/resources/images/call_8.png">
                    </div>
                    <div class="text_box2">
                        <p class="txt">남자락커</p>
                        <p class="desc">02-1678-3752</p>
                    </div>
                </li>
                <li class="contact-item2">
                    <div class="img_box2">
                        <img src="/resources/images/call_9.png">
                    </div>
                    <div class="text_box2">
                        <p class="txt">여자락커</p>
                        <p class="desc">02-1678-3753</p>
                    </div> 
                </li>
            </ul>
        </div>
    </main>
    <%@ include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>
