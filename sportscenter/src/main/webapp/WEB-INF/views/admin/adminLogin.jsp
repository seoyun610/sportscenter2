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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <script src="/js/script.js"></script>
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
</head> 
<body>
    <div class="wrap">
        <form action="adminlogin.do" method="post" id="adminlogin" onsubmit="return loginCheck();">
            <div class="sub">
                <div class="size">
                    <h3 class="sub_title">로그인</h3>
                    
                    <div class="user">
                        <div class="box">
                            <fieldset class="login_form">
                                <ul>
                                    <li><input type="text" id="adminid" name="adminid" placeholder="아이디"></li>
                                    <li><input type="password" id="adminpwd" name="adminpwd" placeholder="비밀번호"></li>
                                    <li><label><input type="checkbox" name="reg1" id="reg1"/> 아이디저장</label></li>
                                </ul>
                                <div class="login_btn"><input type="submit" value="로그인" alt="로그인" /></div>
                            </fieldset>
                            <div class="btnSet clear">
                            </div>
                        </div>
                    </div>
        
                </div>
            </div>
        </form>
    </div>
</body> 
</html>