<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#cashR {
	position: absolute;
	top: calc(50% - 350px);
	left: calc(50% - 442.5px);
	width: 1085px;
}

#cashR table {
	width: 100%;
}

#cashR th, td {
	padding: 5px !important;
}

.title{
	font-size: 25px;
	color: #fcc000;
}

</style>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="cashR">
	<p class="title">충전 상품 관리</p>
	<hr>
		<form action="${pageContext.request.contextPath}/admin/cashRegister" method="post">
			<table>
				<tr>
					<td class="center">충전금</td>
					<td class="center">판매가</td>
					<td class="center">할인률</td>
					<td class="center">이벤트 시작일자</td>
					<td class="center">이벤트 종료일자</td>
					<td></td>
				</tr>
				<tr>
					<td class="center value"><input type="number" min="0" name="won">원</td>
					<td class="center value"><input type="number" min="0" name="price">원</td>
					<td class="center value"><input type="number" min="0" max="100" name="discountrate">%</td>
					<td class="center value"><input type="date" name="startdate"></td>
					<td class="center value"><input type="date" name="enddate"></td>
					<td class="center"><button type="submit">상품 등록</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>