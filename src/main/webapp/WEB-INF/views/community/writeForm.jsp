<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BTS</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
<style>
.ck.ck-editor {
	max-width: 800px;
}

.ck-editor__editable {
	min-height: 400px;
}

#write {
	margin: 40px 0 20px 10px;
	text-align: left;
	font-size: 17px;
	color: black;
	float: left;
}

#subject {
	background-color: #FBFBFC;
	border: 1px solid #D5D5D5;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#subject:hover, #subject:focus {
	background-color: #ffffff;
	color: black;
	border: 1px solid #BDBDBD;
}

#tag {
	color: #76858C;
	background-color: #FBFBFC;
	border: 1px solid #D5D5D5;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#tag:hover, #tag:focus {
	background-color: #ffffff;
	color: black;
	border: 1px solid #BDBDBD;
}

#folder {
	float: right;
	position: relative;
	left: 83px;
	bottom: 2px;
}

#file_text {
	color: black;
	font-size: 14px;
	float: right;
	width: 150px;
}

#file {
	color: #76858C;
	position: relative;
	top: 6px;
	left: 276px;
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
	border: none;
}

#submit {
	width: 125px;
	height: 35px;
	padding: 5px;
	margin: 30px 0 350px 0;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #ffffff;
	background-color: #8C66C8;
	font-size: 15px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
	float: left;
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
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
	float: left;
	display: inline;
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
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
<body class="content" style="background-color:#E3C8F8">
<div style="width: 1240px; margin: 0 auto 0 auto; color: #99ADB6; background:#ffffff; padding:20px; border-radius: 4px;">
		<div id="write">글 쓰기</div><br><br><br><br>
		<form action="cInsert" method="post" enctype="multipart/form-data">
			<div style="margin-bottom: 10px;">
				<input id="subject"
					style="width: 800px; height: 40px; font-size: 15px; box-sizing: border-box;"
					type="text" placeholder="제목을 입력해 주세요." name="csubject"
					maxlength="100">
			</div>
			<div style="margin-bottom: 10px;">
				<textarea id="editor" name="ccontent" maxlength="4000"></textarea>
			</div>
			<div>
				<input type="submit" value="글 작성하기" id="submit"> <input
					type="button" value="취소하기" id="cancel"
					onclick="location.href = '${clist}'">
			</div>


			<div id="file_text">파일 첨부</div>
			<img src="<%=request.getContextPath()%>/images/folder.png"
				id="folder">
			<p id="fileDiv">
				<input type="file" id="file" name="upfile"  multiple="multiple" style="margin-top: 25px;">
		</form>
	</div>

					<script>
				        ClassicEditor
				            .create( document.querySelector( '#editor' ) )
				            .catch( error => {
				                console.error( error );
				            } );
				    </script>
				    
					<c:url var="clist" value="clist">
						<c:param name="page" value="1" />
					</c:url> <a href="${clist}">목록으로</a></td>
			</tr>
		</table>
	</form>
	<script>
<script>
ClassicEditor
    .create( document.querySelector( '#editor' ) )
    .catch( error => {
        console.error( error );
    } );
</script>
</body>
<%@include file="../main/footer.jsp"%>
</html>
