<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<title>관리자 페이지 - BTS</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#cr #modal {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(188, 143, 143, 0.8);
}

#cr #contents {
	background-color: white;
	margin: 100px auto;
	width: 400px;
	height: 600px;
	text-align: center;
	position: relative;
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
	<div id="cr" style="position: absolute; top: 300px; left: 400px;">
		<table border="2">
			<tr>
				<th>No.</th>
				<th>게시글 제목</th>
				<th>신고자</th>
				<th>신고 사유</th>
				<th>피신고자</th>
				<th>신고 시간</th>
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
			</tr>
		</table>
		<p>&#60; 1 2 3 &#62;</p>

		<div id="modal">
			<div id="contents">
				<br> 신고자<br> <input type="text" value="정의로운너구리" readonly>
				<br> 신고 사유<br> <input type="text" value="광고, 홍보성 게시글"
					readonly><br> 신고 시간<br> <input type="text"
					value="2021-06-22 11:23:22" readonly><br>
				<hr>
				게시글 제목<br> <input type="text" value="$&@#무료 환전소%!@%^" readonly><br>
				피신고자<br> <input type="text" value="asdf123" readonly><br>
				게시글 내용<br>
				<textarea cols="22" rows="10" readonly>가느다란 마법사의 동쪽으로 나아가다 보니 허수아비 마루타가 테란이 되었다</textarea>
				<br>
				<hr>
				신고 처리 사유<br> <input type="text" value="운영자 마음대로"><br>
				<br> <br>
				<button type="button">자세히 보기</button>
				<button type="button">신고 수리</button>
				<button type="button">신고 반려</button>
				<button type="button" onclick="closeModal()">닫기</button>
			</div>
		</div>
	</div>
</body>
</html>