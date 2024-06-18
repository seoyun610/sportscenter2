<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    java.util.Calendar calendar = java.util.Calendar.getInstance();
	int currentYear = calendar.get(java.util.Calendar.YEAR);
	int nextMonth = calendar.get(java.util.Calendar.MONTH) + 2;
    int currentDay = calendar.get(java.util.Calendar.DAY_OF_MONTH);
   // pageContext.setAttribute("currentDay", currentDay);
%>
<%int cnt=0; %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수업관리</title>
	<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <style>
    	.modal_btn {
		    display: block;
		    margin: 40px auto;
		    padding: 10px 20px;
		    background-color: royalblue;
		    border: none;
		    border-radius: 5px;
		    color: #fff;
		    cursor: pointer;
		    transition: box-shadow 0.2s;
		}
		.modal_btn:hover {
		    box-shadow: 3px 4px 11px 0px #00000040;
		}
		/*모달 팝업 영역 스타일링*/
		.modal {
		/*팝업 배경*/
			display: none; /*평소에는 보이지 않도록*/
		    position: absolute;
		    top:0;
		    left: 0;
		    width: 100%;
		    height: 100vh;
		    overflow: hidden;
		    background: rgba(0,0,0,0.5);
		}
		.modal .modal_popup {
		/*팝업*/
		    position: absolute;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
		    padding: 20px;
		    background: #ffffff;
		    border-radius: 20px;
		}
		.modal .modal_popup .close_btn {
		    display: block;
		    padding: 10px 20px;
		    background-color: rgb(116, 0, 0);
		    border: none;
		    border-radius: 5px;
		    color: #fff;
		    cursor: pointer;
		    transition: box-shadow 0.2s;
		}
		.modal .modal_popup .add_btn {
		    display: block;
		    padding: 10px 20px;
		    background-color: royalblue;
		    border: none;
		    border-radius: 5px;
		    color: #fff;
		    cursor: pointer;
		    transition: box-shadow 0.2s;
		}
		.modal.on {
		    display: block;
		}
    </style>
</head>
<body>
	<div>
		<!-- 헤더 -->
		<div>
			<!--모달 팝업-->
			<div class="modal">
			    <div class="modal_popup">
			        <h3>등록 기간 설정</h3>
			        <input type="number" id="currentYear" value="<%=currentYear%>"/> 년  <input type="number" id="nextMonth" value="<%=nextMonth%>"/> 월
			        <input type="button" class="close_btn" value="닫기" onclick="closemodal();"/>
			        <input type="button" class="add_btn" value="추가하기" onclick="registAll();"/>
			    </div>
			</div>
			<!--end 모달 팝업-->
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
			<input type="button" value="개별 추가" onclick="registOne();"/>
			<button type="button" class="modal_btn" onclick="openmodal();">일괄 추가</button>
			<form method="get" action="modify.do" id="classForm" name="classForm">
				<table border="1" id="listTable" name="listTable">
				<tbody>
					<c:if test="${empty map.list }">
						<tr>
							<td colspan="9">불러올 과목이 없습니다.</td>
						</tr>
					</c:if>
					<tr>
						<th>선택</th>
						<th>반이름</th>
						<th>종목</th>
						<th>요일</th>
						<th>년도</th>
						<th>월</th>
						<th>시간</th>
						<th>등급</th>
						<th>가격</th>
						<th>정원</th>
						<th>현원</th>
					</tr>
					<c:forEach var="vo" items="${map.list }"> 
						<tr id="list<%=cnt %>" value="<%=cnt%>">
							<td><input type="checkbox" id="classid" name="classid" value="${vo.classid }" onclick="checkOnlyOnce(this)" /></td>
							<td>${vo.classname }</td>  
							<td>${vo.subtypeName }</td>
							<td id="classday">${vo.classYoil }</td>
							<td>${vo.classyear }</td>
							<td>${vo.classmonth }</td>
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
			</form>
			<input type="button" onclick="classDel();" value="선택삭제">
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
<script type="text/javascript">
	var modal = document.getElementsByClassName('modal')[0];
	var modalOpen = document.getElementsByClassName('modal_btn');
	var modalClose = document.getElementsByClassName('close_btn');
	function openmodal(){
		console.log(modal);
		modal.style.display = 'block';
	}
    
	function closemodal(){
		console.log(modal);
		modal.style.display = 'none';
	}
	
    function registOne() {
        window.open("/admin/regist.do");
    }
        
    function registAll() {
    	var classyear = document.getElementById("currentYear").value;
    	var nextMonth = document.getElementById("nextMonth").value;
    	console.log(classyear);
    	console.log(nextMonth);
    	if(classyear != <%=currentYear%>) {
    		alert("년도가 정확하지 않습니다. 다시 확인해주세요.");
    	}
    	if(nextMonth != <%=nextMonth%>) {
    		alert("날짜가 정확하지 않습니다. 다시 확인해주세요.");
    	}
     	if(confirm('다음달 수업을 일괄 추가하시겠습니까?')) {
     		var classmonth = nextMonth - 1; 
     		location.href="/admin/addAll/"+classyear+"/"+classmonth;
     	}
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
</body>
</html>