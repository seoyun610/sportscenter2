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
    <style>
    tbody tr td {
        text-align: center;
        vertical-align: middle;
    }
</style>
    
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
    
    function commentDel(qnaid) {
        if (confirm("답글을 삭제하시겠습니까?")) {
            $.ajax ({
                url: '/qna/delete.do',
                type: 'GET',
                data: { qnaid: qnaid },
                success: function(res) {
                    if (res.trim() != "") {
                        alert('문의글이 정상적으로 삭제되었습니다.');
                        location.href='adminQna.do';
                    }
                }
            });
        }
    }
    
    function commentEdit(replyid, replycontent) {
        $("#editReplyContent").val(replycontent);
        $("#editSection").data("replyid", replyid).show();
        $("#commentSection").hide(); 
    }

    function saveEdit() {
        const replyid = $("#editSection").data("replyid");
        const newContent = $("#editReplyContent").val();
        if (newContent.trim() == '') {
            alert('답글을 입력해 주세요');
            $("#editReplyContent").focus();
            return false;
        }
        if (confirm('답글을 수정하시겠습니까?')) {
            $.ajax({
                type: "POST",
                url: "/reply/update.do",
                data: {
                	qnaid: qnaid,
                	replyid: replyid,
                    replycontent: newContent,
                },
                success: function(res) {
                    console.log(res.trim());
                    if (res.trim() != "") {
                        alert('답글이 정상적으로 수정되었습니다.');
                        $("#editSection").hide();
                        location.reload();  // 페이지 새로고침
                    }
                }
            });
        }
    }
    

    </script>
</head> 
<body>
<main>
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %> 
<div class="page-content">
<%@ include file="/WEB-INF/views/admin/topbar.jsp" %>
<!-- Page main content START -->
	<div class="page-content-wrapper border">

		<!-- Title -->
		<div class="row">
			<div class="col-12 mb-3">
				<h1 class="h3 mb-2 mb-sm-0">QnA</h1>
			</div>
		</div>

		

			
			<div class="mt-4 mb-4">

				<!-- Tab Content START -->
				<div class="tab-content">

					<!-- Personal Information content START -->
					<div class="tab-pane show active" id="tab-1">
						<div class="card shadow">

							<!-- Card header -->
							<div class="card-header border-bottom">
								<h3 class="card-header-title">QnA 문의글</h3>
							</div>

							<!-- Card body START -->
							<div class="card-body">
								<form class="row g-4 align-items-center">
		
									<!-- Input item -->
									<div class="col-lg-4" style="pointer-events: none;">
										<label class="form-label">제목: </label>
										<input type="text" class="form-control" placeholder="${map.qnatitle }"></button>
										 <dd class="date" style="font-size: 12px;">작성일 : <fmt:formatDate value="${map.qnadate }" pattern="YYYY-MM-dd"/></dd>
									</div>

									
									<!-- Textarea item -->
									<div class="col-12" style="pointer-events: none;font-family: 'Noto Sans KR', sans-serif;">
										<label class="form-label">문의 내용</label>
										<textarea class="form-control" rows="3" style="pointer-events: none;font-family: 'Noto Sans KR', sans-serif;">${map.qnacontent }</textarea>
									</div>
									
									<c:if test="${!empty map.qnafilename_org}">
                        				<dl class="file">
                            			<dt>첨부파일 </dt> 
                          				<dd>
                            			<a href="<c:url value="/download.do"/>?uploadPath=/upload/qna&qnafilename_org=${URLEncoder.encode(map.qnafilename_org)}&qnafilename_real=${map.qnafilename_real}" target="_blank">${map.qnafilename_org}</a> 
                          				</dd>
                        				</dl>
                       				</c:if> 
									
									<!-- Save button -->
									<div class="d-sm-flex justify-content-end">
										<button type="button" class="btn" style="background-color: black; color: white; margin-left: 10px;"><a href="/admin/adminQna.do" style="color: white; text-decoration: none; margin-left: 10px;">목록</a></button>
										<button type="button" class="btn" style="background-color: black; color: white;"><a href="javascript:commentDel(${map.qnaid});" style="color: white; text-decoration: none;">게시글 삭제</a></button>
									</div>
									
									<div class="card-header border-bottom">
										<h5 class="card-header-title">QnA 답글</h5>
									</div>
									
									<div>
                 						<c:set var="isQnaidExist" value="false" />
                						<c:forEach var="reply" items="${rmap }">
                     					<c:if test="${reply.qnaid == map.qnaid}">
                         				<c:set var="isQnaidExist" value="true" />
                        			<p>${reply.adminname} 답변</p>
                         			<p style="font-size: 15px;">작성일: <fmt:formatDate value="${reply.regdate}" pattern="YYYY-MM-dd"/></p>
                         			
                         			<textarea class="form-control" rows="3" style="font-family: 'Noto Sans KR', sans-serif;">${reply.replycontent}</textarea>
                         		 
                 				
                         		<input type="button" class="btn" onclick="commentDel(${reply.replyid});" value="삭제" style="background-color: black; color: white;">
                         		<input type="button" class="btn" onclick="commentEdit(${reply.replyid}, '${reply.replycontent}');" value="수정" style="background-color: black; color: white;">
                    		</c:if>
                 				</c:forEach>
                 				
				                 <c:if test="${not isQnaidExist}">
							    <form method="post" name="frm" id="frm"> 
				  				    	<h5>댓글 작성</h5>
				 				        <input type="text" name="replycontent" id="replycontent"> 
				 				        <input type="button" class="btn" onclick="goSave();" value="등록"> 
				                         <input type="hidden" id="qnaid" name="qnaid" value="${QnaVO.qnaid}">
								    </form> 
				                 </c:if>
            				  </div> 
							 <!--수정 영역 -->
										<div id="editSection" style="display: none;">
										    <div> 
										    	<h5>답글 수정</h5>
										        <textarea class="form-control" rows="2" id="editReplyContent"></textarea> 
									        <button class="btn" onclick="saveEdit()" style="background-color: black; color: white;">저장</button> 
										        <button class="btn" onclick="$('#editPopup').hide()" style="background-color: black; color: white;">취소</button>
									    </div> 
										</div> 
							         </div> 
  								  </div> 
								</form>
							</div>
						</div>			
					</div>
</div>
</main>
<!-- Back to top -->
<div class="back-top"><i class="bi bi-arrow-up-short position-absolute top-50 start-50 translate-middle"></i></div>

<!-- Bootstrap JS -->
<script src="/resources/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>

<!-- Vendors -->
<script src="/resources/vendor/purecounterjs/dist/purecounter_vanilla.js"></script>
<script src="/resources/vendor/apexcharts/js/apexcharts.min.js"></script>
<script src="/resources/vendor/choices/js/choices.min.js"></script>
<script src="/resources/vendor/overlay-scrollbar/js/overlayscrollbars.min.js"></script>

<!-- Template Functions -->
<script src="/resources/js/functions.js"></script>







    
</main>
</body> 
</html>

