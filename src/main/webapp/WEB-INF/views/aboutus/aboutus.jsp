<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>BTS</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/aboutus.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function moveMypagePost() {
	var newForm = $('<form></form>');
	newForm.attr("method", "post");
	newForm.attr("action", "<%=request.getContextPath()%>/mypage");
	newForm.appendTo('body');
	newForm.submit();		
}
</script>
</head>
<body id="page-top">
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/mainpage"><img
				src="resources/assets/img/bts_logo.svg" alt="..." /></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars ms-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/aboutus">About Us</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/nlist?news_keyword=">뉴스</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/clist">공지사항</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/insta">커뮤니티</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/investmentpage">모의투자</a></li>
					<li class="nav-item"><a class="nav-link"
						href="javascript:void(window.open('<%=request.getContextPath()%>/prochart', '_blank','width=1300px, height=800px'))">프로차트</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/cashShop">충전소</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/rankDaily">랭킹</a></li>
					<c:choose>
						<c:when test="${loginMember == null }">
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/signup" id="signup">회원가입</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/login" id="login">로그인</a></li>
						</c:when>
						<c:when test="${loginMember != null }">
							<li class="nav-item"><a class="nav-link"
								onclick="moveMypagePost()"  style="cursor:pointer">마이페이지</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/logout" id="logout">로그아웃</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<div class="masthead-subheading">새로운 연결이 세상에 스며들다.</div>
			<div class="masthead-heading">
				Bringing Blockchain<br>into the World
			</div>
			<a class="btn btn-primary btn-xl text-uppercase" href="#services">EXPLORE</a>
		</div>
	</header>
	<!-- 사이트 소개-->
	<section class="page-section" id="services">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">사이트 소개</h2>
			</div>
			<div class="row text-center">
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <img
						src="resources/assets/img/bts_logo_reversal.svg"
						style="height: 2cm; position: relative; right: 10px;" alt="..." />
					</span>
					<p class="my-3" style="font-size: 18px;">
						BTS는 회원님께 다양한 서비스와 편의를 제공하는 가상자산 중개 플랫폼입니다.<br> 가상자산에 투자하려는
						사람들에게 위험부담 없는 투자 기회와 경험을 제공합니다.<br> 주식은 모의투자 개념의 프로그램이 이미 많이
						활성화 되어있습니다.<br> 하지만 암호화폐는 투자를 연습할 공간이 없는 실정이므로, 암호화폐 모의투자
						사이트를 기획하게 되었습니다.<br>

					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- 서비스 소개-->
	<section class="page-section bg-light" id="portfolio">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">서비스 소개</h2>
				<h3 class="section-subheading text-muted">This is the world's
					leading portal for easy and quick</h3>
			</div>
			<div class="row">
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Services item 1-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal1">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="resources/assets/img/portfolio/investment.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">모의투자</div>
							<div class="portfolio-caption-subheading text-muted">Mock
								Investment</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Services item 2-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal2">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="resources/assets/img/portfolio/news.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">뉴스</div>
							<div class="portfolio-caption-subheading text-muted">NEWS</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4">
					<!-- Services item 3-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal3">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="resources/assets/img/portfolio/prochart.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">프로차트</div>
							<div class="portfolio-caption-subheading text-muted">Pro
								Chart</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
					<!-- Services item 4-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal4">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="resources/assets/img/portfolio/community.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">커뮤니티</div>
							<div class="portfolio-caption-subheading text-muted">Community</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
					<!-- Services item 5-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal5">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="resources/assets/img/portfolio/cashshop.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">충전소</div>
							<div class="portfolio-caption-subheading text-muted">Cash
								Shop</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-6">
					<!-- Services item 6-->
					<div class="portfolio-item">
						<a class="portfolio-link" data-bs-toggle="modal"
							href="#portfolioModal6">
							<div class="portfolio-hover">
								<div class="portfolio-hover-content">
									<i class="fas fa-plus fa-3x"></i>
								</div>
							</div> <img class="img-fluid"
							src="resources/assets/img/portfolio/ranking.jpg" alt="..." />
						</a>
						<div class="portfolio-caption">
							<div class="portfolio-caption-heading">랭킹</div>
							<div class="portfolio-caption-subheading text-muted">Ranking</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- 팀 소개-->
	<section class="page-section bg-light" id="team"
		style="background-color: white !important;">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">개발팀 소개</h2>
				<h3>ARMY</h3>
				<h3 class="section-subheading text-muted">Aces Recruited Member
					of Year</h3>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle"
							src="resources/assets/img/profile/ksm.jpg" alt="..." />
						<h4>강수목</h4>
						<p class="text-muted" style="margin: 0;">Developer</p>
						<p class="text-muted">beonlyone0405@gmail.com</p>
						<a class="btn btn-dark btn-social mx-2"
							href="https://github.com/Naverbetter" target="_blank"><i
							class="fab fa-github"></i></a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle"
							src="resources/assets/img/profile/kdy.jpg" alt="..." />
						<h4>김도영</h4>
						<p class="text-muted" style="margin: 0;">Developer</p>
						<p class="text-muted">gimdoyoung97@gmail.com</p>
						<a class="btn btn-dark btn-social mx-2"
							href="https://github.com/ehdud0314" target="_blank"><i
							class="fab fa-github"></i></a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle"
							src="resources/assets/img/profile/kyj.jpg" alt="..." />
						<h4>김연준</h4>
						<p class="text-muted" style="margin: 0;">Developer</p>
						<p class="text-muted">okip6854q@gmail.com</p>
						<a class="btn btn-dark btn-social mx-2"
							href="https://github.com/yeonjuning" target="_blank"><i
							class="fab fa-github"></i></a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle"
							src="resources/assets/img/profile/jjh.jpg" alt="..." />
						<h4>정재훈</h4>
						<p class="text-muted" style="margin: 0;">Developer</p>
						<p class="text-muted">jjh52782796@gmail.com</p>
						<a class="btn btn-dark btn-social mx-2"
							href="https://github.com/meta1mon" target="_blank"><i
							class="fab fa-github"></i></a>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle"
							src="resources/assets/img/profile/jsh.jpg" alt="..." />
						<h4>제승하</h4>
						<p class="text-muted" style="margin: 0;">Developer</p>
						<p class="text-muted">jeseungha1102@gmail.com</p>
						<a class="btn btn-dark btn-social mx-2"
							href="https://github.com/shje" target="_blank"><i
							class="fab fa-github"></i></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 개발 환경 -->
	<div class="py-5" style="background-color: #f8f9fa;">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src="resources/assets/img/logos/tomcat.png" alt="..." /></a>
				</div>
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src="resources/assets/img/logos/java.png" alt="..." /></a>
				</div>
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src="resources/assets/img/logos/oracle.png" alt="..." /></a>
				</div>
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src="resources/assets/img/logos/spring.png" alt="..." /></a>
				</div>
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src="resources/assets/img/logos/html.png" alt="..." /></a>
				</div>
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src="resources/assets/img/logos/jquery.png" alt="..." /></a>
				</div>
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src="resources/assets/img/logos/bootstrap.png" alt="..." /></a>
				</div>
				<div class="col-md-3 col-sm-6 my-3">
					<a href="#!"><img class="img-fluid img-brand d-block mx-auto"
						src="resources/assets/img/logos/ckeditor.png" alt="..." /></a>
				</div>
			</div>
		</div>
	</div>

	<!-- Contact-->
	<section class="page-section" id="contact">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">서포트 & 피드백</h2>
				<h3 class="section-subheading text-muted"
					style="color: azure; font-size: larger;">
					도움이 필요하시면 <a class="contact_kakao"
						href="http://pf.kakao.com/_ZhLns/chat" target="_blank">저희에게
						연락하십시오.</a> 제품 피드백을 공유하려면<br> 제품에 대한 정보는 <a class="contact_comm"
						href="${pageContext.request.contextPath}/insta">여기에서 커뮤니티를
						방문하십시오.</a>
				</h3>
			</div>
		</div>
	</section>

	<!-- SERVICES Modals-->
	<!-- SERVICES item 1 modal popup-->
	<div class="portfolio-modal modal fade" id="portfolioModal1"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-bs-dismiss="modal">
					<img src="resources/assets/img/close-icon.svg" alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project details-->
								<h2 class="text-uppercase">모의투자</h2>
								<p class="item-intro text-muted">Mock Investment</p>
								<img class="img-fluid d-block mx-auto"
									src="resources/assets/img/portfolio/investment.jpg" alt="..." />
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
								<ul class="list-inline">
								</ul>
								<button class="btn btn-primary btn-xl text-uppercase"
									data-bs-dismiss="modal" type="button">
									<i class="fas fa-times me-1"></i> Close Service
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio item 2 modal popup-->
	<div class="portfolio-modal modal fade" id="portfolioModal2"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-bs-dismiss="modal">
					<img src="resources/assets/img/close-icon.svg" alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project details-->
								<h2 class="text-uppercase">뉴스</h2>
								<p class="item-intro text-muted">NEWS</p>
								<img class="img-fluid d-block mx-auto"
									src="resources/assets/img/portfolio/news.jpg" alt="..." />
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
								<ul class="list-inline">
								</ul>
								<button class="btn btn-primary btn-xl text-uppercase"
									data-bs-dismiss="modal" type="button">
									<i class="fas fa-times me-1"></i> Close Service
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio item 3 modal popup-->
	<div class="portfolio-modal modal fade" id="portfolioModal3"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-bs-dismiss="modal">
					<img src="resources/assets/img/close-icon.svg" alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project details-->
								<h2 class="text-uppercase">프로차트</h2>
								<p class="item-intro text-muted">Pro Chart</p>
								<img class="img-fluid d-block mx-auto"
									src="resources/assets/img/portfolio/prochart.jpg" alt="..." />
								<p>Use this area to describe your project. Lorem ipsum dolor
									sit amet, consectetur adipisicing elit. Est blanditiis dolorem
									culpa incidunt minus dignissimos deserunt repellat aperiam
									quasi sunt officia expedita beatae cupiditate, maiores
									repudiandae, nostrum, reiciendis facere nemo!</p>
								<ul class="list-inline">
								</ul>
								<button class="btn btn-primary btn-xl text-uppercase"
									data-bs-dismiss="modal" type="button">
									<i class="fas fa-times me-1"></i> Close Service
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio item 4 modal popup-->
	<div class="portfolio-modal modal fade" id="portfolioModal4"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-bs-dismiss="modal">
					<img src="resources/assets/img/close-icon.svg" alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project details-->
								<h2 class="text-uppercase">커뮤니티</h2>
								<p class="item-intro text-muted">Community</p>
								<img class="img-fluid d-block mx-auto"
									src="resources/assets/img/portfolio/community.jpg" alt="..." />
								<p>
									이미지와 게시판이 결합된 커뮤니티 서비스입니다.<br> 투자자 간 주식, 비트코인 등 사회 각 분야에
									대한 정보와 의견을 공유할 수 있습니다.<br> 현재 CKEditor5, 파일 첨부, 좋아요, 싫어요 등
									다양한 기능을 제공하고 있으며, <br>자유로운 소통의 장으로 자리매김하고 있습니다.
								</p>
								<ul class="list-inline">
								</ul>
								<button class="btn btn-primary btn-xl text-uppercase"
									data-bs-dismiss="modal" type="button">
									<i class="fas fa-times me-1"></i> Close Service
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio item 5 modal popup-->
	<div class="portfolio-modal modal fade" id="portfolioModal5"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-bs-dismiss="modal">
					<img src="resources/assets/img/close-icon.svg" alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project details-->
								<h2 class="text-uppercase">충전소</h2>
								<p class="item-intro text-muted">Cash Shop</p>
								<img class="img-fluid d-block mx-auto"
									src="resources/assets/img/portfolio/cashshop.jpg" alt="..." />
								<p>
									Be fearful when others are greedy, Be greedy when others are
									fearful. <br> - Warren Edward Buffett <br> 여러분의 더 큰 투자 경험을 위해,
									가상 투자금 충전 서비스를 제공하고 있습니다. <br> 당신의 수익률을 위해 투자하세요!

								</p>
								<ul class="list-inline">
								</ul>
								<button class="btn btn-primary btn-xl text-uppercase"
									data-bs-dismiss="modal" type="button">
									<i class="fas fa-times me-1"></i> Close Service
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Portfolio item 6 modal popup-->
	<div class="portfolio-modal modal fade" id="portfolioModal6"
		tabindex="-1" role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="close-modal" data-bs-dismiss="modal">
					<img src="resources/assets/img/close-icon.svg" alt="Close modal" />
				</div>
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="modal-body">
								<!-- Project details-->
								<h2 class="text-uppercase">랭킹</h2>
								<p class="item-intro text-muted">Ranking</p>
								<img class="img-fluid d-block mx-auto"
									src="resources/assets/img/portfolio/ranking.jpg" alt="..." />
								<p>희망이 있는 곳에는 반드시 시련이 있는 법이다.<br>
								-무라카미 하루키<br>
								4 종류의 수익률 랭킹에서 당신의 실력을 증명하고, 상위권을 쟁취하세요!<br>
								
								</p>
								<ul class="list-inline">
								</ul>
								<button class="btn btn-primary btn-xl text-uppercase"
									data-bs-dismiss="modal" type="button">
									<i class="fas fa-times me-1"></i> Close Service
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
<%@include file="../main/footer.jsp"%>
</html>
