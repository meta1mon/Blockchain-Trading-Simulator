<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/admin.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/noticeDetail.css"
	rel="stylesheet" type="text/css" />
<title>게시글 상세 보기</title>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
</head>
<%@include file="headerAndAside.jsp"%>
<body>
	<div id="detailWrapper" style="background-image:url(../resources/assets/img/bgpuple.png); background-repeat: no-repeat; background-size: 100% 200%;">
		<div id="detailOut">
			<div class="comm">
				커뮤니티
			</div>
			<br>
			<hr>
			<table id="table">
				<tr>
					<td>
						<div id="subject">${community.csubject }</div>
						<div id="writer">${community.cwriter }</div>
						<div id="date">${community.cdate }</div>
						<div id="viewcnt">
							<img src="../resources/assets/img/eye.png" id="eye">
							${community.viewcnt }
						</div>
						<div id="replycnt">
							<img src="../resources/assets/img/speechbubble.png" id="speechbubble">
							${community.replycnt }&nbsp;
						</div>
						<div id="likecnt">
							<img src="../resources/assets/img/undoLike.png" id="likey">
							${community.likecnt }&nbsp;
						</div> <br>
						<hr>
					</td>
				</tr>
				<tr>
					<td><br>
	
						<div id="content">
							${community.ccontent }<br>
							<div id="file">
	
								<c:forTokens var="fileName" items="${community.filepath}"
									delims="," varStatus="st">
									<a download="${fileName}"
										href="${pageContext.request.contextPath}/resources/uploadFiles/${community.filepath}">${fileName}</a>
									<c:if test="${!st.last }">
	                        /
	                    </c:if>
									<br>
								</c:forTokens>
								<c:url var="cupdate" value="cUpdateForm">
									<c:param name="cno" value="${community.cno}" />
									<c:param name="page" value="${currentPage}" />
								</c:url>
								<c:url var="cdelete" value="cDelete">
									<c:param name="cno" value="${community.cno}" />
								</c:url>
								<button type="button" class="report" id="popup_open_btn">신고</button>
								<button type="button" class="delete" onclick="location.href='${cdelete}'">삭제</button>
								<button type="button" class="update" onclick="location.href='${cupdate}'">수정</button>
							</div>
						</div></td>
				</tr>
			</table>
	
			<br>
			<h4>
				<span id="replycnt2">전체 댓글
					<p style="color: #FFC000; display: inline;">(${commentList.size()})</p>개
				</span>
			</h4>
			<c:if test="${!empty commentList}">
				<c:forEach var="rep" items="${commentList}">
					<div id="comment">
						<hr>
						<input type="hidden" id="rep_id" name="rep_id" value="${rep.rno}">
						<h4 class="comment-head">작성자 : ${rep.rwriter} &nbsp; &nbsp;
							작성일 : ${rep.rdate}</h4>
						<div class="comment-body">
							<p>${rep.rcontent}</p>
						</div>
						<button type="button" class="rupdateConfirm" name="updateConfirm"
							id="rupdateConfirm" style="display: none;">수정완료</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="rdelete" name="delete" id="rdelete" style="display: none;">삭제하기</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="rupdate" name="update" id="rupdate">수정 및 삭제</button>
						<button type="button" class="report" id="popup_open_btn_reply">신고</button>
					</div>
					<br>
					<br>
				</c:forEach>
			</c:if>
			<hr>
	
			<div>
				<c:if test="${loginMember != null }">
					<form action="rcInsert" id="replyForm" method="get">
						<div class="comment-box">
							<input type="hidden" name="cno" value="${community.cno }">
							<input type="hidden" id="page" name="page" value="${currentPage}">
							<textarea placeholder="댓글 쓰기" id="editor" name="rcontent"
								maxlength="4000"
								onfocus="if(this.value == '댓글 쓰기') { this.value = ''; }"
								onblur="if(this.value == '') { this.value ='댓글 쓰기'; }"
								style="display: inline;"></textarea>
							<script>
								ClassicEditor
								.create( document.querySelector( '#editor' ), {
								    cloudServices: {
								        tokenUrl: 'https://81478.cke-cs.com/token/dev/de0d9159dc2b7ce3ecb85191c28f789217b087f58ae6880e30d89820724d',
								        uploadUrl: 'https://81478.cke-cs.com/easyimage/upload/'
								    }
								} )
								.catch( error => {
								    console.error( error );
								} );
								</script>
							<button type="submit" id="rsubmit">등록</button>
						</div>
					</form>
				</c:if>
				<c:if test="${loginMember == null }">
					<div id="needlogin">&nbsp;&nbsp;&nbsp;댓글을 작성하려면 로그인이 필요합니다.</div>
				</c:if>
			</div>
			<hr>
			<c:url var="clist" value="clist">
				<c:param name="page" value="${currentPage}" />
			</c:url>
			<button type="button" id="list" onclick="location.href='${clist}'">목록으로
				돌아가기</button>
	
			<!-- 게시글 신고 모달창 -->
			<div id="my_modal">
				<form action="creport" name="creport" method="post">
					<p>게시글 신고</p>
					<div class="modal_report_div">
						<input type="radio" id="reportChoice1" class="reportChoice" name="creport" value="1">
						<label for="reportChoice1" class="modal_choise_label">나체 이미지 또는 성적 행위</label> <br> 
						
						<input type="radio" id="reportChoice2" class="reportChoice" name="creport" value="2">
						<label for="reportChoice2" class="modal_choise_label">혐오 발언 또는 폭력적</label> <br> 
						
						<input type="radio" id="reportChoice3" class="reportChoice" name="creport" value="3">
						<label for="reportChoice3" class="modal_choise_label">증오 또는 학대</label> <br>
						
						<input type="radio" id="reportChoice4" class="reportChoice" name="creport" value="4">
						<label for="reportChoice4" class="modal_choise_label">유해하거나 위험한 행위</label> <br> 
						
						<input type="radio" id="reportChoice5" class="reportChoice" name="creport" value="5"> 
						<label for="reportChoice5" class="modal_choise_label">스팸 또는 사용자 현혹</label> <br> 
						
						<input type="radio" id="reportChoice6" class="reportChoice" name="creport" value="6"> 
						<label for="reportChoice6" class="modal_choise_label">마음에 들지 않습니다.</label>
					</div>
					<hr style="width: 328px; position: relative; right: 30px; top: 20px;">
					<div>
						<button type="button" id="btncancel" class="modal_close_btn">취소</button>
						<button type="submit" id="btnreport" class="modal_report_btn">신고</button>
					</div>
				</form>
			</div>
			
			<!-- 댓글 신고 모달창 -->
			<div id="my_modal_reply">
				<form action="creport" name="rcreport" method="post">
					<p>댓글 신고</p>
					<div class="modal_report_div">
						<input type="radio" id="reportChoice1" class="reportChoice" value="1">
						<label for="reportChoice1" class="modal_choise_label">나체 이미지 또는 성적 행위</label> <br> 
						
						<input type="radio" id="reportChoice2" class="reportChoice" value="2">
						<label for="reportChoice2" class="modal_choise_label">혐오 발언 또는 폭력적</label> <br> 
						
						<input type="radio" id="reportChoice3" class="reportChoice" value="3">
						<label for="reportChoice3" class="modal_choise_label">증오 또는 학대</label> <br>
						
						<input type="radio" id="reportChoice4" class="reportChoice" value="4">
						<label for="reportChoice4" class="modal_choise_label">유해하거나 위험한 행위</label> <br> 
						
						<input type="radio" id="reportChoice5" class="reportChoice" value="5"> 
						<label for="reportChoice5" class="modal_choise_label">스팸 또는 사용자 현혹</label> <br> 
						
						<input type="radio" id="reportChoice6" class="reportChoice" value="6"> 
						<label for="reportChoice6" class="modal_choise_label">마음에 들지 않습니다.</label>
					</div>
					<hr style="width: 328px; position: relative; right: 30px; top: 20px;">
					<div>
						<button type="button" id="btncancel" class="modal_close_btn">취소</button>
						<button type="submit" id="btnreport" class="modal_report_btn">신고</button>
					</div>
				</form>
			</div>
		</div>
	<br><br><br><br><br><br><br><br><br>
	</div>
	<script>
	function modal(id) {
        var zIndex = 9999;
        var modal = document.getElementById(id);

        // 모달 div 뒤에 희끄무레한 레이어
        var bg = document.createElement('div');
        bg.setStyle({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.8)'
        });
        document.body.append(bg);

        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        modal.querySelector('.modal_close_btn').addEventListener('click', function() {
            bg.remove();
            modal.style.display = 'none';
        });

        modal.setStyle({
            position: 'fixed',
            display: 'block',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.6), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        });
    }

    // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
    Element.prototype.setStyle = function(styles) {
        for (var k in styles) this.style[k] = styles[k];
        return this;
    };

    document.getElementById('popup_open_btn').addEventListener('click', function() {
        // 모달창 띄우기
        modal('my_modal');
    });
    
    document.getElementById('popup_open_btn_reply').addEventListener('click', function() {
        // 모달창 띄우기
        modal('my_modal_reply');
    });
    

    </script>
    
    
	<script>
    $(function(){
    	// 댓글 Insert Script
    	$('#replyForm').on('submit', function(event){
    		if($('#reply_contents').val() == ""){
    			alert(" 내용을 입력해주세요.");
    			event.preventDefault();
    		} else {
    			$('#comments').val($('#reply_contents').val());
    			return true;
    		}
    	});
	
//기존 댓글 수정 & 삭제
$(".update").on('click',function(){
	var parentP = $(this).parent();
		var parentDiv = parentP.parent();
		var commBody = paren tDiv.children('.comment-body');
	var content = commBody.children('p').text().trim();
	
		if($(this).text() == "수정 및 삭제"){
			commBody.append('<textarea style="margin top:7px;" rows="4" cols="70%" class="updateContent" name="updateContent" id="updateContent">'+content+'</textarea>');
			parentDiv.children('.comment-confirm').show();
			parentP.children(".delete").toggle("fast");
			parentP.children(".updateConfirm").toggle("fast");
			$(this).text("수정취소");
		} else {
			commBody.children(".updateContent").remove();
			parentDiv.children('.comment-confirm').hide();
			$(this).text("수정 및 삭제");
			parentP.children(".delete").toggle("fast");
			parentP.children(".updateConfirm").toggle("fast");
		}
});

	$(".updateConfirm").on('click',function(){
		var parentP = $(this).parent();
			var parentDiv = parentP.parent();
			if(parentDiv.find('input[name=pwd_chk]').val()!=
				parentDiv.children('input[name=rep_pwd]').val()){
					alert(" 비밀번호가 일치하지 않습니다.");
					return false;
				} else {
$.ajax({
url : "${pageContext.request.contextPath}/rcUpdate",
method : "POST",
async : false,
data: {
comment_id : parentDiv.find("input[name=rep_id]").val(),
comments : parentDiv.find('.updateContent').val()
},
success : function(data) {
alert(data);
parentDiv.find(".comment-body p").text(parentDiv.find('.updateContent').val());
}, error : function(request,status,error) {
	
alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
			
parentDiv.find(".updateContent").remove();
parentDiv.find(".comment confirm").val("");
parentDiv.find(".comment confirm").hide();
parentP.children(".updateConfirm").toggle("fast");
parentP.children(".delete").toggle("fast");
parentP.children('.update').text("수정 및 삭제");
$(".delete").on('click',function(){
	var parentP = $(this).parent();
		var parentDiv = parentP.parent();
		
		if(parentDiv.find('input[name=pwd_chk]').val() !=
parentDiv.children('input[name=rep_pwd]').val()){
		alert(" 비밀번호가 일치하지 않습니다.");
		return false;
	} else {
	$.ajax({
			url : "${pageContext.request.contextPath}/rcDelete",
			method : "POST",
			data: {
			comment_id : parentDiv.find("input[name=rep_id]").val(),
			comment_pwd : parentDiv.find('input[name =pwd_chk]').val()
			},
			success : function(data) {
			alert(data);
			parentDiv.remove();
			}, error : function(request,status,error){
				
alert("code:"+request.status+" n"+"message:"+request.responseText+" n"+"error:"+error);
			}
});
	}
});
	});
</script>
</body>
</html>