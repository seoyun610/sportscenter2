<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<div class="sub">
    <div class="size">
        <h3 class="sub_title">종목 게시판</h3>
        <div class="bbs">
            <form method="post" name="frm" id="frm" action="insert.do" enctype="multipart/form-data">
                <table class="board_write">
                    <tbody>
                        <tr>
                            <th>제목</th>
                            <td>
                                <input type="text" name="subjecttype" id="title" class="wid100" value=""/>
                            </td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td>
                                <textarea name="subjectcontent" id="content" style="width:100%;"></textarea> 
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
                <a class="btn" href="javascript:goSave();">저장</a>
            </form>
        </div>
    </div>
</div>
</body>
</html>
