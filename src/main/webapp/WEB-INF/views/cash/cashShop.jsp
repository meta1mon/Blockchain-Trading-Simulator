<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
#cashShop {
	width: 1240px;
	height: 800px;
	background-color: #fff;
	margin: 35px auto;
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
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="cashShop">
			<form>
				<table>
					<tr>
						<td colspan="3">
							<h1>1단계 : 결제 금액을 선택해 주세요</h1>
							<h4>할인 EVENT 기간 : 06/01 ~ 06/30</h4>
						</td>
					</tr>
					<tr>
						<td>모의 투자 충전 금액</td>
						<td>KRW</td>
						<td>할인율</td>
					</tr>
					<c:forEach items="${cashList }" var="cashVo" varStatus="status">
						<tr>
							<td>${cashVo.won }원</td>
							<td>${cashVo.sellprice }원</td>
							<td>${cashVo.discountrate }%</td>
							<td><input type="hidden" name="currentWon${status.count }"
								value="${cashVo.won }" readonly></td>
							<td><input type="hidden" name="currentPrice${status.count }"
								value="${cashVo.sellprice }" readonly></td>
							<td><input type="button" value="선택"
							onclick="buyCash(currentPrice${status.count }, currentWon${status.count })"></td>
						</tr>
						<tr>
					</c:forEach>
				</table>
			</form>
			<table>
				<tr>
					<td colspan="2"><h1>2단계 : 최종 금액을 확인해 주세요</h1></td>
				</tr>
				<tr>
					<td>충전할 금액:</td>
					<td><input type="text" id="won"></td>
				</tr>
				<tr>
					<td>지불할 금액:</td>
					<td><input type="text" id="cash" name="cash"></td>
				</tr>
				<tr>
					<td colspan="3"><button type="button" onclick="openPayment();">결제하기</button></td>
				</tr>
			</table>
		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
<script>
	function buyCash(sellprice, won) {
		$("#won").val(won.value);
		$("#cash").val(sellprice.value);
	}
	
	var openWin;
	function openPayment() {
		if($("#won").val() != '' && $("#cash").val() != '') {
			openChild();
		} else {
			
		}
	}
	
	function openChild() {
		openWin = window.open("<%=request.getContextPath()%>/pay", "paymentPopup", "width=850px, height=650px, resizable = no, left= 100, top=100");
		
	}
</script>
</html>