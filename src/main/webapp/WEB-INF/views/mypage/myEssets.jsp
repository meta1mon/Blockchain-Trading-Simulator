<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<title>Insert title here</title>
<style>
#me {
	width: 1240px;
	margin: 0 auto;
	text-align: center;
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
</style>
</head>
<jsp:include page="myHeader.jsp"></jsp:include>
<body>
	<div id="me">
		<h2>
			<img width="30px" height="30px"> 내 계좌번호 0020132012
		</h2>
		<br>
		<div>
			<ul>
				<li><img width="30px" height="30px">코인 보유액 11111원</li>
				<li><img width="30px" height="30px">현금 보유액 11111원</li>
				<li><img width="30px" height="30px">총액 22222원</li>
			</ul>
		</div>
		<table>
			<tr>
				<th>거래 구분</th>
				<th>종목</th>
				<th>수량</th>
				<th>단가</th>
				<th>총 거래액</th>
				<th>거래 일시</th>
			</tr>
			<tr>
				<td>매수</td>
				<td>DOGE</td>
				<td>2.333332</td>
				<td>520 원</td>
				<td>1040.666664 원</td>
				<td>2021-02-22</td>
			</tr>
		</table>
	</div>
</html>