let bg = null;
let modal = null;

// 모달창 실행시키는 함수
var cno = 0;
var rno = 0;

let replyCno = "";

// 처음 인스타에서 댓글 리스트 불러오기
function reply(idx) {
	var replyHtml = "<ul style=\"zIndex:10000;\" class=\"reply-list\">"
	replyCno = $(".hiddenCno").eq(idx).val();
	$.ajax({
			url : "rcSelect",
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
												+ "<img class=\"img-profile story\" src=\"resources/assets/img/user.png\" alt=\"..\"></div><div class=\"profile-writer\">"
												+ "<span class=\"userID point-span\">" + reply.rwriter + "</span><span class=\"sub-span\">" + reply.rdate
												+ "</span><br><span class=\"content-span\">" + reply.rcontent + "</span></div><div class=\"replyDropdown\" style=\"float: right;\">"
												+ "<div class=\"icon-react icon-more\" style=\"background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);\">"
												+ "<div class=\"dropdown-content\"> <p class=\"reportReply\" onclick=\"rreport('"+ reply.rno + "')\">신고</p>"
												+ "<p class=\"deleteReply\" onclick=\"replyDelete1('" + reply.rno + "', '" + reply.cno + "', '" + reply.rwriter + "')\">삭제</p></div></li>";
									});
					replyHtml += "</ul>";
				} else {
					replyHtml = "<input id=\"modalInCno\" type=\"hidden\" value=\"" + replyCno +"\"><p>작성된 댓글이 없습니다.</p>";
				}
				$("#replyList").html(replyHtml);
			}
		});
}

// moreInsta에서 댓글 리스트 불러오기
function reply2(moreInstaCno) {
	var replyHtml = "<ul style=\"zIndex:10000;\" class=\"reply-list\">"
	$.ajax({
		url : "rcSelect",
		type : "post",
		data : {
			"cno" : moreInstaCno
		},
		datatype : "json",
		success : function(data) {
			replyHtml += "<input id=\"moreModalInCno\" type=\"hidden\" value=\"" + moreInstaCno +"\">";
			modalReplyFn('modal_reply');
			var json = JSON.parse(data);
			if (json.length > 0) {
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
				replyHtml = "<input id=\"moreModalInCno\" type=\"hidden\" value=\"" + moreInstaCno +"\"><p>작성된 댓글이 없습니다.</p>";
			}
			$("#replyList").html(replyHtml);
		}
	});
}

// 게시글 수정
function checkUpdate(updateCno, updateCwriter) {
	$.ajax({
		url : "cUpdateCheck",
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
				form.setAttribute('action', "cUpdateForm"); // 보내는 url
				document.body.appendChild(form);
				form.submit();
			} else { // 작성자 불일치
				alert("수정 권한이 없습니다");
			}
		}
	});
}

// 게시글 삭제
function checkDelete(deleteCno, deleteCwriter) {
	$.ajax({
		url : "cDeleteCheck",
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
				form.setAttribute('action', "cDelete"); // 보내는 url
				document.body.appendChild(form);
				alert("삭제되었습니다");
				form.submit();
			} else {
				alert("삭제 권한이 없습니다");
			}
		}
	});
}
// 게시글, 댓글 드랍다운 메뉴 클릭 시 열기/닫기
$('.dropdown').click(function() {
			console.log("클릭함");
			console.log("클릭dropdown 상위 article idx: "	+ $(this).parents('article').index());
			$('.dropdown-content').eq($(this).parents('article').index()).show();
		});

// moreInsta에서 댓글 드랍다운 만들기
function moreDropdown(idx) {
	console.log(idx);
	$('.dropdown-content').eq(idx).css("display", "block");
}

