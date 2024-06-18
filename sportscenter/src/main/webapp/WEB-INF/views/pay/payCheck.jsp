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
    	<c:if test="${empty cvo }">
    		<tr>
				<td colspan="9">결제 정보가 없습니다.</td>
			</tr>
    	</c:if>
        <tr>
            <td>${cvo.classname}</td>
            <td>${cvo.subtype}</td>
            <td>${cvo.classlevel}</td>
            <td>${cvo.classtime}</td>
            <td>${cvo.classday}</td>
            <td>${cvo.classprice}</td>
        </tr>
    </tbody>
</table>
<input type="hidden" name="classid" value="${cvo.classid}">
<input type="hidden" name="classname" value="${cvo.classname}">
<input type="hidden" name="classprice" value="${cvo.classprice}">
<input type="hidden" name="userid" value="${userid}">
<input type="hidden" name="username" value="${username}">
</form>
<input type="button" onclick="requestPay();" value="결제하기">
</body>
<script>
	var IMP = window.IMP;

	function requestPay() {
		  IMP.init('imp21126721');
		  IMP.request_pay(
		    {
		      pg: "kakaopay",
		      pay_method: "card",
		      merchant_uid: '${cvo.classid}' + new Date().getTime(),
		      name: '${cvo.classname}',
		      amount: ${cvo.classprice},
		      buyer_email: '${uvo.userid}',
		      buyer_name: '${uvo.username}',
		      buyer_tel: '${uvo.hp}',
		      buyer_addr: '${uvo.addr}',
		      buyer_postcode: '${uvo.addr2}'
		    },function(rsp) {
		    	if (rsp.success) {
		    		var paydata = {
		    			imp_uid: rsp.imp_uid,
			        	classid : ${cvo.classid},
			        	price : ${cvo.classprice}
		    		}
			        $.ajax({
			          	url: '/pay/complete.do',
			          	type: 'post',
			        	data : JSON.stringify(paydata),
			        	contentType: 'application/json',
			        	success : function(res) {
			        		console.log(res);
			        		if (res === "ok"){
			        			window.location.href = '/mypage/classView.do'
			        		}else if(res === "bad_request") {
			        	        alert("강좌가 가득찼습니다. 다른 강좌를 신청해주세요");
			        	    }else{
			        	    	alert("잘못된 접근입니다.");
			        	    }
			        	}
			        }) 
		      	} else {
		    		alert("결제에 실패했습니다.", "에러 내용: " + rsp.error_msg, "error");
		      	}
		    }
		   );
	}
</script>
</html>
