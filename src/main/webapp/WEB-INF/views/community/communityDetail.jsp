<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<script
	src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
* {
	font-weight: lighter
}

.ck.ck-editor {
	max-width: 1000px;
	min-width: 1000px;
	margin-left: 20px;
	position: relative;
	top: 6px;
}

.ck-editor__editable {
	min-height: 90px;
}

.ck.ck-toolbar {
	background: white;
}

.ck


.ck-editor__main
>
.ck-editor__editable


:not

 

(
.ck-focused

 

)
{
border


:

 

none


;
}
.comm {
	margin: 40px 0 20px 20px;
	text-align: left;
	font-size: 25px;
	color: #FFC000;
	float: left;
}

#table {
	border: none;
	width: 1200px;
	margin: 0 auto;
}

#table tr {
	border-bottom: 1px solid #eeeeee;
}

#writer {
	margin: 10px 10px 18px 0;
	float: left;
	color: black;
	display: inline;
}

#date, #rqdate {
	font-size: 14px;
	color: #999;
	display: inline;
	position: relative;
	top: 9px;
	left: 5px;
}

#viewcnt {
	float: right;
	position: relative;
	right: 20px;
	bottom: 28px
}

#eye {
	position: relative;
	right: 2px;
	top: 12px;
}

#replycnt {
	float: right;
	position: relative;
	right: 26px;
	bottom: 19px;
}

#speechbubble {
	position: relative;
	right: 5px;
	top: 7px;
}

#likecnt {
	float: right;
	position: relative;
	right: 46px;
	bottom: 19px;
}

#likey {
	position: relative;
	right: 4px;
	top: 5px;
}

#subject {
	margin: 20px 0 0 0;
	text-align: left;
	clear: both;
	font-size: 20px;
	color: black;
}

#likeid {
	width: 55px;
	float: left;
	margin: 0;
	position: relative;
	top: 40px;
	font-size: 18px;
}

#content {
	color: black;
	width: 100%;
	text-align: left;
	word-wrap: break-word;
	padding: 15px 0;
}

#rcontent {
	color: black;
	width: 100%;
	text-align: left;
	background-color: #FAFAFA;
	word-wrap: break-word;
	float: right;
	padding: 20px;
}

.comment-box {
	margin: 0 auto;
	background-color: #FAFAFA;
	padding: 20px 0 35px 0;
	width: 1200px;
	border-bottom: 1px solid #999;
}

#file {
	clear: both;
	padding: 10px 0;
	text-align: left;
}

#like {
	width: 55px;
	margin: 0 auto;
	font-size: 18px;
	position: relative;
	left: 500px;
	display: inline;
	color: #d31900;
}

#dislike {
	width: 55px;
	margin: 0 auto;
	font-size: 18px;
	position: relative;
	left: 500px;
	display: inline;
}

.img_like {
	width: 50px;
	position: relative;
	top: 15px;
	cursor: pointer;
}

.img_dislike {
	width: 50px;
	position: relative;
	top: 15px;
	cursor: pointer;
}

hr {
	/* background-color:#black;
   border: 1px solid #black; */
	width: 1200px;
	margin: auto;
}

#replycnt2 {
	position: relative;
	left: 18px;
	isplay: inline;
}

#rsubmit {
	position: relative;
	right: 25px;
	bottom: 85px;
	float: right;
	width: 125px;
	height: 45px;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #ffffff;
	background-color: #B85CEF;
	font-size: 19px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#list {
	margin: 50px auto 20px auto;
	width: 175px;
	padding: 5px;
	border: 1px solid #eeeeee;
	border-radius: 4px;
	text-align: center;
	background-color: #ffffff;
	font-size: 18px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
	position: relative;
	left: 43%;
}

.update {
	width: 70px;
	height: 35px;
	padding: 5px;
	border: none;
	border-radius: 4px;
	text-align: center;
	background-color: #ffffff;
	font-size: 18px;
	float: right;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

.delete {
	width: 70px;
	height: 35px;
	padding: 5px;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #d31900;
	background-color: #ffffff;
	font-size: 18px;
	float: right;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#comment {
	width: 1160px;
	margin: 0 40px 0 40px;
	border-top: 1px solid #eeeeee;
}

.comment_writer {
	display: inline;
	word-break: break-all;
}

.comment_content {
	display: inline;
	word-break: break-all;
}

.comment_date {
	display: inline;
	font-size: 14px;
	color: #999;
}

.report {
	width: 70px;
	height: 35px;
	padding: 5px;
	border: none;
	border-radius: 4px;
	text-align: center;
	background-color: #ffffff;
	font-size: 18px;
	float: right;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#rsubmit:hover, #rsubmit:active {
	background-color: #CC70EF;
	box-shadow: 10px 10px 20px 5px #eeeeee;
}

#list:hover, #list:active {
	color: #2c3e50;
	background-color: #ffffff;
}

