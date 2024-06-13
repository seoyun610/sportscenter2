<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Retake Class Payment</title>
    <style>
        /* Add your CSS styling here */
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        .sub_title {
            font-size: 1.5em;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <c:if test="${not empty retakeClass}">
        <h3 class="sub_title">재수강 결제 대기 강좌</h3>
        <table>
            <thead>
                <tr>
                    <th>수강 강좌 명</th>
                    <th>수강 기간</th>
                    <th>수강 결제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="classrvo" items="${retakeClass}">
                    <tr>
                        <td>${classrvo.classname}</td>
                        <td>${classrvo.formattedClassdate}</td>
                        <td>
                            <input type="button" value="재수강" onclick="location.href='/class/payCheck.do?classid=${classrvo.classid}'">
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</body>
</html>
