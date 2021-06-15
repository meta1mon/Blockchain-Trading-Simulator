<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
</head>
<%@include file="../main/header.jsp"%>
<body>
	<h1 align="center">게시글 상세보기</h1>
	<table align="center" cellpadding="10" cellspacing="0" border="1"
		width="70%">
		<tr align="center" valign="middle">
			<th colspan="2">${community.cno}번글상세보기</th>
		</tr>
		<tr>
			<td height="15" width="100">제 목</td>
			<td>${community.csubject}</td>
		</tr>
		<tr>
			<td>내 용</td>
			<td>${community.ccontent}</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td><c:if test="${empty community.filepath}">
                        첨부파일 없음
                    </c:if> <c:if test="${!empty community.filepath}">
					<a
						href="${pageContext.request.contextPath}/resources/uploadFiles/${community.filepath}"
						download>${community.filepath}</a>
				</c:if></td>
		</tr>
		<tr align="center" valign="middle">
			<td colspan="2"><c:url var="bupview" value="cRenew.do">
					<c:param name="cno" value="${community.cno}" />
					<c:param name="page" value="${currentPage}" />
				</c:url> <c:url var="cdelete" value="cDelete">
					<c:param name="board_num" value="${board.board_num}" />
				</c:url> <a href="${bupview}"> [수정 페이지로 이동] </a> &nbsp;&nbsp; <a
				href="${cdelete}"> [글 삭제] </a> &nbsp;&nbsp; <c:url var="clist"
					value="clist">
					<c:param name="page" value="${currentPage}" />
				</c:url> <a href="${clist}">[목록]</a></td>
		</tr>
	</table>

</body>
<%@include file="../main/footer.jsp"%>
</html>