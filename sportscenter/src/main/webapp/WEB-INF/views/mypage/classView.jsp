<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.project.sportscenter.user.UserVO" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강내역 확인</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>
<body>

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
					<td> <input type="button" class="cancel_btn" value="수강 취소" onclick="cancel();"><td>
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
				<td> <input type="button" class="pay_btn" value="결제하기" onclick="payment(${classrvo.classid})"> </td>
			</tr>
        </c:forEach>
        </tbody>
        </table>
</c:if>
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