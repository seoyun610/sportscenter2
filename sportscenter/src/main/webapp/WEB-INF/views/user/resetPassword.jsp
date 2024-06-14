<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>비밀번호 재설정</title>
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

	<!-- Favicon -->
	<link rel="shortcut icon" href="resources/images/favicon.ico">

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="resources/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap-icons/bootstrap-icons.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="resources/css/style.css">

	<!-- bootstrap CSS 적용 시 필요 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    


</head>
<body>
<!-- <h2>비밀번호 변경</h2>
    <form action="/user/updatePassword.do" method="post">
        <input type="hidden" name="userid" value="${userid}">
        <input type="password" id="newPwd" name="newPwd" placeholder="새로운 비밀번호 입력해주세요." required>
        <button type="submit">확인</button>
    </form> -->
  <!-- **************** MAIN CONTENT START **************** -->
<main>
	<section class="p-0 d-flex align-items-center position-relative overflow-hidden">
				<div class="col-12 col-lg-6 d-flex justify-content-center">
					<div class="row my-5">
						<div class="col-sm-10 col-xl-12 m-auto">

              <!-- Title -->
							<span class="mb-0 fs-1">🤔</span>
							<h2 class="fs-2">비밀번호 변경</h2>
							<h5 class="fw-light mb-4">비밀번호를 잊으셨다면 변경해주세요.</h5>
							
							<!-- Form START -->
							<form action="/user/updatePassword.do" method="post">
								<!-- Email -->
								<div class="mb-4">
									<label for="InputPwd1" class="form-label">비밀번호 *</label>
									<div class="input-group input-group-lg">
										<input type="hidden" name="userid" value="${userid}">
        								<input type="password" class="form-control border-0 bg-light rounded-end ps-1" id="newPwd" name="newPwd" placeholder="새로운 비밀번호 입력해주세요." required>
        								<button type="submit" class="btn btn-primary mb-0" >확인</button>
									</div>
								</div>
							</form>
							<!-- Form END -->
						</div>
					</div> <!-- Row END -->
				</div>
	</section>
</main>
<!-- **************** MAIN CONTENT END **************** -->

<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Template Functions -->
<script src="assets/js/functions.js"></script>
</body>
</html>