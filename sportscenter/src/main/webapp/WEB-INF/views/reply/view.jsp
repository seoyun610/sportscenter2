<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="reply" items="${replyList}">
    <div class="reply-item">
        <p>${reply.adminname}</p>
        <p>등록일: <fmt:formatDate value="${reply.regdate}" pattern="YYYY-MM-dd"/></p>
        <p>${reply.replycontent}</p>
    </div>
</c:forEach>
