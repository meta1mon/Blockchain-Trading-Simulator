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
<link href="${pageContext.request.contextPath}/resources/css/mikrokosmos.css"
	rel="stylesheet" type="text/css" />
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		/* var n = 0;
		for(var i =0; i < 5; i++) {
			var id = "#ckeditor"+n;
		/* 	ClassicEditor
		    .create( document.querySelector( id ), {
		        cloudServices: {
		            tokenUrl: 'https://81478.cke-cs.com/token/dev/de0d9159dc2b7ce3ecb85191c28f789217b087f58ae6880e30d89820724d',
		            uploadUrl: 'https://81478.cke-cs.com/easyimage/upload/'
		        }
		    } )
		    .catch( error => {
		        console.error( error );
		    } ); */
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
								moreHtml += "<br><div class='parent'><div><img	src='<%=request.getContextPath()%>/resources/assets/img/bts_logo.png'"
								+ "width='25px' height='25px'>" + insta.cwriter + "<span	style='color: red;'>:== 닉네임</span></div>"
								+ "<div>" + insta.ccontentr +"<span style='color: red;''>:== 내용</span></div>"
								+ "<div><img class='img_like' src='resources/assets/img/like.png' width='25px' height='25px' onclick='clike()'>"
								+ "<img	class='img_dislike' src='resources/assets/img/dislike.png' width='25px' height='25px' onclick='dislike()'>"
								+ "<button>댓글보기(아이콘으로 넣기)</button></div>"
								+ "<div>좋아요 수" + insta.likecnt +"&nbsp;&nbsp;&nbsp;&nbsp; 싫어요 수 " + insta.dislikecnt +"&nbsp;&nbsp;&nbsp;&nbsp; 댓글 수" + insta.replycnt +"</div>"
								+ "<div><textarea'placeholder='댓글을 입력하여 대화를 시작하세요!'></textarea></div>"
								+ "<div>" + insta.cdate +"</div></div><hr>";
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
<script type="text/javascript">
/*  $(function(){
	$("#modalWrapper").css("display", "none");
	$("#modal").css("display", "none");
	$("#reply_popup_open").on("click", function(){
		console.log("클릭 이벤트")
		openModal();
	})
	$("#reply_popup_close").on("click", function(){
		console.log("클릭 이벤트")
		closeModal();
	})
	
	function openModal(){
		$("#modalWrapper").css("display", "block");
		$("#modal").css("display", "block");
		$("#modalWrapper").css("overflow", "hidden");
		$("body").css("overflow", "hidden");
		
	function closeModal(){
		$("#modalWrapper").css("display", "none");
		$("#modal").css("display", "none");
		$("#modalWrapper").css("overflow", "visible");
		$("body").css("overflow", "visible");
	}
})  */


var rno = 0;
function rreport(nowRno) {
      rno = nowRno;
      console.log(rno);
       modalFn('modal_report_reply');

}

