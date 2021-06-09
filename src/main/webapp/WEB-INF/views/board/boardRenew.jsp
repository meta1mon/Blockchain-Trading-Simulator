<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />
<body bgcolor="#FFEFD5">
	<form name="renewForm" action="bUpdate" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="board_num" value="${board.board_num}">
		<input type="hidden" name="board_file" value="${board.board_file}">
		<table align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="board_title"
					value="${board.board_title}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${board.board_writer}</td>
			</tr>
			<tr>
				<td>글 비밀번호</td>
				<td><input type="password" name="board_pwd"></td>
			</tr>
			<tr>
				<td>이전 첨부파일</td>
				<td><c:if test="${empty board.board_file}">
첨부파일 없음
</c:if> <c:if test="${!empty board.board_file}">
						<a
							href="${pageContext.request.contextPath}/resources/uploadFiles/${board.board_file}"
							download>${board.board_file}</a>
					</c:if></td>
			</tr>
			<tr>
				<td>변경할 첨부파일</td>
				<td><input type="file" name="upfile"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea cols="50" rows="7" name="board_content">${board.board_content}</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" id="renew"
					value="수정하기"> &nbsp; <c:url var="blist" value="blist">
						<c:param name="page" value="1" />
					</c:url> <a href="${blist}">목록으로</a></td>
			</tr>
		</table>
	</form>
</body>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('form[name=renewForm]').on('submit', function(event) {
			if ($('input[name=board_pwd]').val() != "${board.board_pwd}") {
				alert("비밀번호가 일치하지 않습니다.");
				event.preventDefault();
			} else {
				return true;
			}
		});
	});
</script>
</html>