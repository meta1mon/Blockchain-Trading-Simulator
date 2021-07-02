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
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script> -->
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		var n = 0;
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
		}
		
		
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
</head>
<body>
<%@include file="../main/header.jsp"%>
    <!-- navigation -->
    <nav>
      <div class="nav-container">
        <div class="nav-1">
<!--             <img class="logo_instagram_txt" src="resources/assets/img/logo_text.png" alt="logo_text"> -->
        </div>
        <input id="searchInput" type="search" class="input-search" placeholder="검색">
        <div class="nav-2">
<!--           <img src="resources/assets/img/home.png" alt="홈"> -->
<!--           <img src="resources/assets/img/dm.png" alt="DM"> -->
<!--           <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/explore.png" alt="탐색"> -->
<!--           <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/heart.png" alt="하트"> -->
<!--           <img class="pic" src="https://scontent-gmp1-1.cdninstagram.com/v/t51.2885-19/s150x150/71022783_513111249480681_2188078115513696256_n.jpg?_nc_ht=scontent-gmp1-1.cdninstagram.com&_nc_ohc=7Rl_bMO8TN4AX9C-AKS&oh=64741fc0f2635ebb63f94d5285798e08&oe=5F6A0524" alt="마이페이지"> -->
        </div>
      </div>
    </nav>
    <!-- main -->
    <div id="wrapper">
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
						<button type="button"
							onclick="communityUpdateFn(${status.index })">수정</button>
						<button type="button"
							onclick="communityDeleteFn(${status.index })">삭제</button>
						<button type="button">신고</button>
						<img class="icon-react icon-more" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png" alt="more">
          </header>
          <div class="main-image">
<!--             <img src="" alt="dlwlrma님의 피드 사진" class="mainPic"> -->
            &nbsp;${vo.ccontent }
            <div class="description">
              <p><span class="at-tag">@wkorea @gucci</span> 🌱</p>
            </div>
          </div>
          <div class="icons-react">
            <div class="icons-left">
              <img class="icon-react" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/heart.png" alt="하트">
              <img class="icon-react" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png" alt="말풍선">
              <img class="icon-react" src="resources/assets/img/dm.png" alt="DM">  
            </div>
<!--             <img class="icon-react" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/bookmark.png" alt="북마크"> -->
          </div>
          <!-- article text data -->
          <div class="reaction">
            <div class="liked-people">
              <p><span class="point-span">${vo.likecnt }</span> <span class="point-span">명</span>이 좋아합니다</p>
            </div>
           <!--  <div class="description">
              <p><span class="point-span userID">dlwlrma</span><span class="at-tag">@wkorea @gucci</span> 🌱</p>
            </div> -->
            <div class="comment-section">
              <ul class="comments">
                <li>
                  <span><span class="point-span userID">postmalone</span>내가 입으면 더 잘어울릴 것 같아</span>
                  <div>
                    <img class="comment-more" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png" alt="more">
                    <div class="comment-like">
                      <img class="comment-heart" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/heart.png" alt="하트">
                      <img class="comment-heart-liked" src="resources/assets/img/liked.png" alt="좋아요된하트">
                    </div>
                  </div>
                </li>
                <!-- input 값 여기에 추가 -->
              </ul>
              <div class="time-log">
                <span>${vo.cdate }</span>
              </div>
            </div>
          </div>
          <div class="hl"></div>
          <div class="comment">
            <input id="input-comment" class="input-comment" name="rcontent" maxlength="4000" type="text" placeholder="댓글 달기..." >
            <button type="submit" class="submit-comment" onclick="rcommunityInsertFn(${status.index})">게시</button>
          </div>
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
    </main>
    </div>
    <script src="resources/js/main.js"></script>
    
	<div id="wrapper">
<%-- 		<%@include file="../main/header.jsp"%> --%>
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
	</div>
</body>
</html>