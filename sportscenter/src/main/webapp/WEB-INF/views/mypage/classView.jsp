<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="kr.project.sportscenter.user.UserVO"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title></title>
<META name="viewport"
	content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<script src="/js/script.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description"
	content="Eduport- LMS, Education and Course Theme">
<!-- Favicon -->
<link rel="shortcut icon" href="/resources/images/favicon.ico">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap">

<!-- Plugins CSS -->
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/font-awesome/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/choices/css/choices.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/apexcharts/css/apexcharts.css">
<link rel="stylesheet" type="text/css"
	href="/resources/vendor/overlay-scrollbar/css/overlayscrollbars.min.css">

<!-- Theme CSS -->
<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="/resources/css/sidebar.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
tbody tr td {
	text-align: center;
	vertical-align: middle;
}
</style>
<style>
main {
	margin-left: 400px;
}
</style>
</head>
<body>
		<%@ include file="/WEB-INF/views/mypage/sidebar.jsp"%>
	<main>

		<div></div>
		<h3 class="sub_title">수강 중인 강좌</h3>
		<div>
			<table class="list">
				<thead>
					<tr>
						<th>수강 강좌 명</th>
						<th>수강 기간</th>
						<th>수강 취소</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty classList }">
						<tr>
							<td class="first" colspan="3">등록된 수강 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="classlist" items="${classList }">
						<tr>
							<td class="classname" value="${classlist.classname }">${classlist.classname }</td>
							<td>${classlist.formattedClassdate }</td>
							<td><input type="button" class="cancel_btn" value="수강 취소"
								onclick="cancel();">
							<td>
				
						</tr>
	        </c:forEach>
		</tbody>
	</table>
</div>
<div>

<%
Calendar calendar = Calendar.getInstance();
int day = calendar.get(Calendar.DAY_OF_MONTH);
boolean isBetween20And25 = (day >= 20 && day <= 25);
%>

<c:if test="${not empty retakeClass }">
	<h3 class="sub_title">재수강 결제 대기 강좌</h3>
		<table>
		<thead>
			<tr>
	  			<th>수강 강좌 명</th>
	  			<th>수강 기간</th>
	  			<th>수강 결제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="classrvo" items="${retakeClass }">       
            <tr>
				<td class="retakeClassname">${classrvo.classname }</td>
				<td>${classrvo.formattedClassdate }</td>
				<td> <input type="button" class="pay_btn" value="결제하기"
															onclick="payment(${classrvo.classid})"> </td>
			</tr>
        </c:forEach>
        </tbody>
        </table>
</c:if>
</div>

</main>
<div class="back-top">
		<i
			class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i>
	</div>
</body>
<script>
	function payment(classId) {
		console.log(classId);
		const today = new Date();
	    const day = today.getDate();
	    // 테스트용
	    /* setTimeout(() => {
	    	location.href = '/class/payCheck.do?retake=1&classid=' + classId;
		}, 3000); */
	    if( day >= 20 && day < 25 ) {
	    	location.href = '/class/payCheck.do?classid=' + classId;
	    } else {
	    	alert('재수강 기간이 아닙니다. \n재수강 기간에 다시 신청해주세요.');
	    }
	}
</script>

</html>