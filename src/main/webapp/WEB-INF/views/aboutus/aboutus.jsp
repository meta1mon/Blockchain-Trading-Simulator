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
						href="${pageContext.request.contextPath}/nlist?news_keyword=">??????</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/clist">????????????</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/insta">????????????</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/investmentpage">????????????</a></li>
					<li class="nav-item"><a class="nav-link"
						href="javascript:void(window.open('<%=request.getContextPath()%>/prochart', '_blank','width=1300px, height=800px'))">????????????</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/cashShop">?????????</a></li>
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/rankDaily">??????</a></li>
					<c:choose>
						<c:when test="${loginMember == null }">
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/signup" id="signup">????????????</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/login" id="login">?????????</a></li>
						</c:when>
						<c:when test="${loginMember != null }">
							<li class="nav-item"><a class="nav-link"
								onclick="moveMypagePost()"  style="cursor:pointer">???????????????</a></li>
							<li class="nav-item"><a class="nav-link"
								href="<%=request.getContextPath()%>/logout" id="logout">????????????</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<div class="masthead-subheading">????????? ????????? ????????? ????????????.</div>
			<div class="masthead-heading">
				Bringing Blockchain<br>into the World
			</div>
			<a class="btn btn-primary btn-xl text-uppercase" href="#services">EXPLORE</a>
		</div>
	</header>
	<!-- ????????? ??????-->
	<section class="page-section" id="services">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">????????? ??????</h2>
			</div>
			<div class="row text-center">
				<div class="col-md-4">
					<span class="fa-stack fa-4x"> <img
						src="resources/assets/img/bts_logo_reversal.svg"
						style="height: 2cm; position: relative; right: 10px;" alt="..." />
					</span>
					<p class="my-3" style="font-size: 18px;">
						BTS??? ???????????? ????????? ???????????? ????????? ???????????? ???????????? ?????? ??????????????????.<br> ??????????????? ???????????????
						??????????????? ???????????? ?????? ?????? ????????? ????????? ???????????????.<br> ????????? ???????????? ????????? ??????????????? ?????? ??????
						????????? ??????????????????.<br> ????????? ??????????????? ????????? ????????? ????????? ?????? ???????????????, ???????????? ????????????
						???????????? ???????????? ???????????????.<br>

					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- ????????? ??????-->
	<section class="page-section bg-light" id="portfolio">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">????????? ??????</h2>
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
							<div class="portfolio-caption-heading">????????????</div>
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
							<div class="portfolio-caption-heading">??????</div>
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
							<div class="portfolio-caption-heading">????????????</div>
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
							<div class="portfolio-caption-heading">????????????</div>
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
							<div class="portfolio-caption-heading">?????????</div>
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
							<div class="portfolio-caption-heading">??????</div>
							<div class="portfolio-caption-subheading text-muted">Ranking</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- ??? ??????-->
	<section class="page-section bg-light" id="team"
		style="background-color: white !important;">
		<div class="container">
			<div class="text-center">
				<h2 class="section-heading text-uppercase">????????? ??????</h2>
				<h3>ARMY</h3>
				<h3 class="section-subheading text-muted">Aces Recruited Member
					of Year</h3>
			</div>
			<div class="row">
				<div class="col-lg-4">
					<div class="team-member">
						<img class="mx-auto rounded-circle"
							src="resources/assets/img/profile/ksm.jpg" alt="..." />
						<h4>?????????</h4>
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
						<h4>?????????</h4>
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
						<h4>?????????</h4>
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
						<h4>?????????</h4>
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
						<h4>?????????</h4>
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
	<!-- ?????? ?????? -->
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
				<h2 class="section-heading text-uppercase">????????? & ?????????</h2>
				<h3 class="section-subheading text-muted"
					style="color: azure; font-size: larger;">
					????????? ??????????????? <a class="contact_kakao"
						href="http://pf.kakao.com/_ZhLns/chat" target="_blank">????????????
						??????????????????.</a> ?????? ???????????? ???????????????<br> ????????? ?????? ????????? <a class="contact_comm"
						href="${pageContext.request.contextPath}/insta">???????????? ???????????????
						??????????????????.</a>
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
								<h2 class="text-uppercase">????????????</h2>
								<p class="item-intro text-muted">Mock Investment</p>
								<img class="img-fluid d-block mx-auto"
									src="resources/assets/img/portfolio/investment.jpg" alt="..." />
								<p>Don't hold the stock for 10 minutes unless you're looking at 10 years or more. <br>
								- Warren Buffett <br>
								??????(Bithumb) API??? ??????, ????????? ?????? ???????????? ????????? ???????????????.<br>
								???????????? ???????????? ?????? ??????????????? ?????? ??????????????? ???????????? <br>
								???????????? ???????????? ????????? ????????? ????????????.<br>
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
								<h2 class="text-uppercase">??????</h2>
								<p class="item-intro text-muted">NEWS</p>
								<img class="img-fluid d-block mx-auto"
									src="resources/assets/img/portfolio/news.jpg" alt="..." />
								<p>Beware of false knowledge; it is more dangerous than ignorance.<br>
								- George Bernard Shaw<br>
								??????????????? ????????? ?????? ?????? ???????????? ??????????????? ????????? ??? ?????? ??????????????????.<br>
								???????????????(<a href="http://www.cryptohub.or.kr" style="color:black;">www.cryptohub.or.kr</a>)??? ?????? API??? ??????????????????, <br>
								??????1?????? ?????? ????????? ????????? ??? ????????????.</p>
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
								<h2 class="text-uppercase">????????????</h2>
								<p class="item-intro text-muted">Pro Chart</p>
								<img class="img-fluid d-block mx-auto"
									src="resources/assets/img/portfolio/prochart.jpg" alt="..." />
								<p>Buy in fear, sell in greed<br>
								- Warren Buffett<br>
								???????????? ???????????? ?????? ???????????? ???????????? ??????????????? ?????? ??? ??? ?????? ?????????????????????.<br>
								???????????????(<a href="http://kr.tradingview.com/chart" style="color:black;">kr.tradingview.com/chart</a>)??? API??? ??????????????????, <br>
								????????????, Bollinger Bands ??? ????????? ?????? ??? ??? ?????? ???????????? ??????????????????.</p>
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
								<h2 class="text-uppercase">????????????</h2>
								<p class="item-intro text-muted">Community</p>
								<img class="img-fluid d-block mx-auto"
									src="resources/assets/img/portfolio/community.jpg" alt="..." />
								<p>???????????? ????????????<br>
									???????????? ???????????? ????????? ???????????? ??????????????????.<br> ????????? ??? ??????, ???????????? ??? ?????? ??? ?????????
									?????? ????????? ????????? ????????? ??? ????????????.<br> ?????? CKEditor5, ?????? ??????, ?????????, ????????? ???
									????????? ????????? ???????????? ?????????, <br>???????????? ????????? ????????? ?????????????????? ????????????.
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
								<h2 class="text-uppercase">?????????</h2>
								<p class="item-intro text-muted">Cash Shop</p>
								<img class="img-fluid d-block mx-auto"
									src="resources/assets/img/portfolio/cashshop.jpg" alt="..." />
								<p>
									????????????<br>
									????????? ???????????? ??? ????????? ????????? ??? ????????????<br>
									???????????? ??? ??? ????????? ??? ?????? ????????? ?????? ?????? ????????? ?????? ?????????<br>
									????????? ?????? ???????????????!
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
								<h2 class="text-uppercase">??????</h2>
								<p class="item-intro text-muted">Ranking</p>
								<img class="img-fluid d-block mx-auto"
									src="resources/assets/img/portfolio/ranking.jpg" alt="..." />
								<p>????????? ?????? ????????? ????????? ????????? ?????? ?????????.<br>
								-???????????? ?????????<br>
								4 ????????? ????????? ???????????? ????????? ????????? ????????????, ???????????? ???????????????!<br>
								
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
