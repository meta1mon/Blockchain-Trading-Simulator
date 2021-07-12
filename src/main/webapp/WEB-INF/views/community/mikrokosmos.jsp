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

.tag {
	color: #8c66c8;
	font-size: medium;
}

.nowLike, .nowDislike, .nowLike2, .nowDislike2 {
	border: 0px;
	width: 25px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
		var instaStart = 7;
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
									// 인스타 게시글 첨부파일이 없을 때 사용하는 변수
									moreHtml += "<article> <header> <div class='profile-of-article'> <img class='img-profile pic' src='resources/assets/img/user.png'> <span class='userID main-id point-span'>" + insta.cwriter +"</span> </div> "
											+"<div class=\"dropdown\" style=\"float: right;\" onclick=\"moreDropdown('" + (instaStart-1 + idx*1) + "')\"> <div class='icon-react icon-more' style='background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);'>"
											+"<div class='dropdown-content ddcontent' style='left: 0;'> <p onclick='report(\"" + insta.cno + "\")' class='report'>신고</p><p onclick=\"checkUpdate('" + insta.cno + "', '" + insta.cwriter + "')\" class='update'>수정</p>"
											+"<p onclick='checkDelete(\"" + insta.cno + "\", \"" + insta.cwriter + "\")' class='delete'>삭제</p></div> </div> </div> </header>"
											+"<div class='main-image'><div class='content'>" + insta.ccontent +"<c:if test='${not empty insta.filepath}'> <a download="+insta.filepath+" href=\"${pageContext.request.contextPath}/resources/uploadFiles/"+insta.filepath+"\">"+insta.filepath+"</a></c:if><br> </div> </div>"
		                                	+"<div class=\"icons-react\"> <div class=\"icons-left\" onclick=\"clike2('" + this + "', '" + insta.cno + "')\" > <img class=\"thumbsup2\" src='resources/assets/img/thumbsup.png' alt=\"추천\">"
		                                	+ "<img class=\"thumbsup-liked2\" src=\"resources/assets/img/thumbs-up.png\" alt=\"추천\"><input type=\"text\" class=\"nowLike2\" readonly value=\"" + insta.likecnt +"\"></div>"
											+"<div class=\"icons-middle\" onclick=\"dislike2('" + this + "', '" + insta.cno + "')\"> <img class=\"thumbsdown2\" src='resources/assets/img/thumbsdown.png' alt='비추천'>"
											+"<img class='thumbsdown-disliked2' src='resources/assets/img/thumbs-down.png'><input type=\"text\" class=\"nowDislike2\" readonly value=\"" + insta.dislikecnt +"\"></div> "
											+"<input type=\"hidden\" class=\"hiddenCno\" value=\"" + insta.cno + "\"><div class='icons-right'>"
											+"<img class=\"reply\" onclick=\"reply2('" + insta.cno + "')\" id='reply_popup_open' src='https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png' alt='댓글'><span class='moreReplycnt'>" + insta.replycnt
											+"</span></div> </div> <div class=\"reaction\"> <div class=\"comment-section\"> <ul class=\"comments\"> </ul>"
											+"<div class='time-log'> <span>"+ insta.cdate +"</span> </div> </div> </div> <div> <div class='hl'></div> <c:if test='${loginMember != null }'> <div class='comment'>"
											+"<input type='text' class='input-comment' name='rcontent' maxlength='4000' placeholder='댓글 달기...'> <button type='button' class='submit-comment' onclick=\"replyInsert3('" + this + "', '" + insta.cno + "')\">등록</button>"
											+"</div> </c:if> </div> <c:if test='${loginMember == null }'> <div class='comment'> <input class='input-comment' type='text' readonly placeholder='댓글을 작성하려면 로그인이 필요합니다.'>"
											+"<button type='button' class='submit-comment' onclick=\"location.href='login'\">이동</button> </div> </c:if> </article>";
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
		
// 추천 : 처음 인스타
function clike(idx, likeCno) {
	console.log(idx);
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
        	 if(data == 1) { // 좋아요 + 1
        		 var nowLikeCnt = $(".nowLike").eq(idx).val() * 1 + 1;
				$(".nowLike").eq(idx).val(nowLikeCnt);
				$(".thumbsup-liked").eq(idx).css("display", "inline-block");
				$(".thumbsup").eq(idx).css("display", "none");
        	 } else if(data == 0) { // 좋아요 - 1
        		 var nowLikeCnt = $(".nowLike").eq(idx).val() * 1 - 1;
 				$(".nowLike").eq(idx).val(nowLikeCnt);
				$(".thumbsup-liked").eq(idx).css("display", "none");
				$(".thumbsup").eq(idx).css("display", "inline-block");
        	 }
         }
      });
   } 
}
// 추천 : moreInsta
function clike2(likeThis, likeCno) {
	var nowIdx = $(window.event.target).parents('article').index();
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
        	 if(data == 1) {
        		 var nowLikeCnt = $(".nowLike2").eq(nowIdx).val() * 1 + 1;
				$(".nowLike2").eq(nowIdx).val(nowLikeCnt);
				$(".thumbsup-liked2").eq(nowIdx).css("display", "inline-block");
				$(".thumbsup2").eq(nowIdx).css("display", "none");
        	 } else if(data == 0) {
        		 var nowLikeCnt = $(".nowLike2").eq(nowIdx).val() * 1 - 1;
 				$(".nowLike2").eq(nowIdx).val(nowLikeCnt);
				$(".thumbsup-liked2").eq(nowIdx).css("display", "none");
				$(".thumbsup2").eq(nowIdx).css("display", "inline-block");
        	 }
         }
      });
   }
}
 
