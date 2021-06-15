<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#mr {
	width: 1240px;
	margin: 0 auto;
	text-align: center;
}

#mr table {
	margin: 0 auto;	
}
</style>
</head>
<jsp:include page="myHeader.jsp"></jsp:include>
<body>
	<div id="mr">
		<table border="2">
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>등록일</th>
				<th>조회</th>
				<th>추천</th>
				<th>댓글</th>
			</tr>
			<tr>
				<td>1</td>
				<td>주린이 수익률 자랑</td>
				<td>2021-02-22</td>
				<td>23</td>
				<td>2</td>
				<td>24</td>
			</tr>
		</table>
	</div>

</body>
</html>