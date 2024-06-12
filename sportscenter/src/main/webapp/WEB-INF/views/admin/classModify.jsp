<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Admin Modify</title>
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
			// console.log(classday);
	    	$('#classday').val(classday);
	    };
	    $(function() {
			var dayStr = "${obj.classday}";
			//console.log(dayStr);
			var dayArray = dayStr.split("^");
			//console.log(dayArray);
			for(let i=0; i<dayArray.length; i++) {
				$('input[type="checkbox"]').each(function(){
					if(this.value == dayArray[i]) {
						console.log(this.value);
						this.checked = true;
					}
				})
			}
		})
    </script>
</head>
<body>
modify 페이지 입니다.
<form method="post" action="modify.do" id="modclass" name="modclass">
	<c:if test="${empty obj}">
		<tr>
			<td colspan="9">선택된 과목이 없습니다.</td>
		</tr>
	</c:if>
	<div>
		<label>종목</label>
		<select id="subtype" name="subtype" size="1">
			<option selected disabled>${obj.subtypeName }</option>
		</select>
	</div>
	<div>
		<label>반 이름 설정</label>
		<input type="text" id="classname" name="classname" value="${obj.classname }"/> <small style="color:grey;"> "이름 형식: 종목 시간 등급" </small>
	</div>
	<div>
		<label>수업 등급 설정</label>
		<select id="classlevel" name="classlevel" size="1">
			<c:forEach var="vo" items="${lmap.list }">
				<option value="${vo.levelid }" ${vo.levelid == obj.classlevel ? 'selected' : ''}>${vo.leveltxt }</option>
			</c:forEach>
		</select>
	</div>
	<div>
		<label>등록기간</label>
		<input type="number" id="classyear" name="classyear" value="${obj.classyear }" readonly/>년 <input type="number" id="classmonth" name="classmonth" value="${obj.classmonth }" readonly/>월
	</div>
	<div>
		<label>수업 시간 설정</label>
		<select id="classtime" name="classtime" size="1">
			<c:forEach var="vo" items="${tmap.list }">
				<option value="${vo.timeid }" ${vo.timeid == obj.classtime ? 'selected' : ''}>${vo.timetxt }</option>
			</c:forEach>
		</select>
	</div>
	<div>
		<label>요일 설정</label>
		<input type="checkbox" name="dayChk" id="dayChk" value="1" ${obj.classday }/> 월
		<input type="checkbox" name="dayChk" id="dayChk" value="2"/> 화
		<input type="checkbox" name="dayChk" id="dayChk" value="3"/> 수
		<input type="checkbox" name="dayChk" id="dayChk" value="4"/> 목
		<input type="checkbox" name="dayChk" id="dayChk" value="5"/> 금
		<input type="hidden" name="classday" id="classday" value=""/>
	</div>
	<div>
		<label>수강 정원 설정</label>
		<input type="number" id="classlimit" name="classlimit" value="${obj.classlimit }"/> 명
	</div>
	<div>
		<label>수강 금액 설정</label>
		<input type="number" id="classprice" name="classprice" value="${obj.classprice }"/> 원
	</div>
	<input type="hidden" name="classid" id="classid" value="${obj.classid }"/>
	<input type="hidden" name="classcnt" id="classcnt" value="${obj.classcnt }"/>
	<input type="hidden" name="subtype" id="subtype" value="${obj.subtype }"/>
	<input type="submit" id="mBtn" value="수정하기" onclick="setDay();"/> 
</form>
</body>
</html>