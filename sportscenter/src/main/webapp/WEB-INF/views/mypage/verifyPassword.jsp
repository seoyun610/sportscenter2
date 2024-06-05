<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Verify Password</title>
</head>
<body>
    <h1>비밀번호 확인</h1>
    <form action="${pageContext.request.contextPath}/mypage/verifyPassword.do" method="post">
        <input type="hidden" name="userid" value="${sessionScope.login.userid}">
        <label for="pwd">비밀번호:</label>
        <input type="password" id="pwd" name="pwd">
        <button type="submit">확인</button>
    </form>
    <c:if test="${not empty msg}">
        <p style="color: red;">${msg}</p>
    </c:if>
</body>
</html>
 