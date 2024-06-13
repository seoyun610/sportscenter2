<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%-- <%
    java.util.Calendar calendar = java.util.Calendar.getInstance();
	int currentYear = calendar.get(java.util.Calendar.YEAR);
	int nextMonth = calendar.get(java.util.Calendar.MONTH) + 2;
    int currentDay = calendar.get(java.util.Calendar.DAY_OF_MONTH);
    pageContext.setAttribute("currentDay", currentDay);
%> --%>
<%int cnt=0; %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수업관리</title>
	<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <script>        
        function registOne() {
            window.open("/admin/regist.do");
        }
        
        function registAll() {
    		
        }
        
        function classDel() {
        	var classid = $("input:checkbox[name='classid']:checked").val();
        	console.log("값 확인: " + classid);
        	if(confirm("정말 강좌를 삭제하시겠습니까?")){
        		location.href="/admin/delete/" + classid;
        	}
        }
        
        function checkOnlyOnce(currentCheckbox) {
        	const checkboxes = document.getElementsByName("classid");
        	let checkedCnt = 0;
        	for(let i=0; i<checkboxes.length;i++){
        		if(checkboxes[i].checked) {
        			checkedCnt++;
        			if(checkboxes[i] != currentCheckbox) {
        				checkboxes[i].checked = false;
        			}
        		}
        	}
        	if(checkedCnt === 0) {
        		currentCheckbox.checked = true;
        	}
        }
    </script>
</head>
<body>
	<div>
		<!-- 헤더 -->
		<div>
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
<%-- 						<input type="hidden" id="classyear" name="classyear" value="<%=currentYear %>"> --%>
<%-- 						<input type="hidden" id="classmonth" name="classmonth" value="<%=nextMonth%>"> --%>
						<input type="submit" id="sBtn" value="검색" title="검색">
					</span>
				</form>
			</div>
			<input type="button" value="수업추가" onclick="registOne();"/>
			<input type="button" value="일괄 추가" onclick="registAll();"/>
			<form method="get" action="modify.do" id="classForm" name="classForm">
				<table border="1" id="listTable" name="listTable">
				<tbody>
					<c:if test="${empty map.list }">
						<tr>
							<td colspan="9">불러올 과목이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="vo" items="${map.list }"> 
						<tr id="list<%=cnt %>" value="<%=cnt%>">
							<td><input type="checkbox" id="classid" name="classid" value="${vo.classid }"/></td>
							<td>${vo.classname }</td>  
							<td>${vo.subtypeName }</td>
							<td id="classday">${vo.classYoil }</td>
							<td>${vo.formattedClasstime}</td>
							<td>${vo.classlevelName }</td>
							<td>${vo.classprice }</td>
							<td>${vo.classlimit }</td>
							<td>${vo.classcnt }</td>
						</tr>
						<%cnt = cnt+1; %>
					</c:forEach>
				</tbody>
			</table>
			<input type="submit" id="classBtn" value="선택수정"/>
			<input type="button" onclick="classDel();" value="선택삭제">
			</form>
			<div>
				<ul>
					<c:if test="${map.prev }">
						<li><a href="list.do?page=${map.startPage-1 }"> << </a></li>
					</c:if>
					<c:forEach var="p" begin="${map.startPage }" end="${map.endPage }">
						<c:if test="${p == ClassVO.page }">
							<li><a href='#'; class='current'>${p}</a></li>
						</c:if>
						<c:if test="${p != ClassVO.page }">
							<li><a href="list.do?page=${p}">${p }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${map.next }">
						<li><a href="list.do?page=${map.endPage+1 }"> >> </a></li>
					</c:if>
				</ul>
			</div>
		</div>
		<!-- 푸터 -->
	</div>
</body>
</html>