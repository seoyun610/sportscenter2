<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Webestica.com">
    <meta name="description" content="Eduport- LMS, Education and Course Theme">
    <title>비밀번호 확인</title>

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
	    .submit_btn {
	    background-color: #007bff;
	    color: white;
	    border: none;
	    padding: 10px 15px;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 14px;
	    cursor: pointer;
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
        /* Additional CSS styling can be added here */
        .sub_title {
            margin-top: 0px;
        }
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
        table.list .cancel_btn:hover, table.list .pay_btn:hover {
            background-color: #45a049;
        }
        table.list .pay_btn {
            background-color: #007bff;
        }
        table.list .pay_btn:hover {
            background-color: #0056b3;
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
                        <h1 class="my-1 fs-4"><span>${vo.username}</span> <i class="bi bi-patch-check-fill text-info small"></i></h1>
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
                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
                        </div>
                        <!-- Offcanvas body -->
                        <div class="offcanvas-body p-3 p-xl-0">
                            <div class="bg-dark border rounded-3 pb-0 p-3 w-100">
                                <!-- Dashboard menu --> 
                                <div class="list-group list-group-dark list-group-borderless">
                                    <a class="list-group-item" href="/mypage/classView.do"><i class="bi bi-basket fa-fw me-2"></i>수강 중인 강좌</a>
                                    <a class="list-group-item active" href="/mypage/verifyPassword.do"><i class="bi bi-pencil-square fa-fw me-2"></i>개인 정보 수정</a>
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
                    <h3 class="sub_title">비밀번호 확인</h3>
                    <form action="${pageContext.request.contextPath}/mypage/verifyPassword.do" method="post">
                        <input type="hidden" name="userid" value="${sessionScope.login.userid}">
                        <label for="pwd">비밀번호:</label>
                        <input type="password" id="pwd" name="pwd" class="form-control mb-3" style="width: 300px;">
                        <button type="submit" class="submit_btn">확인</button>
                    </form>
                    <c:if test="${not empty msg}">
                        <p style="color: red; font-size: 14px; font-weight: bold;">${msg}</p>
                    </c:if>
                </div>
                <!-- Main content END -->
            </div>
        </div>
    </section>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<!-- Main Content END -->

</body>
</html>
