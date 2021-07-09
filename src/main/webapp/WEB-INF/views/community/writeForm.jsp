<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<link
	href="${pageContext.request.contextPath}/resources/css/writeForm.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
<script>
$(function() {
	$('form[name=insertForm]').on(
			'submit',
			function(e) {
				if ($('textarea[name=ccontent]').val() == null || $('textarea[name=ccontent]').val() == ""){
					alert("내용을 입력하십시오.");
					e.preventDefault();
				} else {
					return true;
				}
			});
});
</script>

</head>
<body>
	<div id="wrapper">
		<%@include file="../main/header.jsp"%>
		<div class="writeOut">
			<div class="comm">글쓰기</div>
			<br> <br> <br> <br> <br>
			<form action="cInsert" method="post" enctype="multipart/form-data"
				style="margin: 20px 20px 0 20px" name="insertForm">
				<c:if test="${loginMember == 'admin' }">
					<input id="subject" type="text"
						placeholder="&nbsp;&nbsp;제목을 입력해 주세요." name="csubject"
						maxlength="100">
				</c:if>
				<textarea id="editor" name="ccontent" maxlength="4000"
					style="margin: 0 auto 10 auto;"></textarea>
				<input type="submit" value="태그 변환은 '@'와 ' ' 사이에 작성해주세요" id="submit">
				<c:url var="clist" value="clist">
					<c:param name="page" value="1" />
				</c:url>
				<input type="button" value="취소하기" id="cancel"
					onclick="location.href = '${clist}'">

				<div id="file_text">파일 첨부</div>
				<img src="resources/assets/img/folder.png" id="folder">
				<p id="fileDiv">
					<input type="file" id="file" name="upfile" multiple="multiple"
						style="margin-top: 25px;">
			</form>

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
					    </script>
		</div>
		<%@include file="../main/footer.jsp"%>
	</div>
</body>
</html>
