<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
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
    <script>
    function del() {
    	if (confirm('삭제하시겠습니까?')) {
    		location.href='delete.do?qnaid=${vo.qnaid}';
    	}
    }
		
		<c:if test="${!empty login}">
		if ($("#content").val().trim() == '') {
			alert('답글을 입력해 주세요');
			$("#content").focus();
			return false;
		}
		if (confirm('답글을 저장하시겠습니까?')) {
    		$.ajax({
    			url: "/reply/insert.do",
    			data: {
    				qnaid: ${qvo.qnaid}, // sql거쳐 받아온 no도 있고, param에도 no가 있고 // ${param.no} 얘 써도 됨
    				content: $("#content").val(), // 컨트롤러의 커멘드객체(CommentVO vo) 안에 있는 필드명과 일치해야지
    				adminnum: ${adminLogin.qnaid}
    			},
    			success: function(res) {
    				if (res.trim() == "1") {
    					alert('답글이 정상적으로 등록되었습니다.');
    					$("#content").val('');
    					getComment(1);
    				}
    			}
    		});
		}
		</c:if>
	
	function commentDel(no) {
		if (confirm("답글을 삭제하시겠습니까?")) {
			$.ajax ({
				url: '/reply/delete.do?no='+no,
				success: function(res) {
					if (res.trim() == "1") {
						alert('댓글이 정상적으로 삭제되었습니다.');
						getComment(1);
					}
				}
			});
		}
	}
    </script>
</head> 
<body>
	<h3>Qna 게시판</h3>
	<div>
		<div>
			<div>
				<dl>
                   <dt>${qvo.qnatitle }</dt>
                   <dd class="date">작성일 : <fmt:formatDate value="${qvo.qnadate }" pattern="YYYY-MM-dd HH:mm:ss"/> </dd>
                </dl>
             </div>
             <div class="cont">${qvo.qnacontent }</div>
             <c:if test="${!empty qvo.qnafilename_org}">
             <dl class="file">
	             <dt>첨부파일 </dt>
	             <dd>
	             <a href="<c:url value="/download.do"/>?uploadPath=/upload/qna&qnafilename_org=${URLEncoder.encode(qvo.qnafilename_org)}&qnafilename_real=${qvo.qnafilename_real}" target="_blank">${qvo.qnafilename_org}</a></dd>
             </dl>
                		</c:if>                    
                        <div class="btnSet clear">
                            <div class="fl_l">
                            	<a href="/qna/index.do" class="btn">목록</a>
                      
                            </div>
                        </div>
                
                    </div>

                    <div>
                    <form method="post" name="frm" id="frm" action="" enctype="multipart/form-data" >
                        <table class="board_write">
                            <colgroup>
                                <col width="*" />
                                <col width="100px" />
                            </colgroup>
                            <tbody>
                            <tr>
                                <td>
                                    <textarea name="content" id="content" style="height:50px;"></textarea>
                                </td>
                                <td>
                                    <div class="btnSet"  style="text-align:right;">
                                        <a class="btn" href="javascript:goSave();">저장 </a>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        </form>
                    </div>
                </div>
</body> 
</html>