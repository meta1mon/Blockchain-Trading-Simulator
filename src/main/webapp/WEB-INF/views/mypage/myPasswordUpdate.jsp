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
#mpu {
	width: 1240px;
	margin: 0 auto;
	text-align: center;
}

#mpu table {
	margin: 0 auto;	
}
</style>
</head>
<jsp:include page="myHeader.jsp"></jsp:include>
<body>
	<div id="mpu">
		<h2>비밀번호 변경</h2>
		<form action="#" method="post" style="border: 1px solid black;">
			<table>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pass1"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password"></td>
				</tr>
			</table>
			<button type="submit">수정</button>
		</form>
		<form action="#" method="post" style="border: 1px solid black;">
			<table>
				<tr>
					<td>계좌 비밀번호</td>
					<td><input type="password" name="pass1"></td>
				</tr>
				<tr>
					<td>계좌 비밀번호 확인</td>
					<td><input type="password"></td>
				</tr>
			</table>
			<button type="submit">수정</button>
		</form>
	</div>
</body>
</html>