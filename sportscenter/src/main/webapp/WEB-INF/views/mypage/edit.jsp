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
	.btnSet {
        clear: both;
        text-align: right; /* 추가 */
    }
    
    .zipcode_style {
    display: flex;
    align-items: center;
    justify-content: space-between; /* Added this line */
    }
    
    .zipcode_btn {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 5px 10px;
        text-align: center;
        text-decoration: none;
        font-size: 12px;
        cursor: pointer;
        margin-left: 20px;
    }
    
    .pay_btn {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    cursor: pointer;
    margin-top: 20px; /* 버튼을 아래로 내림 */
    margin-right: 10px; /* 오른쪽으로 이동 */ 
	}

    .pay_btn:hover {
        background-color: #0056b3;
    }

    .cancel_btn {
    background-color: #007bff;
    color: white;
    border: none;
    padding: 10px 15px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 14px;
    cursor: pointer;
    margin-left: 10px; /* 버튼 간 간격 */
    margin-top: 20px; /* 버튼을 아래로 내림 */
	}
    .cancel_btn:hover {
        background-color: #c82333;
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
        margin-bottom: 20px;
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
                <div class="wrap col-xl-9" style="padding-left: 65px;">
                    <div class="sub">
                        <div class="size">
                            <h3 class="sub_title">회원정보수정</h3>
                            <form name="frm" id="frm" action="update.do" method="post">
                                <table class="board_write">
                                    <colgroup>
                                        <col width="50%" />
                                        <col width="*" />
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th>아이디</th>
                                            <td>${vo.userid}</td>
                                        </tr>
                                        <tr>
                                            <th>비밀번호</th>
                                            <td><input type="password" name="pwd" id="pwd" placeholder="비밀번호는 숫자, 영문 조합으로 8자 이상으로 입력해주세요." style="width: 500px;">  <span class="ptxt"></span> </td>
                                        </tr>
                                        <tr>
                                            <th>비밀번호<span>확인</span></th>
                                            <td><input type="password" name="pwd_check" id="pwd_check" placeholder="비밀번호는 숫자, 영문 조합으로 8자 이상으로 입력해주세요." style="width: 500px;"></td>
                                        </tr>
                                        <tr>
                                            <th>이름</th>
                                            <td><input type="text" name="username" id="username" style="width: 500px%;" value="${vo.username}" readonly> </td>
                                        </tr>
                                        <tr>
										    <th>성별</th>
										    <td> 
										        <select name="gender" id="gender" style="width: 500px;" disabled>
										            <option value="1" <c:if test="${vo.gender == 1}">selected</c:if>>남성</option>
										            <option value="2" <c:if test="${vo.gender == 2}">selected</c:if>>여성</option>
										        </select> 
										    </td>
										</tr>
                                        <tr>
                                            <th>생년월일</th>
                                            <td><input type="text" name="birth" id="birth" style="width: 500px;" value="${vo.birth}" readonly> </td>
                                        </tr>
                                        <tr>
                                            <th>휴대폰 번호</th>
                                            <td> 
                                                <input type="text" name="hp" id="hp" value="${vo.hp}" maxlength="15" style="width: 500px;">
                                            </td>
                                        </tr>
										<tr>
										    <th rowspan="3">주소</th>
										    <td> 
										        <div class="zipcode_style">
										            <input type="text" name="zipcode" id="zipcode" value="${vo.zipcode}" maxlength="6" style="width: 400px;" readonly> 
										            <a href="javascript:zipcode();" class="zipcode_btn">우편번호</a>
										        </div>
										    </td>
										</tr>
                                        <tr>
                                            <td>
                                                <input type="text" name="addr" id="addr" value="${vo.addr}" maxlength="15" style="float: left; width: 500px;" readonly>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <input type="text" name="addr2" id="addr2" value="${vo.addr2}" maxlength="15" style="float: left; width: 500px;">
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <input type="hidden" name="usernum" value="${vo.usernum}"/>
                            </form>
 							<div class="btnSet clear">
							    <div> 
							        <a href="javascript:;" class="pay_btn" onclick="goSave();">수정</a> 
							        <a href="javascript:;" class="cancel_btn" onclick="location.href='/home.do';">취소</a>
							    </div>
							</div>
                        </div>
                    </div>
                </div>
                <!-- Main content END -->
            </div>
        </div>
    </section>

    <!-- JavaScript libraries -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        // JavaScript function to handle postcode retrieval
        function zipcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var roadAddr = data.roadAddress;
                    var extraRoadAddr = '';

                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    $('#zipcode').val(data.zonecode);
                    $('#addr').val(roadAddr);
                }
            }).open();
        }
    </script>

    <!-- Common footer -->
    <%@ include file="/WEB-INF/views/common/footer.jsp" %> 
</body>
</html>