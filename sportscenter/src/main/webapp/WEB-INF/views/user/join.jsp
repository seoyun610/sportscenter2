<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="/js/script.js"></script>
    <script>
    
    	function goSave() {
    		if ($("#userid").val() == '') {
    			alert('아이디를 입력하세요'); 
    			$("#userid").focus();
    			return;
    		}
    		var con = true;
    		$.ajax({
				url:'/user/useridCheck.do',
				data : {userid:$("#userid").val()},
				async : false,
				success : function(res) {
					console.log(res);
					if (res == '1') {
						alert('중복된 아이디입니다.\r\n다른 아이디를 입력해 주세요');
						con = false;
						return;
					}
				}
			});
    		if (!con) return;
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
    			alert('이메일을 입력하세요');
    			$("#email").focus();
    			return;
    		}
    		var con = true;
    		$.ajax({
				url:'/user/emailCheck.do', 
				data : {email:$("#email").val()},
				async : false,
				success : function(res) {
					console.log(res);
					if (res == '1') {
						alert('중복된 이메일입니다.\r\n다른 이메일을 입력해 주세요');
						con = false;
						return;
					}
				}
			});
    		if (!con) return;
    		// 전송
    		$("#frm").submit();
    	}
    	$(function() {
    		$("#useridCheck").click(function() {
    			$.ajax({
    				url:'/user/useridCheck.do',
    				data:{userid:$('#userid').val()},
    				success:function(res) { 
    					console.log(res);
						if (res == '0') {
							alert('사용 가능한 아이디입니다.');
						} else {
							alert('중복된 아이디입니다.\r\n다른 아이디를 입력해 주세요');
						}
    				}
    			})
    		})
    	})
    	$(function() {
    		$("#emailCheck").click(function() {
    			$.ajax({
    				url:'/user/emailCheck.do',
    				data:{email:$('#email').val()},
    				success:function(res) {
    					console.log(res);
						if (res == '0') {
							alert('사용 가능한 이메일입니다.');
						} else {
							alert('중복된 이메일입니다.\r\n다른 이메일을 입력해 주세요');
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
	</script>
</head> 
<body>
    <div class="wrap">
        <div class="sub">
            <div class="size">
                <h3 class="sub_title">회원가입</h3>
                <form name="frm" id="frm" action="insert.do" method="post">
                <table class="board_write">
                    <colgroup>
                        <col width="20%" />
                        <col width="*" />
                    </colgroup>
                    <tbody>
                        <tr>
                            <th>아이디</th>
                            <td>
                                <input type="text" name="userid" id="userid" class="inNextBtn" style="float:left;">
                                <span class="userid_Check"><a href="javascript:;"  class="btn bgGray" style="float:left; width:auto; clear:none;" id="useridCheck">중복확인</a></span>
                            </td>
                        </tr>
                        <tr>
                            <th>비밀번호</th>
                            <td><input type="password" name="pwd" id="pwd" style="float:left;"> <span class="ptxt">비밀번호는 숫자, 영문 조합으로 8자 이상으로 입력해주세요.</span> </td>
                        </tr>
                        <tr>
                            <th>비밀번호<span>확인</span></th>
                            <td><input type="password" name="pwd_check" id="pwd_check" style="float:left;"></td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input type="text" name="username" id="username" style="float:left;"> </td>
                        </tr>
                        
                        <tr>
                            <th>연락처</th>
                            <td>
                                <input type="text" name="hp" id="hp" value=""  maxlength="15" style="float:left;">
                            </td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>
                                <input type="text" name="email" id="email" class="inNextBtn" style="float:left;">
                                <span class="emailCheck"><a href="javascript:;"  class="btn bgGray" style="float:left; width:auto; clear:none;" id="emailCheck">이메일 중복확인</a></span>
                            </td>
                        </tr>
                        <tr>
                            <th rowspan="3">주소</th>
                            <td>
                                <input type="text" name="zipcode" id="zipcode" value=""  maxlength="6" style="float:left;" readonly>
                                <span class="email_check"><a href="javascript:zipcode();"  class="btn bgGray" style="float:left; width:auto; clear:none;">우편번호</a></span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" name="addr" id="addr" value=""  maxlength="15" style="float:left;" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" name="addr2" id="addr2" value=""  maxlength="15" style="float:left;">
                            </td>
                        </tr>
                        <tr>
                            <th>생년월일</th>
                            <td><input type="text" name="birth" id="birth" style="float:left;" placeholder="생년월일 8자리를 입력해주세요."> </td>
                        </tr>
                        <tr>
						    <th>성별</th>
						    <td>
						        <input type="radio" name="gender" id="gender_male" value="1"> 
						        <label for="gender_male">남성</label>
						        <input type="radio" name="gender" id="gender_female" value="2">
						        <label for="gender_female">여성</label>
						    </td>
						</tr>
                    </tbody>
                </table>
                        <input type="hidden" name="useridCheck" id="useridCheck" value="0"/>
                        <input type="hidden" name="emailCheck" id="emailCheck" value="0"/>
                </form>
                <!-- //write--->
                <div class="btnSet clear">
                    <div><a href="javascript:;" class="btn" onclick="goSave();">가입하기</a> <a href="javascript:;" class="btn" onclick="history.back();">취소</a></div>
                </div>
            </div>
        </div>
    </div>
</body> 
</html>