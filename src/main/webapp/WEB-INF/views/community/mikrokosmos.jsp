<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>BTS</title>
<meta charset="UTF-8">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/footer.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="${pageContext.request.contextPath}/resources/css/mikrokosmos.css"
	rel="stylesheet" type="text/css" />
<style>
.parent>div {
	text-align: center;
	background-color: lightpurple;
}

#modalWrapper {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.3);
	z-index: 10000000000000000000000;
}

#modal {
	border: 1px solid black;
	border-radius: 5px;
	background: white;
	width: 450px;
	height: 450px;
	position: absolute;
	top: calc(50% - 255px);
	left: calc(50% - 225px);
}
</style>
<script>

$(function() {

	// 검색 부분
			$('form[name=listForm]').on('submit',	function(e) {
						if ($('input[name=keyword]').val() == null
								|| $('input[name=keyword]').val() == "") {
							alert("검색어를 입력해 주세요");
							e.preventDefault();
						} else {
							return true;
						}
					});
		});

		// 시작점 1번부터라는 뜻
		var instaStart = 1;
		// 추가로 4개씩 더 불러옴
		const instaPlus = 3;
		var moreHtml = "";
		function moreInsta() {
			instaStart += instaPlus + 1;
			$.ajax({
						url : '${pageContext.request.contextPath}/moreInsta',
						type : "get",
						data : {
							"start" : instaStart,
							"plus" : instaPlus
						},
						datatype : "json",
						contentType : "charset=UTF-8",
						success : function(data) {
							var json = JSON.parse(data);
							if (json.length > 0) {
								$.each(json,function(idx, insta) {
									moreHtml += "<article> <header> <div class='profile-of-article'> <img class='img-profile pic' src='resources/assets/img/user.png'> <span class='userID main-id point-span'>" + insta.cwriter +"</span> </div> "
											+"<div class='dropdown' style='float: right;'> <div class='icon-react icon-more' style='background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);'>"
											+ "<div class='dropdown-content' style='left: 0;'> <p onclick='report()' class='report' id='popup_open_btn'>신고</p> <c:if test='${loginMember == writerEmail }'> <p onclick='checkUpdate('insta.cno', 'insta.cwriter')' class='update'>수정</a> <p onclick='checkDelete('insta.cno', 'insta.cwriter')' class='delete'>삭제</a> </c:if>"
											
											+"</div> </div> </div> </header> <div class='main-image'> <div class='subject'>" + insta.csubject + "</div> <div class='content'>" + insta.ccontent + "</div> <div class='description'>"
											+"<p> <span class='at-tag'>@bts @wkorea @gucci</span> </p> </div> </div> <div class='icons-react'> <div class='icons-left'> <img class='thumbsup' onclick='clike()' src='resources/assets/img/thumbsup.png'>"
											+"<img class='thumbsup-liked' onclick='clike()' src='resources/assets/img/thumbs-up.png'> </div> <div class='icons-middle'> <img class='thumbsdown' onclick='dislike()' src='resources/assets/img/thumbsdown.png'>"
											+"<img class='thumbsdown-disliked' onclick='dislike()' src='resources/assets/img/thumbs-down.png'> </div> <div class='icons-right'> <input type=\"hidden\" class=\"hiddenCno\" value=\"insta.cno\">"
											+"<img class=\"reply\" onclick=\"reply(idx)\" id='reply_popup_open' src='https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png'>"
											+"</div> </div> <div class='reaction'> <div class='liked-people'> <p> <span class='point-span'>"+insta.likecnt +"</span> 명이 추천합니다</p> </div> <div class='comment-section'> <ul class='comments'> </ul>"
											+"<div class='time-log'> <span>"+ insta.cdate +"</span> </div> </div> </div> <div> <div class='hl'></div> <c:if test='${loginMember != null }'> <form> <div class='comment'> <input type='hidden' name='cno' value="+ insta.cno +">"
											+"<input type='text' class='input-comment' name='rcontent' maxlength='4000' placeholder='댓글 달기...''> <button type='submit' class='submit-comment' onclick=\"replyInsert(idx)\">게시</button>"
											+"</div> </form> </c:if> </div> <c:if test='${loginMember == null }'> <div class='comment'> <input class='input-comment' type='text' placeholder='댓글을 작성하려면 로그인이 필요합니다.'>"
											+"<button type='submit' class='submit-comment'>게시</button> </div> </c:if> </article>";
										
								<%-- 		"<br><div class='parent'><div><img	src='<%=request.getContextPath()%>/resources/assets/img/bts_logo.png'"
									+ "width='25px' height='25px'>" + insta.cwriter + "<span	style='color: red;'>:== 닉네임</span></div>"
									+ "<div>" + insta.ccontentr +"<span style='color: red;''>:== 내용</span></div>"
									+ "<div><img class='img_like' src='resources/assets/img/like.png' width='25px' height='25px' onclick='clike()'>"
									+ "<img	class='img_dislike' src='resources/assets/img/dislike.png' width='25px' height='25px' onclick='dislike()'>"
									+ "<button>댓글보기(아이콘으로 넣기)</button></div>"
									+ "<div>좋아요 수" + insta.likecnt +"&nbsp;&nbsp;&nbsp;&nbsp; 싫어요 수 " + insta.dislikecnt +"&nbsp;&nbsp;&nbsp;&nbsp; 댓글 수" + insta.replycnt +"</div>"
									+ "<div><textarea'placeholder='댓글을 입력하여 대화를 시작하세요!'></textarea></div>"
									+ "<div>" + insta.cdate +"</div></div><hr>"; --%>
								});
							} else {
								moreHtml += "<br><div><div style='text-align:center; margin-bottom:20px;'>더이상 불러올 게시글이 없습니다</div></div>";
							}
							$("#moreDiv").html(moreHtml);
							
						}
					});
		}
		
		// 게시글 작성 페이지로 넘어감
		function showInsertForm() {
				      if(${loginMember == null}) {
				    	alert("게시글을 작성하려면 로그인이 필요합니다.");
				      } else {
				    	  window.location='cWriteForm';
				      }
		}
		
		// 게시글 신고 : 로그인 여부 체크
		function report(nowCno) {
			cno = nowCno;
			console.log(cno);
		
			if(${loginMember == null }) {
				alert("로그인이 필요합니다")
			} else {
				$("#creportCno").val(cno);
				modalFn('modal_report');
				
			}
		}
		
		// 댓글 신고 : 로그인 여부 체크
		function rreport(nowRno) {
			rno = nowRno;
			console.log(rno);
			if(${loginMember == null}) {
				alert("로그인이 필요합니다")
			} else {
				$("#rreportRno").val(rno);
				modalReportReplyFn('modal_report_reply');
			}
		}
		
