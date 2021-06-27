<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
<style>
.ck.ck-editor {
	max-width: 1000px;
}

.ck-editor__editable {
	min-height: 600px;
}

.comm {
	margin: 40px 0 20px 20px;
	text-align: left;
	font-size: 25px;
	color: #FFC000;
	float: left;
}

#write {
	margin: 40px 0 20px 10px;
	text-align: left;
	font-size: 17px;
	color: black;
	float: left;
}

#subject {
	margin: 0 auto 10 auto;
	height: 40px;
	font-size: 15px;
	box-sizing: border-box;
	width: 1000px;
	background-color: #FBFBFC;
	border: 1px solid #D5D5D5;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out;
}

#subject:hover, #subject:focus {
	background-color: #ffffff;
	color: black;
	border: 1px solid #BDBDBD;
}

#folder {
	float: right;
	position: relative;
	left: 53px;
	top: 8px;
}

#file_text {
	color: black;
	font-size: 14px;
	float: right;
	width: 150px;
	position: relative;
	top: 10px;
	left: 60px;
}

#file {
	position: relative;
	bottom: 95px;
	left: 74px;
	border: none;
	float: right;
}

input#file-upload-button {
	background-color: #ffffff;
	color: black;
}

input #file-upload-button {
	background-color: #ffffff;
	color: black;
}

#submit {
	width: 125px;
	height: 35px;
	padding: 5px;
	margin: 30px 0 50px 0;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #ffffff;
	background-color: #8C66C8;
	font-size: 15px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#cancel {
	width: 90px;
	height: 35px;
	padding: 5px;
	margin: 30px 0px 0px 0;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #8C66C8;
	background-color: #ffffff;
	font-size: 15px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
	display: inline;
}

#submit:hover, #submit:active {
	background-color: #B85CEF;
	box-shadow: 10px 10px 20px 5px #eeeeee;
}

#cancel:active, #cancel:hover {
	box-shadow: 10px 10px 20px 5px #eeeeee;
}
</style>

</head>
<%@include file="../main/header.jsp"%>
<body class="content"
	style="background-image: url(resources/assets/img/bgpuple.png); background-repeat: no-repeat; background-size: 100% 200%;">
	<div
		style="width: 1040px; background-color: #ffffff; margin: 70px auto; padding: 20px; border-radius: 4px;">
		<div class="comm">글 쓰기</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<form action="cInsert" method="post" enctype="multipart/form-data"
			style="margin-left: 20px">
			<input id="subject" type="text"
				placeholder="&nbsp;&nbsp;제목을 입력해 주세요." name="csubject"
				maxlength="100">
			<textarea id="editor" name="ccontent" maxlength="4000"
				style="margin: 0 auto 10 auto;"></textarea>
			<input type="submit" value="글 작성하기" id="submit">
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
<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
<%@include file="../main/footer.jsp"%>
</html>
