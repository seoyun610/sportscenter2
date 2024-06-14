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
    <script>
    </script>
</head> 
<body>
   <div class="size">
       <h3 class="sub_title"> 수강 정보 관리 </h3>
			<div>
				<table>
					<p><span><strong>총 ${map.count }개</strong>  |  ${NoticeVO.page }/${map.totalPage }페이지</span></p>
                        <thead>
                            <tr>
                            	<th> 번호 </th>
                                <th> 수강생 </th>
                                <th> 수강 대상월 </th>
                                <th> 종목 </th>
                                <th> 요일 </th>
                                <th> 시간 </th>
                                <th> 등급 </th>
                                <th> 결제 상태 </th>
                                <th> 반 변경하기 </th>
                            </tr>
                        </thead>
                    	<tbody>
						<c:if test="${empty map.list }">
                            <tr>
                                <td class="first" colspan="8">등록된 수강 내역이 없습니다.</td>
                            </tr>
						</c:if>
                        <c:forEach var="vo" items="${map.list }" varStatus="status">       
                            <tr>
                                <td>${fn:length(map.list) - status.index}</td>
                                <td> ${vo.username }</td>
                                <td> ${vo.classyear }-${vo.classmonth } </td>
                                <td>  ${vo.subtypeName } </td>
                                <td>  ${vo.classYoil } </td>
                                <td>  ${vo.formattedClasstime } </td>
                                <td>  ${vo.classlevelName } </td>
						        <td><c:choose>
						                <c:when test="${vo.paystate == 0}"> 미결제 </c:when>
						                <c:when test="${vo.paystate == 1}"> 
						                	<c:if test="${vo.refundstate == 1}"> 환불 완료 </c:if>
						                	<c:if test="${vo.refundstate != 1}"> 결제 완료 </c:if>
						                </c:when>
						                <c:otherwise></c:otherwise>
						            </c:choose>
						        </td> 
						        <td> <c:choose>
						                <c:when test="${currentYear == vo.classyear && vo.paystate == 0 && vo.classmonth == nextMonth}">
						                    <input type="button" id="btn" onclick="location.href = '/admin/courseModify.do?payid='+ ${vo.payid };" value="변경하기"></td>
						                </c:when>
						                <c:otherwise />
						            </c:choose>
						        </td>
                            </tr>
                       	</c:forEach>
                     	</tbody>
                 </table>
             </div>
             <div>
             	<ul>
                <c:if test="${map.prev }">
               		<li><a href="courseList.do?page=${map.startPage-1 }&searchWord=${PayVO.searchWord}"> << </a></li>
                </c:if>
                <c:forEach var="p" begin="${map.startPage}" end="${map.endPage}">
	                <c:if test="${p == PayVO.page}">
	                    <li><a href='#;' class='current'>${p}</a></li>
	                </c:if>
	                <c:if test="${p != PayVO.page}">
	                     <li><a href='courseList.do?page=${p}&searchWord=${PayVO.searchWord}'>${p}</a></li>
	                </c:if>
                </c:forEach>
                <c:if test="${map.next }">
                    <li><a href="courseList.do?page=${map.endPage+1 }&searchWord=${PayVO.searchWord}"> >> </a></li>
                </c:if>
                </ul> 
             </div>
         <!-- 페이지처리 -->
              <div>
                 <form method="get" name="searchForm" id="searchForm" action="courseList.do">
                     <span class="searchWord">
                         <input type="text" id="sval" name="searchWord" value="${PayVO.searchWord}"  title="검색" placeholder="검색하고자 하는 수강생 이름을 입력하세요">
                         <input type="submit" id="" value="검색" title="검색">
                     </span>
                 </form>    
              </div>
     </div>
</body>
</html>