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
    
    <!-- CSS -->
    <style>
        .container {
         width: 400 px;
         margin: 50 px auto;
         padding: 20 px;
         border: 1 px solid #ccc;
         border-radius: 10 px;
         box-shadow: 0 0 10 px rgba(0, 0, 0, 0.1);
         text-align: center; /* 컨테이너 안의 요소들 가운데 정렬 */
     }

        .form-container {
             display: none; /* 모든 폼을 숨김 */
         }

         .buttons {
             display: flex;
             justify - content: center;
             margin - bottom: 0; /* 버튼과 구분선 사이 간격 제거 */


         }

         .btn {
             width: auto; /* 버튼의 너비를 내용에 맞게 자동 조정 */
             min-width: 300 px; /* 최소 너비를 설정하여 너비가 내용보다 짧지 않도록 함 */
             margin: 0; /* 기존의 마진 제거 */
             cursor: pointer;
             display: inline - block;
             padding: 15 px 20 px;
             color: #b1b1b1!important;
             border: 1 px solid #3F9CFF;
             font-size: 40px;
     
            }
       
        .btn.active {
            background-color: #0056b3; /* 활성화된 버튼의 색상 */
            border-color: #0056b3;
        }
        
        .separator {
            border-top: 1px solid # ddd;
             margin: 0; /* 상하 마진 제거 */
             width: 100 % ; /* 구분선을 전체 너비로 설정 */
         }

         .div p {
             text-align: center;
             font-size: 15 px; /* 폰트 크기 조정 */
             font-weight: bold; /* 볼드 처리 */
             margin-top: 20 px;
         }

         .submit-btn-container {
             text-align: center;
         } 		   
   </style>
    
   <!-- Favicon -->
	<link rel="shortcut icon" href="assets/images/favicon.ico">

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
   
   <!-- script  -->
   <script>
        $(document).ready(function() {
            // 초기 로드시 아이디 찾기 폼을 보이게 설정하고 버튼 색상 설정
            $("#findId_container").show();
            $("#findPassword_container").hide();
            $(".btn").eq(0).addClass("active"); // 첫 번째 버튼을 활성화
        });

        function showForm(formId) {
            $(".form-container").hide();
            $("#" + formId).show();
            $(".btn").removeClass("active"); // 모든 버튼의 활성화 클래스 제거
            if (formId === 'findId_container') {
                $(".btn").eq(0).addClass("active"); // 첫 번째 버튼 활성화
            } else {
                $(".btn").eq(1).addClass("active"); // 두 번째 버튼 활성화
            }
        }

        function findId() {
            console.log("findId 함수가 호출되었습니다.");
            $.ajax({
                url: '/user/findId.do',
                data: {
                    username: $("#username").val(),
                    birth: $("#birth").val(),
                    hp: $("#hp").val()
                },
                type: 'POST',
                success: function(res) {
                    if (res === "fail") {
                        alert("일치하는 회원 정보가 없습니다.");
                    } else {
                        $("#idBox").text("찾으시는 아이디는 " + res + "입니다.").show();
                    }
                },
                error: function(err) {
                    alert("오류가 발생했습니다. 다시 시도해 주세요.");
                }
            });
        }

        function findPassword() {
            $.ajax({
                url: '/user/findPassword.do',
                data: {
                    userid: $("#userid2").val(),
                    birth: $("#birth2").val(),
                    hp: $("#hp2").val()
                },
                type: 'POST',
                success: function(res) {
                    if (res === "fail") {
                        alert("일치하는 회원 정보가 없습니다.");
                    } else {
                        window.location.href = '/user/resetPassword.do?userid=' + $("#userid2").val();
                    }
                },
                error: function(err) {
                    alert("오류가 발생했습니다. 다시 시도해 주세요.");
                }
            });
            return false;
        }
    </script>
    
 	
</head>
<body>
     <div class="container">
        <!-- Title -->
        <div class="text-center" style="font-size: 2rem;">
            <span class="mb-0 fs-1">🤔</span>
            <h2>아이디/비밀번호 찾기</h2>
        </div>

        <!-- 버튼 -->
        <div class="buttons text-center">
            <button class="btn" type="button" onclick="showForm('findId_container')">아이디 찾기</button>
            <button class="btn" type="button" onclick="showForm('findPassword_container')">비밀번호 변경</button>
        </div>

        <!-- 구분선 -->
        <div class="separator"></div>

        <!-- 아이디 찾기 폼 -->
			<div>
		      <p>입력하신 정보는 아이디 찾기에만 사용되며 저장되지 않습니다.</p> 
		    </div>
		    <div id="findId_container" class="form-container">
				<form class="form-horizontal" role="form" onsubmit="findId(); return false;">
					<div class="mb-4">	
						<div class="input-group input-group-lg">
							<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
							<input type="text" class="form-control border-0 bg-light rounded-end ps-1" id="username" name="username" placeholder="이름" required autofocus>
						</div>
					</div>
					<div class="mb-4">
						<div class="input-group input-group-lg">
							<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
							<input type="text" class="form-control border-0 bg-light rounded-end ps-1" id="birth" name="birth" placeholder="YYMMDD" required>
						</div>
					</div>
					<div class="mb-4">	
						<div class="input-group input-group-lg">
							<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
							<input type="text" class="form-control border-0 bg-light rounded-end ps-1" id="hp" name="hp" placeholder="000-0000-0000" required>
						</div>
					</div>
					<div class="submit-btn-container">	
						<button type="submit" class="btn btn-primary">찾기</button>
					</div>
		 		</form>
		 		<!-- 결과 메시지를 표시할 박스 -->
		 		<div id="idBox" style="display:none; margin-top: 20px;"></div>
			</div>
		
        
        <!-- 비밀번호 찾기 폼-->
		<div id="findPassword_container" class="form-container">
        	<form class="form-horizontal" role="form" onsubmit="findPassword(); return false;">
				<div class="mb-4">	
					<div class="input-group input-group-lg">
						<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
						<input type="text" class="form-control border-0 bg-light rounded-end ps-1" id="userid2" name="userid" placeholder="아이디" required autofocus>
					</div>
				</div>
				<div class="mb-4">
					<div class="input-group input-group-lg">
						<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
						<input type="text" class="form-control border-0 bg-light rounded-end ps-1" id="birth2" name="birth" placeholder="YYMMDD" required>
					</div>
				</div>
				<div class="mb-4">	
					<div class="input-group input-group-lg">
						<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
						<input type="text" class="form-control border-0 bg-light rounded-end ps-1" id="hp2" name="hp" placeholder="000-0000-0000" required>
					</div>
				</div>
				<div class="submit-btn-container">	
					<button type="submit" class="btn btn-primary">다음</button>
				</div>
		 	</form>
		</div>
      </div>
    
		<!-- Back to top -->
		<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>
		
		<!-- Bootstrap JS -->
		<script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
		
		<!-- Template Functions -->
		<script src="assets/js/functions.js"></script>					
	</body>
</html>