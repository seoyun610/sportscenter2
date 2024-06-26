<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>취소하기</title>
	
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
	<link rel="stylesheet" type="text/css" href="/resources/css/pay.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<style>
		tbody tr td {
	        text-align: center;
	        vertical-align: middle;
	    }
	    .container {
	    	display: flex !important;
	    	flex-direction: column !important;
	    	justify-content: center !important;
			align-item: center !important;
	    	text-align: center !important;
			margin-top: 10% !important;
	/*     	left:50%; */
	/*     	margin:-50px 0 0 -50px; */
	    	width: 1000px !important;
	    	height: 300px !important;
	    }
	    .row {
	    	justify-content: center !important;
			align-item: center !important;
	    	height: 100% !important;
	    }
	    .col-lg-5 {
	    	height: 100% !important;
	    }
	    .card {
	    	height: 100% !important;
	    }
	    .payBtn {
	    	position: absolute;
	    	width: 90%;
	    	bottom: 5%;
	    }
	</style>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<body>
	<div class="container">
		<div class="row g-4 g-sm-5">
			<div class="col-lg-8 mb-4 mb-sm-0">
				<div class="card card-body p-4 shadow">
					<div class="table-responsive border-0 rounded-3">
						<table class="table align-middle p-4 mb-0">
						    <thead>
						        <tr>
						            <th>강좌명</th>
						            <th>종목</th>
						            <th>등급</th>
						            <th>시간</th>
						            <th>요일</th>
						            <th>취소 금액</th>
						        </tr>
						    </thead>
						    <tbody class="border-top-0">
						    	<c:if test="${empty cvo }">
						    		<tr>
										<td colspan="9">취소 정보가 없습니다.</td>
									</tr>
						    	</c:if>
						        <tr>
						            <td> <h4 class="mb-0 ms-lg-3 mt-lg-0">${cvo.classname}</h4></td>
						            <td> <h4 class="mb-0 ms-lg-3 mt-lg-0">${cvo.subtype}</h4></td>
						            <td> <h4 class="mb-0 ms-lg-3 mt-lg-0">${cvo.classlevel}</h4></td>
						            <td> <h4 class="mb-0 ms-lg-3 mt-lg-0">${cvo.classtime}</h4></td>
						            <td> <h4 class="mb-0 ms-lg-3 mt-lg-0">${cvo.classYoil}</h4></td>
						            <td class="text-center"> <h4 class="text-success mb-0">${cvo.classprice}</h4></td>
						        </tr>
						    </tbody>
						</table>
					</div>
					<input type="hidden" name="classid" value="${cvo.classid}">
					<input type="hidden" name="classname" value="${cvo.classname}">
					<input type="hidden" name="classprice" value="${cvo.classprice}">
					<input type="hidden" name="userid" value="${userid}">
					<input type="hidden" name="username" value="${username}">
					<input type="button" onclick="requestCancel();" class="cancelBtn" value="취소하기">
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function requestCancel() {
		var canceldata = {
			imp_uid: "${pvo.imp_uid}",
			amount: ${pvo.price}
		}
		$.ajax({
			type: 'POST',
			url: '/pay/cancel/complete',
			data: JSON.stringify(canceldata),
			dataType: 'json',
			contentType: 'application/json',
			success: function(data) {
				console.log(data);
				if(data.result === "ok") {
					alert('취소 완료');
        			window.location.href = '/mypage/classView.do'
				}
				else if(data.result === "bad_request") {
					alert('취소 오류');
        			window.location.href = '/mypage/classView.do'
				}
			}
		})
	}
</script>
</html>