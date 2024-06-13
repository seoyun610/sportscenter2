<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head> 
    <meta charset="utf-8">
    <title></title>
    <META name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
    <script>
    </script>
</head> 
<body>
   <div class="size">
       <h3 class="sub_title"> 공지 게시판</h3>
			<div>
				<table>
					<p><span><strong>총 ${map.count }개</strong>  |  ${NoticeVO.page }/${map.totalPage }페이지</span></p>
						<caption>게시판 목록</caption>
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
                                    <a href="adminNoticeView.do?noticeid=${vo.noticeid}">${vo.noticetitle } </a>
                                </td>
                                <td>
                                    ${vo.adminname }
                                </td>
                                <td>${vo.noticeregcnt }</td>
                                <td class="date"><fmt:formatDate value="${vo.noticedate }" pattern="YYYY-MM-dd"/></td>
                            </tr>
                       	</c:forEach>
                     	</tbody>
                 </table>
             </div>
             <input type="button" class="btn" onClick="location.href='/notice/write.do'" value="작성하기"></a>
             <div>
             	<ul>
                <c:if test="${map.prev }">
               		<li><a href="/notice/index.do?page=${map.startPage-1 }&searchType=${NoticeVO.searchType}&searchWord=${NoticeVO.searchWord}"> << </a></li>
                </c:if>
                <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
	                <c:if test="${p == NoticeVO.page}">
	                    <li><a href='#;' class='current'>${p}</a></li>
	                </c:if>
	                <c:if test="${p != NoticeVO.page}">
	                     <li><a href='/notice/index.do?page=${p}&searchType=${NoticeVO.searchType}&searchWord=${NoticeVO.searchWord}'>${p}</a></li>
	                </c:if>
                </c:forEach>
                <c:if test="${map.next }">
                    <li><a href="/notice/index.do?page=${map.endPage+1 }&searchType=${NoticeVO.searchType}&searchWord=${NoticeVO.searchWord}"> >> </a></li>
                </c:if> 
                </ul> 
             </div>
         <!-- 페이지처리 -->
              <div>
                 <form method="get" name="searchForm" id="searchForm" action="index.do">
                 <span class="srchSelect">
                 <select id="stype" name="searchType" class="dSelect" title="검색분류 선택">
                     <option value="all">전체</option>
                     <option value="noticetitle" <c:if test="${NoticeVO.searchType == 'noticetitle'}">selected</c:if>>제목</option>
                     <option value="noticecontent" <c:if test="${NoticeVO.searchType == 'noticecontent'}">selected</c:if>>내용</option>
                 </select>
                     </span>
                     <span class="searchWord">
                         <input type="text" id="sval" name="searchWord" value="${NoticeVO.searchWord}"  title="검색어 입력">
                         <input type="button" id="" value="검색" title="검색">
                     </span>
                 </form>
                        
              </div>
     </div>
</body>
</html>