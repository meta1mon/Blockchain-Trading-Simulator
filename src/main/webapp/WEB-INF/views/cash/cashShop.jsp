<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<style>
#cashShop {
	width: 1240px;
	margin: 0 auto;
	text-align: center;
	border: solid 1px black;
}

#cashShop table {
	margin: 0 auto;
}

#cashShop li {
	list-style-type: none;
	float: left;
	margin: 0 50px;
}
</style>
<title>Insert title here</title>
</head>
<jsp:include page="../main/header.jsp"></jsp:include>
<body>
	<div id="cashShop">
		<form action="#" method="post">
			<h4>1단계 : 결제 금액을 선택해 주세요</h4>
			<h1>할인 EVENT 기간 : 06/01 ~ 06/30</h1>
			<table>
				<tr>
					<td>모의투자 금액 충전 : 1,000,000원</td>
					<td>KRW : 1,000원 / 할인률 : 0%</td>
					<td><input type="radio" name="cash" value="1"></td>
				</tr>
				<tr>
					<td>모의투자 금액 충전 : 5,000,000원</td>
					<td>KRW : 5,000원 / 할인률 : 0%</td>
					<td><input type="radio" name="cash" value="2"></td>
				</tr>
				<tr>
					<td>모의투자 금액 충전 : 10,000,000원</td>
					<td>KRW : 9,900원 / 할인률 : 10%</td>
					<td><input type="radio" name="cash" value="3"></td>
				</tr>
				<tr>
					<td>모의투자 금액 충전 : 50,000,000원</td>
					<td>KRW : 42,500원 / 할인률 : 15%</td>
					<td><input type="radio" name="cash" value="4"></td>
				</tr>
				<tr>
					<td>모의투자 금액 충전 : 100,000,000원</td>
					<td>KRW : 80,000원 / 할인률 : 20%</td>
					<td><input type="radio" name="cash" value="5"></td>
				</tr>
			</table>
			<h4>2단계 : 최종 금액을 확인해 주세요</h4>
			<p>지불할 금액 : 5,000원</p>
			<button type="submit">결제하기</button>
		</form>
	</div>
</body>
</html>