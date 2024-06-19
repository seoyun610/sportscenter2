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
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="author" content="Webestica.com">
	<meta name="description" content="Eduport- LMS, Education and Course Theme">
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
	    	$('#classday').val(classday);
	    }
    </script>
    <style>
	    .input-group-text {
	        font-size: 1em; 
	    }
	
	    .form-control {
	        font-size: 1em; 
	    }
	    .mb-4 {
	        margin-bottom: 1.5rem;
	    }
	    
	</style>
    

	<!-- Google Font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap">

	<!-- Plugins CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/vendor/font-awesome/css/all.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/choices/css/choices.min.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/apexcharts/css/apexcharts.css">
	<link rel="stylesheet" type="text/css" href="/resources/vendor/overlay-scrollbar/css/overlayscrollbars.min.css">

	<!-- Theme CSS -->
	<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Favicon -->
	<link rel="shortcut icon" href="/resources/images/favicon.ico">
	</head> 
<body>
<main>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %> 
<div class="page-content">
<%@ include file="/WEB-INF/views/admin/topbar.jsp" %>
	<div class="page-content-wrapper border">
   	<div class="row mb-3">
       <div class="card position-relative">
    <div class="card-header py-3">
        <h2 class="m-0 font-weight-bold text-primary">수업 개별 등록</h2>
    </div>
	<div class="card-body">
		            <form method="post" action="add.do" id="modclass" name="modclass">
                <div class="mb-4 row">
                    <label class="col-sm-2 col-form-label"><strong>종목</strong></label>
                    <div class="col-sm-3">
                        <select id="subtype" name="subtype" size="1" class="form-control">
                            <c:forEach var="vo" items="${smap.list }">
					            <option value="${vo.sportid }" ${vo.sportid == 99 ? 'selected disabled hidden' : ''}>${vo.sporttxt }</option>
				            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="mb-4 row">
                    <label class="col-sm-2 col-form-label"><strong>반 이름 설정</strong></label>
                    <div class="col-sm-3">
                        <input type="text" id="classname" name="classname" class="form-control" placeholder="이름 형식: 종목 시간 등급"/>
                    </div>
                </div>
                <div class="mb-4 row">
                    <label class="col-sm-2 col-form-label"><strong>수업 등급</strong></label>
                    <div class="col-sm-3">
                        <select id="classlevel" name="classlevel" size="1" class="form-control">
                            <c:forEach var="vo" items="${lmap.list}">
                                <option value="${vo.levelid}" ${vo.levelid == 99 ? 'selected disabled hidden': ''}>${vo.leveltxt}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="mb-4 row">
                    <label class="col-sm-2 col-form-label"><strong>등록기간</strong></label>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <input type="number" id="classyear" name="classyear" class="form-control"/>
                            <span class="input-group-text small-text">년</span>
                        </div>
                    </div>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <input type="number" id="classmonth" name="classmonth" class="form-control" />
                            <span class="input-group-text small-text">월</span>
                        </div>
                    </div>
                </div>
                <div class="mb-4 row">
                    <label class="col-sm-2 col-form-label"><strong>수업 시간</strong></label>
                    <div class="col-sm-3">
                        <select id="classtime" name="classtime" size="1" class="form-control">
                            <c:forEach var="vo" items="${tmap.list}">
                                <option value="${vo.timeid}" ${vo.timeid == 99 ? 'selected disabled hidden' : ''}>${vo.timetxt}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="mb-4 row">
                    <label class="col-sm-2 col-form-label"><strong>요일</strong></label>
                    <div class="col-sm-10 d-flex align-items-center">
                        <input type="checkbox" name="dayChk" id="dayChk" value="1" class="form-check-input" style="margin-right: 10px; margin-left: 10px;" /> 월 
                        <input type="checkbox" name="dayChk" id="dayChk" value="2" class="form-check-input" style="margin-right: 10px; margin-left: 10px;" /> 화 
                        <input type="checkbox" name="dayChk" id="dayChk" value="3" class="form-check-input" style="margin-right: 10px; margin-left: 10px;" /> 수 
                        <input type="checkbox" name="dayChk" id="dayChk" value="4" class="form-check-input" style="margin-right: 10px; margin-left: 10px;" /> 목 
                        <input type="checkbox" name="dayChk" id="dayChk" value="5" class="form-check-input" style="margin-right: 10px; margin-left: 10px;" /> 금 
                        <input type="hidden" name="classday" id="classday" value=""/>
                    </div>
                </div>
                <div class="mb-4 row">
                    <label class="col-sm-2 col-form-label"><strong>수강 정원</strong></label>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <input type="number" id="classlimit" name="classlimit" class="form-control"/>
                            <span class="input-group-text small-text">명</span>
                        </div>
                    </div>
                </div>
                <div class="mb-4 row">
                    <label class="col-sm-2 col-form-label"><strong>수강 금액</strong></label>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <input type="number" id="classprice" name="classprice" class="form-control"/>
                            <span class="input-group-text small-text">원</span>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-end">
                    <input type="submit" id="addBtn" value="추가하기" class="btn btn-primary" onclick="setDay();"/> 
                </div>
            </form>
</div>
</div>
</div>
</div>
</div>
</main>
</body>
</html>
