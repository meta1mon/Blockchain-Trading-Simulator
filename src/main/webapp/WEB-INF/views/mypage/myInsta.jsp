<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/header.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/myNav.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/myInsta.css"	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/mikrokosmos.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
</head>
<body>
	<div id="wrapper">
		<jsp:include page="../main/header.jsp"></jsp:include>
		<jsp:include page="myNav.jsp"></jsp:include>
		<main>
			<div class="feeds">
				<article>
					<header>
						<div class="profile-of-article">
							<img class="img-profile pic" src="${pageContext.request.contextPath}/resources/assets/img/user.png"
								alt=".."> <span class="userID main-id point-span">${vo.cwriter }</span>
						</div>
						<div class="dropdown" style="float: right;">
							<div class="icon-react icon-more"
								style="background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);">
								<div class="dropdown-content ddcontent" style="left: 0;">
									<p onclick="report('${community.cno}')" class="report">신고</p>
									<p class="update"
										onclick="checkUpdate('${community.cno }', '${community.cwriter }')">수정</p>
									<p class="delete"
										onclick="checkDelete('${community.cno }', '${community.cwriter }')">삭제</p>
								</div>
							</div>
						</div>
					</header>
					<!-- 게시글 내용 영역 -->
					<div class="main-image">
						<div class="content">${community.ccontent }
							<a download="${community.filepath}"
								href="${pageContext.request.contextPath}/resources/uploadFiles/${community.filepath}">${community.filepath}</a>
							<br>
						</div>
					</div>
					<!-- 게시글 추천, 비추천, 댓글 작성 -->
					<div class="icons-react">
						<div class="icons-left"
							onclick="clike('${status.index}', '${community.cno }')">
							<img class="thumbsup-liked"
								src="${pageContext.request.contextPath}/resources/assets/img/thumbs-up.png" alt="추천"> <img
								class="thumbsup" src="${pageContext.request.contextPath}/resources/assets/img/thumbsup.png"
								alt="추천"> <input type="text" class="nowLike" readonly
								value="${community.likecnt }">
						</div>
						<div class="icons-middle"
							onclick="dislike('${status.index}', '${community.cno }')">
							<img class="thumbsdown-disliked"
								src="${pageContext.request.contextPath}/resources/assets/img/thumbs-down.png" alt="비추천"> <img
								class="thumbsdown" src="${pageContext.request.contextPath}/resources/assets/img/thumbsdown.png"
								alt="비추천"> <input type="text" class="nowDislike" readonly
								value="${community.dislikecnt }">
						</div>
						<div class="icons-right">
							<input type="hidden" class="hiddenCno" value="${community.cno }">
							<img class="reply" onclick="reply(${status.index})"
								id="reply_popup_open"
								src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png"
								alt="댓글"><span class="liveReplyCnt">${community.replycnt }</span>
						</div>
					</div>
					<!-- 추천 수 -->
					<div class="reaction">
						<div class="comment-section">
							<ul class="comments">
							</ul>
							<div class="time-log">
								<span>${community.cdate }</span>
							</div>
						</div>
					</div>
					<!-- 모달 밖 댓글 작성 영역 -->
					<div>
						<div class="hl"></div>
						<c:if test="${loginMember != null }">
							<div class="comment">
								<input type="hidden" name="cno" class="replyInsertCno1"
									value="${community.cno }"> <input type="text"
									class="input-comment replyContent1" name="rcontent"
									maxlength="4000" placeholder="댓글 달기...">
								<button type="button" class="submit-comment"
									onclick="replyInsert1(${status.index})">등록</button>
							</div>
						</c:if>
					</div>
					<c:if test="${loginMember == null }">
						<div class="comment">
							<input class="input-comment" type="text" readonly
								placeholder="댓글을 작성하려면 로그인이 필요합니다.">
							<button type="button" class="submit-comment"
								onclick="location.href='login'">이동</button>
						</div>
					</c:if>

				</article>
			</div>
		</main>
		<jsp:include page="../main/footer.jsp"></jsp:include> 
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/myCommunity.js"></script>

</body>
</html>