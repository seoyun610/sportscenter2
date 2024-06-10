<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script src="/js/script.js"></script>
    <style>
        .form-container {
            display: none;
            margin-top: 20px;
        }
        .form-container.active {
            display: block;
        }
    </style>
    <script>
        $(document).ready(function() {
            // 초기 로드시 아이디 찾기 폼을 보이게 설정
            $("#findId_container").addClass("active");
        });

        function showForm(formId) {
            $(".form-container").removeClass("active");  
            $("#" + formId).addClass("active");
        }

        function findId() {
            $.ajax({
                url: '/user/findId.do',
                data: {
                    username: $("#username").val(),
                    birth: $("#birth").val(),
                    hp: $("#hp").val()
                },
                type: 'POST',
                success: function(res) {
                    if (res === "일치하는 회원 정보가 없습니다.") {
                        alert(res);
                    } else {
                        alert("찾으시는 아이디는 " + res + "입니다.");
                    }
                },
                error: function(err) {
                    alert("오류가 발생했습니다. 다시 시도해 주세요.");
                }
            });
        }

        function findPassword() {
            $.ajax({
                url: '/user/findPassword.do',
                data: {
                    userid: $("#userid").val(),
                    birth: $("#birth").val(),
                    hp: $("#hp").val()
                },
                type: 'POST',
                success: function(res) {
                    if (res === "일치하는 회원 정보가 없습니다.") {
                        alert(res);
                    } else {
                        alert(res);
                    }
                },
                error: function(err) {
                    alert("오류가 발생했습니다. 다시 시도해 주세요.");
                }
            });
        }
    </script>
</head>
<body>
  <div>
        <button type="button" class="btn btn-primary" onclick="showForm('findId_container')">아이디 찾기</button>
        <button type="button" class="btn btn-primary" onclick="showForm('findPassword_container')">비밀번호 변경</button>
    </div>

    <div id="findId_container" class="form-container">
        <form class="form-horizontal" role="form" onsubmit="findId(); return false;">
            <div class="form-group">
                <input type="text" id="username" name="username" placeholder="이름을 입력해주세요." required autofocus>
            </div>
            <div class="form-group">
                <input type="text" id="birth" name="birth" placeholder="생년월일 8자리를 입력해주세요." required>
            </div>
            <div class="form-group">
                <input type="text" id="hp" name="hp" placeholder="휴대전화번호를 입력해주세요." required>
                <button type="submit" class="btn btn-primary">아이디 찾기</button>
            </div>
        </form>
    </div>

    <div id="findPassword_container" class="form-container">
        <form class="form-horizontal" role="form" onsubmit="findPassword(); return false;">
            <div class="form-group">
                <input type="text" id="userid" name="userid" placeholder="아이디를 입력해주세요." required autofocus>
            </div>
            <div class="form-group">
                <input type="text" id="birth" name="birth" placeholder="생년월일 8자리를 입력해주세요." required>
            </div>
            <div class="form-group">
                <input type="text" id="hp" name="hp" placeholder="휴대전화번호를 입력해주세요." required>
            </div>
            <div class="form-group"> 
                <button type="submit" class="btn btn-primary">확인</button>
            </div>
        </form>
    </div>
</body>
</html>