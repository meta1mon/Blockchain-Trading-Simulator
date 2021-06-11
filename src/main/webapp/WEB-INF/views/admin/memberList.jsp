<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
th, td {
	padding: 5px;
	text-align: center;
}
</style>
</head>
<body>
	<div id="mmm">
		<div>
			<form action="#" method="get">
				<select name="searchType">
					<option value="1">닉네임</option>
					<option value="2">이메일</option>
				</select> <input type='search' name="search">
				<button type=submit id="btnsearch">검색</button>
			</form>
		</div>

		<div>

			<table border="2">
				<tr>
					<th>No.</th>
					<th>이메일</th>
					<th>닉네임</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>현금보유액</th>
					<th>코인평가금액</th>
					<th>자산총액</th>
				</tr>
				<tr>
					<td>1</td>
					<td>borabora@naver.com</td>
					<td>불타는너구리</td>
					<td>남</td>
					<td>951129</td>
					<td>10000000</td>
					<td>20000000</td>
					<td>30000000</td>
				</tr>
			</table>

		</div>
		<div id="page">
			<a href="#">&#60;&#60;</a>
			<a href="#">1 2 3</a>
			<a href="#">&#62;&#62;</a>
		</div>





	</div>
</body>
</html>