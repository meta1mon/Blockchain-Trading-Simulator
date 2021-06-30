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

#mcl table {
	margin: 0 auto;	
}
</style>
</head>
<body>
	<div id="wrapper">
	<jsp:include page="myNav.jsp"></jsp:include>
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
	</div>
</body>
</html>