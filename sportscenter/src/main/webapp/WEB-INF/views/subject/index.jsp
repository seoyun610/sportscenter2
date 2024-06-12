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
	<style> 
		/* 기본 스타일 */
		body {
		    font-family: Arial, sans-serif;
		    margin: 0;
		    padding: 0;
		}
		
		/* 네비게이션 바 스타일 */
		nav {
		    background-color: #000; /* 네비게이션 바 배경 색상 */
		    padding: 1rem; /* 내부 여백 */
		    border-radius: 10px;
		}
		
		nav ul {
		    list-style-type: none; /* 리스트 스타일 제거 */
		    margin: 0;
		    padding: 0;
		    display: flex; /* 가로 정렬 */
		    justify-content: center; /* 가운데 정렬 */
		}
		
		nav ul li {
		    margin: 0 1rem; /* 리스트 아이템 간격 */
		}
		
		nav ul li a {
		    color: #fff; /* 링크 글자 색상 */
		    text-decoration: none; /* 밑줄 제거 */
		    font-size: 1rem; /* 글자 크기 */
		}
		
		nav ul li a:hover {
		    text-decoration: underline; /* 마우스 오버 시 밑줄 표시 */
		}
		
	
	 </style>
</head>  
<body>
   <header>
       <h1><p style="text-align:center;"> 종목 / 안내</p></h1>
	</header>
	<nav>
        <ul>
            <li><a href="/subject/view.do">종목 안내</a></li>
            <li><a href="/subject/usageInfo.do">이용 안내</a></li>
            <li><a href="/subject/registInfo.do">수업 신청 안내</a></li>
        </ul>
    </nav>	
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
</html>