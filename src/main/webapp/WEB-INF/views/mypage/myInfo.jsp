<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<style>
#mi {
	width: 1240px;
	margin: 0 auto;
	text-align: center;
}

#mi table {
	margin: 0 auto;
}

#mi .insert, #mi #changeBtn {
	display: none;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function() {
		$("#moveChangeBtn").click(function() {
			$(".update").attr("readonly", false);
			$(".none").css("display", "none");
			$(".insert").css("display", "inline");
			$("#moveChangeBtn").css("display", "none");
			$("#changeBtn").css("display", "inline");
		});

		var checkND = true;
		$("#nickname").on("blur", function() {
			checkND = true;
			if($("#nickname").val() != ${myInfo.nickname }) {
				$.ajax({
					url : "${pageContext.request.contextPath}/nickcheck",
					type : "post",
					dataType : "json",
					data : {
						"nickname" : $("#nickname").val()
					},
					success : function(data) {
						if (data == 1) {
							checkND = false;
						} else {
							console.log("닉네임 중복 x");
							checkND = true;
						}
					}
				});
			}
		});
		
		$("#changeBtn").click(function() {
			var checkNN = false;
			var nickname = $("input[name=nickname]").val();
			var reg1 = /^[가-힣A-Za-z0-9]{2,8}$/g;

			if (nickname.match(reg1) != null) {
				checkNN = true;
				console.log("닉네임 양식O");
			} else {
				alert("닉네임은 2~8자의 한글, 영어 대 소문자, 숫자만 사용할 수 있습니다")
				console.log("닉네임 양식X");
			}

			var checkPN = true;
			var phone = $("input[name=phone]").val();
			var reg2 = /^01([0|1|6|7|8|9]?)+([0-9]{3,4})+([0-9]{4})$/;
			if (phone.length != 0 && phone.match(reg2) == null) {
				checkPN = false;
				console.log("연락처 양식X")
				alert("연락처는 10~11자리의 숫자만 사용할 수 있습니다")
			} else {
				checkPN = true;
				console.log("연락처 양식O")
			}

// 닉네임 변경 시, 기존 게시글과 댓글의 작성자도 변경해주기 아직 안함!

			var dataquery = $("#frmChangeInfo").serialize();
			if (!checkND) {
				alert("이미 사용중인 닉네임 입니다");
			}
			if (checkNN && checkPN && checkND) {
				$.ajax({
					url : "${pageContext.request.contextPath}/mypage/miu",
					type : "POST",
					data : dataquery,
					async : true,
					success : function(data) {
						alert("회원 정보 수정 완료!");
						location.href = "mi";
					},
					error : function() {
						alert("회원 정보 수정 실패!");
						console.log("error: 회원가입 실패!");
					}
				});
			}

		});
		// 회원 탈퇴
		$("#leaveBtn").click(function() {
			var doubleCheck = prompt("탈퇴하시려면, \"탈퇴하겠습니다\" 라고 입력하세요");
			if (doubleCheck == "탈퇴하겠습니다") {
				console.log("탈퇴하였습니다.");
				$.ajax({
					url : "mw",
					type : "POST",
					success : function(data) {
						alert("탈퇴 되었습니다. 다음에 꼭 다시 만나요!")
						location.href = "${pageContext.request.contextPath}/";
					},
					error : function() {
						console.log("error: 탈퇴 실패");
					}
				})

			} else {
				console.log("탈퇴 취소")
			}

		});

	})
</script>
</head>
<body>
	<div id="wrapper">
	<jsp:include page="myNav.jsp"></jsp:include>
		<div id="container">
		<div id="mi">
			<form id="frmChangeInfo">
				<table border="2">
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" value="${myInfo.email }"
							readonly></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><input type="text" name="nickname" id="nickname"
							value="${myInfo.nickname }" readonly class="update"></td>
					</tr>
					<tr>
						<td>성별</td>
						<c:if test="${myInfo.gender == 'M' }">
							<td><input type="hidden" name="gender" value="M">남자</td>
						</c:if>
						<c:if test="${myInfo.gender == 'F' }">
							<td><input type="hidden" name="gender" value="F">여자</td>
						</c:if>
						<c:if test="${myInfo.gender == null }">
							<td class="none">입력하지 않은 항목입니다</td>
							<td class="insert"><select name="gender">
									<option value="">선택안함</option>
									<option value="M">남자</option>
									<option value="F">여자</option>
							</select></td>
						</c:if>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="date" name="birthdate"
							value="${myInfo.birthdate }" readonly></td>
					</tr>
					<tr>
						<td>연락처</td>
						<c:if test="${myInfo.phone == null }">
							<td class="none">입력하지 않은 항목입니다</td>
							<td class="insert"><input type="text" name="phone" value=""
								placeholder="숫자만 입력하세요"></td>
						</c:if>
						<c:if test="${myInfo.phone != null }">
							<td><input type="text" name="phone" value="${myInfo.phone }"
								readonly class="update"></td>
						</c:if>
					</tr>
					<tr>
						<td>수신 동의</td>
						<c:if test="${myInfo.mailing == null }">
							<td class="none"><input type="checkbox"
								onclick="return(false);"></td>
							<td class="insert"><input type="checkbox" name="mailing"></td>
						</c:if>
						<c:if test="${myInfo.mailing != null }">
							<td class="none"><input type="checkbox" checked
								onclick="return(false);"></td>
							<td class="insert"><input type="checkbox" name="mailing"
								checked></td>
						</c:if>
					</tr>
					<tr>
						<td colspan="2">
							<button type="button" id="moveChangeBtn">정보수정</button>
							<button type="button" id="changeBtn">수정완료</button>
							<button type="button" id="leaveBtn">탈퇴</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		</div>
	</div>
</body>
</html>