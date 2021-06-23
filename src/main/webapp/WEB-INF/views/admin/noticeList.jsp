<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<title>공지사항 리스트 - BTS</title>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
<div id="nl"  style="position: absolute; top: 300px; left: 400px;">
	<form action="#" method="post">
		<input type="search">
		<button type="button">검색</button>
	</form>
	<table border="2">
		<tr bgcolor="#8C66C8">
			<th align="center" width="60">No.</th>
			<th align="center" width="380">게시글 제목</th>
			<th align="center" width="100">글쓴이</th>
			<th align="center" width="100">작성일</th>
			<th align="center" width="60">조회</th>
			<th align="center" width="60">추천</th>
			<th align="center" width="60">비추천</th>
		</tr>
		<!-- 글이 없을 경우 -->
		<c:if test="${listCount eq 0}">
			<tr>
				<td colspan="6" align="center">
				<br><br> 게시판에 저장된 글이 없습니다. <br><br>
				</td>
			</tr>
		</c:if>
		<c:if test="${listCount ne 0 }">
			<c:forEach var="vo" items="${list }" varStatus="status">
				<tr>
					<td align="center">${status.count }</td>
					<td align="left">
					<a href="noticedetail?notice_num=${vo.notice_num}&page=${currentPage}">
					&nbsp;${vo.notice_title }
					</a>
					</td>
					<td align="center">${vo.notice_writer }</td>
					<td align="center">${vo.regDate}</td>
					<td align="center">${vo.read_count }</td>
				</tr>
			</c:forEach>
		</c:if>
		
		
<!-- 		<tr> -->
<!-- 			<td align="center">1</td> -->
<!-- 			<td align="center"><a href="#">신규회원 필독</a></td> -->
<!-- 			<td align="center">관리자</td> -->
<!-- 			<td align="center">2021-02-12</td> -->
<!-- 			<td align="center">230</td> -->
<!-- 			<td align="center">110</td> -->
<!-- 			<td align="center">20</td> -->
<!-- 		</tr> -->
	</table>
	<p>&#60; 1 2 3 &#62;</p>
	<button type="button">글쓰기</button>
</div>
</body>
</html>