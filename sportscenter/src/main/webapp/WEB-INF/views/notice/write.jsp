<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    java.util.Calendar calendar = java.util.Calendar.getInstance();
	int currentYear = calendar.get(java.util.Calendar.YEAR);
	int nextMonth = (calendar.get(java.util.Calendar.MONTH) + 2) % 12;
    int currentDay = calendar.get(java.util.Calendar.DAY_OF_MONTH);
    pageContext.setAttribute("currentYear", currentYear);
    pageContext.setAttribute("nextMonth", nextMonth);
    pageContext.setAttribute("currentDay", currentDay);
%>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <script src="/js/script.js"></script>
    <script src="/smarteditor/js/HuskyEZCreator.js"></script>
    
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
    
    <script>
    var oEditors = [];
    $(function() { 
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content", // ID 변경
			sSkinURI: "/smarteditor/SmartEditor2Skin.html",    
			htParams : {
				bUseToolbar : true,
				bUseVerticalResizer : true,
				bUseModeChanger : true,
				fOnBeforeUnload : function(){}
			},
			fOnAppLoad : function(){
				//예제 코드
				//oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator: "createSEditor2"
		});
    });
    
    function goSave() {
        oEditors.getById['content'].exec('UPDATE_CONTENTS_FIELD',[]);
        $("#frm").submit();
    }

    </script>
</head>
<body>
<main>
<div class="sub" style="margin: 0 auto; width: 50%; margin-top: 100px;">
    <div class="size" style="padding: 20px; border: 1px solid #ccc; border-radius: 5px; background-color: #f5f5f5;">
        <h3 class="sub_title" style="font-size: 24px; margin-bottom: 10px;">공지 게시판</h3>
        <div class="bbs">
            <form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data">
                <table class="board_write" style="width: 100%;">
                    <tbody>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="noticetitle" id="title" class="wid100" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="noticecontent" id="content" style="width:100%;"></textarea> 
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td>
                                <input type="file" name="file" id="file" class="wid100" />
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="btnSet" style="text-align: right; margin-top: 20px;">
                <a class="btn" href="javascript:goSave();" style="background-color: #000; color: #fff; padding: 8px 16px; border-radius: 3px; text-decoration: none;">저장</a>
                </div>
            </form>
        </div>
    </div>
</div>
</main>
</body>
</html>
