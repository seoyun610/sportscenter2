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
    <link rel="stylesheet" href="/css/reset.css"/>
    <link rel="stylesheet" href="/css/style.css"/>
    <link rel="stylesheet" href="/css/contents.css"/>
    <script src="/js/script.js"></script>
    <script>
    </script>
</head> 
<div class="size">
       <h3 class="sub_title"> QnA 게시판</h3>
			<div>
				<table>
					<p><span><strong>총 ${map.count }개</strong>  |  ${map.page }/${map.totalPage }페이지</span></p>
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
                        <c:forEach var="vo" items="${map.list }">       
                            <tr>
                                <td>${vo.qnaid }</td>
                                <td>
                                    <a href="adminQnaView.do?qnaid=${vo.qnaid}">${vo.qnatitle } </a> 
                                </td>
                                <td>
                                    ${vo.username }
                                </td>
                                <td>${vo.qnadate }</td>
                                <td class="date"><fmt:formatDate value="${vo.qnadate }" pattern="YYYY-MM-dd"/></td>
                            </tr>
                       </c:forEach>
                        </tbody>
                    </table>
                    <div>
                        <ul>
                        <c:if test="${map.prev }">
                        	<li><a href="index.do?page=${map.startPage-1 }&searchType=${map.searchType}&searchWord=${map.searchWord}"> << </a></li>
                        </c:if>
                        <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
                        	<c:if test="${p == map.page}">
                            <li><a href='#;' class='current'>${p}</a></li>
                            </c:if>
                            <c:if test="${p != map.page}">
                            <li><a href='index.do?page=${p}&searchType=${map.searchType}&searchWord=${map.searchWord}'>${p}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${map.next }">
                        	<li><a href="index.do?page=${map.endPage+1 }&searchType=${map.searchType}&searchWord=${map.searchWord}"> >> </a></li>
                        </c:if>
                        </ul> 
                    </div>
                
                    <!-- 페이지처리 -->
                    <div>
                        <form method="get" name="searchForm" id="searchForm" action="index.do">
                            <span class="srchSelect">
                                <select id="stype" name="searchType" class="dSelect" title="검색분류 선택">
                                    <option value="all">전체</option>
                                    <option value="qnatitle" <c:if test="${map.searchType == 'qnatitle'}">selected</c:if>>제목</option>
                                    <option value="qnacontent" <c:if test="${map.searchType == 'qnacontent'}">selected</c:if>>내용</option>
                                </select>
                            </span>
                            <span class="searchWord">
                                <input type="text" id="sval" name="searchWord" value="${map.searchWord}"  title="검색어 입력">
                                <input type="button" id="" value="검색" title="검색">
                            </span>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
</body> 
</html>