<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 한글 깨지는 거 방지(아래) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Webestica.com">
    <meta name="description" content="Eduport- LMS, Education and Course Theme">
    <title>비밀번호 확인</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="/resources/images/favicon.ico">

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap">
    
    <!-- Plugins CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/font-awesome/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/tiny-slider/tiny-slider.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/glightbox/css/glightbox.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }
        main {
            flex: 1;
            margin-left: 300px;
            padding-top: 100px;
        }
        
    </style>
</head>

<body>

<!-- Main Content START -->
<main>
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
</main>
<%@ include file="/WEB-INF/views/mypage/footer.jsp" %> 
<!-- Main Content END -->

</body>
</html>