.delete:active, .delete:hover, .update:hover, .update:active, #list:hover,
	#list:active, .report:hover, .report:active {
	box-shadow: 10px 10px 20px 5px #eeeeee;
}

#needlogin {
	margin: 10px auto 0 auto;
	width: 1200px;
	line-height: 200px;
	text-align: left;
	color: black;
	font-size: 30px;
	box-shadow: 5px 5px 10px 5px #eeeeee;
}

#my_modal, #my_modal_reply {
	display: none;
	width: 270px;
	height: 320px;
	padding: 30px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 5px;
	transition: all 0.3s ease;
}

.modal_report_div {
	margin-top: 10px;
}

#my_modal .modal_close_btn, #my_modal_reply .modal_close_btn {
	position: absolute;
	bottom: 20px;
	right: 65px;
	border: none;
	background-color: #fefefe;
	font-size: 16px;
	padding: 3px 10px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#my_modal .modal_report_btn, #my_modal_reply .modal_report_btn {
	position: absolute;
	bottom: 20px;
	right: 15px;
	border: none;
	background-color: #fefefe;
	color: #065fd4;
	font-size: 16px;
	padding: 3px 10px;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#my_modal .modal_close_btn:hover, #my_modal .modal_report_btn:hover {
	background-color: #ffffff;
	box-shadow: 5px 5px 10px 3px #eeeeee;
}

.reportChoice {
	margin: 13px 0;
}

.modal_choise_label {
	margin: 10px;
}
</style>
</head>

