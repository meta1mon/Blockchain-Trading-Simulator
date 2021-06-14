<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- Font Awesome 4-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<style>
li a {
	font-size: 15px;
}

body {
	margin: 0 auto;
	padding: 0;
}

a {
	text-decoration: none;
}

i .fa {
	float: right;
}

i .fas {
	float: right;
}

/* 충전 내역 관리 아래 빈 곳*/
.menu {
	margin: 0;
	padding: 0;
	background: #b85cef;
}

.contenedor-menu {
	width: 200px;
	display: block;
	line-height: 18px;
}

.contenedor-menu .menu {
	width: 100%;
}

.contenedor-menu ul {
	list-style: none;
}

/* aside 전체 부분 */
.contenedor-menu .menu li a {
	color: white;
	display: block;
	padding: 15px 20px;
	background: b85cef;
}

/* aside에 마우스 올릴 때 */
.contenedor-menu .menu li a:hover {
	background: #e3c8f8;
	color: #fff;
}

.contenedor-menu .menu i.fa {
	font-size: 12px;
	line-height: 18px;
	float: right;
}

.contenedor-menu .menu ul {
	padding: 0;
	display: none;
}

/* aside 메뉴 안쪽 부분 */
.contenedor-menu .menu ul li a {
	background: #b7aee8;
	color: #e9e9e9;
}

/* 클린된 메뉴 */
.contenedor-menu .menu .activado>a {
	background: e3c8f8;
	color: #fff;
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

<body style="height: 100vh; width: 200px; float: left;">
	<div class="contenedor-menu">
	<ul class="menu">
		<li id="index"><a href="#"><img src="" width="160"
				height="100"></a></li>
		<li id="home"><a href="#">MAIN<i class="fa fa-home"></i></a></li>
		<li id="buychart"><a href="#">회원관리<i
				class="fa fa-chevron-down"></i></a>
			<ul>
				<li><a href="#">회원 조회 및 탈퇴</a></li>
			</ul></li>
		<li id="adminshop"><a href="#">게시판 관리<i
				class="fa fa-chevron-down"></i></a>
			<ul>
				<li><a href="#">게시판 신고 리스트</a></li>
				<li><a href="#">댓글 신고 리스트</a></li>
				<li><a href="#">처리한 신고 게시글</a></li>
				<li><a href="#">처리한 신고 댓글</a></li>
			</ul></li>
		<li id="adminmember"><a href="#">공지사항 관리<i
				class="fa fa-chevron-down"></i></a>
			<ul>
				<li><a href="#">공지사항 리스트</a></li>
			</ul></li>
		<li id="adminmember"><a href="#">충전 내역 관리<i
				class="fa fa-chevron-down"></i></a>
			<ul>
				<li><a href="#">충전 내역 리스트</a></li>
			</ul></li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>
		<li>&nbsp;</li>

		<li id="adminmember"><a href="#">1:1 문의 관리</a></li>
	</ul>
</div>
</body>
</html>