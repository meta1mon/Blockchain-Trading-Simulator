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
#mi {
	width: 1240px;
	margin: 0 auto;
	text-align: center;
}

#mi table {
	margin: 0 auto;	
}
</style>
</head>
<jsp:include page="myHeader.jsp"></jsp:include>
<body>
	<div id="mi">
		<table>
			<tr>
				<td>이메일</td>
				<td><input type="text" value="sadf222@naver.com" readonly></td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" value="파란너구리" readonly></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" value="010203" readonly></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" checked readonly> 남자 <input
					type="radio" readonly> 여자</td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><input type="text" value="01021535554" readonly></td>
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox">각종 소식 수신 및 이벤트
					참여에 동의합니다</td>
			</tr>
		</table>

		<a href="#">정보수정</a> <a href="#">탈퇴</a>

	</div>
</body>
</html>