<%@include file="../main/header.jsp"%>
<body class="content"
	style="background-image: url(resources/assets/img/bgpuple.png); background-repeat: no-repeat; background-size: 100% 200%;">
	<div
		style="width: 1240px; background-color: #ffffff; margin: 70px auto; padding: 20px; border-radius: 4px;">
		<div class="comm">커뮤니티</div>
		<br>

		<script>
			var rno = 0;
			function rreport(nowRno) {
  				 rno = nowRno;
  				 console.log(rno);
  				  modalFn('my_modal_reply');
   
			}
		</script>
		<!-- 게시글 제목 부분 -->
		<hr style="position: relative; top: 7px;">
		<table id="table">
			<tr>
				<td>
					<div id="subject">${community.csubject }</div>
					<div id="writer">${community.cwriter }</div>
					<div id="date">${community.cdate }</div> <!-- 게시글 조회수, 댓글수, 추천수 -->
					<div id="viewcnt">
						<img src="resources/assets/img/eye.png" id="eye">
						${community.viewcnt }
					</div>
					<div id="replycnt">
						<img src="resources/assets/img/speechbubble.png" id="speechbubble">
						${community.replycnt }&nbsp;
					</div>
					<div id="likecnt">
						<img src="resources/assets/img/thumb-up.png" id="likey">
						${community.likecnt }&nbsp;
					</div> <br>
					<hr>
				</td>
			</tr>
			<tr>
				<td><br> <!-- 게시글 내용 -->
					<div id="content">
						${community.ccontent }<br>
						<!-- 게시글 첨부 파일 다운로드 -->
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
							<br> <br> <br> <br> <br>
							<div id="like">
								<span class="likecnt">${community.likecnt }</span>&nbsp;&nbsp;&nbsp;<img
									class="img_like" src="resources/assets/img/like.png"
									onclick="like(${community.cno})">
							</div>
							&nbsp;&nbsp;&nbsp;
							<div id="dislike">
								<img class="img_dislike" src="resources/assets/img/dislike.png"
									onclick="dislike(${community.cno})">&nbsp;&nbsp;&nbsp;<span
									class="dislikecnt">${community.dislikecnt }</span>
							</div>
							<!-- 게시글 신고, 삭제, 수정 버튼 -->
						</div>
						<button type="button" class="report" id="popup_open_btn">신고</button>
						<button type="button" class="delete"
							onclick="location.href='${cdelete}'">삭제</button>
						<button type="button" class="update"
							onclick="location.href='${cupdate}'">수정</button>
					</div></td>
			</tr>
		</table>

		<br>
		<!-- 댓글 리스트 -->
		<h4>
			<span id="replycnt2">전체 댓글 <span style="color: #FFC000;">${commentList.size()}</span>개
			</span>
		</h4>
		<hr style="position: relative; top: 1px;">
		<c:if test="${!empty commentList}">
			<c:forEach var="rep" items="${commentList}">
				<div id="comment">
					<br>
					<!-- 댓글 작성자명, 내용, 날짜 -->
					<input type="hidden" id="rep_id" name="rep_id" value="${rep.rno}">
						<span style="display:inline;">
						<span class="comment_writer">
							${rep.rwriter} &nbsp; &nbsp;</span>
						<span class="comment_date">
							${rep.rdate}</span>
						<span class="comment_writer">
							${rep.rcontent}</span>
						
							</span>
					<!-- 댓글 수정, 삭제, 신고 버튼 -->
					<button type="button" class="rupdateConfirm" name="updateConfirm"
						id="rupdateConfirm" style="display: none;">수정완료</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" class="rdelete" name="delete" id="rdelete"
						style="display: none;">삭제하기</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" class="rupdate" name="update" id="rupdate">수정
						및 삭제</button>
					<button type="button" class="report" id="popup_open_btn_reply"
						onclick="rreport(${rep.rno})">신고</button>
				</div>

				<br>
			</c:forEach>
		</c:if>
		<hr>

		<!-- 댓글 작성 영역 -->
		<div>
			<c:if test="${loginMember != null }">
				<form action="rcInsert" id="replyForm" method="get">
					<div class="comment-box">
						<input type="hidden" name="cno" value="${community.cno }">
						<input type="hidden" id="page" name="page" value="${currentPage}">
						<textarea placeholder="댓글 쓰기" id="editor" name="rcontent"
							maxlength="4000"
							onfocus="if(this.value == '댓글 쓰기') { this.value = ''; }"
							onblur="if(this.value == '') { this.value ='댓글 쓰기'; }"></textarea>
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
		<c:url var="clist" value="clist">
			<c:param name="page" value="${currentPage}" />
		</c:url>

		<button type="button" id="list" onclick="location.href='${clist}'">목록으로
			돌아가기</button>

		<!-- 게시글 신고 모달창 -->
		<div id="my_modal">
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
						type="hidden" name="csubject" value="${community.csubject }" /> <input
						type="hidden" name="cwriter" value="${community.cwriter }" /> <input
						type="hidden" name="ccontent" value="${community.ccontent }" /> <input
						type="hidden" name="cno" value="${community.cno }" />
				</div>
				<hr
					style="width: 328px; position: relative; right: 30px; top: 20px;">
				<div>
					<button type="button" id="btncancel" class="modal_close_btn">취소</button>
					<button type="submit" id="btnreport" class="modal_report_btn">신고</button>
				</div>
			</form>
		</div>

		<script>

      </script>


		<!-- 댓글 신고 모달창 -->
		<div id="my_modal_reply">
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
			<hr style="width: 328px; position: relative; right: 30px; top: 20px;">
			<div>
				<button type="button" id="btncancel" class="modal_close_btn">취소</button>
				<button type="button" id="btnrply" class="modal_report_btn">신고</button>
			</div>
		</div>

		<!-- 댓글 신고 ajax -->
		<script>

      </script>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<script>
   var bg = null;
   var modal = null;
   function modalFn(id) {
        var zIndex = 9999;
        modal = document.getElementById(id);

        // 모달 div 뒤에 희끄무레한 레이어
        bg = document.createElement('div');
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
        modalFn('my_modal');
    });
    
// 게시글 신고 부분
      <!-- 게시글 신고 전송 ajax -->
      $("#btnreport").on("click", function() {
         var dataList = $("#frmC").serialize();
         $.ajax({
            url : "${pageContext.request.contextPath}/admin/reportCommunity",
            type : "post",
            data : dataList,
            success : function(data) {
               if(data > 0) {
                  alert("신고 접수 되었습니다!");
               } else {
                  alert("신고 접수 실패! 관리자에게 문의하세요!");                  
               }
               bg.remove();
               modal.style.display = 'none';
               
            }
         });
      });
    
    
    
// 댓글 신고 부분
    $("#btnrply").on("click", function() {
  	  var rreport = $("input[name='rreport']:checked").val();
       $.ajax({
          url : "${pageContext.request.contextPath}/admin/reportRcommunity",
          type : "post",
          data : {"rrreason" : rreport,
          	"rno" : rno},
          success : function(data) {
             if(data > 0) {
                alert("신고 접수 되었습니다!");
             } else {
                alert("신고 접수 실패! 관리자에게 문의하세요!");                  
             }
             bg.remove();
             modal.style.display = 'none';
             
          }
       });
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
      var commBody = parentDiv.children('.comment-body');
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
<%@include file="../main/footer.jsp"%>
</html>