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
<link href="${pageContext.request.contextPath}/resources/css/clist.css"
	rel="stylesheet" type="text/css" />
<script
	src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
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
	<div id="wrapper">
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
	</div>
</body>
</html>