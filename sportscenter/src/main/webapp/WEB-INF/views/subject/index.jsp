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
</head>  
<body>
   <div class="size">
       <h3 class="sub_title"> 종목 게시판</h3>
			<div>
				<table >
					<tbody>
						<c:if test="${empty map.list }">
                            <tr>
                                <td class="first" colspan="3">등록된 글이 없습니다.</td>
                            </tr>
						</c:if>
                        <c:forEach var="vo" items="${map.list }">       
                            <tr> 
							<td>  <a href="view.do?subjectid=${vo.subjectid}"> <img src='/upload/subject/${vo.subjectfilename_real}' /> </a> ${vo.subjecttype }</td> </tr>     
                       </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
</body>
</html>