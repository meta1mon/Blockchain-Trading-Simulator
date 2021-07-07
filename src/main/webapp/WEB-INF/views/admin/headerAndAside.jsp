<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />

<title>관리자 페이지 - BTS</title>
<link href="${pageContext.request.contextPath}/resources/css/admin.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/adminhaa.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/adminhaa.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- Font Awesome 4-->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
</head>
<body>
	<div id="aa" style='height: 100vh; width: 200px; float: left;'>
		<div class="contenedor-menu">
			<ul class="menu">
				<li id="index"><img src="${pageContext.request.contextPath}/resources/assets/img/bts_logo.svg" width="120"height="50" ></li>
				<li id="home"><a href="${pageContext.request.contextPath}/admin">MAIN<span class="icon"><i class="fa fa-home"></i></span></a></li>
				<li id="adminmember"><a href="#">공지사항 관리
				<span class="icon"><i class="fas fa-bullhorn"></i></span></a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/nl">공지사항 리스트</a></li>
					</ul>
					</li>
				<li id="buychart"><a href="#">회원관리<span class="icon"><i
						class="fa fa-chevron-down"></i></span></a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/ml">회원 관리</a></li>
					</ul></li>
				<li id="adminshop"><a href="#">게시판 관리<span class="icon"><i
						class="fa fa-chevron-down"></i></span></a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/cr">신고된 게시글 조회</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/acr">처리된 신고 게시글 조회</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/rr">신고된 댓글 조회</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/arr">처리된 신고 댓글 조회</a></li>
					</ul></li>
				<li id="adminmember"><a href="#">충전 상품 관리<span class="icon"><i
						class="fa fa-chevron-down"></i></span></a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/cash">충전 상품 관리</a></li>
					</ul>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/cll">충전 내역 리스트</a></li>
					</ul>
				</li>
				<li id="adminmember" style="width: 200px; margin-top: auto; position: absolute; bottom: 0px;"><a onclick="window.open('https://center-pf.kakao.com/_ZhLns/dashboard')">1:1 문의 관리</a></li>
			</ul>

		</div>
	</div>

	<div>
	<table id="mh">
		<tr>
			<td>
				<span class="fas fa-users"></span>
				<span>전체 회원 수: ${countMember}명</span>
			</td>
			<td>
				<span class="fas fa-user-plus"></span>
				<span>신규 회원 수: ${countTodayMember}명</span>
			</td>
			<td>
				<span class="fas fa-newspaper"></span>
				<span>총 게시글 수: ${totalCount}개</span>
			</td>
			<td>
				<span class="fas fa-pencil-alt"></span>
				<span>신규 게시글 수:  ${totalTodayCount}개</span>
			</td>
		</tr>
	</table>

	</div>
</body>
</html>