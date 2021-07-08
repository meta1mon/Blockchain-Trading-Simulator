<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"	rel="stylesheet" type="text/css" />
<style>
#wrapper {
	background-color: #eeeeee;
	background-size: 100% 270%;
	text-align: center;
}

.listout {
	width: 65%;
	min-width: 1000px;
	height: 95%;
	padding: 20px;
	margin: 25px auto;
	background-color: #fff;
	border: 1.5px solid #E3C8F8;
	box-shadow: 1px 1px 3px rgb(90 90 90/ 35%);
}

.img {
	margin: auto;
}

#body {
	width: 1000px;
	margin: 100px auto;
	color: #404040;
}

#error {
	margin-top: 10px;
	color: #abb0b3;
	font-size: 13px;
}

#oops {
	font-size: 57px;
	margin-top: 12px;
	text-align: center;
}

#this {
	margin: auto;
	max-width: 380px;
	margin-top: 25px;
	line-height: 43px;
	margin-top: 25px;
	font-size: 33px;
}

}
#help {
	color: #82888c;
	font-size: 16px;
	margin-top: 54px;
	margin: auto;
}

#a {
	font-size: 13px;
	line-height: 1;
	height: 16px;
	color: #00bfc1;
	border-bottom: 1px solid #00bfc1;
	padding-bottom: 2px;
	margin: auto;
}

#a:hover {
	border: none;
	color: #14D3D5;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
</head>
<%@include file="main/header.jsp"%>
<body>
	<div id="wrapper">
		<div class="listout">
			<img class="img" alt="404 error"
				src="https://assets.justinmind.com/wp-content/uploads/2019/05/404_2019.gif"
				data-src="https://assets.justinmind.com/wp-content/uploads/2019/05/404_2019.gif">
			<div id="error">ERROR</div>
			<div id="oops">Oops!!</div>
			<div id="this">
				This is not the page<br>you are looking for
			</div>
			<br> <br>
			<div id="help">Here are some helpful links instead:</div>
			<a id="a" href="<%=request.getContextPath()%>/mainpage">Home</a>
			&nbsp; <a id="a" href="javascript:window.history.back();">Back</a> <br>
			<br> <br>
		</div>
		<br>
<%@include file="main/footer.jsp"%>
	</div>
</body>
</html>