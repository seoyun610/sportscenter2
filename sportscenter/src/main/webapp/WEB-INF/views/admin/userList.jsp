<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style>
.sidenav {
  height: 100%;
  width: 200px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #f1f1f1;
  overflow-x: hidden;
  padding-top: 20px;
  transition: 0.5s;
}

.sidenav:hover {
  width: 250px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #000;
}

.sidenav .dropdown-btn {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 20px;
  color: #818181;
  display: block;
  border: none;
  background: none;
  width: 100%;
  text-align: left;
  cursor: pointer;
  outline: none;
}

.sidenav .dropdown-btn:hover {
  color: #000;
}

.sidenav .dropdown-container {
  display: none;
  background-color: #e8e8e8;
  padding-left: 8px;
}

.sidenav .dropdown-container a {
  font-size: 16px;
  color: #6c6c6c;
}

.main {
  margin-left: 200px;
  padding: 0px 10px;
}
</style>
</head>
<body>

<div class="sidenav">
  <a href="#">회원관리</a>
  <button class="dropdown-btn">강좌관리
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">강좌정보관리</a>
    <a href="classList.do">강좌등록</a>
  </div>
  <button class="dropdown-btn">게시판관리
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="adminSubject.do">종목안내</a>
    <a href="#">이용안내</a>
    <a href="adminNotice.do">공지사항</a>
    <a href="adminQna.do">Q&A</a>
  </div>
</div>


<script>
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}
</script>

</body>
</html>
