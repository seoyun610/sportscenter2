<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 
<p><span><strong>총 ${comment.totalCount}개</strong>  |  ${commentVO.page}/${comment.totalPage}페이지</span></p>
                <table class="list">
                    <colgroup>
                        <col width="80px" />
                        <col width="*" />
                        <col width="100px" />
                        <col width="200px" />
                    </colgroup> -->
                    <tbody>
                    <c:if test="${empty map.qlist}">
                        <tr>
                            <td class="first" colspan="8">등록된 글이 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:if test="${!empty map.qlist }">
                    <c:forEach var="vo" items="${map.qlist}">
                        <tr>
                            <td>${vo.replyid}</td>
                            <td>
                            	<!-- 댓글 삭제 // 세션의 adminnum와 replyVO 객체의 adminnum와 일치하는 경우에만(댓글 작성자만) 삭제할 수 있도록 -->
                            	${vo.content} <c:if test="${login.adminnum == vo.adminnum}"><a href="javascript:commentDel(${vo.replyid});">[삭제]</a></c:if>
                            </td>
                            <td>
                                ${vo.adminname}
                            </td>
                            <td class="date">
                            <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${vo.regdate}" />
                            </td>
                        </tr>
                    </c:forEach>
                    </c:if>
                    </tbody>
                </table>