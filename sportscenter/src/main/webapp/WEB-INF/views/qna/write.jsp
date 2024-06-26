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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <link rel="stylesheet" href="/css/contents.css"/>
    <script src="/js/script.js"></script>
    <script src="/smarteditor/js/HuskyEZCreator.js"></script>
    
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
    <script>
    var oEditors = [];
    $(function() {
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: "content",
            sSkinURI: "/smarteditor/SmartEditor2Skin.html",    
            htParams : {
                bUseToolbar : true,                // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseVerticalResizer : true,        // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
                bUseModeChanger : true,            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
                fOnBeforeUnload : function(){
                }
            }, //boolean
            fOnAppLoad : function(){
                //예제 코드
                //oEditors.getById["contents"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
            },
            fCreator: "createSEditor2"
        });
    })
    function goSave() {
    	oEditors.getById['content'].exec('UPDATE_CONTENTS_FIELD',[]);
    	$("#frm").submit();
    }
    </script>
</head> 
 <%@ include file="/WEB-INF/views/common/header.jsp"%>
<body>

     


<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="/resources/vendor/choices/js/choices.min.js"></script>
<script src="/resources/vendor/aos/aos.js"></script>
<script src="/resources/vendor/glightbox/js/glightbox.js"></script>
<script src="/resources/vendor/quill/js/quill.min.js"></script>
<script src="/resources/vendor/stepper/js/bs-stepper.min.js"></script>

<!-- Template Functions -->
<script src="/resources/js/functions.js"></script>
<body>
    <h1 style="text-align: center; margin-top: 50px; font-weight: bold;"> QnA</h1>
     <form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data">
     	
        <table style="width: 50%; border-collapse: collapse; margin-bottom: 15px; margin: auto;">
        	<tbody>
            <tr>
                <td colspan="2" style="padding: 10px; border: 1px solid #ddd;">
                    <label for="title" style="display: block; margin-bottom: 5px;">글 제목</label>
                    <input type="text" class="form-control" placeholder="글 제목" name="qnatitle" id="title" maxlength="50" style="width: 100%; padding: 10px; border: 1px solid #ccc;">
                </td>
            </tr>
            <tr>
                <td colspan="2" style="padding: 10px; border: 1px solid #ddd;">
                    <label for="content" style="display: block; margin-bottom: 5px;">글 내용</label>
                    <textarea class="form-control" placeholder="글 내용을 작성해주세요" name="qnacontent" id="content" maxlength="3000" style="width: 100%; padding: 10px; border: 1px solid #ccc; height: 150px;"></textarea>
                </td>
            </tr>
            <tr>
                <td style="padding: 10px; border: 1px solid #ddd;">
                    <label for="file" style="display: block; margin-bottom: 5px;">첨부파일</label>
                    <input type="file" name="file" id="file" style="margin-top: 10px;">
                </td>
            </tr>
            <tr>
            </tr>
        </table>
            <a class="btn" href="javascript:goSave();" style="background-color: #000; color: #fff; padding: 8px 16px; border-radius: 3px; text-decoration: none; margin-left: 820px; margin-top: 30px;">저장 </a>
    </form>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body> 
</html>