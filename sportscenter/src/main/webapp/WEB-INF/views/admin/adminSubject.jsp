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
       <h3 class="sub_title">종목 게시판</h3>
			<div>
				<table>
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
                            <a href="adminSubjectView.do?subjectid=${vo.subjectid}">${vo.subjecttype } </a>
                            </td>
                            <td>
                            	${vo.adminname }
                            </td>
                            <td>${vo.subjectregcnt }</td>                            
                            <td class="date"><fmt:formatDate value="${vo.subjectregdate }" pattern="YYYY-MM-dd"/></td>
                            </tr>
                    </c:forEach>
                    </tbody>
                 </table>
             </div>
             <input type="button" class="btn" onClick="location.href='/subject/write.do'" value="작성하기"></a>
     </div>
</body>
</html>