<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script src="${pageContext.request.contextPath}/resources/js/data.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/newsList.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/main.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<meta charset="UTF-8">

</head>
<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
	<div id="wrapper">
	
		<jsp:include page="../sub/pop.jsp"></jsp:include>
		<!-- 위젯 부분   -->
		<div id="container">
			<!-- 비디오 버젼 -->
			<!-- 			<video id="videobcg" width="100%" height="auto" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0"> -->
			<%-- 		        <source src="<%=request.getContextPath()%>/resources/assets/mainvideo.mp4" type="video/mp4"> --%>
			<!-- 		        Sorry, your browser does not support HTML5 video. -->
			<!-- 		    </video> -->

			<div id="new">
				<!-- 뉴스 부분   -->
				<div class="headLine">
					<marquee class="scroll" onmouseover="this.stop();"
						onmouseout="this.start();"> </marquee>
				</div>
			</div>
			<br>

			<table style="width: 100%">
				<tr>
					<!-- 차트부분   -->
					<td id="c1">

						<div id="chart_div"></div>
					</td>
					<td><span>&nbsp;&nbsp;</span></td>
					<!-- 테이블부분   -->
					<td id="c2">
						<div id="table">
							<div id="cointable_div"></div>
						</div>
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td colspan="2">
						<button id="cointable_btn"
							onclick="location.href = '<%=request.getContextPath()%>/investmentpage';">거래소바로가기</button>
					</td>
				</tr>
			</table>
			<br>
			<!-- 지수 차트부분   -->
			<table style="width: 100%">
				<tr style="border: 2px solid; border-color: #E3C8F8;">
					<td><div class="ex1">
							<a>BTS MajerCoin지수</a>
						</div></td>
					<td><div class="ex1">
							<a>BTS AltCoin지수</a>
						</div></td>
				</tr>
				<tr>
					<td id="c1_1"><iframe src="btmichart" width="100%"
							height="550px" class="chat"
							style="border: 1px solid #E3C8F8 !important;"></iframe></td>

					<td id="c1_2"><iframe src="btaichart" width="100%"
							height="550px" class="chat"
							style="border: 1px solid #E3C8F8 !important;"></iframe></td>
				</tr>
			</table>
			<br>
			<!-- 인스타 커뮤니티 인기글 부분   -->
			<table class="insta1" style="width: 100%">
				<tr style="border: 2px solid; border-color: #E3C8F8;">
					<td colspan="1"><div class="ex1">
							<a>커뮤니티 인기글</a>
						</div></td>

				</tr>
				<tr style="border: 2px solid; border-color: #E3C8F8;">
					<td>
						<table class="insta" style="width: 100%">
							<tr>
								<td id="c2_1">
									<article>
										<header>
											<div class="profile-of-article">
												<img class="img-profile pic"
													src="resources/assets/img/user.png" alt=".."> <span
													class="userID main-id point-span">${maincommuList0.cwriter }</span>
											</div>
										</header>
										<!-- 게시글 내용 영역 -->
										<div class="main-image">
											<%-- <div class="subject">${maincommuList0.csubject }</div> --%>
											<div class="content">${maincommuList0.ccontent }
												<c:forTokens var="fileName"
													items="${maincommuList0.filepath}" delims=","
													varStatus="st">
													<a download="${fileName}"
														href="${pageContext.request.contextPath}/resources/uploadFiles/${maincommuList0.filepath}">${fileName}</a>
													<c:if test="${!st.last }">

													</c:if>
													<br>
												</c:forTokens>
											</div>
										</div>
										<!-- 게시글 추천, 비추천, 댓글 작성 -->
										<div class="icons-react">
											<div class="icons-left">
												<img class="thumbsup"
													src="resources/assets/img/thumbsup.png" alt="추천"> <img
													class="thumbsup-liked"
													src="resources/assets/img/thumbs-up.png" alt="추천">
												${maincommuList0.likecnt }
											</div>
											<div class="icons-middle">
												<img class="thumbsdown"
													src="resources/assets/img/thumbsdown.png" alt="비추천">
												<img class="thumbsdown-disliked"
													src="resources/assets/img/thumbs-down.png" alt="비추천">
												${maincommuList0.dislikecnt }
											</div>

										</div>
										<!-- 추천 수 -->
										<div class="reaction">
											<div class="comment-section">
												<ul class="comments">
												</ul>
												<div class="time-log">
													<span>${maincommuList0.cdate }</span>
												</div>
											</div>
										</div>
									</article>
								</td>

								<td id="c2_2">
									<article>
										<header>
											<div class="profile-of-article">
												<img class="img-profile pic"
													src="resources/assets/img/user.png" alt=".."> <span
													class="userID main-id point-span">${maincommuList0.cwriter }</span>
											</div>
										</header>
										<!-- 게시글 내용 영역 -->
										<div class="main-image">
											<%-- 	<div class="subject">${maincommuList1.csubject }</div> --%>
											<div class="content">${maincommuList1.ccontent }
												<c:forTokens var="fileName"
													items="${maincommuList1.filepath}" delims=","
													varStatus="st">
													<a download="${fileName}"
														href="${pageContext.request.contextPath}/resources/uploadFiles/${maincommuList1.filepath}">${fileName}</a>
													<c:if test="${!st.last }">

													</c:if>
													<br>
												</c:forTokens>
											</div>
										</div>
										<!-- 게시글 추천, 비추천, 댓글 작성 -->
										<div class="icons-react">
											<div class="icons-left">
												<img class="thumbsup"
													src="resources/assets/img/thumbsup.png" alt="추천"> <img
													class="thumbsup-liked"
													src="resources/assets/img/thumbs-up.png" alt="추천">
												${maincommuList1.likecnt }
											</div>
											<div class="icons-middle">
												<img class="thumbsdown"
													src="resources/assets/img/thumbsdown.png" alt="비추천">
												<img class="thumbsdown-disliked"
													src="resources/assets/img/thumbs-down.png" alt="비추천">
												${maincommuList1.dislikecnt }
											</div>

										</div>
										<!-- 추천 수 -->
										<div class="reaction">
											<div class="comment-section">
												<ul class="comments">
												</ul>
												<div class="time-log">
													<span>${maincommuList1.cdate }</span>
												</div>
											</div>
										</div>
									</article>
								</td>
							</tr>
							<tr>
								<td id="c3_1">
									<article>
										<header>
											<div class="profile-of-article">
												<img class="img-profile pic"
													src="resources/assets/img/user.png" alt=".."> <span
													class="userID main-id point-span">${maincommuList2.cwriter }</span>
											</div>

										</header>
										<!-- 게시글 내용 영역 -->
										<div class="main-image">
											<%-- <div class="subject">${maincommuList2.csubject }</div> --%>
											<div class="content">${maincommuList2.ccontent }
												<c:forTokens var="fileName"
													items="${maincommuList2.filepath}" delims=","
													varStatus="st">
													<a download="${fileName}"
														href="${pageContext.request.contextPath}/resources/uploadFiles/${maincommuList2.filepath}">${fileName}</a>
													<c:if test="${!st.last }">

													</c:if>
													<br>
												</c:forTokens>
											</div>
										</div>
										<!-- 게시글 추천, 비추천, 댓글 작성 -->
										<div class="icons-react">
											<div class="icons-left">
												<img class="thumbsup"
													src="resources/assets/img/thumbsup.png" alt="추천"> <img
													class="thumbsup-liked"
													src="resources/assets/img/thumbs-up.png" alt="추천">
												${maincommuList2.likecnt }
											</div>
											<div class="icons-middle">
												<img class="thumbsdown"
													src="resources/assets/img/thumbsdown.png" alt="비추천">
												<img class="thumbsdown-disliked"
													src="resources/assets/img/thumbs-down.png" alt="비추천">
												${maincommuList2.dislikecnt }
											</div>

										</div>
										<!-- 추천 수 -->
										<div class="reaction">
											<div class="comment-section">
												<ul class="comments">
												</ul>
												<div class="time-log">
													<span>${maincommuList2.cdate }</span>
												</div>
											</div>
										</div>
									</article>
								</td>

								<td id="c3_2">
									<article>
										<header>
											<div class="profile-of-article">
												<img class="img-profile pic"
													src="resources/assets/img/user.png" alt=".."> <span
													class="userID main-id point-span">${maincommuList3.cwriter }</span>
											</div>


										</header>
										<!-- 게시글 내용 영역 -->
										<div class="main-image">
											<%-- 	<div class="subject">${maincommuList3.csubject }</div> --%>
											<div class="content">${maincommuList3.ccontent }
												<c:forTokens var="fileName"
													items="${maincommuList3.filepath}" delims=","
													varStatus="st">
													<a download="${fileName}"
														href="${pageContext.request.contextPath}/resources/uploadFiles/${maincommuList3.filepath}">${fileName}</a>
													<c:if test="${!st.last }">

													</c:if>
													<br>
												</c:forTokens>
											</div>
										</div>
										<!-- 게시글 추천, 비추천, 댓글 작성 -->
										<div class="icons-react">
											<div class="icons-left">
												<img class="thumbsup"
													src="resources/assets/img/thumbsup.png" alt="추천"> <img
													class="thumbsup-liked"
													src="resources/assets/img/thumbs-up.png" alt="추천">
												${maincommuList3.likecnt }
											</div>
											<div class="icons-middle">
												<img class="thumbsdown"
													src="resources/assets/img/thumbsdown.png" alt="비추천">
												<img class="thumbsdown-disliked"
													src="resources/assets/img/thumbs-down.png" alt="비추천">
												${maincommuList3.dislikecnt }
											</div>

										</div>
										<!-- 추천 수 -->
										<div class="reaction">
											<div class="comment-section">
												<ul class="comments">
												</ul>
												<div class="time-log">
													<span>${maincommuList3.cdate }</span>
												</div>
											</div>
										</div>
									</article>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>


		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>