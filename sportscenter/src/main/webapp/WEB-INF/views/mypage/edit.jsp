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
    <title>개인정보 수정</title>
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

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
    <!-- Favicon -->
    <link rel="shortcut icon" href="/resources/images/favicon.ico">
    <style>
    .btnSet {
        clear: both;
        text-align: right;
    }

    .zipcode {
        display: flex;
        align-items: center;
        justify-content: space-between;
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
        margin-top: 10px;
        margin-right: 10px;
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
        margin-left: 10px;
        margin-top: 10px;
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

    /* Additional CSS for the last row */
     .last-row {
        padding-bottom: 10px; /* Additional padding for the last row */
    }
    .board_write th,
    .board_write td {
        padding-bottom: 15px; /* Add padding to the bottom of all table cells */
    }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp"%>
    <section class="pt-0" style="padding-bottom: 1rem;">
        <div class="container-fluid px-0">
            <div class="bg-blue h-150px h-md-300px rounded-0" style="background-image: url('/resources/images/water1.jpg'); background-repeat: no-repeat; background-position: center center; background-size: cover;">
            </div>
        </div>
        <div class="container mt-n4">
            <div class="row">
                <div class="col d-md-flex justify-content-between align-items-center mt-5 mb-1">
                    <div>
                        <h1 class="my-1 fs-4"><span>${vo.username}</span> <i class="bi bi-patch-check-fill text-info small"></i></h1>
                    </div>
                </div>
            </div>
        </div>
        <hr class="d-xl-none">
        <div class="col-12 col-xl-3 d-flex justify-content-between align-items-center">
            <a class="h6 mb-0 fw-bold d-xl-none" href="#">Menu</a>
            <button class="btn btn-primary d-xl-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSidebar" aria-controls="offcanvasSidebar">
                <i class="fas fa-sliders-h"></i>
            </button>
        </div>
    </section>

    <section class="pt-0" style="padding-bottom: 25rem;">
        <div class="container">
            <div class="row content-container">
                <div class="col-xl-3">
                    <div class="offcanvas-xl offcanvas-end" tabindex="-1" id="offcanvasSidebar">
                        <div class="offcanvas-header bg-light">
                            <h5 class="offcanvas-title" id="offcanvasNavbarLabel">My profile</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasSidebar" aria-label="Close"></button>
                        </div>
                        <div class="offcanvas-body p-3 p-xl-0">
                            <div class="bg-dark border rounded-3 pb-0 p-3 w-100">
                                <div class="list-group list-group-dark list-group-borderless">
                                    <a class="list-group-item" href="/mypage/classView.do"><i class="bi bi-basket fa-fw me-2"></i>수강 중인 강좌</a>
                                    <a class="list-group-item active" href="/mypage/verifyPassword.do"><i class="bi bi-pencil-square fa-fw me-2"></i>개인 정보 수정</a>
                                    <a class="list-group-item" href="/mypage/classHistory.do"><i class="bi bi-people fa-fw me-2"></i>수강 내역 확인</a>
                                </div>  
                            </div>
                        </div>
                    </div>
                </div>
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
                                            <td><input type="password" name="pwd" id="pwd" placeholder="비밀번호는 숫자, 영문 조합으로 8자 이상으로 입력해주세요." style="width: 500px;"> <span class="ptxt"></span> </td>
                                        </tr>
                                        <tr>
                                            <th>비밀번호<span>확인</span></th>
                                            <td><input type="password" name="pwd_check" id="pwd_check" placeholder="비밀번호는 숫자, 영문 조합으로 8자 이상으로 입력해주세요." style="width: 500px;"></td>
                                        </tr>
                                        <tr>
                                            <th>이름</th>
                                            <td><input type="text" name="username" id="username" style="width: 500px;" value="${vo.username}" readonly> </td>
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
                                                <div class="zipcode">
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
                                        <tr class="last-row">
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
            </div>
        </div>
    </section>

    <!-- JavaScript libraries -->
    <script>

            var dupCheck = false;

            function goSave() {
                if ($("#pwd").val() != '') {
                    if ($("#pwd").val() != $("#pwd_check").val()) {
                        alert('비밀번호를 확인하세요');
                        return;
                    }
                    var reg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/;
                    if ($("#pwd").val().match(reg) == null) {
                        alert('비밀번호는 영문+숫자 조합으로 8자이상 입력하세요');
                        $("#pwd").val('');
                        $("#pwd_check").val('');
                        return;
                    }
                }
                
//                 if ($("#pwd").val() == '') {
//                     var reg = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,}$/;
//                     if ($("#pwd").val().match(reg) == null) {
//                         alert('비밀번호를 입력하세요');
//                         $("#pwd").val('');
//                         $("#pwd_check").val('');
//                         return;
//                     }
//                 }

                if ($("#hp").val() == '') {
                    alert('전화번호를 입력하세요');
                    $("#hp").focus();
                    return; 
                }
                if ($("#addr").val() == '') {
                    alert('주소를 입력하세요');
                    $("#addr").focus();
                    return;
                }
                // 전송
                $("#frm").submit();
            }

            $(".pay_btn").click(goSave);
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
        //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
        function zipcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                    // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                    // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraRoadAddr !== ''){
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    $('#zipcode').val(data.zonecode);
                    $('#addr').val(roadAddr);
                }
            }).open();
        }
    </script>

    <%@ include file="/WEB-INF/views/common/footer.jsp" %> 
</body>
</html>
