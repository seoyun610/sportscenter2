<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    java.util.Calendar calendar = java.util.Calendar.getInstance();
	int currentYear = calendar.get(java.util.Calendar.YEAR);
	int nextMonth = (calendar.get(java.util.Calendar.MONTH) + 2) % 12;
    int currentDay = calendar.get(java.util.Calendar.DAY_OF_MONTH);
   // pageContext.setAttribute("currentDay", currentDay);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>course modify</title>
<META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
<script type="text/javascript">
	function memberCheck(){
	    $.ajax({
	        url: '/user/findMem.do',
	        type: 'POST',
	        data: { 
	            username: $("#username2").val(),
	            birth: $("#birth2").val(),
	            hp: $("#hp2").val() 
	        },
	        success: function(res) {
	            if (res !== "fail") {
	                // 가입 내역이 있을 때의 처리
	                document.getElementById('res').innerText = "확인 되는 회원 아이디는 " + res.userid + "입니다.";
	                document.getElementById('res').style.color = "green";
					document.getElementsByName('userid')[0].value = res.userid;
					document.getElementsByName('usernum')[0].value = res.usernum;
	            } else {
	                document.getElementById('res').innerText = "가입되지 않은 회원입니다.";
	                document.getElementById('res').style.color = "red";
	            }
	        },
	        error: function(xhr, status, error) {
	        	document.getElementById('res').innerText = "가입되지 않은 회원입니다.";
                document.getElementById('res').style.color = "red";
	        }
	    });
	}

</script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Webestica.com">
<meta name="description" content="Eduport- LMS, Education and Course Theme">
<!-- Favicon -->
<link rel="shortcut icon" href="/resources/images/favicon.ico">

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
					 <h2 class="m-0 font-weight-bold text-primary">현장 접수 회원 등록</h2>
			 	</div>
				<div class="card-body">       
                    <form class="row g-4" name="offregist" action="offRegist.do" method="post">
                        <div class="mb-4 d-flex align-items-center">
                            <label class="col-sm-2 col-form-label"><strong>회원 아이디</strong></label>
                            <div class="input-group d-flex flex-grow-1">
								<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3">
									<i class="bi bi-person-plus-fill"></i>
								</span>
                                <input type="text" class="form-control border-0 bg-light rounded-end ps-1 flex-grow-1" style="max-width: 200px;" id="userid" name="userid" readonly="readonly">
                                <a href="#" class="btn btn-primary-soft ms-2 mb-0" data-bs-toggle="modal" data-bs-target="#appDetail" style="font-size: 0.8rem; ">회원 정보 검색</a>
                            </div>
                        </div>
                        <div class="mb-4 d-flex align-items-center">
							<label class="col-sm-2 col-form-label"><strong>수업 강좌</strong></label>
                            <div class="input-group d-flex flex-grow-1">
								<span class="input-group-text bg-light rounded-start border-0 text-secondary px-3">
									<i class="bi bi-calendar4-week"></i>
								</span>
                                <input type="text" class="form-control border-0 bg-light rounded-end ps-1 flex-grow-1" style="max-width: 200px;" id="classname" name="classname" readonly="readonly">
                                <a href="#" class="btn btn-primary-soft ms-2 mb-0" data-bs-toggle="modal" data-bs-target="#CappDetail" style="font-size: 0.8rem;">수업 정보 검색</a>
                            </div>
                        </div>
                        <div class="mb-4 d-flex align-items-center">
                            <label class="col-sm-2 col-form-label"><strong>수강 금액</strong></label>
							<div class="input-group d-flex flex-grow-1">
                                <span class="input-group-text bg-light rounded-start border-0 text-secondary px-3">
                                     <i class="bi bi-currency-dollar"></i>
                                </span>
                                <input type="text" class="form-control border-0 bg-light rounded-end ps-1 flex-grow-1" style="max-width: 200px;" id="price" name="price" placeholder="일할 계산 후 입력해주세요.">
                            </div>
                        </div>
                        <div class="d-flex justify-content-start">
                            <button type="submit" class="btn btn-primary mb-0">등록하기</button> 
                        </div>
                            <input type="hidden" id="usernum" name="usernum">
                            <input type="hidden" id="classid" name="classid"> 
                            <input type="hidden" id="classcnt" name="classcnt">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>




