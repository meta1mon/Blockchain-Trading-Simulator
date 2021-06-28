<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지 - BTS</title>
<meta charset="UTF-8">
<script	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script	src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/noticeUpdate.css"
	rel="stylesheet" type="text/css" />
</head>
<%@include file="headerAndAside.jsp"%>
<body >
	<div id="updateWrapper" style="background-image: url(../resources/assets/img/bgpuple.png); background-repeat: no-repeat; background-size: 100% 200%;">
		<div id="updateOut">
			<div class="comm">글 쓰기</div>
			<br>
			<br>
			<br>
			<br>
			<br>
			<form action="nInsert" method="post" enctype="multipart/form-data"
				style="margin-left: 20px">
				<input type="hidden" name="cno" value="${community.cno}"> <input
					type="hidden" name="filepath" value="${community.filepath}">
				<input id="subject" type="text"
					placeholder="&nbsp;&nbsp;제목을 입력해 주세요." name="csubject"
					maxlength="100" value="${community.csubject}">
				<textarea id="editor" name="ccontent" maxlength="4000"
					style="margin: 0 auto 10 auto;">${community.ccontent}</textarea>
				<input type="submit" value="글 작성하기" id="submit">
				<c:url var="nlist" value="nl">
					<c:param name="page" value="1" />
				</c:url>
				<input type="button" value="취소하기" id="cancel"
					onclick="location.href = '${nlist}'">
				<!-- 게시글 첨부파일 -->
				<div id="file_text">변경할 첨부 파일</div>
				<img src="../resources/assets/img/upload.png" id="folder">
					<input type="file" id="file" name="upfile" multiple="multiple">
				<!-- 이전 게시글 첨부파일 -->
				<p id="oldFileDiv"><img src="../resources/assets/img/download.png" id="oldFolder">
				이전 첨부 파일<br>
				<c:if test="${empty community.filepath}">
				<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;첨부 파일 없음
				</c:if></p>
				<c:if test="${!empty community.filepath}">
					<c:forTokens var="fileName" items="${community.filepath}" delims=","
						varStatus="st">
						<a download="${fileName}"
							href="${pageContext.request.contextPath}/resources/uploadFiles/${community.filepath}">${fileName}</a>
						<c:if test="${!st.last }">
	                        /
	                    </c:if>
						<br>
					</c:forTokens>
				</c:if>
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
		<br>
		<br>
	</div>
</body>
</html>