// 추천
function clike(likeCno) {
	console.log("clike들어오나!!!!!!");
   if(${loginMember == null}) {
      alert("로그인이 필요합니다");         
   } else {
      $.ajax({
         url : "${pageContext.request.contextPath}/clike",
         type : "post",
         data : {
            "cno" : likeCno
         },
         success : function(data) {
        	 alert("좋아요 제대로 들어갔는데, 컨트롤러에서 print.out을 안해서 좋아요 됐을 때 안됐을 때 구분이 안됨! 나중에 할거임!");
            window.location.reload();
         }
      });
      let commentLike = document.querySelectorAll('.icons-left');
      commentLike.forEach(function(event) {
          event.addEventListener('click', function() {
              var likeBtn = this.querySelector('.thumbsup');
              var likedBtn = this.querySelector('.thumbsup-liked');

              if (likeBtn.style.display === 'none') {
                  likeBtn.style.display = 'inline-block';
                  likedBtn.style.display = 'none';
              } else {
                  likeBtn.style.display = 'none';
                  likedBtn.style.display = 'inline-block';
              }
          })
      })
   }
}
 
// 비추천
function dislike(dislikeCno) {
   if(${loginMember == null}) {
      alert("로그인이 필요합니다");         
   } else {
      $.ajax({
         url : "${pageContext.request.contextPath}/cdislike",
         type : "post",
         data : {
            cno : dislikeCno
         },
         datatype : "json",
         success : function(data) {
        	 alert("싫어요 제대로 들어갔는데, 컨트롤러에서 print.out을 안해서 좋아요 됐을 때 안됐을 때 구분이 안됨! 나중에 할거임!");
            window.location.reload();
         }
      });
      let commentDislike = document.querySelectorAll('.icons-middle');
      commentDislike.forEach(function(event) {
      	event.addEventListener('click', function() {
      		var likeBtn = this.querySelector('.thumbsdown');
      		var likedBtn = this.querySelector('.thumbsdown-disliked');
      		
      		if (likeBtn.style.display === 'none') {
      			likeBtn.style.display = 'inline-block';
      			likedBtn.style.display = 'none';
      		} else {
      			likeBtn.style.display = 'none';
      			likedBtn.style.display = 'inline-block';
      		}
      	})
      })
   }
}


