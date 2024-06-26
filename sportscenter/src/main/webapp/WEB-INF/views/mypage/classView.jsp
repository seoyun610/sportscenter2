<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="kr.project.sportscenter.user.UserVO"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>

	table.list {
	  width: 100%;
	  border-collapse: collapse;
	  font-size: 14px;
	}
	
	table.list th, table.list td {
	  padding: 10px;
	  text-align: left;
	  border-bottom: 1px solid #ddd;
	}
	
	table.list th {
	  background-color: #f2f2f2;
	}
	
	table.list tr:hover {
	  background-color: #f5f5f5;
	}
	
	table.list .cancel_btn, table.list .pay_btn {
	  color: white;
	  border: none;
	  padding: 5px 10px;
	  text-align: center;
	  text-decoration: none;
	  display: inline-block;
	  font-size: 12px;
	  cursor: pointer;
	}
	
	.sub_title {
	        margin-top: 0px; /* 원하는 여백 크기 (예: 10px, 20px 등) */
	}
	table.list .pay_btn {
        background-color: #007bff; /* 파란색 */
        color: white; /* 흰색 글자 */
        border: none;
        padding: 5px 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 12px;
        cursor: pointer;
    }
    
    table.list .cancel_btn {
        background-color: #007bff; /* 파란색 */
        color: white; /* 흰색 글자 */
        border: none;
        padding: 5px 10px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 12px;
        cursor: pointer;
    }

    table.list .pay_btn:hover {
        background-color: #0056b3; /* 파란색 (더 짙은) */
    }
    .bg-dark-subtle {
	  background-color: var(--bs-dark-bg-subtle) !important;
	}
	.main-content .list {
	        width: 120%; /* 표의 너비를 120%로 설정 */
	}
    
