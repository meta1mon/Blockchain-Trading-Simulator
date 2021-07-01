<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<style>
#me {
	width: 65%;
	min-width: 1024px;
	text-align: center;
	height: 50%;
	padding: 20px;
	margin: 25px auto;
	background-color: #fff;
    border: 1.5px solid #E3C8F8;
	box-shadow: 1px 1px 3px rgb(90 90 90/ 35%);
}

#me div {
	width: 900px;
	height : 50px;
	margin: 0 auto;
	
}

#me ul {
	padding: 0;
}

#me li {
	list-style-type: none;
	float: left;
	width : 300px;
	box-sizing: border-box;
}

#me li:nth-last-of-type(2), #me li:nth-last-of-type(3) {
	border-right: solid black 1px;
}

#me table {
	margin: 10px auto 0 auto;
}

#coinTable {
	width : 80%;
	border: 1px solid black;
	border-collapse: collapse;
}

#coinTable th, td {
	border: 1px solid black;
	padding: 10px;
}

</style>
</head>
<body>
	<div id="wrapper">
	<jsp:include page="myNav.jsp"></jsp:include>
		<div id="me">
			<h2>
				<img width="30px" height="30px"> 내 계좌번호 : ${acnt.acntno }
			</h2>
			<br>
			<div>
				<ul>
					<li><img width="30px" height="30px">코인 보유액 ${totalCoin }원</li>
					<li><img width="30px" height="30px">현금 보유액 ${acnt.cybcash }원</li>
					<li><img width="30px" height="30px">총액  ${totalAssets }원</li>
				</ul>
			</div>
			
			<h2>보유코인 목록</h2>
			
			<table id="coinTable">
				<tr>
					<th>보유코인</th>
					<th>보유수량</th>
					<th>매수평균가</th>
					<th>매수금액</th>
					<th>평가금액</th>
					<th>평가손익</th>
				</tr>
				<c:if test="${coinListCount eq 0 }">
					<tr>
						<td colspan="6" align="center"><br> <br> 
						보유한 코인이 없습니다.<br> <br></td>
					</tr>
				</c:if>
				<c:if test="${coinListCount ne 0 }">
					<c:forEach var="coin" items="${coinList }" varStatus="status">
						<tr>
							<td>${coin.coin }</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			
			
			<!-- 기존 테이블 -->
<!-- 			<table> -->
<!-- 				<tr> -->
<!-- 					<th>거래 구분</th> -->
<!-- 					<th>종목</th> -->
<!-- 					<th>수량</th> -->
<!-- 					<th>단가</th> -->
<!-- 					<th>총 거래액</th> -->
<!-- 					<th>거래 일시</th> -->
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<td>매수</td> -->
<!-- 					<td>DOGE</td> -->
<!-- 					<td>2.333332</td> -->
<!-- 					<td>520 원</td> -->
<!-- 					<td>1040.666664 원</td> -->
<!-- 					<td>2021-02-22</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
		</div>
	</div>
</html>