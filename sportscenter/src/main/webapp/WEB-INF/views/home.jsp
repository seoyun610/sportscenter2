<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!-- 한글 깨지는 거 방지(아래) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>스포츠 문화센터</title>
</head>
<script>
//로그인 여부 확인 함수
function isLoggedIn() {
  // 로그인 상태 확인 로직 구현
  // 예: 세션 정보, 쿠키 등을 확인하여 로그인 여부 판단
  return true; // 로그인 상태라고 가정
}

// 사용자 옵션 메뉴 생성 함수
function renderUserOptions() {
  const userOptionsDiv = document.querySelector('.user-options');
  userOptionsDiv.innerHTML = '';

  if (isLoggedIn()) {
    // 로그인 상태인 경우 "정보수정" 메뉴만 생성
    const editLink = document.createElement('a');
    editLink.href = '/mypage/edit.do';
    editLink.textContent = '정보수정';
    userOptionsDiv.appendChild(editLink);
  } else {
    // 로그인 상태가 아닌 경우 "로그인", "회원가입" 메뉴 생성
    const loginLink = document.createElement('a');
    loginLink.href = '/user/login.do';
    loginLink.textContent = '로그인';
    userOptionsDiv.appendChild(loginLink);

    const joinLink = document.createElement('a');
    joinLink.href = '/user/join.do';
    joinLink.textContent = '회원가입';
    userOptionsDiv.appendChild(joinLink);
  }
}

// 페이지 로드 시 사용자 옵션 메뉴 생성
window.addEventListener('load', renderUserOptions);
</script>

<body>
	<!-- Header -->
	<header>
		<div class="header-container">
		<!-- 내비게이션 메뉴 -->
			<h1>스포츠 문화 센터</h1>
			<nav>
				<ul id="main-nav"> 
					<li><a href="#">종목/안내</a>
					<li><a href="#">수강신청</a>
					<li><a href="#">커뮤니티</a>
				</ul>
			</nav>
			<!-- 사용자 옵션 (로그인, 회원가입) -->
			<div class="user-options">
				<a href="/user/login.do">로그인</a>
				<a href="/user/join.do">회원가입</a>
				<a href="/mypage/edit.do">정보수정</a>
				<!-- #에는 로그인, 회원가입 이동 링크 삽입 -->
			</div>
		</div>
	</header>
	
	<!-- 콘텐츠 영역 -->
	<main>
		<section class="programs">
			<div class="program">
				<h3>수영</h3>
				<p>수영은 육상에서 하는 운동과 달리 부력...</p>
			</div>
			<div class="program">
				<h3>헬스</h3>
				<p>헬스는 부담 없이...</p>
			</div>
			<div class="program">
				<h3>스쿼시</h3>
				<p>...</p>
			</div>			 
	    </section>
	    
	  <!-- 공지사항 -->
	    <section class="announcements">
	    	<div class="notices">
	    		<h3>공지사항</h3>
	    		<ul>
	    			<li>가나다</li>
	    			<li>가나다</li>
	    			<li>가나다</li>
	    			<li>가나다</li>
	    		</ul>
	    	</div>
	    	<div class="communities">
	    		<h3>커뮤니티</h3>
	    	    <ul>
	    			<li>가나다</li>
	    			<li>가나다</li>
	    			<li>가나다</li>
	    			<li>가나다</li>
	    		</ul>
	    	</div>
	    </section>  
	</main>
	
	<!-- 푸터 -->
	<footer>
		<div class="footer-container">
		<!-- 주소 및 연락처 -->
		<address>
			<p>03993)서울 마포구 월드컵북로 4길 77</p>
			<p>고객센터:02-2180-3743~4</p> 
		</address>
		<!-- 푸터 링크 -->
		<div class="footer-links">
			<a href="#">개인정보처리방침</a>
			<a href="#">이용약관</a>
			<a href="#">찾아오시는 길</a>
			</div>
			</div>
		</footer>
	</body>
</html>