<!-- Modal START -->
<div class="modal fade" id="appDetail" tabindex="-1" aria-labelledby="appDetaillabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			
			<!-- Modal header -->
			<div class="modal-header bg-dark">
				<h3 class="modal-title text-white" id="appDetaillabel">회원 찾기</h3>
				<button type="button" class="btn btn-sm btn-light mb-0 ms-auto" data-bs-dismiss="modal" aria-label="Close"><i class="bi bi-x-lg"></i></button>
			</div>

			<!-- Modal body -->
            <!-- Modal body -->
			<form name="frm">
			    <div class="modal-body p-5">
			        <!-- Name -->
			        <div class="form-group row mb-3">
			            <h4 class="col-sm-3 col-form-label">이름 : </h4>
			            <div class="col-sm-9">
			                <input type="text" id="username2" name="username2" class="form-control form-control-sm" style="max-width: 200px;">
			            </div>
			        </div>
			
			        <!-- Birthdate -->
			        <div class="form-group row mb-3">
			            <h4 class="col-sm-3 col-form-label">생년월일 : </h4>
			            <div class="col-sm-9">
			                <input type="text" id="birth2" name="birth2" class="form-control form-control-sm" style="max-width: 200px;">
			            </div>
			        </div>
			
			        <!-- Phone number -->
			        <div class="form-group row mb-3">
			            <h4 class="col-sm-3 col-form-label">연락처 : </h4>
			            <div class="col-sm-9">
			                <input type="text" id="hp2" name="hp2" class="form-control form-control-sm" style="max-width: 200px;">
			            </div>
			        </div>
			
			        <p class="text-dark mb-0 d-flex justify-content-start">
			            <input type="button" value="검색" onclick="memberCheck()" class="btn btn-sm btn-light mb-0 ms-auto">
			        </p>
			        <p id="res"></p>
			    </div>
			</form>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger-soft my-0" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>   
<!-- Modal END -->

<!-- Modal START -->
<div class="modal fade" id="CappDetail" tabindex="-1" aria-labelledby="appDetaillabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			
			<!-- Modal header -->
			<div class="modal-header bg-dark">
				<h5 class="modal-title text-white" id="appDetaillabel">강의 선택하기</h5>
				<button type="button" class="btn btn-sm btn-light mb-0 ms-auto" data-bs-dismiss="modal" aria-label="Close"><i class="bi bi-x-lg"></i></button>
			</div>

			<!-- Modal body -->
            <form name="frm">
			<div class="modal-body p-5">
				<input type="hidden" id="classyear" name="classyear" value="<%=currentYear %>">
				<input type="hidden" id="classmonth" name="classmonth" value="<%=nextMonth%>">
                <table class="table">
                    <thead>
                        <tr>
                            <th>선택</th>
                            <th>수업 유형</th>
                            <th>요일</th>
                            <th>시간</th>
                            <th>수준</th>
                            <th>가격</th>
                            <th>제한 인원</th>
                            <th>현재 인원</th>
                        </tr>
                    </thead>
                    <tbody id="classTableBody">
                        <!-- AJAX 요청 후 데이터가 여기에 삽입됩니다. -->
                    </tbody>
                </table>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-primary-soft my-0" onclick="selectClass()">선택하기</button>
				<button type="button" class="btn btn-danger-soft my-0" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
</body>
<script>
	$('#CappDetail').on('shown.bs.modal', function () {
	    classCheck();
	    console.log("확인하기");
	});
	
	function classCheck() {
	    var classyear = $("#classyear").val();
	    var classmonth = $("#classmonth").val();
	
	    console.log("classyear: ", classyear);
	    console.log("classmonth: ", classmonth);
	
	    $.ajax({
	        url: '/class/foroff.do',
	        type: 'get',
	        data: {
	            classyear: classyear,
	            classmonth: classmonth
	        },
	        dataType: 'json',
	        success: function(data) {
	            var tableBody = '';
	            console.log("확인하기2");
	            $.each(data, function(index, vo) {
	            	tableBody += '<tr>';
	                tableBody += '<td><input type="radio" class="form-check-input" id="classid_' + index + '" name="crd" value="' + vo.classid + '" data-classname="' + vo.classname + '" data-classcnt="' + vo.classcnt + '" onclick="checkOnlyOnce(this)" /></td>';
	                tableBody += '<td>' + vo.subtypeName + '</td>';
	                tableBody += '<td id="classday">' + vo.classYoil + '</td>';
	                tableBody += '<td>' + vo.formattedClasstime + '</td>';
	                tableBody += '<td>' + vo.classlevelName + '</td>';
	                tableBody += '<td>' + vo.classprice + '</td>';
	                tableBody += '<td>' + vo.classlimit + '</td>';
	                tableBody += '<td>' + vo.classcnt + '</td>';
	                tableBody += '</tr>';
	            });
	            $('#classTableBody').html(tableBody);
	        },
	        error: function(xhr, status, error) {
	            console.error("AJAX Error: ", status, error);
	        },
	        complete: function(xhr, status) {
	            console.log("AJAX 요청 완료: ", status);
	            console.log("응답 데이터: ", xhr.responseText);
	        }
	    });
	}
    function selectClass() {
	    var selectedRadio = $('input[name="crd"]:checked');
	    if (selectedRadio.length > 0) {
	        var className = selectedRadio.data('classname');
	        var classCnt = selectedRadio.data('classcnt');
	        var classId = selectedRadio.val();
	        
	        $('input[name="classname"]').val(className);
	        $('input[name="classcnt"]').val(classCnt);
	        $('input[name="classid"]').val(classId);
	        
	        $('#CappDetail').modal('hide');
	    } else {
	        alert("수업을 선택하세요.");
	    }
	}

	function checkOnlyOnce(element) {
	    var checkboxes = document.getElementsByName('crd');
	    checkboxes.forEach((item) => {
	        if (item !== element) item.checked = false;
	    });
	}
</script>
</html>