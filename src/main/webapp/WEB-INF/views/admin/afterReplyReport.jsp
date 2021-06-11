<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#modal {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.8);
}

#contents {
	background-color: white;
	margin: 30px auto;
	width: 400px;
	height: 650px;
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
<body>
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
			<br> 처리 상태 <br>
			<input type="text" value="수리"><br> 신고 처리 사유<br>
			<input type="text" value="욕은 심했지 ㅇㅈ?"><br> 처리 시간<br>
			<input type="text" value="2021-06-23 11:23:22"><br>
			<hr>
			신고자<br>
			<input type="text" value="정의로운너구리" readonly> <br> 신고 사유<br>
			<input type="text" value="광고, 홍보성 게시글" readonly><br> 신고
			시간<br>
			<input type="text" value="2021-06-22 11:23:22" readonly><br>
			<hr>
			게시글 제목<br>
			<input type="text" value="$&@#무료 환전소%!@%^" readonly><br>
			피신고자<br>
			<input type="text" value="asdf123" readonly><br> 게시글 내용<br>
			<textarea cols="22" rows="10" readonly>가느다란 마법사의 동쪽으로 나아가다 보니 허수아비 마루타가 테란이 되었다</textarea>
			<br> <br>
			<button type="button" onclick="closeModal()">닫기</button>
		</div>
	</div>

</body>
</html>