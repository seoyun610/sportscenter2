<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    java.util.Calendar calendar = java.util.Calendar.getInstance();
    int currentDay = calendar.get(java.util.Calendar.DAY_OF_MONTH);
    pageContext.setAttribute("currentDay", currentDay);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function classSelection(classId, classLimit, classCnt) {
		const today = new Date();
	    const day = today.getDate();

		if (day >= 20 && day <= 26) {
			if (classLimit > classCnt){
				location.href = 'payCheck?classId=' + classId;
			} else {
				alert ('잔여석 없음')
			}
	    } else {
	        alert('신청 기간이 아닙니다.');
	    }
	}
	
</script>
</head>
<body>
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
                            <td>신청 불가1</td>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <td>신청 불가2</td>
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
</body>
</html>