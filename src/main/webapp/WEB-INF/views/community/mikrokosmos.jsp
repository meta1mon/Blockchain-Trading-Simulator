<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<link rel="icon"
	href="${pageContext.request.contextPath}/resources/assets/favicon.ico"
	type="image/x-icon" />
<meta charset="UTF-8">
<link
	href="${pageContext.request.contextPath}/resources/css/mikrokosmos.css"
	rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		/* var n = 0;
		for(var i =0; i < 5; i++) {
			var id = "#ckeditor"+n;
		 	ClassicEditor
		    .create( document.querySelector( id ), {
		        cloudServices: {
		            tokenUrl: 'https://81478.cke-cs.com/token/dev/de0d9159dc2b7ce3ecb85191c28f789217b087f58ae6880e30d89820724d',
		            uploadUrl: 'https://81478.cke-cs.com/easyimage/upload/'
		        }
		    } )
		    .catch( error => {
		        console.error( error );
		    } ); 
			n++;
		} */
		
		
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
										+ "<div class='dropdown-content' style='left: 0;'> <a href='#' onclick='report(${vo.cno})' class='report' id='popup_open_btn'>신고</a> <c:if test='${loginMember == writerEmail }'> <a href='${cupdate}' class='update'>수정</a> + </c:if>"
										+"</div> </div> </div> </header> <div class='main-image'> <div class='subject'>" + insta.csubject + "</div> <div class='content'>" + insta.ccontent + "</div> <div class='description'>"
										+"<p> <span class='at-tag'>@bts @wkorea @gucci</span> </p> </div> </div> <div class='icons-react'> <div class='icons-left'> <img class='thumbsup' onclick='clike()' src='resources/assets/img/thumbsup.png'>"
										+"<img class='thumbsup-liked' onclick='clike()' src='resources/assets/img/thumbs-up.png'> </div> <div class='icons-middle'> <img class='thumbsdown' onclick='dislike()' src='resources/assets/img/thumbsdown.png'>"
										+"<img class='thumbsdown-disliked' onclick='dislike()' src='resources/assets/img/thumbs-down.png'> </div> <div class='icons-right'> <img class='reply' onclick='reply('rep.rno')' id='reply_popup_open' src='https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png'>"
										+"</div> </div> <div class='reaction'> <div class='liked-people'> <p> <span class='point-span'>"+insta.likecnt +"</span> 명이 추천합니다</p> </div> <div class='comment-section'> <ul class='comments'> </ul>"
										+"<div class='time-log'> <span>"+ insta.cdate +"</span> </div> </div> </div> <div> <div class='hl'></div> <c:if test='${loginMember != null }'> <form> <div class='comment'> <input type='hidden' name='cno' value="+ insta.cno +">"
										+"<input type='text' class='input-comment' name='rcontent' maxlength='4000' placeholder='댓글 달기...''> <button type='submit' class='submit-comment' onclick="rcommunityInsertFn('status.index')">게시</button>"
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
							moreHtml += "<br><div><div>더이상 불러올 게시글이 없습니다</div></div><hr>";
						}
						$("#moreDiv").html(moreHtml);
						
					}
				});
	}
	
	function showInsertForm() {
			      if(${loginMember == null}) {
			    	alert("게시글을 작성하려면 로그인이 필요합니다.");
			      } else {
			    	  window.location='cWriteForm';
			      }
		      }
	
	// 게시글 수정
	function communityUpdateFn(idx) {
		
	}

	// 게시글 삭제
	function communityDeleteFn(idx) {
		
	}
	
	// 댓글 입력
	function rcommunityInsertFn(idx) {

	}