$(document).mouseup(function(e) {
	var dropdown = $('.ddcontent');
	var replyDropdownBtn = $('.replyDropdown');
	var containerReply = $('#modal_reply'); // 댓글 모달창
	var containerReport = $('#modal_report'); // 게시글 신고 모달창
	var containerReportReply = $('#modal_report_reply'); // 댓글 신고 모달창

	if (dropdown.has(e.target).length === 0) {
		dropdown.css('display', 'none');
	}
	if (containerReport.has(e.target).length === 0) {
		containerReport.css('display', 'none');
		if (bg != null) {
			bg.remove();
		}
		if (modal != null) {
			modal.style.display = 'none';

		}
	}
	if (containerReportReply.has(e.target).length === 0) {
		containerReportReply.css('display', 'none');
		if (bgReportReply != null) {
			bgReportReply.remove();
		}
		if (modalReportReply != null) {
			modalReportReply.style.display = 'none';
		}
	}
});

// 게시글 신고 부분
$("#btnreport").on("click", function() {
	$.ajax({
		url : "admin/reportCommunity",
		type : "post",
		data : {
			"cno" : $("#creportCno").val(),
			"creport" : $("[name=creport]:checked").val()
		},
		success : function(data) {
			if (data > 0) {
				alert("신고 접수 되었습니다!");
			} else {
				alert("신고 접수 실패! 관리자에게 문의하세요!");
			}
			bg.remove();
			$("#modal_report").css("display", "none");
			$(".reportChoice:checked").prop("checked", false);

		}
	});
})

