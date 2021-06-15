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
<style>
.ck.ck-editor {
	max-width: 800px;
}

.ck-editor__editable {
	min-height: 400px;
}
</style>
</head>
<%@include file="../main/header.jsp"%>
<body>
	<form action="cInsert" method="post" enctype="multipart/form-data">
		<table align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="csubject"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="cwriter"></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="upfile"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><div id="toolbar-container"></div><div id="editor" name="ccontent" maxlength="4000"></div></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="등록하기"> &nbsp; <c:url var="clist" value="clist">
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