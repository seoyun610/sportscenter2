<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.project.sportscenter.user.UserVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<script>
	    function setSearchMonth(month) {
	        document.getElementById("searchMonth").value = month;
	        document.getElementById("searchForm").submit();
	    }
	</script>
<title>지난 내역</title>
</head>
<body>
	    <form method="get" id="searchForm" action = "classHistory.do">
        <input type="hidden" id="searchMonth" name="searchMonth" value="${param.searchMonth}">
        
        <div class="search-tabs">
            <button type="button" onclick="setSearchMonth(3)">3개월</button>
            <button type="button" onclick="setSearchMonth(6)">6개월</button>
            <button type="button" onclick="setSearchMonth(12)">12개월</button>
        </div>
        
        <div>
            <input type="text" name="searchWord" placeholder="강좌명 검색" value="${param.searchWord}">
            <button type="submit">검색</button>
        </div>
    </form>
<div>
<table class="list">
	<thead>
		<tr>
	  		<th>수강 내역</th>
	  		<th>수강 기간</th>
	  		<th>수강 상태</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty classHistory }">
			<tr>
				<td class="first" colspan="3">지난 수강 내역이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="vo" items="${classHistory }">       
            <tr>
				<td>${vo.classname }</td>
				<td>${vo.formattedClassdate }</td>
				<td>${vo.classstatus }<td>
			</tr>
        </c:forEach>
	</tbody>
</table>
</div>    
    
    
</body>
</html>