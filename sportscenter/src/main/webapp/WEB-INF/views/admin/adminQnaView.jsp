<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title>Qna 게시판</title>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />
    <script src="/js/script.js"></script>
    <script>
    const qnaid = '${map.qnaid}';
    
    function del() {
        if (confirm('삭제하시겠습니까?')) {
            location.href='delete.do?qnaid=' +qnaid;
        }
    }
    
    function goSave() {
        if ($("#replycontent").val().trim() == '') {
            alert('답글을 입력해 주세요');
            $("#replycontent").focus();
            return false;
        }
        if (confirm('답글을 저장하시겠습니까?')) {
            $.ajax({
                type: "POST",
                url: "/reply/insert.do",
                data: {
                    qnaid: qnaid,
                    replycontent: $("#replycontent").val(),
                },
                success: function(res) {
                    console.log(res.trim());
                    if (res.trim() != "") {
                        alert('답글이 정상적으로 등록되었습니다.');
                        $("#replycontent").val('');
                        location.reload();  // 페이지 새로고침
                    }
                }
            });
        }
    }
    


    function commentDel(no) {
        if (confirm("답글을 삭제하시겠습니까?")) {
            $.ajax ({
                url: '/reply/delete.do',
                type: 'GET',
                data: { qnaid: qnaid },
                success: function(res) {
                    if (res.trim() != "") {
                        alert('댓글이 정상적으로 삭제되었습니다.');
                        location.reload();
                    }
                }
            });
        }
    }
    

    

    </script>
</head> 
<body>
    <div class="sub">
        <div class="size">
            <h3 class="sub_title">Qna 게시판</h3>
            <div class="bbs">
                <div class="view">
                    <div class="title">
                        <dl>
                            <dt>${map.qnatitle }</dt>
                            <dd class="date">작성일 : <fmt:formatDate value="${map.qnadate }" pattern="YYYY-MM-dd"/> </dd>
                        </dl>
                    </div>
                    <div class="cont">${map.qnacontent }</div>
                    <c:if test="${!empty map.qnafilename_org}">
                    <dl class="file">
                        <dt>첨부파일 </dt>
                        <dd>
                            <a href="<c:url value="/download.do"/>?uploadPath=/upload/qna&qnafilename_org=${URLEncoder.encode(map.qnafilename_org)}&qnafilename_real=${map.qnafilename_real}" target="_blank">${map.qnafilename_org}</a>
                        </dd>
                    </dl>
                    </c:if>
                    <div>
                        <a href="/admin/adminQna" class="btn">목록</a>
                        <a href="javascript:del();" class="btn">삭제</a>
                    </div>
                </div>
            </div>
            <div id="commentSection">
                <c:set var="isQnaidExist" value="false" />
				<c:forEach var="reply" items="${rmap }">
				    <c:if test="${reply.qnaid == map.qnaid}">
				        <c:set var="isQnaidExist" value="true" />
				        <p>${reply.adminname}</p>
			            <p>등록일: <fmt:formatDate value="${reply.regdate}" pattern="YYYY-MM-dd"/></p>
			            <p>${reply.replycontent}</p>
				    </c:if>
				</c:forEach>
				
				<c:if test="${not isQnaidExist}">
				    <form method="post" name="frm" id="frm">
				        <input type="text" name="replycontent" id="replycontent">
				        <button type="button" class="btn" onclick="goSave();">저장</button>
				        <input type="hidden" id="qnaid" name="qnaid" value="${QnaVO.qnaid}">
				    </form>
				</c:if>

            </div>
        </div>
    </div>
</body> 
</html>
