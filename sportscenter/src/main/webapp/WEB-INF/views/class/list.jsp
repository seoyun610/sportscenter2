<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    java.util.Calendar calendar = java.util.Calendar.getInstance();
	int currentYear = calendar.get(java.util.Calendar.YEAR);
	int nextMonth = calendar.get(java.util.Calendar.MONTH) + 2;
    int currentDay = calendar.get(java.util.Calendar.DAY_OF_MONTH);
    pageContext.setAttribute("currentDay", currentDay);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수강신청</title>
	<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
	<script>
		function classSelection(classId, classLimit, classCnt) {
			const today = new Date();
		    const day = today.getDate();
	
			if (day >= 20 && day <= 26) {
				if (classLimit > classCnt){
					location.href = 'payCheck?classId=' + classId;
				} else {
					alert ('잔여석이 없습니다.')
				}
		    } else {
		        alert('신청 기간이 아닙니다.');
		    }
		}
		
	</script>
</head>
<body>
	<div class="wrap">
		<!-- 헤더 -->
		<div class="sub">
			<div class="clsSearch">
				<form method="get" name="searchForm" id="searchForm" action="list.do">
					<span class="srchSelect">
						<select id="subtype" name="subtype" size="1">
							<option value="0">종목</option>
							<option value="1">수영</option>
							<option value="2">헬스</option>
							<option value="3">스쿼시</option>
							<option value="4">줌바댄스</option>
							<option value="5">아쿠아로빅</option>
							<option value="6">스피닝</option>
							<option value="7">필라테스</option>
							<option value="8">점핑 트램플린</option>
							<option value="9">플라잉요가</option>
						</select>
						<select id="classtime" name="classtime" size="1">
							<option value="0">시간</option>
							<option value="6">06시</option>
							<option value="7">07시</option>
							<option value="8">08시</option>
							<option value="9">09시</option>
							<option value="10">10시</option>
							<option value="11">11시</option>
							<option value="12">12시</option>
							<option value="13">13시</option>
							<option value="14">14시</option>
							<option value="15">15시</option>
							<option value="16">16시</option>
							<option value="17">17시</option>
							<option value="18">18시</option>
							<option value="19">19시</option>
							<option value="20">20시</option>
							<option value="21">21시</option>							
						</select>
						<select id="classlevel" name="classlevel" size="1">
							<option value="0">등급</option>
							<option value="1">초급</option>
							<option value="2">중급</option>
							<option value="3">고급</option>
							<option value="4">연수</option>
							<option value="5">FREE</option>
						</select>
						<input type="hidden" id="classyear" name="classyear" value="<%=currentYear %>">
						<input type="hidden" id="classmonth" name="classmonth" value="<%=nextMonth%>">
						<input type="submit" id="sBtn" value="검색" title="검색">
					</span>
				</form>
			</div>
			<table>
			<tbody>
				<c:if test="${empty map.list }">
					<tr>
						<td colspan="9">등록된 과목이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="vo" items="${map.list }"> 
					<tr>
						<td rowspan="2">${vo.classname }</td>  
						<td>${vo.subtypeName }</td>
						<td>${vo.classday } </td>
						<td>${vo.formattedClasstime}</td>
						<td>${vo.classlevelName }</td>
						<td>${vo.classprice }</td>
						<td>${vo.classlimit }</td>
						<c:choose>
			                <c:when test="${currentDay >= 20 && currentDay <= 26}">
			                    <c:choose>
			                        <c:when test="${vo.classlimit > vo.classcnt }">
			                            <td>신청 가능</td>
			                        </c:when>
			                        <c:otherwise>
			                            <td>신청 불가</td>
			                        </c:otherwise>
			                    </c:choose>
			                </c:when>
			                <c:otherwise>
			                    <td>신청 불가</td>
			                </c:otherwise>
			            </c:choose>
						<td> <button type="button" id="btn" onclick="classSelection(${vo.classid}, ${vo.classlimit}, ${vo.classcnt})" > 신청 </button> <td>
					</tr>
					<tr>
						<td colspan = "8"> graph </td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</div>
	</div>
</body>
</html>