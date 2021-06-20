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
</head>
<%@include file="../main/header.jsp"%>
<body class="content"
	style="background-image: url(resources/assets/img/bgpuple.png); background-repeat: no-repeat; background-size: cover;">
	<div
		style="width: 1240px; background-color: #ffffff; margin: 70px auto; padding: 20px; border-radius: 4px;">
		<h1 align="center">게시글 상세보기</h1>
		<table align="center" cellpadding="10" cellspacing="0" border="1"
			width="70%">
			<tr align="center" valign="middle">
				<th colspan="2">${community.cno}번글상세보기</th>
			</tr>
			<tr>
				<td height="15" width="100">제 목</td>
				<td>${community.csubject}</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${community.cwriter}</td>
			</tr>
			<tr>
				<td>내 용</td>
				<td>${community.ccontent}</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><c:if test="${empty community.filepath}">
                        첨부파일 없음
                    </c:if> <c:if test="${!empty community.filepath}">

						<c:forTokens var="fileName" items="${community.filepath}"
							delims="," varStatus="st">
							<a download="${fileName}"
								href="${pageContext.request.contextPath}/resources/uploadFiles/${community.filepath}">${fileName}</a>
							<c:if test="${!st.last }">
                        /
                    </c:if>
							<br>
						</c:forTokens>
					</c:if></td>
			</tr>
			<tr align="center" valign="middle">
				<td colspan="2"><c:url var="cupdate" value="cUpdateForm">
						<c:param name="cno" value="${community.cno}" />
						<c:param name="page" value="${currentPage}" />
					</c:url> <c:url var="cdelete" value="cDelete">
						<c:param name="cno" value="${community.cno}" />
					</c:url> <a href="${cupdate}"> [수정 페이지로 이동] </a> &nbsp;&nbsp; <a
					href="${cdelete}"> [글 삭제] </a> &nbsp;&nbsp; <c:url var="clist"
						value="clist">
						<c:if test="${loginMember == null }">
							<div id="login">답변을 하려면 로그인이 필요합니다.</div>
						</c:if>
						<c:param name="page" value="${currentPage}" />
					</c:url> <a href="${clist}">[목록]</a></td>
			</tr>
		</table>
		<br>
		<h4>
			<span>댓글 (${commentList.size()})</span>
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
					<p align="right">
						<button type="button" class="updateConfirm" name="updateConfirm"
							id="updateConfirm" style="display: none;">수정완료</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="delete" name="delete" id="delete"
							style="displ ay: none;">삭제하기</button>
						&nbsp;&nbsp;&nbsp;
						<button type="button" class="update" name="update" id="update">수정
							및 삭제</button>
					</p>
				</div>
				<br>
				<br>
			</c:forEach>
		</c:if>
		<hr>

		<div class="comment-box">
			<c:if test="${loginMember != null }">
				<form action="rcInsert" id="replyForm" method="post">
					<div style="float: right; margin-top: 10px;">
						<input type="hidden" name="cno" value="${community.cno }">
						<input type="hidden" id="page" name="page" value="${currentPage}">
						<input type="hidden" id="comments" name="comments" value="">
						<textarea placeholder="댓글 쓰기" id="editor" name="rqcontent"
							maxlength="4000"
							onfocus="if(this.value == '댓글 쓰기') { this.value = ''; }"
							onblur="if(this.value == '') { this.value ='댓글 쓰기'; }"></textarea>
					</div>
					<div style="clear: both; float: right; padding-top: 10px;">
						<button type="submit" id="rsubmit">등록</button>
					</div>
				</form>
			</c:if>
			<c:if test="${loginMember == null }">
				<div id="login">답변을 하려면 로그인이 필요합니다.</div>
			</c:if>
		</div>
	</div>
</body>

<script type="text/javascript">
	ClassicEditor
	.create( document.querySelector( '#editor' ) )
	.catch( error => {
	    console.error( error );
	} );

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
comment_pwd : parentDiv.find('input[name=pwd_chk]').val(),
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