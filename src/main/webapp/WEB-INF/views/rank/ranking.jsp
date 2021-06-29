<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<style>
#rank {
	width: 1240px;
	height: 800px;
	margin: 35px auto;
	text-align: center;
	background-color: #fff;
}

#rank table {
	margin: 0 auto;
}

#rank li {
	list-style-type: none;
	float: left;
	margin: 0 50px;
}
</style>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div id="rank">
			<ul>
				<li>
					<div>
						<img src="#" width="300px" height="300px">
					</div>
					<div>
						<p>2등 닉네임</p>
					</div>
					<div>
						<p>수익률 %</p>
					</div>
				</li>
				<li>
					<div>
						<img src="#" width="300px" height="300px">
					</div>
					<div>
						<p>1등 닉네임</p>
					</div>
					<div>
						<p>수익률 %</p>
					</div>
				</li>
				<li>
					<div>
						<img src="#" width="300px" height="300px">
					</div>
					<div>
						<p>3등 닉네임</p>
					</div>
					<div>
						<p>수익률 %</p>
					</div>
				</li>
			</ul>
	
			<hr style="clear: both;">
			<p>전체 참가 인원 : 12032 명</p>
	
			<table border="2">
				<tr>
					<th>순위</th>
					<th>닉네임</th>
					<th>수익률</th>
				</tr>
				<tr>
					<td>4위</td>
					<td>4등 닉네임</td>
					<td>수익률 %</td>
				</tr>
				<tr>
					<td>4위</td>
					<td>4등 닉네임</td>
					<td>수익률 %</td>
				</tr>
				<tr>
					<td>4위</td>
					<td>4등 닉네임</td>
					<td>수익률 %</td>
				</tr>
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td>234위</td>
					<td>내 닉네임</td>
					<td>내 수익률 %</td>
				</tr>
			</table>
	
	
	
		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>