<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="kr.project.sportscenter.class1.ClassVO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<body>
<form method="post" name="payForm" id="payForm" action="/pay/paycheck.do">
<table>
    <thead>
        <tr>
            <th>강좌명</th>
            <th>종목</th>
            <th>등급</th>
            <th>시간</th>
            <th>요일</th>
            <th>금액</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="basket" items="${map.list}">
        <tr>
            <td>${basket.classname}</td>
            <td>${basket.subtype}</td>
            <td>${basket.classlevel}</td>
            <td>${basket.classtime}</td>
            <td>${basket.classday}</td>
            <td>${basket.classprice}</td>
        </tr>
        </c:forEach>
    </tbody>
</table>
<script>
	var IMP = window.IMP;
	
	function requestPay() {
		
		  IMP.init('imp21126721');
		  
		  IMP.request_pay(
			{
		    pg: "html5_inicis",
		    pay_method: "card",
		    merchant_uid : '${vo.classid}',
		    name : '${vo.classname}',
		    amount : ${vo.classprice},
		    buyer_email : '${uvo.userid}',
		    buyer_name : '${uvo.username}',
		    buyer_tel : '${uvo.hp}',
		    buyer_addr : '${uvo.addr}',
		    buyer_postcode : '${uvo.addr2}',
		  	}, function (rsp) { 
		  		console.log(rsp);
              $.ajax({
                  type: 'post',
                  url: '/pay/' + rsp.imp_uid
               }).done(function(data) {
                   if(rsp.paid_amount === data.response.amount){
                      data = JSON.stringify({
                    	  "imp_uid" : rsp.imp_uid,
                    	  "merchant"
                      })
                   } else {
                       alert("결제 실패");
                   }
               });
           });
       } 
</script>




<input type="hidden" name="classid" value="${map.list[0].classid}">
<input type="hidden" name="classname" value="${map.list[0].classname}">
<input type="hidden" name="classprice" value="${map.list[0].classprice}">
<input type="hidden" name="userid" value="${userid}">
<input type="hidden" name="username" value="${username}">
<input type="button" onclick="requestPay();" value="결제하기">
</form>
</body>
</html>
