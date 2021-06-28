<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - BTS</title>
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<style>
#mm li {
	float: left;
	list-style-type: none;
	margin: 15px;
	color: black;
	width: 128px;
	height: 167px;
	text-align: center;
	border: 1px solid #ffc000;
	border-radius: 5px;
    padding-top: 39px;
    padding-left: 39px;
    padding-right: 39px;	
}

#mm img {
	width: 100px;
	height: 100px;
}

#mm {
	position: absolute;
	top: calc(50% - 150px);
	left: calc(50% - 238px);
}
</style>
</head>
<%@include file="headerAndAside.jsp"%> 
<body class="adminContent">
	<div>
		<ul id="mm">
			<li><p>전체 가상 투자금</p> <img src="resources/assets/img/invest.svg" />
				<p>1,111,111원</p></li>
			<li><p>미처리 신고 건수</p> <img src="resources/assets/img/report.svg" />
				<p>111건</p></li>
			<li><p>신규 충전액</p> <img src="resources/assets/img/charge.svg" />
				<p>111,111원</p></li>
		</ul>
	</div>
</body>
</html>