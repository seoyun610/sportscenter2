<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>
 <title>아이디 찾기 / 비밀번호 찾기</title>
    <link rel="stylesheet" href="findId.css">
</head>
<body>
    <div class="container">
        <div class="tab-menu">
            <button class="tab-link active" onclick="openTab(event, 'findId')">아이디 찾기</button>
            <button class="tab-link" onclick="openTab(event, 'findPassword')">비밀번호 찾기</button>
        </div>

        <div id="findId" class="tab-content">
            <h2>아이디 찾기</h2>
            <form>
                <input type="text" placeholder="이름" name="username" required>
                <input type="birth" placeholder="생년월일" name="birth" required>
                <input type="hp" placeholder="휴대폰번호" name="hp" required>
                <button type="submit">찾기</button>
            </form>
        </div>

        <div id="findPassword" class="tab-content" style="display:none">
            <h2>비밀번호 찾기</h2>
            <p>비밀번호는 가입시 입력하신 이메일을 통해 찾을 수 있습니다.</p>
            <form>
                <input type="text" placeholder="아이디" name="userid" required>
                <input type="email" placeholder="이메일" name="email" required>
                <button type="submit">찾기</button>
            </form>
        </div>
    </div>
</body>
</html>