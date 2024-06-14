<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head> 
    <title>join</title>
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
	<link rel="shortcut icon" href="assets/images/favicon.ico">
	
	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap-icons/bootstrap-icons.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	
	<!-- bootstrap CSS 적용 시 필요 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
    <style>
    body, h2, .form-label, .form-control, .btn {
    		font-family: 'Noto Sans KR', sans-serif;
		} /*Noto Sans KR */
	
	.btn.btn-secondary {
		width: 100px;
	    background-color: #0d6efd;
    	color: white; /* 버튼 텍스트 색상 */ 
	}

	.btn.btn-secondary:hover {
    	background-color: #0056b3; /* 마우스 호버 시 배경색 */
    	color: white; /* 마우스 호버 시 텍스트 색상 */
	}	
	
	
	.form-label {
            font-weight: 700; /* bold */
            font-size: 15px;
    }
    
    .separator {
            border-top: 1px solid #ddd;
            margin: 20px 0; /* 위 아래로 간격을 둠 */
        }
    .btn-cancel {
        background-color: #ced4da; /* 회색 배경색 */
        color: white; /* 흰색 텍스트색 */
        border-color: #ced4da; /* 회색 테두리색 */
        flex: 1;
    }

    .btn-cancel:hover,
    .btn-cancel:focus {
        background-color: #495057; /* 더 어두운 회색 배경색 */
        border-color: #495057; /* 더 어두운 회색 테두리색 */
    	color: white;
    }

    .btn-save {
        background-color: #0d6efd; /* 파란색 배경색 */
        border-color: #0d6efd; /* 파란색 테두리색 */
        color: white;
        flex: 1; 
    }

    .btn-save:hover,
    .btn-save:focus {
        background-color: #0056b3; /* 더 어두운 파란색 배경색 */
        border-color: #0056b3; /* 더 어두운 파란색 테두리색 */
        color: white; 
    }
    
     .btnSet .text-center {
        display: flex;
        justify-content: space-between;
        gap: 1rem; /* 버튼 간격 */
    }

    .btnSet .text-center a {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100%;
        padding: 0.5rem 1rem; /* 버튼 패딩 */
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
	
	#pwd_check::placeholder {
	    font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
	    font-size: 15px; /* 원하는 폰트 크기로 변경 */
	    color: #999; /* 원하는 폰트 색상으로 변경 */
	}
	
	#username::placeholder {
	    font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
	    font-size: 15px; /* 원하는 폰트 크기로 변경 */
	    color: #999; /* 원하는 폰트 색상으로 변경 */
	}
	
	#hp::placeholder {
	    font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
	    font-size: 15px; /* 원하는 폰트 크기로 변경 */
	    color: #999; /* 원하는 폰트 색상으로 변경 */
	}
	    
	#email::placeholder {
	    font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
	    font-size: 15px; /* 원하는 폰트 크기로 변경 */
	    color: #999; /* 원하는 폰트 색상으로 변경 */
	}
	
	#addr::placeholder {
	    font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
	    font-size: 15px; /* 원하는 폰트 크기로 변경 */
	    color: #999; /* 원하는 폰트 색상으로 변경 */
	}
	
	#addr2::placeholder {
	    font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
	    font-size: 15px; /* 원하는 폰트 크기로 변경 */
	    color: #999; /* 원하는 폰트 색상으로 변경 */
	}
	
	#birth::placeholder {
	    font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
	    font-size: 15px; /* 원하는 폰트 크기로 변경 */
	    color: #999; /* 원하는 폰트 색상으로 변경 */
	}
	
	#gender::placeholder {
	    font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
	    font-size: 15px; /* 원하는 폰트 크기로 변경 */
	    color: #999; /* 원하는 폰트 색상으로 변경 */
	}
	
	.form-check-label{
		font-family: 'Noto Sans KR', sans-serif; /* 원하는 폰트로 변경 */
	    font-size: 15px; /* 원하는 폰트 크기로 변경 */
	    color: #999; /* 원하는 폰트 색상으로 변경 */
	}
    </style>
    <script>
    	var con1 = false;
    	var con2 = false;
    
    	function goSave() {
    		if ($("#userid").val() == '') {
    			alert('아이디를 입력하세요'); 
    			$("#userid").focus();
    			return;
    		}
    		if ($("#pwd").val() == '') {
    			alert('비밀번호를 입력하세요');
    			$("#pwd").focus();
    			return;
    		}
    		if ($("#pwd").val() != $("#pwd_check").val()) {
    			alert('비밀번호를 확인하세요');
    			return;
    		}
    		var reg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/;
    		if ($("#pwd").val().match(reg) == null) {
    			alert('비밀번호는 영문+숫자 조합으로 8자이상 입력하세요');
    			$("#pwd").val('');
    			$("#pwd_check").val('');
    			return;
    		}
    		if ($("#username").val() == '') {
    			alert('이름을 입력하세요');
    			$("#username").focus();
    			return;
    		}
    		if ($("#hp").val() == '') {
    			alert('연락처를 입력하세요');
    			$("#hp").focus();
    			return;
    		}

    		if ($("#email").val() == '') {
    			// 이메일 입력 필드의 값이 비어 있는지 확인 
    			alert('이메일을 입력하세요');
    			// 이메일이 입력되지 않은 경우, 경고 메시지를 표시 

    		if ($("#email").val() == '') { 
    			alert('이메일을 입력하세요'); 
    			$("#email").focus();
    			return;
    		} 
    		if ($("#addr").val() == '' || $("#addr2").val() == '') {
    			alert('주소를 입력하세요');
    			$("#addr2").focus();
    			return;
    		}
    		if ($("#birth").val() == '') {
    			alert('생년월일을 입력하세요');
    			$("#birth").focus();
    			return;
    		}
    		if (!$('input[name="gender"]:checked').val()) {
    		    alert('성별은 필수 입력값입니다.');
    		    $('input[name="gender"]').first().focus();
    		    return false;
    		}
    		if(!con1){
    			alert('아이디 중복 체크를 진행해주세요'); 
    			$("#userid").focus();
    			return;
    		}
    		if(!con2){
    			alert('이메일을 중복 체크를 진행해주세요'); 

    			$("#email").focus();
    			// 이메일 입력 필드에 포커스를 맞춤 
    			return;
    			//이메일이 입력되지 않은 경우, 함수 실행 중단 
    		}

    		var con = true;
    		// 이메일 중복 확인 결과를 저장할 변수를 선언하고 초기앖을 true로 설정 
    		// 초기값을 true로 설정하는 이유? 
    		$.ajax({ 
				url:'/user/emailCheck.do', 
				// 이메일 중복 확인을 위한 서버 요청 url을 설정 
				data : {email:$("#email").val()},
				// 서버에 보낼 데이터를 설정. 이메일 입력 필드 값을 email이라는 키로 보냄. 
				async : false,
				// 동기 방식으로 요청 설정 
				// 동기 방식 : 요청을 보낸 후 응답을 받아야지만 다음 동작이 이루어지는 방식 
				success : function(res) {
					// 서버로부터 응답을 성공적으로 받았을 때 실행될 함수 
					console.log(res);
					// 서버 응답 데이터를 콘솔에 출력 
					if (res == '1') {
						// 서버 응답이 '1' 인 경우(즉, 중복된 이메일인 경우)
						alert('중복된 이메일입니다.\r\n다른 이메일을 입력해 주세요');
						// 사용자에게 중복된 이메일임을 알리는 경고 메시지를 표시 
						con = false;
						//이메일 중복 확인 변수를 false로 설정하여 중복된 이메일임을 기록 
						return;
						// 함수 실행 중단 
				}
				}
			});	
    		if (!con) return;
    		// 전송

    		$("#frm").submit();
    	}
    	$(function() {
    		// 페이지가 로드되면 실행될 함수 
    		$("#useridCheck").click(function() {

    			// 아이디 중복 확인 버튼 클릭 시 실행될 함수 
    	    		if ($("#userid").val() == '') {
    	    			// 만약 아이디 입력란이 비어있으면__val("set하고싶은 value값")
    	    			alert('아이디를 입력하세요'); 
    	    			$("#userid").focus();
    	    			// 아이디 입력란에 포커스를 맞추고 
    	    			return; // 함수 종료 
    	    		}
    			// ajax를 사용하여 서버로 아이디 중복 체크 요청 보냄

    	    		if ($("#userid").val() == '') {
    	    			alert('아이디를 입력하세요'); 
    	    			$("#userid").focus();
    	    			return; 
    	    		}

    			$.ajax({
    				url:'/user/useridCheck.do', // 요청 보낼 url 
    				data:{userid:$('#userid').val()},// 서버로 전송할 데이터(아이디)
    				success:function(res) {
    					// 요청 성공 시 실행될 콜백 함수 
    					console.log(res); // 콘솔에 결과를 출력해 디버깅 
						if (res == '1') {
							// 서버에서 받은 결과가 '1'인 경우 (중복된 아이디)

    				url:'/user/useridCheck.do', 
    				data:{userid:$('#userid').val()},
    				success:function(res) { 
    					console.log(res); 
						if (res == '1') {
							alert('중복된 아이디입니다.\r\n다른 아이디를 입력해 주세요');
						} else {
							// 서버에서 받은 결과가 '1'이 아닌 경우(사용 가능한 아이디)
							alert('사용 가능한 아이디입니다.');
							alert('사용 가능한 아이디입니다.');
							con1 = true;
						}
    				}
    			})
    		})
    	})
    	$(function() {
    		// 페이지가 로드되면 실행될 함수 
    		$("#emailCheck").click(function() {
    			// 이메일 중복 확인 버튼 클릭 시 실행될 함수 
    			if ($("#email").val() == '') {
    				// 만약 이메일 입력란이 비어있으면__val("set하고싶은 value값")
        			alert('이메일을 입력하세요');
        			$("#email").focus();
        			// 이메일 입력란에 포커스를 맞추고
        			return;// 함수 종료 
    			}
    			// ajax를 사용하여 서버로 이메일 중복 체크 요청 보냄
    			if ($("#email").val() == '') {
        			alert('이메일을 입력하세요');
        			$("#email").focus();
        			return;
    			}
    			
    			$.ajax({
    				url:'/user/emailCheck.do',// 요청 보낼 url 
    				data:{email:$('#email').val()},// 서버로 전송할 데이터(이메일)
    				url:'/user/emailCheck.do',
    				data:{email:$('#email').val()},
    				success:function(res) {
    					// 요청 성공 시 실행될 콜백 함수 
    					console.log(res);// 콘솔에 결과를 출력해 디버깅 
						if (res == '1') {
							// 서버에서 받은 결과가 '1'인 경우 (중복된 이메일)
    					console.log(res);
						if (res == '1') {
							alert('중복된 이메일입니다.\r\n다른 이메일을 입력해 주세요');
						} else {
							// 서버에서 받은 결과가 '1'이 아닌 경우(사용 가능한 이메일ㅇ)
							alert('사용 가능한 이메일입니다.');
							alert('사용 가능한 이메일입니다.');
							con2 = true;
						}
    				}
    			})
    		})
    	})
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function zipcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수
	
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                /*
	                document.getElementById('sample4_postcode').value = data.zonecode;
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
	                */
	                $('#zipcode').val(data.zonecode);
	                $('#addr').val(roadAddr);
	            }
	        }).open();
	    }
				    $(document).ready(function() {
				        $('#addressCheck').click(function() {
				            zipcode();
				        });
				    });			    
	</script>
