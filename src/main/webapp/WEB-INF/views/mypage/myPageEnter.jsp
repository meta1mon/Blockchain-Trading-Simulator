<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
#mpe {
	margin: 30px auto;
	width: 65%;
	min-width: 1024px;
	text-align: center;
	height: 50%;
	padding: 20px;
	background-color: #fff;
    border: 1.5px solid #E3C8F8;
	box-shadow: 1px 1px 3px rgb(90 90 90/ 35%);
}

.pwd {
	height: 31.5px;
    width: 20%;
    padding: 5px;
    border: 1.5px solid #E3C8F8;
    border-radius: 5px;
    font-size: 18px;
    box-shadow: 1px 1px 3px rgb(90 90 90 / 35%);
}

.checkBtn {
	height: 30px;
    font-size: 16px;
    background-color: #fff;
    padding: 0px 8px;
    border: 1px solid transparent;
    border-color: #E3C8F8;
    border-radius: 4px;
    cursor: pointer;
    box-shadow: 1px 1px 3px rgb(90 90 90 / 35%);
    margin: 0 2%;
}
</style>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="mpe">
			<form action="${pageContext.request.contextPath}/mypage/admitEnter" method="post">
<!-- 				<font style="margin-bottom: 15px; font-size: 20px;">비밀번호 확인&nbsp;&nbsp;&nbsp;</font> -->
				<input type="password" placeholder="비밀번호를 입력하세요" name="password" class="pwd">
				<button class="checkBtn" type="submit">확인</button>
			</form>
		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include> 
	</div>
</body>
</html>