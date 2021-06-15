<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="cll"  style="position: absolute; top: 300px; left: 400px;">
		<form action="#" method="post">
			<input type="search">
			<button type="button">검색</button>
		</form>
		<table border="2">
			<tr>
				<th>No.</th>
				<th>닉네임</th>
				<th>결제액</th>
				<th>충전액</th>
				<th>결제 일시</th>
			</tr>
			<tr>
				<td>1</td>
				<td>불타는너구리</td>
				<td>10,000원</td>
				<td>10,000,000원</td>
				<td>2021-02-23 11:02:32</td>
			</tr>
		</table>
		<p>&#60; 1 2 3 &#62;</p>
	</div>
</body>
</html>