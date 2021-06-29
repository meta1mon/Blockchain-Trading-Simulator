<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/noticeWrite.css"
	rel="stylesheet" type="text/css" />

</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="writeWrapper" style="background-image:url(../resources/assets/img/bgpuple.png); background-repeat: no-repeat; background-size: 100% 200%;">
		<div id="writeOut">
			<div class="comm">글 쓰기</div><br><br><br><br><br>
			<form action="nInsert" method="post" enctype="multipart/form-data" style="margin-left:20px">
					<input id="subject"	type="text" placeholder="&nbsp;&nbsp;제목을 입력해 주세요." name="csubject" maxlength="100">
					<textarea id="editor" name="ccontent" maxlength="4000" style="margin: 0 auto 10 auto;"></textarea>
					<input type="submit" value="글 작성하기" id="submit"> 
					<c:url var="nlist" value="nlist">
							<c:param name="page" value="1" />
					</c:url>
					<input type="button" value="취소하기" id="cancel" onclick="location.href = '${nlist}'">
	
				<div id="file_text">파일 첨부</div>
				<img src="../resources/assets/img/folder.png" id="folder">
				<p id="fileDiv">
					<input type="file" id="file" name="upfile"  multiple="multiple" style="margin-top: 25px;">
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
		<br><br><br><br><br><br><br><br><br>
	</div>
</body>
</html>
