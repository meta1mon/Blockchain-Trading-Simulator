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
<style>
.thumbsup, .thumbsup-liked, .thumbsdown, .thumbsdown-disliked {
    cursor: pointer !important;
}
</style>
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
								alt=".."> <span class="userID main-id point-span">${community.cwriter }</span>
						</div>
<!-- 드랍다운 숨기기				<div class="dropdown" style="float: right;"> -->
<!-- 							<div class="icon-react icon-more" -->
<!-- 								style="background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);"> -->
<!-- 								<div class="dropdown-content ddcontent" style="left: 0;"> -->
<%--  									<p onclick="report('${community.cno}')" class="report">신고</p> --%> 
<!-- 									<p class="update" -->
<%-- 										onclick="checkUpdate('${community.cno }', '${community.cwriter }')">수정</p> --%>
<!-- 									<p class="delete" -->
<%-- 										onclick="checkDelete('${community.cno }', '${community.cwriter }')">삭제</p> --%>
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
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
					<div class="icons-left"	onclick="clike(0, '${community.cno }')">
<!-- 좋아요 기능없앨때쓰는태그 		<div class="icons-left"> -->
							<img class="thumbsup-liked"	src="${pageContext.request.contextPath}/resources/assets/img/thumbs-up.png" alt="추천">
							<img class="thumbsup" src="${pageContext.request.contextPath}/resources/assets/img/thumbsup.png" alt="추천"> 
							<input type="text" class="nowLike" readonly	value="${community.likecnt }">
						</div>
					<div class="icons-middle" onclick="dislike(0, '${community.cno }')">
<!-- 싫어요 기능없앨때쓰는태그 		<div class="icons-middle" > -->
							<img class="thumbsdown-disliked"
								src="${pageContext.request.contextPath}/resources/assets/img/thumbs-down.png" alt="비추천"> <img
								class="thumbsdown" src="${pageContext.request.contextPath}/resources/assets/img/thumbsdown.png"
								alt="비추천"> <input type="text" class="nowDislike" readonly
								value="${community.dislikecnt }">
						</div>
						<div class="icons-right">
							<input type="hidden" class="hiddenCno" value="${community.cno }">
							<img class="reply" onclick="reply2(0)"
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
<!-- 댓글란 삭제			<div> -->
<!-- 						<div class="hl"></div> -->
<%-- 						<c:if test="${loginMember != null }"> --%>
<!-- 							<div class="comment"> -->
<!-- 								<input type="hidden" name="cno" class="replyInsertCno1" -->
<%-- 									value="${community.cno }"> <input type="text" --%>
<!-- 									class="input-comment replyContent1" name="rcontent" -->
<!-- 									maxlength="4000" placeholder="댓글 달기..."> -->
<!-- 								<button type="button" class="submit-comment" -->
<%-- 									onclick="replyInsert1(${status.index})">등록</button> --%>
<!-- 							</div> -->
<%-- 						</c:if> --%>
<!-- 					</div> -->
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
								onclick="replyInsertMy()">등록</button>
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
						<button type="button" id="btnrplyMy" class="modal_report_btn">신고</button>
					</div>
				</form>
			</div>
		</main>
		<jsp:include page="../main/footer.jsp"></jsp:include> 
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/mikrokosmos.js"></script>
<script>
function reply2(idx) {
	var replyHtml = "<ul style=\"zIndex:10000;\" class=\"reply-list\">"
	replyCno = $(".hiddenCno").eq(idx).val();
	$.ajax({
			url : "${pageContext.request.contextPath}/rcSelect",
			type : "post",
			data : {
				"cno" : replyCno
			},
			datatype : "json",
			success : function(data) {
				modalReplyFn('modal_reply');
				replyHtml +="<input id=\"modalInCno\" type=\"hidden\" value=\"" + replyCno +"\">";
				var json = JSON.parse(data);
				if (json.length > 0) {
					$.each(json, function(idx, reply) {
										replyHtml += "<li><div class=\"profile-wrap\">"
												+ "<img class=\"img-profile story\" src=\"../resources/assets/img/user.png\" alt=\"..\"></div><div class=\"profile-writer\">"
												+ "<span class=\"userID point-span\">" + reply.rwriter + "</span><span class=\"sub-span\">" + reply.rdate
												+ "</span><br><span class=\"content-span\">" + reply.rcontent + "</span></div><div class=\"replyDropdown\" style=\"float: right;\">"
												+ "<div class=\"icon-react icon-more\" style=\"background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);\">"
												+ "<div class=\"dropdown-content\"> <p class=\"reportReply\" onclick=\"rreport('"+ reply.rno + "')\">신고</p>"
												+ "<p class=\"deleteReply\" onclick=\"replyDeleteMy('" + reply.rno + "', '" + reply.cno + "', '" + reply.rwriter + "')\">삭제</p></div></li>";
									});
					replyHtml += "</ul>";
				} else {
					replyHtml = "<input id=\"modalInCno\" type=\"hidden\" value=\"" + replyCno +"\"><p>작성된 댓글이 없습니다.</p>";
				}
				$("#replyList").html(replyHtml);
			}
		});
}

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