//댓글 아무것도 입력 안 했을 때
$(function(){
       // 댓글 Insert Script
       $('#replyForm').on('submit', function(event){
          if($('#reply_contents').val() == "" || $('#reply_contents').val() == null){
             alert("내용을 입력해주세요.");
             event.preventDefault();
          } else {
             $('#comments').val($('#reply_contents').val());
             return true;
          }
       });
})
</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div id="wrapper">
		<!-- navigation -->
		<nav>
			<div class="nav-container">
				<div class="nav-1"></div>
				<form action="clist" name="listForm" method="get"
					style="width: 340px;">
					<select id="searchType" class="searchType" name="searchType">
						<option value="1">글제목</option>
						<option value="2">글내용</option>
						<option value="3">작성자</option>
					</select> <input id="searchInput" type="search" class="input-search"
						name="keyword" placeholder="검색">
					<button type=submit id="btnsearch" style="display: none;"></button>
				</form>
				<div class="nav-2">
					<img src="resources/assets/img/writing.png"
						onclick="showInsertForm()" title="글 작성" alt="글쓰기"
						style="cursor: pointer;"> <img
						src="resources/assets/img/megaphone.png"
						onclick="location.href='clist'" title="공지사항" alt="공지사항"
						style="cursor: pointer;">
				</div>
			</div>
		</nav>

		<!-- main -->
		<main>
			<div class="feeds">
				<!-- article -->
				<c:forEach items="${commuList }" var="vo" varStatus="status">
					<article>
						<header>
							<div class="profile-of-article">
								<img class="img-profile pic" src="resources/assets/img/user.png"
									alt=".."> <span class="userID main-id point-span">${vo.cwriter }</span>
							</div>
							<div class="dropdown" style="float: right;">
								<div class="icon-react icon-more"
									style="background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);">
									<div class="dropdown-content" style="left: 0;">
										<p onclick="report('${vo.cno}')" class="report">신고</p>
										<p class="update"
											onclick="checkUpdate('${vo.cno }', '${vo.cwriter }')">수정</p>
										<p class="delete"
											onclick="checkDelete('${vo.cno }', '${vo.cwriter }')">삭제</p>
									</div>
								</div>
							</div>
						</header>
						<!-- 게시글 내용 영역 -->
						<div class="main-image">
							<div class="subject">${vo.csubject }</div>
							<div class="content">${vo.ccontent }
								<c:forTokens var="fileName" items="${vo.filepath}" delims=","
									varStatus="st">
									<a download="${fileName}"
										href="${pageContext.request.contextPath}/resources/uploadFiles/${vo.filepath}">${fileName}</a>
									<c:if test="${!st.last }">
                                    /
                                </c:if>
									<br>
								</c:forTokens>
							</div>
						</div>
						<!-- 게시글 추천, 비추천, 댓글 작성 -->
						<div class="icons-react">
							<div class="icons-left">
								<img class="thumbsup" onclick="clike('${vo.cno }')"
									src="resources/assets/img/thumbsup.png" alt="추천"> <img
									class="thumbsup-liked" src="resources/assets/img/thumbs-up.png"
									alt="추천"> ${vo.likecnt }
							</div>
							<div class="icons-middle">
								<img class="thumbsdown" onclick="dislike('${vo.cno }')"
									src="resources/assets/img/thumbsdown.png" alt="비추천"> <img
									class="thumbsdown-disliked"
									src="resources/assets/img/thumbs-down.png" alt="비추천">
								${vo.dislikecnt }
							</div>
							<div class="icons-right">
								<input type="hidden" class="hiddenCno" value="${vo.cno }">
								<img class="reply" onclick="reply(${status.index})"
									id="reply_popup_open"
									src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png"
									alt="댓글"> ${vo.replycnt }
							</div>
						</div>
						<!-- 추천 수 -->
						<div class="reaction">
							<div class="comment-section">
								<ul class="comments">
								</ul>
								<div class="time-log">
									<span>${vo.cdate }</span>
								</div>
							</div>
						</div>
						<!-- 모달 밖 댓글 작성 영역 -->
						<div>
							<div class="hl"></div>
							<c:if test="${loginMember != null }">
								<div class="comment">
									<input type="hidden" name="cno" class="replyInsertCno1"
										value="${vo.cno }"> <input type="text"
										class="input-comment replyInsert1" name="rcontent"
										maxlength="4000" placeholder="댓글 달기...">
									<button type="submit" class="submit-comment"
										onclick="replyInsert1(${status.index})">등록</button>
								</div>
							</c:if>
						</div>
						<c:if test="${loginMember == null }">
							<div class="comment">
								<input class="input-comment" type="text"
									placeholder="댓글을 작성하려면 로그인이 필요합니다.">
								<button type="submit" class="submit-comment">게시</button>
							</div>
						</c:if>

					</article>
				</c:forEach>

				<div id="moreDiv"></div>
				<button type="button" class="moreFeed" onclick="moreInsta()">더보기</button>
			</div>
			<!-- main-right -->
			<div class="main-right">
				<!-- 누적 랭킹 section -->
				<div class="section-story">
					<div class="menu-title">
						<span class="sub-title">누적 랭킹</span> <span class="find-more"
							onclick="location.href='rankAccumulative'">모두 보기</span>
					</div>
					<ul class="story-list">
						<li>
							<div class="gradient-wrap">
								<img class="img-profile story"
									src="resources/assets/img/gold_medal.png" alt="..">
							</div>
							<div class="profile-text">
								<span class="userID point-span">${first.nickname }</span> <span
									class="sub-span">1등</span>
							</div>
						</li>
						<li>
							<div class="gradient-wrap">
								<img class="img-profile story"
									src="resources/assets/img/silver_medal.png" alt="..">
							</div>
							<div class="profile-text">
								<span class="userID point-span">${second.nickname }</span> <span
									class="sub-span">2등</span>
							</div>
						</li>
						<li>
							<div class="gradient-wrap">
								<img class="img-profile story"
									src="resources/assets/img/bronze_medal.png" alt="..">
							</div>
							<div class="profile-text">
								<span class="userID point-span">${third.nickname }</span> <span
									class="sub-span">3등</span>
							</div>
						</li>
						<c:forEach items="${other }" var="rank" begin="3"
							varStatus="status">
							<li>
								<div class="gradient-wrap">
									<img class="img-profile story"
										src="resources/assets/img/user.png" alt="..">
								</div>
								<div class="profile-text">
									<span class="userID point-span">${rank.nickname }</span> <span
										class="sub-span">${status.index +1 }등</span>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<!-- 데일리 랭킹 section -->
				<div class="section-story">
					<div class="menu-title">
						<span class="sub-title">데일리 랭킹</span> <span class="find-more"
							onclick="location.href='rankDaily'">모두 보기</span>
					</div>
										<ul class="story-list">
						<li>
							<div class="gradient-wrap">
								<img class="img-profile story"
									src="resources/assets/img/gold_medal.png" alt="..">
							</div>
							<div class="profile-text">
								<span class="userID point-span">${dailyFirst.nickname }</span> <span
									class="sub-span">1등</span>
							</div>
						</li>
						<li>
							<div class="gradient-wrap">
								<img class="img-profile story"
									src="resources/assets/img/silver_medal.png" alt="..">
							</div>
							<div class="profile-text">
								<span class="userID point-span">${dailySecond.nickname }</span> <span
									class="sub-span">2등</span>
							</div>
						</li>
						<li>
							<div class="gradient-wrap">
								<img class="img-profile story"
									src="resources/assets/img/bronze_medal.png" alt="..">
							</div>
							<div class="profile-text">
								<span class="userID point-span">${dailyThird.nickname }</span> <span
									class="sub-span">3등</span>
							</div>
						</li>
						<c:forEach items="${dailyOther }" var="rank" begin="3"
							varStatus="status">
							<li>
								<div class="gradient-wrap">
									<img class="img-profile story"
										src="resources/assets/img/user.png" alt="..">
								</div>
								<div class="profile-text">
									<span class="userID point-span">${rank.nickname }</span> <span
										class="sub-span">${status.index +1 }등</span>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
				<footer>
					<p class="insta-sccript">© 2021 Blockchain Traiding Simulator</p>
				</footer>
			</div>

			<!-- 모달 안에서 댓글 달기: 미완성-->
			<!-- 모달 안에서 댓글 달기: 미완성-->
			<!-- 모달 안에서 댓글 달기: 미완성-->
			<!-- 모달 안에서 댓글 달기: 미완성-->
			<!-- 모달 안에서 댓글 달기: 미완성-->
			<!-- 모달 안에서 댓글 달기: 미완성-->
			<!-- 모달 안에서 댓글 달기: 미완성-->
			<!-- 모달 안에서 댓글 달기: 미완성-->

			<!-- 댓글 모달창 -->
			<div id="modal_reply" class="modal_reply">
				<button type="button" class="modal_reply_close_btn"></button>
				<!-- 댓글 작성 영역 -->
				<div>
					<c:if test="${loginMember != null }">
						<div class="modalComment">
							<input type="text" class="modal-input-comment replyInsert2"
								name="rcontent" maxlength="4000" placeholder="댓글 달기...">
							<button type="submit" class="submit-comment"
								onclick="replyInsert2()">등록</button>
						</div>
					</c:if>
				</div>
				<c:if test="${loginMember == null }">
					<div class="modalComment">
						<input class="modal-input-comment" type="text"
							placeholder="댓글을 작성하려면 로그인이 필요합니다.">
						<button type="submit" class="submit-comment">게시</button>
					</div>
				</c:if>
				<div class="modal-hl"></div>
				<!-- 댓글 목록을 html로 불러온다 -->
				<div class="section-reply" id="replyList"></div>
			</div>

			<!-- 게시글 신고 모달창 -->
			<div id="modal_report">
				<form id="frmC">
					<p>게시글 신고</p>
					<div class="modal_report_div">
						<input type="radio" id="reportChoice1" class="reportChoice"
							name="creport" value="1"> <label for="reportChoice1"
							class="modal_choise_label">나체 이미지 또는 성적 행위</label> <br> <input
							type="radio" id="reportChoice2" class="reportChoice"
							name="creport" value="2"> <label for="reportChoice2"
							class="modal_choise_label">혐오 발언 또는 폭력적</label> <br> <input
							type="radio" id="reportChoice3" class="reportChoice"
							name="creport" value="3"> <label for="reportChoice3"
							class="modal_choise_label">증오 또는 학대</label> <br> <input
							type="radio" id="reportChoice4" class="reportChoice"
							name="creport" value="4"> <label for="reportChoice4"
							class="modal_choise_label">유해하거나 위험한 행위</label> <br> <input
							type="radio" id="reportChoice5" class="reportChoice"
							name="creport" value="5"> <label for="reportChoice5"
							class="modal_choise_label">스팸 또는 사용자 현혹</label> <br> <input
							type="radio" id="reportChoice6" class="reportChoice"
							name="creport" value="6"> <label for="reportChoice6"
							class="modal_choise_label">마음에 들지 않습니다.</label> <input
							type="hidden" id="creportCno" name="cno" />
					</div>
					<hr
						style="width: 328px; position: relative; right: 30px; top: 20px;">
					<div>
						<button type="button" class="modal_close_btn">취소</button>
						<button type="submit" id="btnreport" class="modal_report_btn">신고</button>
					</div>
				</form>
			</div>

			<!-- 댓글 신고 모달창 -->
			<div id="modal_report_reply">
				<form id="frmR">
					<p>댓글 신고</p>
					<div class="modal_report_div">
						<input type="radio" id="rreportChoice1" class="reportChoice"
							name="rreport" value="1"> <label for="rreportChoice1"
							class="modal_choise_label">나체 이미지 또는 성적 행위</label> <br> <input
							type="radio" id="rreportChoice2" class="reportChoice"
							name="rreport" value="2"> <label for="rreportChoice2"
							class="modal_choise_label">혐오 발언 또는 폭력적</label> <br> <input
							type="radio" id="rreportChoice3" class="reportChoice"
							name="rreport" value="3"> <label for="rreportChoice3"
							class="modal_choise_label">증오 또는 학대</label> <br> <input
							type="radio" id="rreportChoice4" class="reportChoice"
							name="rreport" value="4"> <label for="rreportChoice4"
							class="modal_choise_label">유해하거나 위험한 행위</label> <br> <input
							type="radio" id="rreportChoice5" class="reportChoice"
							name="rreport" value="5"> <label for="rreportChoice5"
							class="modal_choise_label">스팸 또는 사용자 현혹</label> <br> <input
							type="radio" id="rreportChoice6" class="reportChoice"
							name="rreport" value="6"> <label for="rreportChoice6"
							class="modal_choise_label">마음에 들지 않습니다.</label><input
							type="hidden" id="rreportRno" name="rno" />
					</div>
					<hr
						style="width: 328px; position: relative; right: 30px; top: 20px;">
					<div>
						<button type="button" class="modal_close_btn">취소</button>
						<button type="button" id="btnrply" class="modal_report_btn">신고</button>
					</div>
				</form>
			</div>

		</main>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>


	<script src="resources/js/mikrokosmos.js"></script>




	<%-- 	<div id="wrapper">
		<%@include file="../main/header.jsp"%>
		<div class="listOut">

			<div class="comm">소우주</div>
			<div class="searchDiv">
				<form action="clist" name="listForm" method="get">
					<select id="searchType" name="searchType">
						<option value="1">글제목</option>
						<option value="2">글내용</option>
						<option value="3">작성자</option>
					</select> <input type='search' id="search" name="keyword">
					<button type=submit id="btnsearch">검색</button>
				</form>
				<input type="hidden" name="page" value="${currentPage}"> <input
					type="button" id="write" class="write" value="글쓰기"
					onclick="showInsertForm()">
			</div>
			<hr>
			<c:forEach items="${commuList }" var="vo" varStatus="status">
				<br>
				<div class="parent">
					<div style="background-color: gray">
						<img
							src="<%=request.getContextPath()%>/resources/assets/img/bts_logo.png"
							width="25px" height="25px">${vo.cwriter } <span
							style="color: red;">:== 닉네임</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button">...</button>
						<button type="button"
							onclick="communityUpdateFn(${status.index })">수정</button>
						<button type="button"
							onclick="communityDeleteFn(${status.index })">삭제</button>
						<button type="button">신고</button>
					</div>
					<div style="background-color: yellow">${vo.ccontent }
						<span style="color: red;">:== 내용</span>
					</div>
					<div style="background-color: lightgray">
						<img class="img_like" src="resources/assets/img/like.png"
							width="25px" height="25px" onclick="clike()"><img
							class="img_dislike" src="resources/assets/img/dislike.png"
							width="25px" height="25px" onclick="dislike()">
						<button>댓글보기(아이콘으로 넣기)</button>
					</div>
					<div style="background-color: lightgreen">좋아요 수 ${vo.likecnt }
						&nbsp;&nbsp;&nbsp;&nbsp; 싫어요 수 ${vo.dislikecnt }&nbsp;&nbsp;&nbsp;&nbsp;
						댓글 수${vo.replycnt }</div>
					<div style="background-color: lightblue">
						<textarea placeholder="댓글을 입력하여 대화를 시작하세요!" name="rcontent"
							maxlength="4000"
							onfocus="if(this.value == '댓글을 입력하여 대화를 시작하세요!') { this.value = ''; }"
							onblur="if(this.value == '') { this.value ='댓글을 입력하여 대화를 시작하세요!'; }"></textarea>
						<button type="button"
							onclick="rcommunityInsertFn(${status.index})">댓글 작성</button>
						<button type="button"
							onclick="rcommunityInsertFn(${status.index})">댓글 쓰기</button>
					</div>
					<div>${vo.cdate }</div>
				</div>
				<hr>
			</c:forEach>
			<div id="moreDiv"></div>
			<button type="button" onclick="moreInsta()">더보기</button>

			<div class="searchDiv">
				<form action="clist" name="bottomListForm" method="get">
					<select id="searchType" name="bottomSearchType">
						<option value="1">글제목</option>
						<option value="2">글내용</option>
						<option value="3">작성자</option>
					</select> <input type='search' id="search" name="bottomKeyword">
					<button type=submit id="btnsearch">검색</button>
				</form>
				<input type="hidden" name="page" value="${currentPage}"> <input
					type="button" id="write" class="write" value="글쓰기"
					onclick="showInsertForm()">
			</div>
		</div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div> --%>
</body>
</html>