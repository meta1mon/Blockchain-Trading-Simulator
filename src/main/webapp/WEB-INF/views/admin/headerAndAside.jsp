<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#mh {
	position: absolute;
    width: calc(100% - 200px);
    left: 200px;
	height: 100px;
}
#mh td {
	padding-top: 42px; 
	text-align: center;
}
#mh td:nth-child(2), #mh td:nth-child(3), #mh td:nth-child(4) {
	border-left: 1px solid black;
}

#mh td p {
	text-align: left;
}

#mh span {
	vertical-align: top;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Font Awesome 4-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<style>
#aa {
	background-color: #8c66c8;
}

#aa li a {
	font-size: 15px;
}

#aa a {
	text-decoration: none;
}

/* #aa i .fa {
	float: right !important;
}

#aa i .fas {
	float: right !important;
} */

.icon{
	float: right;
}

/* 충전 내역 관리 아래 빈 곳*/
#aa .contenedor-menu {
	width: 200px;
	display: block;
	line-height: 18px;
}

#aa .contenedor-menu .menu {
	width: 100%;
}

#aa .contenedor-menu ul {
	list-style: none;
}

#aa img {
	padding: 15px 20px;
}

/* aside 전체 부분 */
#aa .contenedor-menu .menu li a {
	color: white;
	display: block;
	padding: 15px 20px;
	background: #8c66c8;
}

/* aside에 마우스 올릴 때 */
#aa .contenedor-menu .menu li a:hover {
	background: #ffc000;
	color: white;
}

#aa .contenedor-menu .menu i.fa {
	font-size: 12px;
	line-height: 18px;
	float: right;
}

#aa .contenedor-menu .menu ul {
	padding: 0;
	display: none;
}

/* aside 메뉴 안쪽 부분 */
#aa .contenedor-menu .menu ul li a {
	background: #f2f2f2;
	color: black;
}

/* 클린된 메뉴 */
#aa .contenedor-menu .menu .activado>a {
	background: #ffc000;
	color: white;
}
</style>
<script>
	$(document).ready(function() {
		$('.menu li:has(ul)').click(function(e) {
			e.preventDefault();

			if ($(this).hasClass('activado')) {
				$(this).removeClass('activado');
				$(this).children('ul').slideUp();
			} else {
				$('.menu li ul').slideUp();
				$('.menu li').removeClass('activado');
				$(this).addClass('activado');
				$(this).children('ul').slideDown();
			}

			$('.menu li ul li a').click(function() {
				window.location.href = $(this).attr('href');
			})
		});
	});
</script>
</head>
<body>
	<div id="aa" style="height: 100vh; width: 200px; float: left;">
		<div class="contenedor-menu">
			<ul class="menu">
				<li id="index"><img src="resources/assets/img/bts_logo.png" width="120"
						height="50" style="border-radius:5px;"></li>
				<li id="home"><a href="${pageContext.request.contextPath}/admin">MAIN<span class="icon"><i class="fa fa-home"></i></span></a></li>
				<li id="buychart"><a href="#">회원관리<span class="icon"><i
						class="fa fa-chevron-down"></i></span></a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/ml">회원 조회 및 탈퇴</a></li>
					</ul></li>
				<li id="adminshop"><a href="#">게시판 관리<span class="icon"><i
						class="fa fa-chevron-down"></i></span></a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/cr">게시판 신고 리스트</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/rr">댓글 신고 리스트</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/acr">처리한 신고 게시글</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/arr">처리한 신고 댓글</a></li>
					</ul></li>
				<li id="adminmember"><a href="#">공지사항 관리<span class="icon"><i
						class="fa fa-chevron-down"></i></span></a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/nl">공지사항 리스트</a></li>
					</ul></li>
				<li id="adminmember"><a href="#">충전 상품 관리<span class="icon"><i
						class="fa fa-chevron-down"></i></span></a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/cashR">충전 상품 등록</a></li>
					</ul>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/cashMR">충전 수정·삭제</a></li>
					</ul>
					<ul>
						<li><a href="${pageContext.request.contextPath}/admin/cll">충전 내역 리스트</a></li>
					</ul>
				</li>
				<li id="adminmember" style="width: 200px; margin-top: auto; position: absolute; bottom: 0px;"><a href="#">1:1 문의 관리</a></li>
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