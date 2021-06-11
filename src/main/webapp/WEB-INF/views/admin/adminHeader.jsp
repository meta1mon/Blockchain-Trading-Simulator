<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	width: 1240px;
	margin: 0 auto;
}

#mh li {
	box-sizing: border-box;
	list-style-type: none;
	width: 300px;
	float: left;
	text-align: center;
}

#mh li:nth-child(2), #mh li:nth-child(3), #mh li:nth-child(4) {
	border-left: 1px solid black;
}

#mh li p {
	text-align: center;
}

#mh span {
	vertical-align: top;
	margin-left: 10px;
}
</style>
</head>
<body>
	<div id="mh">
		<ul>
			<li><img width="25px" height="25px" /><span>전체 ARMY 수</span>
				<p>111명</p></li>
			<li><img width="25px" height="25px" /><span>신규 ARMY 수</span>
				<p>111명</p></li>
			<li><img width="25px" height="25px" /><span>신규 게시글 수</span>
				<p>111개</p></li>
			<li><img width="25px" height="25px" /><span>총 게시글 수</span>
				<p>111개</p></li>
		</ul>
	</div>
</body>
</html>