</style>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Webestica.com">
    <meta name="description" content="Eduport- LMS, Education and Course Theme">
    <title>수강중인 강좌</title>

    <!-- Favicon -->
    <link rel="shortcut icon" href="/resources/images/favicon.ico">

    <!-- Google Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;700&family=Roboto:wght@400;500;700&display=swap">
     
    <!-- Plugins CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/vendor/font-awesome/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/tiny-slider/tiny-slider.css">
    <link rel="stylesheet" type="text/css" href="/resources/vendor/glightbox/css/glightbox.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
    <style>
	    table.list th.check {
		  padding-right: 50px;
		  text-align: left;
		}
		table.list th.period,
		table.list td.period {
		  padding-right: 20px;
		}
    	table.list {
		  width: 100%;
		  border-collapse: collapse;
		  border: 1px solid #ddd;
		  text-align: left;
		  padding: 8px;
		}
		
		table.list th {
		  background-color: #f2f2f2;
		  padding: 12px 8px;
		}
		
		table.list td {
		  padding: 8px;
		}
		
		table.list th,
		table.list td {
		  border-bottom: 1px solid #ddd;
		}
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }
        .main-content {
            flex: 1;
            margin-left: 50px;
        }
        .content-container {
            display: flex;
            flex-wrap: wrap;
        }
        .content-container > div {
            flex: 1;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp"%>
    <!-- =======================Page Banner START -->
    <section class="pt-0" style="padding-bottom: 1rem;">
	         <!-- Main banner background image -->
		<div class="container-fluid px-0">
			<div class="bg-blue h-150px h-md-300px rounded-0" style="background-image: url('/resources/images/water1.jpg'); background-repeat: no-repeat; background-position: center center; background-size: cover;">
			</div>
		</div>
        <div class="container mt-n4">
            <div class="row">
                <!-- Profile info -->
                <div class="col d-md-flex justify-content-between align-items-center mt-5 mb-1"> 
                    <div>
					    <h1 class="my-1 fs-4"><span>${vo.username}</span>  <i class="bi bi-patch-check-fill text-info small"></i></h1>
					</div>
                </div>
            </div>
        </div>
        <!-- Profile banner END -->

        <!-- Advanced filter responsive toggler START -->
        <!-- Divider -->
        <hr class="d-xl-none">
        <div class="col-12 col-xl-3 d-flex justify-content-between align-items-center">
            <a class="h6 mb-0 fw-bold d-xl-none" href="#">Menu</a>
            <button class="btn btn-primary d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
                <i class="fas fa-sliders-h"></i>
            </button> 
        </div>
        <!-- Advanced filter responsive toggler END -->
    </section>
    
    <!-- ======================= Page content START -->
    <section class="pt-0" style="padding-bottom: 25rem;"> 
        <div class="container">
            <div class="row content-container">
                <!-- Left sidebar START -->
                <div class="col-xl-3">
                    <!-- Responsive offcanvas body START -->
                    <div class="offcanvas-xl offcanvas-end" tabindex="-1" id="offcanvasSidebar">
                        <!-- Offcanvas header -->
                        <div class="offcanvas-header bg-light">
                            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">My profile</h5>
                            <button  type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
                        </div>
                        <!-- Offcanvas body -->
                        <div class="offcanvas-body p-3 p-xl-0">
                            <div class="bg-dark border rounded-3 pb-0 p-3 w-100">
                                <!-- Dashboard menu -->
                                <div class="list-group list-group-dark list-group-borderless">  
                                    <a class="list-group-item active" href="/mypage/classView.do"><i class="bi bi-basket fa-fw me-2"></i>수강 중인 강좌</a>
                                    <a class="list-group-item" href="/mypage/verifyPassword.do"><i class="bi bi-pencil-square fa-fw me-2"></i>개인 정보 수정</a>
                                    <a class="list-group-item" href="/mypage/classHistory.do"><i class="bi bi-people fa-fw me-2"></i>수강 내역 확인</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Responsive offcanvas body END -->
                </div>
                <!-- Left sidebar END -->

                <!-- Main content START -->
				<div class="col-xl-9 main-content">
				    <h3 class="sub_title">수강 중인 강좌</h3> 
				    <div> 
				        <table class="list">
								<thead>
									<tr>
										<th>수강 강좌 명</th>
										<th>수강 기간</th>
										<th>수강 취소</th>
									</tr>
								</thead>
								<tbody>
									<c:if test="${empty classList }">
										<tr>
											<td class="first" colspan="3">등록된 수강 내역이 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="classlist" items="${classList }">
										<tr>
											<td class="classname" value="${classlist.classname }"  style="padding-right:25px;">${classlist.classname }</td>
											<td>${classlist.formattedClassdate }</td>
											<td> <input type="button" class="cancel_btn" value="수강 취소" onclick="cancel(${classlist.payid}, ${classlist.classid});"></td>				
										</tr>
					        </c:forEach>
						</tbody>
					</table>
				    </div>
				
				<c:if test="${not empty retakeClass }">
					<h3 class="sub_title" style="padding-top:30px;">재수강 결제 대기 강좌</h3>
						<form method="GET" action="/class/payCheck.do" name="retakePay">
					    	<table class="list">
					    		<thead>
									<tr>
							  			<th>수강 강좌 명</th>
							  			<th>수강 기간</th>
							  			<th>수강 결제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="classrvo" items="${retakeClass }">       
							            <tr>
											<td class="retakeClassname">${classrvo.classname }</td>
											<td>${classrvo.formattedClassdate }</td>
											<td style="display: none;"> <input type="hidden" name="classid" value="${classrvo.classid }"> </td>
									        <td style="display: none;"> <input type="hidden" name="retake" value="1"> </td>
									        <td style="display: none;"> <input type="hidden" name="payid" value="${classrvo.payid }"> </td>
											<td> <input type="submit" class="pay_btn" value="결제하기"> </td>
										</tr>
						        	</c:forEach>
						        </tbody>
					        </table>    
					    </form>
				</c:if>
				</div>
				<!-- Main content END -->
            </div>
        </div>
    </section>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
    <div class="back-top">
        <i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i>
    </div>

<script>
// 	function payment(payid, classId) {
// 		// console.log(classId);
// 		const today = new Date();
// 	    const day = today.getDate();
// 	    // 테스트용
// 	    /* setTimeout(() => {
// 	    	location.href = '/class/payCheck.do?classid=' + classId;
// 		}, 3000); */
// 	    if( day >= 20 && day < 26 ) {
// 	    	location.href = '/class/payCheck.do?retake=1&classid=' + classId;
// 	    } else {
// 	    	alert('재수강 기간이 아닙니다. \n재수강 기간에 다시 신청해주세요.');
// 	    }
// 	}
	function cancel(payid, classid) {
		console.log(payid, classid);
		setTimeout(() => {
			location.href = '/pay/cancel/' + payid + '/' + classid;
		}, 800);
// 		const day = Date().getDate();
// 		if(day >= 1 and day <= 10) {
// 			location.href = '/pay/cancel/' + classid;
// 		} else {
// 			alert('10일 이후 취소 및 환불이 불가합니다.');
// 		}
	}
</script>
</body>
</html>

