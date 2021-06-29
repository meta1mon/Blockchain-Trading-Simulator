<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<style>
#mcl {
	width: 1240px;
	margin: 0 auto;
	text-align: center;
}

#mcl table {
	margin: 0 auto;	
}
</style>
</head>
<jsp:include page="myHeader.jsp"></jsp:include>
<body>
	<div id="mcl">
		<table border="2">
			<tr>
				<th>결제일시</th>
				<th>결제금액</th>
				<th>충전금액</th>
			</tr>
			<tr>
				<td>2021-02-22 21:04:23</td>
				<td>\ 5,000</td>
				<td>5,000,000 원</td>
			</tr>
		</table>
	</div>
</body>
</html>