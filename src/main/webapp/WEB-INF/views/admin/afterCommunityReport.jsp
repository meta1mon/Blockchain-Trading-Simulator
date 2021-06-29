<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<title>관리자 페이지 - BTS</title>
<style>
#modal{
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

#contents table {
	width: 100%;
}

#contents {
	padding: 30px;
    background-color: white;
    border: 2px solid rgb(140, 102, 200);
    border-radius: 5px;
    top: calc(50% - 200px);
    left: calc(50% - 100px);
    width: 400px;
    height: 365px;
    text-align: center;
    position: absolute;
}

#acr th, td {
	padding: 5px !important;
}

#acr td:not(.center, .right){
	text-align: left;
}

#acr {
	position: absolute;
	top: calc(50% - 150px);
	left: calc(50% - 320px);
}

#page{
	text-align: center;
}

#listForm{
	width: 100%;
}

#detail {
	height: 35px;
}

#close {
	height: 35px;
}

#contents table td:nth-child(1) {
	width: 120px;
	text-align: right;
}

#contents table td input {
	width: 270px;
	border: 1px solid rgba(0, 0, 0, 0.5);
	border-radius: 3px;
}

#ccontentText {
	height: 105px;
	width: 270px;
	border: 1px solid rgba(0, 0, 0, 0.5);
	border-radius: 3px;
	font-size: 13.3333px;
	padding: 1px 2px;
	text-align: left;
	background: white;
}

button {
	width: 94px;
}

.hidden{
	display: none;
}
</style>
<script>
	function openModal() {
		$("#modal").css("display", "block");
	}

	function closeModal() {
		$("#modal").css("display", "none");
	}
</script>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="acr"  style="position: absolute; top: 300px; left: 400px;">
		<form action="#" method="post">
			<input type="search">
			<button type="button">검색</button>
		</form>
		<table border="2">
			<tr>
				<th>No.</th>
				<th>게시글 제목</th>
				<th>신고자</th>
				<th>신고 사유</th>
				<th>피신고자</th>
				<th>신고 시간</th>
				<th>처리 상태</th>
				<th>처리 사유</th>
				<th>처리 시간</th>
			</tr>
			<tr>
				<td onclick="openModal()" style="cursor: pointer;">1</td>
				<td onclick="openModal()" style="cursor: pointer;">$&@#무료
					환전소%!@%^</td>
				<td onclick="openModal()" style="cursor: pointer;">정의로운너구리</td>
				<td onclick="openModal()" style="cursor: pointer;">광고, 홍보성 게시글</td>
				<td onclick="openModal()" style="cursor: pointer;">asdf123</td>
				<td onclick="openModal()" style="cursor: pointer;">2021-06-22
					11:23:22</td>
				<td onclick="openModal()" style="cursor: pointer;">수리</td>
				<td onclick="openModal()" style="cursor: pointer;">욕은 심했지 ㅇㅈ?</td>
				<td onclick="openModal()" style="cursor: pointer;">2021-06-23
					11:23:22</td>
			</tr>
		</table>
		<p>&#60; 1 2 3 &#62;</p>
		<div id="modal">
			<div id="contents">
				<br> 처리 상태 <br> <input type="text" value="수리"><br>
				신고 처리 사유<br> <input type="text" value="욕은 심했지 ㅇㅈ?"><br>
				처리 시간<br> <input type="text" value="2021-06-23 11:23:22">
				<hr>
				신고자<br> <input type="text" value="정의로운너구리" readonly> <br>
				신고 사유<br> <input type="text" value="광고, 홍보성 게시글" readonly><br>
				신고 시간<br> <input type="text" value="2021-06-22 11:23:22"
					readonly><br>
				<hr>
				게시글 제목<br> <input type="text" value="$&@#무료 환전소%!@%^" readonly><br>
				피신고자<br> <input type="text" value="asdf123" readonly><br>
				게시글 내용<br>
				<textarea cols="22" rows="10" readonly>가느다란 마법사의 동쪽으로 나아가다 보니 허수아비 마루타가 테란이 되었다</textarea>
				<br> <br>
				<button type="button" onclick="closeModal()">닫기</button>
			</div>
		</div>
	</div>
</body>
</html>