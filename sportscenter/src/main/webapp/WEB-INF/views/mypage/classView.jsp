<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.project.sportscenter.user.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3> ${username } 님, 안녕하세요. </h3>
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
				<td>${classlist.classname }</td>
				<td>${classlist.formattedClassdate }</td>
				<td> <input type="button" value="수강 취소" onclick="location.href='payCancel?payid=${vo.payid }'"><td>
			</tr>
        </c:forEach>
	</tbody>
</table>
</div>
<div>

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
				<td>${classrvo.classname }</td>
				<td>${classrvo.formattedClassdate }</td>
				<td> <input type="button" value="재수강" onclick="location.href='payCheck?payid=${classrvo.payid }'"><td>
			</tr>
        </c:forEach>
        </tbody>
        </table>
</c:if>
</div>
</body>
</html>