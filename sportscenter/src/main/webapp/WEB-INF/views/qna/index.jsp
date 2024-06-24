<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>

    
</style>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Webestica.com">
    <meta name="description" content="Eduport- LMS, Education and Course Theme">
    <title>비밀번호 확인</title>

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
    <style>
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
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp"%>
    <!-- =======================Page Banner START -->
    <section class="pt-0" style="padding-bottom: 1rem;"> 
	<div class="container">
		<div class="row content-container">
      		 <h3 class="sub_title"> QnA 게시판</h3>
				<table>
					<p><span><strong>총 ${map.count }개</strong>  |  ${QnaVO.page }/${map.totalPage }페이지</span></p>
						<caption>QnA 목록</caption>
                        <thead>
                            <tr>
                            	<th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>조회수</th>
                                <th>작성일</th>
                            </tr>
                        </thead>
                        <tbody>
						<c:if test="${empty map.list }">
                            <tr>
                                <td class="first" colspan="8">등록된 글이 없습니다.</td>
                            </tr>
						</c:if>
                        <c:forEach var="vo" items="${map.list }" varStatus="status">       
                            <tr>
                                <td>${fn:length(map.list) - status.index}</td>
                                <td>
                                    <a href="view.do?qnaid=${vo.qnaid}">${vo.qnatitle } </a>
                                </td>
                                <td>
                                    ${vo.username }
                                </td>
                                <td>${vo.qnacnt }</td>
                                <td class="date"><fmt:formatDate value="${vo.qnadate }" pattern="yyyy-MM-dd"/></td>
                            </tr>
                       </c:forEach>
                        </tbody>
                    </table>
                    <div>
                        <ul>
                        <c:if test="${map.prev }">
                        	<li><a href="index.do?page=${map.startPage-1 }&searchType=${QnaVO.searchType}&searchWord=${QnaVO.searchWord}"> << </a></li>
                        </c:if>
                        <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
                        	<c:if test="${p == QnaVO.page}">
                            <li><a href='#;' class='current'>${p}</a></li>
                            </c:if>
                            <c:if test="${p != QnaVO.page}">
                            <li><a href='index.do?page=${p}&searchType=${QnaVO.searchType}&searchWord=${QnaVO.searchWord}'>${p}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${map.next }">
                        	<li><a href="index.do?page=${map.endPage+1 }&searchType=${QnaVO.searchType}&searchWord=${QnaVO.searchWord}"> >> </a></li>
                        </c:if>
                        </ul> 
                    </div>
                	<c:if test="${not empty login}">
              		  <input type="button" class="btn" onClick="location.href='write.do'" value="작성하기"></a>
           			</c:if>
                    <!-- 페이지처리 -->
                    <div>
                        <form method="get" name="searchForm" id="searchForm" action="index.do">
                            <span class="srchSelect">
                                <select id="stype" name="searchType" class="dSelect" title="검색분류 선택">
                                    <option value="all">전체</option>
                                    <option value="qnatitle" <c:if test="${QnaVO.searchType == 'qnatitle'}">selected</c:if>>제목</option>
                                    <option value="qnacontent" <c:if test="${QnaVO.searchType == 'qnacontent'}">selected</c:if>>내용</option>
                                </select>
                            </span>
                            <span class="searchWord">
                                <input type="text" id="sval" name="searchWord" value="${QnaVO.searchWord}"  title="검색어 입력">
                                <input type="button" id="" value="검색" title="검색">
                            </span>
                        </form>
                        
                    </div>
                </div>
            </div>
        </section>
</body> 
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 
</html>