//게시글 수정
function checkUpdate(updateCno, updateCwriter) {
	$.ajax({
		url : "${pageContext.request.contextPath}/cUpdateCheck",
		type : "post",
		data : {
			"cwriter" : updateCwriter
		},
		success : function(data) {
			if (data == 1) { // 작성자 일치
				var form = document.createElement('form'); // 폼객체 생성
				var objs;
				objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
				objs.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				objs.setAttribute('name', 'cno'); // 객체이름
				objs.setAttribute('value', updateCno); // 객체값
				console.log(updateCno);
				var objs2;
				objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				objs2.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				objs2.setAttribute('name', 'fromInsta'); // 객체이름
				objs2.setAttribute('value', 1); // 객체값
				form.appendChild(objs);
				form.appendChild(objs2);
				form.setAttribute('method', 'post'); // get,post 가능
				form.setAttribute('action', "${pageContext.request.contextPath}/cUpdateForm"); // 보내는 url
				document.body.appendChild(form);
				form.submit();
			} else { // 작성자 불일치
				alert("수정 권한이 없습니다");
			}
		}
	});
}

//게시글 삭제
function checkDelete(deleteCno, deleteCwriter) {
	$.ajax({
		url : "${pageContext.request.contextPath}/cDeleteCheck",
		type : "post",
		data : {
			"cwriter" : deleteCwriter
		},
		datatype : "json",
		success : function(data) {
			if (data == 1) {
				var form = document.createElement('form'); // 폼객체 생성
				var objs;
				objs = document.createElement('input'); // 값이 들어있는 녀석의 형식
				objs.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				objs.setAttribute('name', 'cno'); // 객체이름
				objs.setAttribute('value', deleteCno); // 객체값
				var objs2;
				objs2 = document.createElement('input'); // 값이 들어있는 녀석의 형식
				objs2.setAttribute('type', 'hidden'); // 값이 들어있는 녀석의 type
				objs2.setAttribute('name', 'fromInsta'); // 객체이름
				objs2.setAttribute('value', 1); // 객체값
				form.appendChild(objs);
				form.appendChild(objs2);
				form.setAttribute('method', 'post'); // get,post 가능
				form.setAttribute('action', "${pageContext.request.contextPath}/cDelete"); // 보내는 url
				document.body.appendChild(form);
				alert("삭제되었습니다");
				form.submit();
			} else {
				alert("삭제 권한이 없습니다");
			}
		}
	});
}

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

$("#btnrplyMy").on("click", function() {
	var rreport = $("input[name='rreport']:checked").val();
	$.ajax({
		url : "${pageContext.request.contextPath}/admin/reportRcommunity",
		type : "post",
		data : {
			"rrreason" : $("[name=rreport]:checked").val(),
			"rno" : $("#rreportRno").val()
		},
		success : function(data) {
			if (data > 0) {
				alert("신고 접수 되었습니다!");
			} else {
				alert("신고 접수 실패! 관리자에게 문의하세요!");
			}
			bgReportReply.remove();
			$("#modal_report_reply").css("display", "none");
			$(".reportChoice:checked").prop("checked", false);

		}
	});
})

