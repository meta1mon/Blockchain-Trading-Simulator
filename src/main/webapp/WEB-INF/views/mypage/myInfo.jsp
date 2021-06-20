<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<title>Insert title here</title>
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
			// 닉네임 중복체크 아직 안함!
			var dataquery = $("#frmChangeInfo").serialize();
			if (checkNN && checkPN) {
				$.ajax({
					url : "miu",
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
				})
			}
		});

	})
</script>
</head>
<jsp:include page="myHeader.jsp"></jsp:include>
<body>
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
					<td><input type="text" name="nickname"
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
					<td><input type="date" value="${myInfo.birthdate }" readonly></td>
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
						<button type="button">탈퇴</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>