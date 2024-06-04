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
							<c:forEach var="vo" items="${smap.list }">
								<option value="${vo.sportid }" ${vo.sportid == 99 ? 'selected disabled hidden' : ''}>${vo.sporttxt }</option>
							</c:forEach>
						</select>
						<select id="classtime" name="classtime" size="1">
							<c:forEach var="vo" items="${tmap.list }">
								<option value="${vo.timeid }" ${vo.timeid == 99 ? 'selected disabled hidden' : ''}>${vo.timetxt }</option>
							</c:forEach>
						</select>
						<select id="classlevel" name="classlevel" size="1">
							<c:forEach var="vo" items="${lmap.list }">
								<option value="${vo.levelid }" ${vo.levelid == 99 ? 'selected disabled hidden': ''}>${vo.leveltxt}</option>
							</c:forEach>
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