<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <title>Admin login</title>
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
    <script>
    function loginCheck() {
    	if ($("#adminid").val() == '') {
    		alert("아이디를 입력해 주세요");
    		$("#adminid").focus();
    		return false;
    	} 
    	if ($("#adminpwd").val() == '') {
    		alert("비밀번호를 입력해 주세요");
    		$("#adminpwd").focus();
    		return false;
    	}
    }
    </script>
    <!-- Favicon -->
	<link rel="shortcut icon" href="/resources/images/favicon.ico">
	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap-icons/bootstrap-icons.css">
	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	<!-- bootstrap CSS 적용 시 필요 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	</head> 
<body>
<main>
	
	<section class="p-0 d-flex align-items-center position-relative overflow-hidden">
		<div class="col-12 col-lg-6 m-auto">
		<div class="row my-5">
		<div class="col-sm-10 col-xl-8 m-auto">
		<div class="text-center">
		<img class="fs-2 mb-4 mt-8" src="/resources/images/sportscenter.png" alt="img" style="width: 20%; height: auto;">
		<h1 class="fs-2 mb-4" style="font-family: 'Noto Sans KR', sans-serif; font-weight: 700;">관리자 로그인</h1>
		</div>
        <form action="adminLogin.do" method="post" id="adminLogin" onsubmit="return loginCheck();">
            <div class="mb-4">
               	<label for="inputId1" class="form-label">아이디 *</label>
				<div class="input-group input-group-lg">
				<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-envelope-fill"></i></span>
				<input type="text" id="adminid" name="adminid" class="form-control border-0 bg-light rounded-end ps-1" placeholder="아이디" >
				</div>
			</div>
			<div class="mb-4">
               	<label for="inputId1" class="form-label">비밀번호 *</label>
				<div class="input-group input-group-lg">
				<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-envelope-fill"></i></span>
				<input type="password" id="adminpwd" name="adminpwd" class="form-control border-0 bg-light rounded-end ps-1" placeholder="비밀번호" >
				</div>
			</div>
			<div class="mb-4 text-center">
			<input type="submit" class="btn btn-primary mb-0 spacing-2" type="button" onclick="loginCheck()" value="로그인">
			</div>
            </form>
            </div>
		</div>
 		</div>
 	</section>
 	</main>
</body> 
</html>