</head> 
<body>
    <!-- **************** MAIN CONTENT START **************** -->
<main>
	<section class="p-0 d-flex align-items-center position-relative overflow-hidden">

				<div class="col-12 col-lg-6 m-auto">
					<div class="row my-5">
						<div class="col-sm-10 col-xl-8 m-auto">
							<!-- Title -->
							<h2 style="text-align: center; font-weight: 700;" >회원가입</h2>
							
							<!-- Separator -->
								<div class="separator"></div>
						
							<!-- Form START -->
							<form method="post" name="frm" id="frm" action="insert.do">
								<!-- Id -->
								<div class="mb-4">
									<label for="InputId1" class="form-label">아이디 *</label>
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="bi bi-envelope-fill"></i></span>
										<input type="text" class="form-control border-0 bg-light rounded-end ps-1" placeholder="아이디" id="userid" name="userid">
										<a href="javascript:;" class="btn btn-secondary ms-2" id="useridCheck">중복확인</a> 
									</div>
								</div>

								<!-- Password -->
								<div class="mb-4">
									<label for="inputPassword5" class="form-label">비밀번호 *</label>
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
										<input type="password" class="form-control border-0 bg-light rounded-end ps-1" placeholder="비밀번호를 입력해주세요" id="pwd" name="pwd">
									</div>
								</div>
								
								<!-- Confirm Password -->
								<div class="mb-4">
									<label for="inputPassword6" class="form-label">비밀번호 확인 *</label>
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
										<input type="password" class="form-control border-0 bg-light rounded-end ps-1" placeholder="비밀번호를 한번 더 입력해주세요" id="pwd_check" name="pwd_check">
									</div>
								</div>

                                <!-- Name -->
								<div class="mb-4">
									<label for="inputName1" class="form-label">이름 *</label>
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
										<input type="text" class="form-control border-0 bg-light rounded-end ps-1" placeholder="이름" id="username" name="username">
									</div>
								</div>

                                <!-- Hp -->
								<div class="mb-4">
									<label for="inputHp1" class="form-label">연락처 *</label>
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
										<input type="text" class="form-control border-0 bg-light rounded-end ps-1" placeholder="000-0000-0000" id="hp" name="hp">
									</div>
								</div>
	
							
                            <!-- Email -->
								<div class="mb-4">
									<label for="inputEmail1" class="form-label">이메일 *</label>
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
										<input type="text" class="form-control border-0 bg-light rounded-end ps-1" placeholder="예: example@example.com" id="email" name="email">
                                        <a href="javascript:;" class="btn btn-secondary ms-2" id="emailCheck">중복확인</a> 
                                    </div>
								</div>
								
                        	
                        
                         <!-- Address -->
								<div class="mb-4">
									<label for="inputAddress1" class="form-label">주소 *</label>
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
										<input type="text" class="form-control border-0 bg-light rounded-end ps-1" placeholder="기본주소" id="addr" name="addr" readonly>
                                        <a href="javascript:zipcode();"  class="btn btn-secondary ms-2">우편번호</a>
									</div>
								</div>
									<!-- 상세 주소 -->
                        			<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
										<input type="text" class="form-control border-0 bg-light rounded-end ps-1" placeholder="상세주소" id="addr2" name="addr2">
									</div>
									
					 <!-- Birth -->
								<div class="mb-4">
									<label for="inputBirth1" class="form-label"> 생년월일 *</label>
									<div class="input-group input-group-lg">
										<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-lock"></i></span>
										<input type="birth" class="form-control border-0 bg-light rounded-end ps-1" placeholder="YYYYMMDD" id="birth" name="birth">
                                    </div>
								</div>				
                       
                       
                       <!-- Gender -->
						<div class="mb-4">
						    <label class="form-label">성별 *</label>
						    <div class="input-group input-group-lg">
						        <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3"><i class="fas fa-venus-mars"></i></span>
						        <div class="form-control border-0 bg-light rounded-end ps-1 d-flex align-items-center">
						            <div class="form-check form-check-inline">
						                <input class="form-check-input" type="radio" name="gender" id="gender_male" value="1">
						                <label class="form-check-label" for="gender_male">남성</label>
						            </div>
						            <div class="form-check form-check-inline ms-3">
						                <input class="form-check-input" type="radio" name="gender" id="gender_female" value="2">
						                <label class="form-check-label" for="gender_female">여성</label>
						            </div>
						        </div>
						    </div>
						</div>					
                        	<input type="hidden" name="useridCheck" id="useridCheck" value="0"/>
                        	<input type="hidden" name="emailCheck" id="emailCheck" value="0"/>
              			</form>
              <!-- //write--->
				<div class="btnSet clear justify-content-between">
				    <div class="text-center">
				     <a href="javascript:;" class="btn btn-cancel ms-2 flex-grow-1 me-3" onclick="history.back();">취소</a>
				    <a href="javascript:;" class="btn btn-save ms-2 flex-grow-1" onclick="goSave();">가입하기</a> 
				   </div>
				</div>
            </div>
        </div>
    </div>
    </section>
    </main>
    
    <!-- Back to top -->
	<!--<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>  -->

	<!-- Bootstrap JS -->
	<!-- <script src="assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script> -->

	<!-- Template Functions -->
	<!-- <script src="assets/js/functions.js"></script> -->
</body> 
</html>