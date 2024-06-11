<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>비밀번호 변경</h2>
    <form action="/user/updatePassword.do" method="post">
        <input type="hidden" name="userid" value="${userid}">
        <input type="password" id="newPwd" name="newPwd" placeholder="새로운 비밀번호 입력해주세요." required>
        <button type="submit">확인</button>
    </form>
</body>
</html>