function replyInsertMy() {
	var rcontent = $("#replyContent2").val();
	var cno = "";
	var flag = 0;
	if($("#modalInCno").val() == undefined) {     // moreInsta에서 들어옴
		console.log("moreInsta에서 들어옴");
		cno = $("#moreModalInCno").val();
		flag = 1;
	} else {                                      // 그냥 Insta에서 들어옴
		console.log("그냥 Insta에서 들어옴");
		cno = $("#modalInCno").val();
	}
	if (rcontent == "") {
		alert("댓글을 입력하세요");
	} else {
		$.ajax({
			url : "${pageContext.request.contextPath}/rcInsert",
			type : "post",
			data : {
				"rcontent" : rcontent,
				"cno" : cno
			},
			success : function(data) {
				bgReply.remove();
				alert("댓글 작성 완료");
				var replyHtml = "<ul style=\"zIndex:10000;\" class=\"reply-list\">";
				
				// 댓글 리스트 읽어오는 ajax
				$.ajax({
					url : "${pageContext.request.contextPath}/rcSelect",
					type : "post",
					data : {
						"cno" : cno
					},
					datatype : "json",
					success : function(data) {
						modalReplyFn('modal_reply');
						var json = JSON.parse(data);
						if(flag == 0) {		// 그냥 인스타에서 들어옴
							replyHtml +="<input id=\"modalInCno\" type=\"hidden\" value=\"" + cno +"\">";
							if (json.length > 0) {
								$.each(json, function(idx, reply) {
													replyHtml += "<li><div class=\"profile-wrap\">"
															+ "<img class=\"img-profile story\" src=\"../resources/assets/img/user.png\" alt=\"..\"></div><div class=\"profile-writer\">"
															+ "<span class=\"userID point-span\">" + reply.rwriter + "</span><span class=\"sub-span\">" + reply.rdate
															+ "</span><br><span class=\"content-span\">" + reply.rcontent + "</span></div><div class=\"replyDropdown\" style=\"float: right;\">"
															+ "<div class=\"icon-react icon-more\" style=\"background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);\">"
															+ "<div class=\"dropdown-content\"> <p class=\"reportReply\" onclick=\"rreport('"+ reply.rno + "')\">신고</p>"
															+ "<p class=\"deleteReply\" onclick=\"replyDeleteMy('" + reply.rno + "', '" + reply.cno + "', '" + reply.rwriter + "')\">삭제</p></div></li>";
												});
								replyHtml += "</ul>";
							} else {
								replyHtml = "<input id=\"modalInCno\" type=\"hidden\" value=\"" + replyCno +"\"><p>작성된 댓글이 없습니다.</p>";
							}
						} else if (flag == 1) {  // moreInsta에서 들어옴
							replyHtml += "<input id=\"moreModalInCno\" type=\"hidden\" value=\"" + cno +"\">";
							if (json.length > 0) {
								$.each(json, function(idx, reply) {
									replyHtml += "<li><div class=\"profile-wrap\">"
											+ "<img class=\"img-profile story\" src=\"../resources/assets/img/user.png\" alt=\"..\"></div><div class=\"profile-writer\">"
											+ "<span class=\"userID point-span\">" + reply.rwriter + "</span><span class=\"sub-span\">" + reply.rdate
											+ "</span><br><span class=\"content-span\">" + reply.rcontent + "</span></div><div class=\"replyDropdown\" style=\"float: right;\">"
											+ "<div class=\"icon-react icon-more\" style=\"background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);\">"
											+ "<div class=\"dropdown-content\"> <p class=\"reportReply\" onclick=\"rreport('"+ reply.rno + "')\">신고</p>"
											+ "<p class=\"deleteReply\" onclick=\"replyDelete2('" + reply.rno + "', '" + reply.cno + "', '" + reply.rwriter + "')\">삭제</p>"
											+ "</div></li>";
												});
								replyHtml += "</ul>";
							} else {
								replyHtml = "<input id=\"moreModalInCno\" type=\"hidden\" value=\"" + moreInstaCno +"\"><p>작성된 댓글이 없습니다.</p>";
							}
						}
						$("#replyList").html(replyHtml);
						$("#replyContent2").val("");
					}
				});
				
				// 화면에 댓글 숫자 변경
				if(flag ==0) {
					$.ajax({
						url : "${pageContext.request.contextPath}/replyCount",
						type : "post",
						data : {
							"cno" : cno
						},
						success : function(data) {
							var i = 0;
							while(true) {
								if($(".hiddenCno").eq(i).val() == cno) {
										$(".liveReplyCnt").eq(i).text(data);
									break;
								}
								i++;
							}
						}
					});
				} else if (flag ==1) {
					$.ajax({
						url : "${pageContext.request.contextPath}/replyCount",
						type : "post",
						data : {
							"cno" : cno
						},
						success : function(data) {
							console.log(data + "다녀온 결과값, 현재 댓글 개수");
							var i = 0;
							while(true) {
								console.log($(".hiddenCno").eq(i).val() + "바깥에 있는 게시글 번호");
								if($(".hiddenCno").eq(i).val() == cno) {
									$(".moreReplycnt ").eq(i - 10).text(data);
									break;
								}
								i++;	
							}
						}
					});
				}
			}
		});
	}
	
}

//댓글 삭제 : 원래 인스타
function replyDeleteMy(deleteRno, deleteCno, deleteRwriter) {
	if(${loginMember == null}) {
		alert("로그인 후 이용해주세요");
	} else {
		$.ajax({
			url : "${pageContext.request.contextPath}/rcDelete",
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
						url : "${pageContext.request.contextPath}/rcSelect",
						type : "post",
						data : {
							"cno" : deleteCno
						},
						datatype : "json",
						success : function(data) {
							modalReplyFn('modal_reply');
							var json = JSON.parse(data);
							if (json.length > 0) {
								replyHtml += "<input id=\"modalInCno\" type=\"hidden\" value=\"" + deleteCno +"\">";
								$.each(json, function(idx, reply) {
									replyHtml += "<li><div class=\"profile-wrap\">"
										+ "<img class=\"img-profile story\" src=\"../resources/assets/img/user.png\" alt=\"..\"></div><div class=\"profile-writer\">"
										+ "<span class=\"userID point-span\">" + reply.rwriter + "</span><span class=\"sub-span\">" + reply.rdate
										+ "</span><br><span class=\"content-span\">" + reply.rcontent + "</span></div><div class=\"replyDropdown\" style=\"float: right;\">"
										+ "<div class=\"icon-react icon-more\" style=\"background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);\">"
										+ "<div class=\"dropdown-content\"> <p class=\"reportReply\" onclick=\"rreport('"+ reply.rno + "')\">신고</p>"
										+ "<p class=\"deleteReply\" onclick=\"replyDeleteMy('" + reply.rno + "', '" + reply.cno + "', '" + reply.rwriter + "')\">삭제</p></div></li>";
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
						url : "${pageContext.request.contextPath}/replyCount",
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
</script>
</body>
</html>