<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
<div id="nl"  style="position: absolute; top: 300px; left: 400px;">
	<form action="#" method="post">
		<input type="search">
		<button type="button">검색</button>
	</form>
	<table border="2">
		<tr>
			<th>No.</th>
			<th>게시글 제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회</th>
			<th>추천</th>
			<th>비추천</th>
		</tr>
		<tr>
			<td>1</td>
			<td><a href="#">신규회원 필독</a></td>
			<td>관리자</td>
			<td>2021-02-12</td>
			<td>230</td>
			<td>110</td>
			<td>20</td>
		</tr>
	</table>
	<p>&#60; 1 2 3 &#62;</p>
	<button type="button">글쓰기</button>
</div>
</body>
</html>