<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/signup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/member.css">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<title>BTS</title>
<style>
.contents {
	padding: calc(50vh - 84.5px) 100px !important;
	height: 100%;
}

body {
overflow: hidden;
}
</style>
</head>
<body>
	<div class="contents shadow">
		<table class="w100 center">
			<tr>
				<td colspan="2"><h1>인증 메일이 전송되었습니다.</h1></td>
			</tr>
			<tr>
				<td colspan="2">
				<p>입력하신 이메일을 확인해주세요.</p>
				<p>이메일 인증 후 사이트 이용이 가능합니다.</p>
				</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2"><a href="mainpage"><button type="button" class="btn1">메인
						페이지로 이동</button></a></td>
			</tr>
		</table>
	</div>
</body>
</html>