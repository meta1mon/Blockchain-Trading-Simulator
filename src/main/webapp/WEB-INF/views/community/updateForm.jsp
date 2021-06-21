<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BTS</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
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
	<form name="renewForm" action="cUpdate" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="cno" value="${community.cno}"> <input
			type="hidden" name="filepath" value="${community.filepath}">
		<table align="center">
			<tr>
				<td>제목</td>
				<td><input type="text" name="csubject"
					value="${community.csubject}"></td>
			</tr>
			<tr>
				<td>이전 첨부파일</td>
				<td><c:if test="${empty community.filepath}">
첨부파일 없음
</c:if> <c:if test="${!empty community.filepath}">
						<c:forTokens var="fileName" items="${community.filepath}"
							delims="," varStatus="st">
							<a download="${fileName}"
								href="${pageContext.request.contextPath}/resources/uploadFiles/${community.filepath}">${fileName}</a>
							<c:if test="${!st.last }">
                        /
                    </c:if>
							<br>
						</c:forTokens>
					</c:if></td>
			</tr>
			<tr>
				<td>변경할 첨부파일</td>
				<td><input type="file" name="upfile" multiple="multiple"></td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td><textarea id="editor" name="ccontent" maxlength="4000">${community.ccontent}</textarea>
					<script>
					  ClassicEditor
					    .create( document.querySelector( '#editor' ), {
					        cloudServices: {
					            tokenUrl: 'https://81478.cke-cs.com/token/dev/de0d9159dc2b7ce3ecb85191c28f789217b087f58ae6880e30d89820724d',
					            uploadUrl: 'https://81478.cke-cs.com/easyimage/upload/'
					        }
					    } )
					    .catch( error => {
					        console.error( error );
					    } );
				    </script></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" id="renew"
					value="수정하기"> &nbsp; <c:url var="clist" value="clist">
						<c:param name="page" value="1" />
					</c:url> <a href="${clist}">목록으로</a></td>
			</tr>
		</table>
	</form>
</body>
<%@include file="../main/footer.jsp"%>
</html>