// 댓글 신고 부분
$("#btnrply").on("click", function() {
	var rreport = $("input[name='rreport']:checked").val();
	$.ajax({
		url : "admin/reportRcommunity",
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

// 모달 밖의 댓글 삽입. 원래 인스타
function replyInsert1(Idx) {
	var rcontent = $(".replyContent1").eq(Idx).val();
	var cno = $(".replyInsertCno1").eq(Idx).val();
	if (rcontent == "") {
		alert("댓글을 입력하세요");
	} else {
		$.ajax({
			url : "rcInsert",
			type : "post",
			data : {
				"rcontent" : rcontent,
				"cno" : cno
			},
			success : function(data) {
				alert("댓글 작성 완료");
				window.location.reload();
			}
		})
	}

}

// 모달 밖의 댓글 삽입. moreInsta
function replyInsert3(thisObject, outModalCno) {
	var thisIdx = $(window.event.target).parents('article').index();
	var rcontent = $(window.event.target).prev().val();
	
	if (rcontent == "") {
		alert("댓글을 입력하세요");
	} else {
		$.ajax({
			url : "rcInsert",
			type : "post",
			data : {
				"rcontent" : rcontent,
				"cno" : outModalCno
			},
			success : function(data) {
				alert("댓글 작성 완료");
				$.ajax({
					url : "replyCount",
					type : "post",
					data : {
						"cno" : outModalCno
					},
					success : function(data) {
						var nowReplyCnt = $(".moreReplycnt").eq(thisIdx).text();
						$(".moreReplycnt").eq(thisIdx).text(nowReplyCnt*1 + 1);
						// 기존의 글이 10개라 10개를 더함. 처음 글이 5개면 5개 더해야 함
						$(".input-comment").eq(thisIdx+10).val(" ");
					}
				})
			}
		});
	}
	
}

// 모달 안의 댓글 삽입. 원래와 추가 인스타 공통
function replyInsert2() {
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
			url : "rcInsert",
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
					url : "rcSelect",
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
															+ "<img class=\"img-profile story\" src=\"resources/assets/img/user.png\" alt=\"..\"></div><div class=\"profile-writer\">"
															+ "<span class=\"userID point-span\">" + reply.rwriter + "</span><span class=\"sub-span\">" + reply.rdate
															+ "</span><br><span class=\"content-span\">" + reply.rcontent + "</span></div><div class=\"replyDropdown\" style=\"float: right;\">"
															+ "<div class=\"icon-react icon-more\" style=\"background-image: url(https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/bearu/more.png);\">"
															+ "<div class=\"dropdown-content\"> <p class=\"reportReply\" onclick=\"rreport('"+ reply.rno + "')\">신고</p>"
															+ "<p class=\"deleteReply\" onclick=\"replyDelete1('" + reply.rno + "', '" + reply.cno + "', '" + reply.rwriter + "')\">삭제</p></div></li>";
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
						url : "replyCount",
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
						url : "replyCount",
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



/* 게시글 신고 모달 */

function modalFn(id) {
	var zIndex = 9999;
	modal = document.getElementById(id);
	// 모달 div 뒤에 희끄무레한 레이어
	bg = document.createElement('div');
	bg.setStyle({
		position : 'fixed',
		zIndex : zIndex,
		left : '0px',
		top : '0px',
		width : '100%',
		height : '100%',
		overflow : 'auto',
		// 레이어 색갈은 여기서 바꾸면 됨
		backgroundColor : 'rgba(0,0,0,0.3)'
	});
	document.body.append(bg);

	// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	modal.querySelector('.modal_close_btn').addEventListener('click',
			function() {
				bg.remove();
				modal.style.display = 'none';
			});

	modal.setStyle({
			position : 'fixed',
			display : 'block',
			boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

			// 시꺼먼 레이어 보다 한칸 위에 보이기
			zIndex : zIndex + 1,

			// div center 정렬
			top : '50%',
			left : '50%',
			transform : 'translate(-50%, -50%)',
			msTransform : 'translate(-50%, -50%)',
			webkitTransform : 'translate(-50%, -50%)'
		});
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
	for ( var k in styles)
		this.style[k] = styles[k];
	return this;
}

/* 댓글 신고 모달 */
var bgReportReply = null;
var modalReportReply = null;
function modalReportReplyFn(id) {
	var zIndex = 9999;
	modalReportReply = document.getElementById(id);

	// 모달 div 뒤에 희끄무레한 레이어
	bgReportReply = document.createElement('div');
	bgReportReply.setStyle({
		position : 'fixed',
		zIndex : zIndex,
		left : '0px',
		top : '0px',
		width : '100%',
		height : '100%',
		overflow : 'auto',
		// 레이어 색갈은 여기서 바꾸면 됨
		backgroundColor : 'rgba(0,0,0,0.3)'
	});
	document.body.append(bgReportReply);

	// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	modalReportReply.querySelector('.modal_close_btn').addEventListener(
			'click', function() {
				bgReportReply.remove();
				modalReportReply.style.display = 'none';
			});

	modalReportReply
			.setStyle({
				position : 'fixed',
				display : 'block',
				boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

				// 시꺼먼 레이어 보다 한칸 위에 보이기
				zIndex : zIndex + 1,

				// div center 정렬
				top : '50%',
				left : '50%',
				transform : 'translate(-50%, -50%)',
				msTransform : 'translate(-50%, -50%)',
				webkitTransform : 'translate(-50%, -50%)'
			});
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
	for ( var k in styles)
		this.style[k] = styles[k];
	return this;
}

/* 댓글 모달 */
var bgReply = null;
var modalReply = null;
function modalReplyFn(id) {
	var zIndex = 9998;
	modalReply = document.getElementById(id);

	// 모달 div 뒤에 희끄무레한 레이어
	bgReply = document.createElement('div');
	bgReply.setStyle({
		position : 'fixed',
		zIndex : zIndex,
		left : '0px',
		top : '0px',
		width : '100%',
		height : '100%',
		overflow : 'auto',
		// 레이어 색갈은 여기서 바꾸면 됨
		backgroundColor : 'rgba(0,0,0,0.1)'
	});
	document.body.append(bgReply);

	// 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	   modalReply.querySelector('.modal_reply_close_btn').addEventListener(
		         'click', function() {
		            $("#replyContent2").val("");
		            bgReply.remove();
		            modalReply.style.display = 'none';
		         });


	modalReply
			.setStyle({
				position : 'fixed',
				display : 'block',
				boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.1), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

				// 시꺼먼 레이어 보다 한칸 위에 보이기
				zIndex : zIndex + 1,

				// div center 정렬
				top : '50%',
				left : '50%',
				transform : 'translate(-50%, -50%)',
				msTransform : 'translate(-50%, -50%)',
				webkitTransform : 'translate(-50%, -50%)'
			});
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
	for ( var k in styles)
		this.style[k] = styles[k];
	return this;
}
