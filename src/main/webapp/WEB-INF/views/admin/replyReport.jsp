<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
#modal {
	display: none;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(188, 143, 143, 0.8);
}

#contents {
	background-color: white;
	margin: 100px auto;
	width: 400px;
	height: 600px;
	text-align: center;
	position: relative;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function openModal() {
		$("#modal").css("display", "block");
	}

	function closeModal() {
		$("#modal").css("display", "none");
	}
</script>

</head>
<body class="adminContent">
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
			<td onclick="openModal()" style="cursor: pointer;">개미 다죽는다 국가가
				보상해라</td>
			<td onclick="openModal()" style="cursor: pointer;">정의로운너구리</td>
			<td onclick="openModal()" style="cursor: pointer;">혐오표현</td>
			<td onclick="openModal()" style="cursor: pointer;">anger123</td>
			<td onclick="openModal()" style="cursor: pointer;">2021-03-22
				11:23:22</td>
		</tr>
	</table>
	<p>&#60; 1 2 3 &#62;</p>
	<div id="modal">
		<div id="contents">
			<br> 신고자<br>
			<input type="text" value="정의로운너구리" readonly> <br> 신고 사유<br>
			<input type="text" value="혐오표현" readonly><br> 신고 시간<br>
			<input type="text" value="2021-03-22 11:23:22" readonly><br>
			<hr>
			게시글 제목<br>
			<input type="text" value="개미 다죽는다 국가가 보상해라" readonly><br>
			피신고자<br>
			<input type="text" value="anger123" readonly><br> 댓글 내용<br>
			<textarea cols="22" rows="10" readonly>xx xxx xxxx xxx xx</textarea>
			<br>
			<hr>
			신고 처리 사유<br>
			<input type="text" value="운영자 마음대로"><br>
			<br>
			<br>
			<button type="button">자세히 보기</button>
			<button type="button">신고 수리</button>
			<button type="button">신고 반려</button>
			<button type="button" onclick="closeModal()">닫기</button>
		</div>
	</div>

</body>
</html>