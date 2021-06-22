<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세 보기</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/28.0.0/classic/ckeditor.js"></script>

<style>

.ck.ck-editor {
	max-width: 1000px;
	min-width: 1000px;
}

.ck-editor__editable {
	min-height: 90px;
}

.ck.ck-toolbar {
	background:white;
}

.ck.ck-editor__main>.ck-editor__editable:not (.ck-focused ) {
	border: none;
}

.comm {
	margin: 40px 0 20px 20px;
	text-align: left;
	font-size: 25px;
	color: #8C66C8;
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
	color: #2c3e50;
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

#replycnt2 {
	position: relative;
	left: 18px;
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
	right: 10px;
	top: 7px;
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
	padding:20px 0;
	width: 1200px;
}

#file {
	clear: both;
	padding: 10px 0;
	text-align: left;
}

hr {
	/* background-color:#black;
	border: 1px solid #black; */
	width: 1200px;
	margin: auto;
}

#rsubmit {
	width: 125px;
	height: 35px;
	float: right;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #ffffff;
	background-color: #B85CEF;
	font-size: 18px;
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
	color: black;
	background-color: #ffffff;
	font-size: 18px;
	float: right;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#delete {
	width: 70px;
	height: 35px;
	padding: 5px;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #c0041f;
	background-color: #ffffff;
	font-size: 18px;
	float: right;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		box-shadow 0.15s ease-in-out;
}

#report {
	width: 70px;
	height: 35px;
	padding: 5px;
	border: none;
	border-radius: 4px;
	text-align: center;
	color: #black;
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

#delete:active, #delete:hover, .update:hover, .update:active, #list:hover,
	#list:active, #report:hover, #report:active {
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
</style>
</head>
<%@include file="../main/header.jsp"%>
<body class="content"
	style="background-image: url(resources/assets/img/bgpuple.png); background-repeat: no-repeat; background-size: cover;">
	<div style="width: 1240px; background-color: #ffffff; margin: 70px auto; padding: 20px; border-radius: 4px;">
		<div class="comm">커뮤니티</div><br>
		<hr style="position: relative; top: 7px;">
		<table id="table">
			<tr>
				<td>
				<div id="subject">${community.csubject }</div>
					<div id="writer">${community.cwriter }</div>
					<div id="date">${community.cdate }</div>
					<div id="viewcnt">
						<img src="resources/assets/img/eye.png" id="eye">
						${community.viewcnt }
					</div>
					<div id="replycnt">
						<img src="resources/assets/img/speechbubble.png"
							id="speechbubble"> ${community.replycnt }&nbsp;
					</div>
					<div id="likecnt">
						<img src="resources/assets/img/undoLike.png"
							id="likey"> ${community.likecnt }&nbsp;
					</div> <br>
					<hr>
				</td>
			</tr>
			<tr>
				<td> <br>
			
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
								<button type="button" id="report" onclick="location.href='${creport}'">신고</button>
								<button type="button" id="delete" onclick="location.href='${cdelete}'">삭제</button>
								<button type="button" class="update" onclick="location.href='${cupdate}'">수정</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
		
		<br>
		<h4>
			<span id="replycnt2">전체 댓글 <p style="color:#FFC000; display:inline;">(${commentList.size()})</p>개</span>
		</h4>
		<c:if test="${!empty commentList}">
			<c:forEach var="rep" items="${commentList}">
				<div id="comment">
					<hr>
					<input type="hidden" id="rep_id" name="rep_id" value="${rep.rno}">
					<h4 class="comment-head">작성자 : ${rep.rwriter} &nbsp; &nbsp; 작성일 : ${rep.rdate}</h4>
					<div class="comment-body"><p>${rep.rcontent}</p>
					</div>
						<button type="button" class="rupdateConfirm" name="updateConfirm"
							id="rupdateConfirm" style="display: none;">수정완료</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="rdelete" name="delete" id="rdelete"
							style="displ ay: none;">삭제하기</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="rupdate" name="update" id="rupdate">수정
							및 삭제</button>
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
							onblur="if(this.value == '') { this.value ='댓글 쓰기'; }" style="display:inline;"></textarea>
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
					</c:url> <button type="button" id="list"
				onclick="location.href='${clist}'">목록으로 돌아가기</button>
				
			<form action="creport" name="creport" method="post">
				<p>신고</p>
			<div>
			    <input type="radio" id="contactChoice1"
			     name="contact" value="email">
			    <label for="contactChoice1">Email</label>
			
			    <input type="radio" id="contactChoice2"
			     name="contact" value="phone">
			    <label for="contactChoice2">Phone</label>
			
			    <input type="radio" id="contactChoice3"
			     name="contact" value="mail">
			    <label for="contactChoice3">Mail</label>
			    
			    <input type="radio" id="contactChoice1"
			     name="contact" value="email">
			    <label for="contactChoice1">Email</label>
			
			    <input type="radio" id="contactChoice2"
			     name="contact" value="phone">
			    <label for="contactChoice2">Phone</label>
			
			    <input type="radio" id="contactChoice3"
			     name="contact" value="mail">
			    <label for="contactChoice3">Mail</label>
			  </div>
			  <hr>
			  <div>
			    <button type="button" id="btncancel">취소</button>
			    <button type="submit" id="btnreport">신고</button>
			  </div>
		</form>
	</div>
</body>

<script type="text/javascript">
$(function(){
	// 댓글 Insert Script
	$('#replyForm').on('submit',function(event){
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
<%@include file="../main/footer.jsp"%>
</html>