</script>
<style>
.parent>div {
	text-align: center;
	background-color: lightpurple;
}
</style>
<style>
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
// 추천
function clike() {
   if(${loginMember == null}) {
      alert("로그인이 필요합니다");         
   } else {
      $.ajax({
         url : "${pageContext.request.contextPath}/clike",
         type : "post",
         data : {
            "cno" : "${community.cno}"
         },
         success : function(data) {
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
function dislike() {
   if(${loginMember == null}) {
      alert("로그인이 필요합니다");         
   } else {
      $.ajax({
         url : "${pageContext.request.contextPath}/cdislike",
         type : "post",
         data : {
            cno : "${community.cno}"
         },
         datatype : "json",
         success : function(data) {
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

function showInsertForm() {
    if(${loginMember == null}) {
  	alert("게시글을 작성하려면 로그인이 필요합니다.");
    } else {
  	  window.location='cWriteForm';
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
          <img src="resources/assets/img/writing.png" onclick="showInsertForm()" title="글 작성" alt="글쓰기" style="cursor:pointer;">
          <img src="resources/assets/img/megaphone.png" onclick="location.href='clist'" title="공지사항" alt="공지사항" style="cursor:pointer;">
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
										<a href="#" onclick="report(${vo.cno})" class="report">신고</a>
										<!-- 로그인한 유저의 게시글만 수정, 삭제 버튼 보임 -->
										<c:url var="insta" value="insta">
											<c:param name="cno" value="${vo.cno}" />
										</c:url>
										<c:url var="cupdate" value="cUpdateForm">
											<c:param name="cno" value="${vo.cno}" />
										</c:url>
										<c:url var="cdelete" value="cDelete">
											<c:param name="cno" value="${vo.cno}" />
										</c:url>
										<c:if test="${loginMember == writerEmail }">
											<a href="${cupdate}" class="update">수정</a>
											<a href="${cdelete}" class="delete">삭제</a>
										</c:if>
									</div>
								</div>
							</div>
						</header>
						<div class="main-image">
							<div class="subject">${vo.csubject }</div>
							<div class="content">${vo.ccontent }
							<c:forTokens var="fileName" items="${vo.filepath}"
									delims="," varStatus="st">
									<a download="${fileName}"
										href="${pageContext.request.contextPath}/resources/uploadFiles/${vo.filepath}">${fileName}</a>
									<c:if test="${!st.last }">
                                    /
                                </c:if>
									<br>
								</c:forTokens>
								</div>
							<div class="description">
								<p>
									<span class="at-tag">@bts @wkorea @gucci</span>
								</p>
							</div>
						</div>
						<!-- 게시글 추천, 비추천, 댓글 작성 -->
						<div class="icons-react">
							<div class="icons-left">
								<img class="thumbsup" onclick="clike()"
									src="resources/assets/img/thumbsup.png" alt="추천"> <img
									class="thumbsup-liked" onclick="clike()"
									src="resources/assets/img/thumbs-up.png" alt="추천">
							</div>
							<div class="icons-middle">
								<img class="thumbsdown" onclick="dislike()"
									src="resources/assets/img/thumbsdown.png" alt="비추천"> <img
									class="thumbsdown-disliked" onclick="dislike()"
									src="resources/assets/img/thumbs-down.png" alt="비추천">
							</div>
							<div class="icons-right">
								<img class="reply" onclick="reply(${rep.rno})"
									id="reply_popup_open"
									src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png"
									alt="댓글">
							</div>
						</div>
						<!-- 추천 수 -->
						<div class="reaction">
							<div class="liked-people">
								<p>
									<span class="point-span">${vo.likecnt }</span>명이 추천합니다
								</p>
							</div>
							<div class="comment-section">
								<ul class="comments">
								</ul>
								<div class="time-log">
									<span>${vo.cdate }</span>
								</div>
							</div>
						</div>
						<!-- 댓글 작성 부분 -->
						<div>
							<div class="hl"></div>
							<c:if test="${loginMember != null }">
								<form id="writeRcommunity">
									<div class="comment">
										<input type="hidden" name="cno" value="${community.cno }">
										<input type="text" class="input-comment" name="rcontent"
											maxlength="4000" placeholder="댓글 달기...">
										<button type="submit" class="submit-comment"
											onclick="rplyInsert()">등록</button>
									</div>
								</form>
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
				<!-- 랭킹 section -->
				<div class="section-story">
					<div class="menu-title">
						<span class="sub-title">누적 랭킹</span> <span class="find-more" onclick="location.href='rankAccumulative'">모두
							보기</span>
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
						<c:forEach items="${other }" var="rank" begin="3" varStatus="status">
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
				<!-- recommendation section -->
			 	<div class="section-recommend">
					<div class="menu-title">
						<span class="sub-title">회원님을 위한 추천</span> <span class="find-more" onclick="location.href='rankAccumulative'">모두
							보기</span>
					</div>
					<ul class="recommend-list">
						<li>
							<div class="recommend-friend-profile">
								<img class="img-profile" src="resources/assets/img/user.png"
									alt="..">
								<div class="profile-text">
									<span class="userID point-span">renebaebae</span> <span
										class="sub-span">hi_sseulgi님 외 2명이 팔로우합니다</span>
								</div>
							</div> <span class="btn-follow">팔로우</span>
						</li>
						<li>
							<div class="recommend-friend-profile">
								<img class="img-profile" src="resources/assets/img/user.png"
									alt="..">
								<div class="profile-text">
									<span class="userID point-span">_jeongjaehyun</span> <span
										class="sub-span">johnnyjsuh님이 팔로우합니다</span>
								</div>
							</div> <span class="btn-follow">팔로우</span>
						</li>
						<li>
							<div class="recommend-friend-profile">
								<img class="img-profile" src="resources/assets/img/user.png"
									alt="..">
								<div class="profile-text">
									<span class="userID point-span">leehi_hi</span> <span
										class="sub-span">jennierubyjane님 외 5명이 팔로우합...</span>
								</div>
							</div> <span class="btn-follow">팔로우</span>
						</li>
					</ul>
				</div> 
				<footer>
					<p class="insta-sccript">
						© 2021 Blockchain Traiding Simulator
					</p>
				</footer>
			</div>

			<!-- 댓글 작성, 게시글 신고, 댓글 신고 모달창 -->

			<!-- 댓글 모달창 -->
			<div id="modal_reply" class="modal_reply">
				<button type="button" class="modal_reply_close_btn"></button>
				<!-- 댓글 작성 영역 -->
				<div>
					<c:if test="${loginMember != null }">
						<form>
							<div class="comment">
								<input type="hidden" name="cno" value="${community.cno }">
								<input type="text" class="modal-input-comment" name="rcontent"
									maxlength="4000" placeholder="댓글 달기...">
								<button type="submit" class="submit-comment"
									onclick="rcommunityInsertFn(${status.index})">게시</button>
							</div>
						</form>
					</c:if>
				</div>
				<c:if test="${loginMember == null }">
					<div class="comment">
						<input class="modal-input-comment" type="text"
							placeholder="댓글을 작성하려면 로그인이 필요합니다.">
						<button type="submit" class="submit-comment">게시</button>
					</div>
				</c:if>
				<div class="modal-hl"></div>
				<!-- 댓글 목록 -->
				<div class="section-reply">
					<ul class="reply-list">
						<br>
						
						<c:if test="${!empty commentList}">
				<!--  댓글 불러오기 -->
				<c:forEach var="rep" items="${commentList}" varStatus="status">
						<li>
							<div class="profile-wrap">
								<img class="img-profile story"
									src="resources/assets/img/user.png" alt="..">
							</div>
							<div class="profile-writer">
								<input type="hidden" name="cno" value="${commuList.cno }">
								<span class="userID point-span">${rep.rwriter}</span><span
									class="sub-span">${rep.rdate}</span><br> <span
									class="content-span">${rep.rcontent}</span>
									<textarea class="newRcontent" style="display: none;"
								maxlength="4000">${rep.rcontent }</textarea>
								
								<div class="replyDropdown" style="float: right; position: relative; left: 10px;">
									<div class="icon-react icon-more"
										style="background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);">
										<div class="dropdown-content" style="left: 0;">
											<a href="#" onclick="rreport(${vo.cno})" class="report">신고</a>
											<!-- 로그인한 유저의 게시글만 수정, 삭제 버튼 보임 -->
											<c:if test="${loginMember == writerEmail }">
												<a href="#" class="update"
													onclick="makeUpdateBtn(${status.index })">수정</a>
												<a href="#" class="delete"
													onclick="replyDelete(${rep.rno}, ${rep.cno })">삭제</a>
											<button type="button" class="submitRUpdate"
										onclick="replyUpdate(${rep.rno}, ${status.index })"
										style="display: none;">수정완료</button>
									<button type="button" class="cancleRUpdate"
										onclick="updateRCancle(${status.index })"
										style="display: none;">수정취소</button>
											</c:if>
										</div>
									</div>
									
								</div>
							</div>
						</li>
						</c:forEach>
			</c:if>
						<li>
							<div class="profile-wrap">
								<img class="img-profile story"
									src="resources/assets/img/user.png" alt="..">
							</div>
							<div class="profile-writer">
								<span class="userID point-span">han_ye_seul</span><span
									class="sub-span">12분 전</span><br> <span
									class="content-span">저스틴 비버의 어쿠스틱 라이브 😮</span>
							</div>
						</li>
						<li>
							<div class="profile-wrap">
								<img class="img-profile story"
									src="resources/assets/img/user.png" alt="..">
							</div>
							<div class="profile-writer">
								<span class="userID point-span">dntlrdl</span><span
									class="sub-span">12분 전</span><br> <span
									class="content-span">저스틴 비버의 어쿠스틱 라이브 😮</span>
							</div>
						</li>

					</ul>
				</div>
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
							class="modal_choise_label">마음에 들지 않습니다.</label> 
						<input type="hidden" name="csubject" value="${community.csubject }" />
						<input type="hidden" name="cwriter" value="${community.cwriter }" />
						<input type="hidden" name="ccontent" value="${community.ccontent }" /> 
						<input type="hidden" name="cno" value="${community.cno }" />
					</div>
					<hr
						style="width: 328px; position: relative; right: 30px; top: 20px;">
					<div>
						<button type="button" id="btncancel" class="modal_close_btn">취소</button>
						<button type="submit" id="btnreport" class="modal_report_btn">신고</button>
					</div>
				</form>
			</div>

			<!-- 댓글 신고 모달창 -->
			<div id="modal_report_reply">
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
						class="modal_choise_label">마음에 들지 않습니다.</label>
				</div>
				<hr
					style="width: 328px; position: relative; right: 30px; top: 20px;">
				<div>
					<button type="button" id="btncancel" class="modal_close_btn">취소</button>
					<button type="button" id="btnrply" class="modal_report_btn">신고</button>
				</div>
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