function reply(nowRno) {
      rno = nowRno;
      console.log(rno);
       modalFn('modal_reply');

}
</script>
</head>
<body>
<%@include file="../main/header.jsp"%>
	<div id="wrapper">
    <!-- navigation -->
    <nav>
      <div class="nav-container">
        <div class="nav-1">
        </div>
        <form action="clist" name="listForm" method="get" style="width: 340px;">
					<select id="searchType" class="searchType" name="searchType">
						<option value="1">글제목</option>
						<option value="2">글내용</option>
						<option value="3">작성자</option>
					</select> 
        	<input id="searchInput" type="search" class="input-search" name="keyword" placeholder="검색">
					<button type=submit id="btnsearch" style="display:none;"></button>
		</form>
        <div class="nav-2">
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
              <img class="img-profile pic" src="resources/assets/img/user.png" alt="..">
              <span class="userID main-id point-span">${vo.cwriter }</span>
            </div>
					<div class="dropdown" style="float:left;">
						<div class="icon-react icon-more" style="background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);">
          					<div class="dropdown-content" style="left:0;;">
								  <a href="#" class="report" id="popup_open_btn">신고</a>
								  <!-- 로그인한 유저의 게시글만 수정, 삭제 버튼 보임 -->
								  <c:if test="${loginMember == writerEmail }">
								  <a href="${cupdate}" class="update">수정</a>
								  <a href="${cdelete}" class="delete">삭제</a>
								  </c:if>
							  </div>
						</div>
					</div>
					<!--  src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png" -->
          </header>
			<div class="main-image">
				<div class="subject">${vo.csubject }</div>
				<div class="content">${vo.ccontent }</div>
	            <div class="description">
				<p><span class="at-tag">@bts @wkorea @gucci</span></p>
            </div>
          </div>
          <!-- 게시글 추천, 비추천, 댓글 작성 -->
          <div class="icons-react">
            <div class="icons-left">
              <img class="thumbsup" onclick="" src="resources/assets/img/thumbsup.png" alt="추천">  
              <img class="thumbsup-liked" onclick="" src="resources/assets/img/thumbs-up.png" alt="추천">  
             </div>
             <div class="icons-middle">
              <img class="thumbsdown" onclick="" src="resources/assets/img/thumbsdown.png" alt="비추천">  
              <img class="thumbsdown-disliked" onclick="" src="resources/assets/img/thumbs-down.png" alt="비추천">  
              </div>
              <div class="icons-right">
              <img class="reply" onclick="reply(${rep.rno})" id="reply_popup_open" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png" alt="댓글">
            </div>
          </div>
          <!-- 추천 수 -->
          <div class="reaction">
            <div class="liked-people">
              <p><span class="point-span">${vo.likecnt }</span>명이 추천합니다</p>
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
					<form>
						<div class="comment">
							<input type="hidden" name="cno" value="${community.cno }">
			            	<input type="text" class="input-comment" name="rcontent" maxlength="4000" placeholder="댓글 달기..." >
			            	<button type="submit" class="submit-comment" onclick="rcommunityInsertFn(${status.index})">게시</button>
						</div>
					</form>
				</c:if>
			</div>
			<c:if test="${loginMember == null }">
          <div class="comment">
            <input class="input-comment" type="text" placeholder="댓글을 작성하려면 로그인이 필요합니다." >
            <button type="submit" class="submit-comment">게시</button>
          </div>
          </c:if>
        </article>
        </c:forEach>
        

      </div>
      <!-- main-right -->
      <div class="main-right">
        <div class="myProfile">
          <img class="pic" src="resources/assets/img/user.png" alt="..">
          <div>
            <span class="userID point-span">thisisyourhyung</span>
            <span class="sub-span">JIHYUNG LEE</span>  
          </div>
        </div>
        <!-- story section -->
        <div class="section-story">
          <div class="menu-title">
            <span class="sub-title">스토리</span>
            <span class="find-more">모두 보기</span>
          </div>
          <ul class="story-list">
            <li>
              <div class="gradient-wrap">
                <img class="img-profile story" src="resources/assets/img/user.png" alt="..">
              </div>
              <div class="profile-text">
                <span class="userID point-span">wecode_bootcamp</span>
                <span class="sub-span">12분 전</span>  
              </div>
            </li>
            <li>
              <div class="gradient-wrap">
                <img class="img-profile story" src="resources/assets/img/user.png" alt="..">
              </div>
              <div class="profile-text">
                <span class="userID point-span">han_ye_seul</span>
                <span class="sub-span">28분 전</span>  
              </div>
            </li>
            <li>
              <div class="gradient-wrap">
                <img class="img-profile story" src="resources/assets/img/user.png" alt="..">
              </div>
              <div class="profile-text">
                <span class="userID point-span">dntlrdl</span>
                <span class="sub-span">40분 전</span>  
              </div>
            </li>
            <li>
              <div class="gradient-wrap">
                <img class="img-profile story" src="resources/assets/img/user.png" alt="..">
              </div>
              <div class="profile-text">
                <span class="userID point-span">i_icaruswalks</span>
                <span class="sub-span">56분 전</span>  
              </div>
            </li>
          </ul>
        </div>
        <!-- recommendation section -->
        <div class="section-recommend">
          <div class="menu-title">
            <span class="sub-title">회원님을 위한 추천</span>
            <span class="find-more">모두 보기</span>
          </div>
          <ul class="recommend-list">
            <li>
              <div class="recommend-friend-profile">
                <img class="img-profile" src="resources/assets/img/user.png" alt="..">
                <div class="profile-text">
                  <span class="userID point-span">renebaebae</span>
                  <span class="sub-span">hi_sseulgi님 외 2명이 팔로우합니다</span>
                </div>
              </div>
              <span class="btn-follow">팔로우</span>
            </li>
            <li>
              <div class="recommend-friend-profile">
                <img class="img-profile" src="resources/assets/img/user.png" alt="..">
                <div class="profile-text">
                  <span class="userID point-span">_jeongjaehyun</span>
                  <span class="sub-span">johnnyjsuh님이 팔로우합니다</span>  
                </div>
              </div>
              <span class="btn-follow">팔로우</span>
            </li>
            <li>
              <div class="recommend-friend-profile">
                <img class="img-profile" src="resources/assets/img/user.png" alt="..">
                <div class="profile-text">
                  <span class="userID point-span">leehi_hi</span>
                  <span class="sub-span">jennierubyjane님 외 5명이 팔로우합...</span>  
                </div>
              </div>
              <span class="btn-follow">팔로우</span>
            </li>
          </ul>
        </div>
        <footer>
          <p class="insta-sccript">
            소개 ∙ 도움말 ∙ 홍보 센터 ∙ API ∙ 채용 정보 ∙ 개인정보처리방침 ∙ <br>약관 ∙ 위치 ∙ 인기계정 ∙ 해시태그 ∙ 언어
            <br><br>
            © 2020 INSTAGRAM FROM FACEBOOK
          </p>
        </footer>
      </div>

			<!-- 댓글 작성, 게시글 신고, 댓글 신고 모달창 -->

			<!-- 댓글 모달창 -->
			<div id="modal_reply">
					<button type="button" id="reply_popup_close"
						class="modal_close_btn"
						style="position: absolute; top: 10px; right: 10px; border: none; background-color: #fefefe; font-size: 14px;">X</button>
					<!-- 댓글 작성 부분 -->
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

					<button type="button" class="report" id="popup_open_btn_reply"
						onclick="rreport(${rep.rno})">신고</button>
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
							type="hidden" name="csubject" value="${community.csubject }" />
						<input type="hidden" name="cwriter" value="${community.cwriter }" />
						<input type="hidden" name="ccontent"
							value="${community.ccontent }" /> <input type="hidden"
							name="cno" value="${community.cno }" />
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

			<div id="moreDiv"></div>
			<button type="button" onclick="moreInsta()">더보기</button>
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