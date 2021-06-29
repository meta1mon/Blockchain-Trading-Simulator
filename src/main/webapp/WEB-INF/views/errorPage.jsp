<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<title>BTS</title>
<style>
#img {
	float: right;
	margin-right: 250px;
}

#body {
	margin-left: 300px;
	color:#404040;
}

#error {
	margin-top: 170px;
	color: #d5d5d5;
}

#help {
	color: #d5d5d5;
}

#a {
	color : #FFC000;
	text-decoration:underline;
}

#a:hover{
	text-decoration:none;
}
</style>
</head>
<%@include file="main/header.jsp"%>
<body class="content">
	<img id="img" src="resources/assets/img/team/2.jpg" alt="..." />
	<div id="body">
		<div id="error">ERROR</div>
		<h1>Oops!!</h1>
		<br>
		<h2>
			This is not the page you are<br>looking for
		</h2>
		<br>
		<br>
		<div id="help">Here are some helpful links instead:</div>
		<a id="a" href="<%=request.getContextPath()%>/mainpage">Home</a>
		&nbsp;
		<a id="a" href="javascript:window.history.back();">Back</a>
	</div>
</body>
<%@include file="main/footer.jsp"%>
</html>