<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="kr.project.sportscenter.class1.ClassVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" name="payForm" id="payForm" action="/pay/payCheck2.do">
<table>
	<thead>
		<tr>
	  		<th>강좌명</th>
	  		<th>종목</th>
	  		<th>등급</th>
	  		<th>시간</th>
	  		<th>요일</th>
	  		<th>금액</th>
			</tr>
		</thead>
		<tbody>     
            <c:forEach var="basket" items="${map.list}">
			<tr>
				<td>${basket.classname}</td>
				<td>${basket.subtype}</td>
				<td>${basket.classlevel}</td>
				<td>${basket.classtime}</td>
				<td>${basket.classday}</td>
				<td>${basket.classprice}</td>
			</tr>
		</c:forEach>
        </tbody>
        </table>
        <input type="hidden" name="classid" value="${map.list[0].classid}">
        <input type="submit" value="결제하기">
</form>
</body>
</html>