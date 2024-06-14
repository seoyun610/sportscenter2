<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head> 
    <title>login</title>
    <meta charset="utf-8">
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Eduport- LMS, Education and Course Theme">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <script src="/js/script.js"></script>
    <style>
        /* 로그인 버튼과 회원가입 링크 사이의 선 스타일 */
        .separator {
            border-top: 1px solid #ddd;
            margin: 20px 0; /* 위 아래로 간격을 둠 */
        }
        #userid::placeholder {
		    font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
		    font-size: 15px; /* 원하는 폰트 크기로 변경 */
		    color: #999; /* 원하는 폰트 색상으로 변경 */
	}
	#pwd::placeholder {
		    font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
		    font-size: 15px; /* 원하는 폰트 크기로 변경 */
		    color: #999; /* 원하는 폰트 색상으로 변경 */
	}
	 .spacing-1 {
      margin-left: 330px; /* 원하는 간격(마진)을 설정 */
    }
	</style>
    <!-- Script -->  
    <script>
    function loginCheck() {
    	if ($("#userid").val() == '') {
    		alert("아이디를 입력해 주세요");
    		$("#email").focus();
    		return false;
    	}
    	if ($("#pwd").val() == '') {
    		alert("비밀번호를 입력해 주세요");
    		$("#pwd").focus();
    		return false;
    	}
    	$("#loginFrm").submit();
    }
    </script>
    
    <!-- 부트스트랩 관련 -->
    	<!-- Favicon -->
		<link rel="shortcut icon" href="assets/images/favicon.ico">
		<!-- Plugins CSS -->
		<link rel="stylesheet" type="text/css" href="/resources/vendor/font-awesome/css/all.min.css">
		<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap-icons/bootstrap-icons.css">
		<!-- Theme CSS -->
		<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
		<!-- bootstrap CSS 적용 시 필요 -->
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	
	</head> 
	<body>
		<!--MAIN CONTENT START -->
		<main>
			<section class="p-0 d-flex align-items-center position-relative overflow-hidden">
						<div class="col-12 col-lg-6 m-auto">
							<div class="row my-5">
								<div class="col-sm-10 col-xl-8 m-auto">
									<!-- Title -->
									<div class="text-center">
										<span class="mb-0 fs-1" style="font-size: 3rem; display: inline-block;">👋</span>
										<h1 class="fs-2" style="font-family: 'Noto Sans KR', sans-serif; font-weight: 700;">로그인</h1>
										<p class="lead mb-4" style="font-size: 18px; font-family: 'Noto Sans KR', sans-serif;">스포츠 문화 센터에 오신 걸 환영합니다.</p>
									</div>
									<!-- Form START -->
									<form id="loginFrm" action="login.do" method="post">
										<!-- Id -->
										<div class="mb-4">
											<label for="inputId1" class="form-label">아이디 *</label>
											<div class="input-group input-group-lg">
												<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-envelope-fill"></i></span>
												<input type="text" id="userid" name="userid" class="form-control border-0 bg-light rounded-end ps-1" placeholder="아이디" >
											</div>
										</div>
										<!-- Password -->
										<div class="mb-4">
											<label for="inputPassword5" class="form-label">비밀번호 *</label>
											<div class="input-group input-group-lg">
												<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
												<input type="password" id="pwd" name="pwd" class="form-control border-0 bg-light rounded-end ps-1" placeholder="비밀번호">
											</div>
											<div id="passwordHelpBlock" class="form-text" style="font-size:13px; line-height: 2.1;">
												* 비밀번호는 8자 이상이어야 합니다.
											</div>
										</div>
										<div class="mb-4 d-flex justify-content-between">
											<div class="text-primary-hover">
												<a href="findId.do" class="text-secondary">
													<u style="font-size:13px;">아이디/비밀번호 찾기</u>
												</a>
												<button class="btn btn-primary mb-0 spacing-1" type="button" onclick="loginCheck()">Login</button>
											</div>
										</div>
										
									</form>
									<!-- Form END -->
									
									<!-- Separator -->
									<div class="separator"></div>
									
							<!-- Sign up link -->
							<div class="mt-4 text-center">
								<span style="font-family: 'Noto Sans KR', sans-serif; font-weight: 550;">아직 계정이 없으신가요? <a href="join.do">회원가입</a></span>
							</div>
						</div>
					</div> <!-- Row END -->
				</div>
			</div> <!-- Row END -->
		</div>
	</section>
</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- Back to top -->
<!--<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>  -->

<!-- Bootstrap JS -->
<!--<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>  -->

<!-- Template Functions -->
<!-- <script src="assets/js/functions.js"></script> -->

</body>
</html>