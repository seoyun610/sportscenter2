<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head> 
    <title>아이디 찾기 / 비밀번호 변경</title>
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

      
      
     	#username::placeholder {
		  font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
		  font-size: 15px; /* 원하는 폰트 크기로 변경 */
		  color: #999; /* 원하는 폰트 색상으로 변경 */	   
		  }
		  
		#birth::placeholder{
		  font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
		  font-size: 15px; /* 원하는 폰트 크기로 변경 */
		  color: #999; /* 원하는 폰트 색상으로 변경 */	    
        }
        
        #hp::placeholder {
		  font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
		  font-size: 15px; /* 원하는 폰트 크기로 변경 */
		  color: #999; /* 원하는 폰트 색상으로 변경 */	  
		  }
		  
        #userid2::placeholder {
		  font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
		  font-size: 15px; /* 원하는 폰트 크기로 변경 */
		  color: #999; /* 원하는 폰트 색상으로 변경 */	   
		  }
        
         #birth2::placeholder {
		  font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
		  font-size: 15px; /* 원하는 폰트 크기로 변경 */
		  color: #999; /* 원하는 폰트 색상으로 변경 */	   
		  }
		  
		  #hp2::placeholder {
		  font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
		  font-size: 15px; /* 원하는 폰트 크기로 변경 */
		  color: #999; /* 원하는 폰트 색상으로 변경 */	   
		  }
		  
		  .separator {
            border-top: 1px solid #ddd;
            margin: 10px 10px; /* 위 아래로 간격을 둠 */
        }
        
  
        
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
         
   </style>
    
   <!-- Favicon -->
	<link rel="shortcut icon" href="assets/images/favicon.ico">

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
     
   <div class="col-12 col-lg-6 m-auto">
	<div class="row my-5">
		<div class="col-sm-10 col-xl-8 m-auto">
		<!-- Title -->
		 <h2 style="text-align: center; font-weight: 700; margin-bottom: 30px;" >아이디/비밀번호 찾기</h2>
        <!-- 버튼 -->
        <div class="buttons text-center" style="margin-bottom: 0;">
    <button class="btn" id="findId" type="button" onclick="showForm('findId_container')" style="font-family: 'Noto Sans KR', sans-serif; width: 220px; background-color: #0d6efd; color: white; border: none; padding: 10px; cursor: pointer; outline: none; transition: background-color 0.3s, color 0.3s;">아이디 찾기</button>
    <button class="btn" id="findPwd" type="button" onclick="showForm('findPassword_container')" style="font-family: 'Noto Sans KR', sans-serif; width: 220px; background-color: #0d6efd; color: white; border: none;  padding: 10px; cursor: pointer; outline: none; transition: background-color 0.3s, color 0.3s;">비밀번호 찾기</button>
    <div class="separator" style="margin-top: 0;"></div>
</div>
		
        <!-- 아이디 찾기 폼 -->
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
							<input type="text" class="form-control border-0 bg-light rounded-end ps-1" id="birth" name="birth" placeholder="YYYYMMDD" required>
						</div>
					</div>
					<div class="mb-4">	
						<div class="input-group input-group-lg">
							<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
							<input type="text" class="form-control border-0 bg-light rounded-end ps-1" id="hp" name="hp" placeholder="000-0000-0000" required>
						</div>
					</div>
					<div class="submit-btn-container" style="text-align: center">	
						<button type="submit" class="btn btn-primary" style="padding: 10px 255px; font-size: 15px;">찾기</button>
					</div>
		 		</form>
		 		<!-- 결과 메시지를 표시할 박스 -->
		 		<div id="idBox" style="display:none; margin-top: 20px; font-size:20px;"></div>
			</div>
		
        
        <!-- 비밀번호 찾기 폼-->
		<div id="findPassword_container" class="form-container">
        	<form class="form-horizontal" role="form" onsubmit="findPassword(); return false;">
				<div class="mb-4">	
					<div class="input-group input-group-lg">
						<span class="input-group-text bg-light rounded-start border-0 text-secondary 10px-3"><i class="fas fa-lock"></i></span>
						<input type="text" class="form-control border-0 bg-light rounded-end ps-1" id="userid2" name="userid" placeholder="아이디" required autofocus>
					</div>
				</div>
				<div class="mb-4">
					<div class="input-group input-group-lg">
						<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
						<input type="text" class="form-control border-0 bg-light rounded-end ps-1" id="birth2" name="birth" placeholder="YYYYMMDD" required>
					</div>
				</div>
				<div class="mb-4">	
					<div class="input-group input-group-lg" style="text-align: center">
						<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
						<input type="text" class="form-control border-0 bg-light rounded-end ps-1" id="hp2" name="hp" placeholder="000-0000-0000" required>
					</div>
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