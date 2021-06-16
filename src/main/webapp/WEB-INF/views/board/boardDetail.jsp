<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />
</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<h1 align="center">게시글 상세보기</h1>
	<table align="center" cellpadding="10" cellspacing="0" border="1"
		width="70%">
		<tr align="center" valign="middle">
			<th colspan="2">${board.board_num}번글상세보기</th>
		</tr>
		<tr>
			<td height="15" width="100">제 목</td>
			<td>${board.board_title}</td>
		</tr>
		<tr>
			<td>내 용</td>
			<td>${board.board_content}</td>
		</tr>
		<tr>
			<td>첨부파일</td>
			<td><c:if test="${empty board.board_file}">
                        첨부파일 없음
                    </c:if> <c:if test="${!empty board.board_file}">
					<a
						href="${pageContext.request.contextPath}/resources/uploadFiles/${board.board_file}"
						download>${board.board_file}</a>
				</c:if></td>
		</tr>
		<tr align="center" valign="middle">
			<td colspan="2"><c:url var="bupview" value="bRenew.do">
					<c:param name="board_num" value="${board.board_num}" />
					<c:param name="page" value="${currentPage}" />
				</c:url> <c:url var="bdelete" value="bDelete.do">
					<c:param name="board_num" value="${board.board_num}" />
				</c:url> <a href="${bupview}"> [수정 페이지로 이동] </a> &nbsp;&nbsp; <a
				href="${bdelete}"> [글 삭제] </a> &nbsp;&nbsp; <c:url var="blist"
					value="blist.do">
					<c:param name="page" value="${currentPage}" />
				</c:url> <a href="${blist}">[목록]</a></td>
		</tr>
	</table>

</body>
</html>