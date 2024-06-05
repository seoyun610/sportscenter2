<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>수업 등록하기</title>
	<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <script type="text/javascript">
	    function setDay(){
	    	var dayArray = new Array();
	    	var classday = "";
	    	$('input:checkbox[name=dayChk]:checked').each(function(){
	    		dayArray.push(this.value);
	    	});
	    	for(let i=0; i<dayArray.length; i++){
	    		classday += dayArray[i] + "^";
	    	}
	    	classday = classday.substr(0, classday.length-1);
	    	console.log(classday);
	    	$('#classday').val(classday);
	    }
    </script>
</head>
<body>
수업 등록하기
<div>
	<form method="get" action="add.do">
		<div>
			<label>종목 선택</label>
			<select id="subtype" name="subtype" size="1">
				<c:forEach var="vo" items="${smap.list }">
					<option value="${vo.sportid }" ${vo.sportid == 99 ? 'selected disabled hidden' : ''}>${vo.sporttxt }</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<label>반 이름</label>
			<input type="text" id="classname" name="classname"/>
		</div>
		<div>
			<label>수업 등급</label>
			<select id="classlevel" name="classlevel" size="1">
				<c:forEach var="vo" items="${lmap.list }">
					<option value="${vo.levelid }" ${vo.levelid == 99 ? 'selected disabled hidden': ''}>${vo.leveltxt}</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<label>등록 기간</label>
			<input type="number" id="classyear" name="classyear"/> 년  <input type="number" id="classmonth" name="classmonth"/> 월
		</div>
		<div>
			<label>수업 시간</label>
			<select id="classtime" name="classtime" size="1">
				<c:forEach var="vo" items="${tmap.list }">
					<option value="${vo.timeid }" ${vo.timeid == 99 ? 'selected disabled hidden' : ''}>${vo.timetxt }</option>
				</c:forEach>
			</select>
		</div>
		<div>
			<label>요일</label>
			<input type="checkbox" name="dayChk" id="dayChk" value="1"/> 월
			<input type="checkbox" name="dayChk" id="dayChk" value="2"/> 화
			<input type="checkbox" name="dayChk" id="dayChk" value="3"/> 수
			<input type="checkbox" name="dayChk" id="dayChk" value="4"/> 목
			<input type="checkbox" name="dayChk" id="dayChk" value="5"/> 금
			<input type="hidden" name="classday" id="classday" value=""/>
		</div>
		<div>
			<label>수강 정원</label>
			<input type="number" id="classlimit" name="classlimit"/> 명
		</div>
		<div>
			<label>수강 현원</label>
			<input type="number" id="classcnt" name="classcnt" value=0 readonly/> 명
		</div>
		<div>
			<label>수강 금액</label>
			<input type="number" id="classprice" name="classprice"/> 원
		</div>
		<input type="submit" id="addbtn" value="추가하기" onclick="setDay();">
	</form>
</div>
</body>
</html>