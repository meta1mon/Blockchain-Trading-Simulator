<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<style>
#mm li {
	float: left;
	list-style-type: none;
	margin-left: 30px;
	background-color: blueviolet;
	color: white;
	width: 200px;
	height: 200px;
	text-align: center;
}

#mm img {
	width: 100px;
	height: 100px;
}
</style>
</head>
<%-- <%@include file="adminHeader.jsp"%>
<%@include file="adminAside.jsp"%> --%>
<body>
	<div id="mm" style="width: 1240px;">
		<ul>
			<li><p>전체 가상 투자금</p> <img src="#" />
				<p>1,111,111원</p></li>
			<li><p>미처리 신고 건수</p> <img src="#" />
				<p>111건</p></li>
			<li><p>신규 충전액</p> <img src="#" />
				<p>111,111원</p></li>
		</ul>
	</div>
</body>
</html>