// 비추천 : 처음 인스타
function dislike(idx, dislikeCno) {
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
        	 if(data == 1) {
        		 var nowDislikeCnt = $(".nowDislike").eq(idx).val() * 1 + 1;
				$(".nowDislike").eq(idx).val(nowDislikeCnt);
				$(".thumbsdown-disliked").eq(idx).css("display", "inline-block");
				$(".thumbsdown").eq(idx).css("display", "none");
        	 } else if(data == 0) {
        		 var nowDislikeCnt = $(".nowDislike").eq(idx).val() * 1 - 1;
 				$(".nowDislike").eq(idx).val(nowDislikeCnt);
				$(".thumbsdown-disliked").eq(idx).css("display", "none");
				$(".thumbsdown").eq(idx).css("display", "inline-block");
        	 }
         }
      });
   }
}

// 비추천 : moreInsta
function dislike2(dislikeThis, dislikeCno) {
	var nowIdx = $(window.event.target).parents('article').index();
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
        	 if(data == 1) {
        		 var nowDislikeCnt = $(".nowDislike2").eq(nowIdx).val() * 1 + 1;
				$(".nowDislike2").eq(nowIdx).val(nowDislikeCnt);
				$(".thumbsdown-disliked2").eq(nowIdx).css("display", "inline-block");
				$(".thumbsdown2").eq(nowIdx).css("display", "none");
        	 } else if(data == 0) {
        		 var nowDislikeCnt = $(".nowDislike2").eq(nowIdx).val() * 1 - 1;
 				$(".nowDislike2").eq(nowIdx).val(nowDislikeCnt);
				$(".thumbsdown-disliked2").eq(nowIdx).css("display", "none");
				$(".thumbsdown2").eq(nowIdx).css("display", "inline-block");
        	 }
         }
      });
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

