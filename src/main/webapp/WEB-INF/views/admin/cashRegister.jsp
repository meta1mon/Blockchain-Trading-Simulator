<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>관리자 페이지 - BTS</title>
<style>
#cashR {
	width: 1240px;
	margin: 0 auto;
	text-align: center;
	border: solid 1px black;
}

#cashR table {
	margin: 0 auto;
}
</style>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="cashR" style="position: absolute; top: 300px; left: 400px;">
		<form action="${pageContext.request.contextPath}/admin/cashRegister" method="post">
			<table style="border: 1px black solid;">
				<tr>
					<td>충전금</td>
					<td><input type="number" min="0" name="won">원</td>
				</tr>
				<tr>
					<td>판매가</td>
					<td><input type="number" min="0" name="price">원</td>
				</tr>
				<tr>
					<td>할인률</td>
					<td><input type="number" min="0" max="100" name="discountrate">%</td>
				</tr>
				<tr>
					<td>이벤트 시작일자</td>
					<td><input type="date" name="startdate"></td>
				</tr>
				<tr>
					<td>이벤트 종료일자</td>
					<td><input type="date" name="enddate"></td>
				</tr>
				<tr>
					<td colspan="2"><button type="submit">상품 등록</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>