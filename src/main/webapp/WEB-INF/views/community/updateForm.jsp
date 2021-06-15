<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BTS</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/28.0.0/decoupled-document/ckeditor.js"></script>
</head>
<%@include file="../main/header.jsp"%>
<body bgcolor="#FFEFD5">
	<form name="renewForm" action="cUpdate" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="cno" value="${community.cno}">
		<input type="hidden" name="filepath" value="${community.filepath}">
		<table align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="csubject"
					value="${community.csubject}"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${community.cwriter}</td>
			</tr>
			<tr>
				<td>이전 첨부파일</td>
				<td><c:if test="${empty community.filepath}">
첨부파일 없음
</c:if> <c:if test="${!empty community.filepath}">
						<a
							href="${pageContext.request.contextPath}/resources/uploadFiles/${community.filepath}"
							download>${community.filepath}</a>
					</c:if></td>
			</tr>
			<tr>
				<td>변경할 첨부파일</td>
				<td><input type="file" name="upfile"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><div id="toolbar-container"></div><div id="editor" name="ccontent" maxlength="4000"></div></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" id="renew"
					value="수정하기"> &nbsp; <c:url var="clist" value="clist">
						<c:param name="page" value="1" />
					</c:url> <a href="${clist}">목록으로</a></td>
			</tr>
		</table>
	</form>
<script>
    DecoupledEditor
        .create( document.querySelector( '#editor' ) )
        .then( editor => {
            const toolbarContainer = document.querySelector( '#toolbar-container' );

            toolbarContainer.appendChild( editor.ui.view.toolbar.element );
        } )
        .catch( error => {
            console.error( error );
        } );
</script>
</body>
<%@include file="../main/footer.jsp"%>
</html>