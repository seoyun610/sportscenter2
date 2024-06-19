<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강 취소</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<body>
	<table>
	    <thead>
	        <tr>
	            <th>강좌명</th>
	            <th>종목</th>
	            <th>등급</th>
	            <th>시간</th>
	            <th>요일</th>
	            <th>취소 금액</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:if test="${empty cvo }">
	    		<tr>
					<td colspan="9">취소 정보가 없습니다.</td>
				</tr>
	    	</c:if>
	        <tr>
	            <td>${cvo.classname}</td>
	            <td>${cvo.subtype}</td>
	            <td>${cvo.classlevel}</td>
	            <td>${cvo.classtime}</td>
	            <td>${cvo.classday}</td>
	            <td>${cvo.classprice}</td>
	        </tr>
	    </tbody>
	</table>
	<input type="button" onclick="requestCancel();" value="취소하기">
</body>
<script>
	function requestCancel() {
		var canceldata = {
			imp_uid: "${pvo.imp_uid}",
			amount: ${pvo.price}
		}
		$.ajax({
			type: 'POST',
			url: '/pay/cancel/complete',
			data: JSON.stringify(canceldata),
			dataType: 'json',
			contentType: 'application/json',
			success: function(data) {
				console.log(data);
				if(data.result === "ok") {
					alert('취소 완료');
        			window.location.href = '/mypage/classView.do'
				}
				else if(data.result === "bad_request") {
					alert('취소 오류');
        			window.location.href = '/mypage/classView.do'
				}
			}
		})
	}
</script>
</html>