//댓글 삭제 : 원래 인스타
function replyDelete1(deleteRno, deleteCno, deleteRwriter) {
	if(${loginMember == null}) {
		alert("로그인 후 이용해주세요");
	} else {
		$.ajax({
			url : "rcDelete",
			type : "post",
			data : {
				"rno" : deleteRno,
				"cno" : deleteCno,
				"rwriter" : deleteRwriter
			},
			success : function(data) {
				if (data == -1) {
					alert("권한이 없습니다");
				} else if (data > 0) {
					bgReply.remove();
					alert("댓글 삭제 성공");
					var replyHtml = "<ul style=\"zIndex:10000;\" class=\"reply-list\">";
					// 댓글 리스트 읽어오는 ajax
					$.ajax({
						url : "rcSelect",
						type : "post",
						data : {
							"cno" : deleteCno
						},
						datatype : "json",
						success : function(data) {
							modalReplyFn('modal_reply');
							var json = JSON.parse(data);
							if (json.length > 0) {
								replyHtml += "<input id=\"moreModalInCno\" type=\"hidden\" value=\"" + deleteCno +"\">";
								$.each(json, function(idx, reply) {
									replyHtml += "<li><div class=\"profile-wrap\">"
										+ "<img class=\"img-profile story\" src=\"resources/assets/img/user.png\" alt=\"..\"></div><div class=\"profile-writer\">"
										+ "<span class=\"userID point-span\">" + reply.rwriter + "</span><span class=\"sub-span\">" + reply.rdate
										+ "</span><br><span class=\"content-span\">" + reply.rcontent + "</span></div><div class=\"replyDropdown\" style=\"float: right;\">"
										+ "<div class=\"icon-react icon-more\" style=\"background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);\">"
										+ "<div class=\"dropdown-content\"> <p class=\"reportReply\" onclick=\"rreport('"+ reply.rno + "')\">신고</p>"
										+ "<p class=\"deleteReply\" onclick=\"replyDelete1('" + reply.rno + "', '" + reply.cno + "', '" + reply.rwriter + "')\">삭제</p></div></li>";
								});
								replyHtml += "</ul>";
							} else {
								replyHtml = "<p>작성된 댓글이 없습니다.</p>";
							}
							$("#replyList").html(replyHtml);
						}
					});
					
					// 화면에 댓글 숫자 변경
					$.ajax({
						url : "replyCount",
						type : "post",
						data : {
							"cno" : deleteCno
						},
						success : function(data) {
							var i = 0;
							while(true) {
								if($(".hiddenCno").eq(i).val() == deleteCno) {
										$(".liveReplyCnt").eq(i).text(data);
									break;
								}
								i++;
							}
						}
					});
				} else {
					alert("댓글 삭제 실패");
				}
			}
		});
	
	}
}
//댓글 삭제 : moreInsta
function replyDelete2(deleteRno, deleteCno, deleteRwriter) {
	if(${loginMember == null}) {
		alert("로그인 후 이용해주세요");
	} else {
		$.ajax({
			url : "rcDelete",
			type : "post",
			data : {
				"rno" : deleteRno,
				"cno" : deleteCno,
				"rwriter" : deleteRwriter
			},
			success : function(data) {
				if (data == -1) {
					alert("권한이 없습니다");
				} else if (data > 0) {
					bgReply.remove();
					alert("댓글 삭제 성공");
					var replyHtml = "<ul style=\"zIndex:10000;\" class=\"reply-list\">";
					// 댓글 리스트 읽어오는 ajax
					$.ajax({
						url : "rcSelect",
						type : "post",
						data : {
							"cno" : deleteCno
						},
						datatype : "json",
						success : function(data) {
							modalReplyFn('modal_reply');
							var json = JSON.parse(data);
							if (json.length > 0) {
								replyHtml += "<input id=\"moreModalInCno\" type=\"hidden\" value=\"" + deleteCno +"\">";
								$.each(json, function(idx, reply) {
									replyHtml += "<li><div class=\"profile-wrap\">"
										+ "<img class=\"img-profile story\" src=\"resources/assets/img/user.png\" alt=\"..\"></div><div class=\"profile-writer\">"
										+ "<span class=\"userID point-span\">" + reply.rwriter + "</span><span class=\"sub-span\">" + reply.rdate
										+ "</span><br><span class=\"content-span\">" + reply.rcontent + "</span></div><div class=\"replyDropdown\" style=\"float: right;\">"
										+ "<div class=\"icon-react icon-more\" style=\"background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);\">"
										+ "<div class=\"dropdown-content\"> <p class=\"reportReply\" onclick=\"rreport('"+ reply.rno + "')\">신고</p>"
										+ "<p class=\"deleteReply\" onclick=\"replyDelete2('" + reply.rno + "', '" + reply.cno + "', '" + reply.rwriter + "')\">삭제</p>"
										+ "</div></li>";
								});
								replyHtml += "</ul>";
							} else {
								replyHtml = "<p>작성된 댓글이 없습니다.</p>";
							}
							$("#replyList").html(replyHtml);
						}
					});
					
					// 화면에 댓글 숫자 변경
					$.ajax({
						url : "replyCount",
						type : "post",
						data : {
							"cno" : deleteCno
						},
						success : function(data) {
							console.log(data + "다녀온 결과값, 현재 댓글 개수");
							console.log(deleteCno + "현재 게시글 번호");
							var i = 0;
							while(true) {
								console.log($(".hiddenCno").eq(i).val() + "바깥에 있는 게시글 번호");
								if($(".hiddenCno").eq(i).val() == deleteCno) {
									$(".moreReplycnt ").eq(i - 10).text(data);
									break;
								}
								i++;	
							}
						}
					});
				} else {
					alert("댓글 삭제 실패");
				}
			}
		});
	
	}
}
</script>
</head>
<body>
	<%@include file="../main/header.jsp"%>
	<div id="wrapper">
		<!-- navigation -->
		<nav>
			<div class="nav-container">
				<div class="nav-1"></div>
				<form action="insta" name="listForm" method="get"
					style="width: 340px;">
					<select id="searchType" class="searchType" name="searchType">
						<option value="1">태그</option>
						<option value="2">작성자</option>
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
									<div class="dropdown-content ddcontent" style="left: 0;">
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
							<div class="content">${vo.ccontent }
								<a download="${vo.filepath}"
									href="${pageContext.request.contextPath}/resources/uploadFiles/${vo.filepath}">${vo.filepath}</a>
								<br>
							</div>
						</div>
						<!-- 게시글 추천, 비추천, 댓글 작성 -->
						<div class="icons-react">
							<div class="icons-left"
								onclick="clike('${status.index}', '${vo.cno }')">
								<img class="thumbsup-liked"
									src="resources/assets/img/thumbs-up.png" alt="추천"> <img
									class="thumbsup" src="resources/assets/img/thumbsup.png"
									alt="추천"> <input type="text" class="nowLike" readonly
									value="${vo.likecnt }">
							</div>
							<div class="icons-middle"
								onclick="dislike('${status.index}', '${vo.cno }')">
								<img class="thumbsdown-disliked"
									src="resources/assets/img/thumbs-down.png" alt="비추천"> <img
									class="thumbsdown" src="resources/assets/img/thumbsdown.png"
									alt="비추천"> <input type="text" class="nowDislike" readonly
									value="${vo.dislikecnt }">
							</div>
							<div class="icons-right">
								<input type="hidden" class="hiddenCno" value="${vo.cno }">
								<img class="reply" onclick="reply(${status.index})"
									id="reply_popup_open"
									src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/comment.png"
									alt="댓글"><span class="liveReplyCnt">${vo.replycnt }</span>
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
				</c:forEach>
				<br>
				<div id="moreDiv">
					<!-- 더 불러온 인스타 넣는 구역 -->
				</div>
				<c:if test="${isSearched == null }">
					<button type="button" class="moreFeed" onclick="moreInsta()">더보기</button>
				</c:if>
				<c:if test="${isSearched != null }">
					<button type="button" class="moreFeed"
						onclick="location.href='insta'">목록으로 돌아가기</button>
				</c:if>
			</div>
			<!-- main-right -->
			<div class="main-right">
				<!-- 누적 랭킹 section -->
				<div class="section-accumulative">
					<div class="menu-title">
						<span class="sub-title">누적 랭킹</span> <span class="find-more"
							onclick="location.href='rankDaily?criteria=0'">모두 보기</span>
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
				<div class="section-daily">
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
								<span class="userID point-span">${dailySecond.nickname }</span>
								<span class="sub-span">2등</span>
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

			<!-- 모달 안에서 댓글 달기-->
			<!-- 댓글 모달창 -->
			<div id="modal_reply" class="modal_reply">
				<button type="button" class="modal_reply_close_btn"></button>
				<!-- 댓글 작성 영역 -->
				<div>
					<c:if test="${loginMember != null }">
						<div class="modalComment">
							<input type="text" class="modal-input-comment" id="replyContent2"
								name="rcontent" maxlength="4000" placeholder="댓글 달기...">
							<button type="submit" class="submit-comment"
								onclick="replyInsert2()">등록</button>
						</div>
					</c:if>
					<c:if test="${loginMember == null }">
						<div class="modalComment">
							<input class="modal-input-comment" type="text" readonly
								placeholder="댓글을 작성하려면 로그인이 필요합니다.">
							<button type="button" class="submit-comment"
								onclick="location.href='login'">이동</button>
						</div>
					</c:if>
				</div>

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
						<button type="button" id="btnreport" class="modal_report_btn">신고</button>
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
<script src="${pageContext.request.contextPath}/resources/js/mikrokosmos.js"></script>
</body>
</html>