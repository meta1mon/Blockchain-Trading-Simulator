<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/pinpad.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/pinpad.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<title>Insert title here</title>
<style>
#mpu {
	width: 1240px;
	margin: 0 auto;
	text-align: center;
}

#mpu table {
	margin: 0 auto;
}
</style>
</head>
<jsp:include page="myHeader.jsp"></jsp:include>
<body>
	<div id="mpu">
		<h2>비밀번호 변경</h2>
		<form action="${pageContext.request.contextPath}/mypage/passChange"
			method="post" style="border: 1px solid black;">
			<table>
				<tr>
					<td colspan="2">비밀번호*</td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" name="pw" id="pw"
						placeholder="비밀번호를 입력해주세요."></td>
				</tr>
				<tr>
					<td colspan="2"><p class="alert pwReg">&nbsp;</p></td>
				</tr>
				<tr>
					<td colspan="2">비밀번호 확인*</td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" name="pwCh" id="pwCh"
						placeholder="비밀번호를 다시 한 번 입력해주세요."></td>
				</tr>
				<tr>
					<td colspan="2"><p class="alert pwCh">&nbsp;</p></td>
				</tr>
			</table>
			<button type="submit" id="changePw" onclick="return passChange();">비밀번호
				수정</button>
		</form>



		<form action="${pageContext.request.contextPath}/mypage/bankPwChange"
			method="post" style="border: 1px solid black;">
			<table>
				<tr>
					<td>계좌 비밀번호</td>
					<td colspan="2"><input type="password" name="bankPw"
						id="bankPw1" class="pin1" placeholder="계좌 비밀번호를 입력해주세요"></td>
				</tr>
				<tr>
					<td>계좌 비밀번호 확인</td>
					<td colspan="2"><input type="password" id="bankPw2"
						class="pin2" placeholder="계좌 비밀번호를 입력해주세요."></td>
				</tr>

			</table>
			<button type="submit" onclick="return bankPwChange();">계좌
				비밀번호 수정</button>
		</form>
	</div>
	<script>
		// 비밀번호와 비밀번호 확인 일치 여부
		var pass1 = $("input[name=pw]").val();
		var pass2 = $("input[name=pwCh]").val();
		
		var flag1 = false;
		var passEqual = function() {
			var pass1 = $("input[name=pw]").val();
			var pass2 = $("input[name=pwCh]").val();
				if (pass1 == pass2) {
					$(".pwCh").text("비밀번호가 일치합니다.");
					$(".pwCh").css("color", "blue");
					flag1 = true;
					console.log("일치");
				} else {
					$(".pwCh").text("비밀번호가 일치하지 않습니다.");
					console.log("일치X");
					flag1 = false;
				}
				console.log(flag1 + "일치 여부" + pass1 + "/" + pass2);
		};

		$("input[name=pwCh]").on("keyup", passEqual);

		// 비밀번호의 정규식 일치 여부
		var flag2 = false;
		var pwReg = function() {
			var password = $("input[name=pw]").val();
			var reg = /^[A-Za-z0-9!@#$%^&*]{8,15}$/g;
			if (password.length != 0) {
				if (password.match(reg) != null) {
					$(".pwReg").html("&nbsp;");
					flag2 = true;
				} else {
					$(".pwReg").text(
							"8~15자의 영어 대 소문자, 숫자와 특수문자(!@#$%^&*)만 사용할 수 있습니다.");
					$(".pwReg").css("color", "red");
					flag2 = false;
				}
				console.log(flag2 + "양식 여부" + password);
			}
		};
		$("#pw").on("keyup", pwReg);

		function passChange() {
			console.log(flag1 + "/" + flag2);
			console.log(flag1 && flag2);
			alert("변경하시겠습니까?");
			if(flag1 && flag2 ) {
				alert("변경 성공!");
				return true;
			};
				alert("변경 실패!");
				return false;
		};
</script>
	<script>
		// 은행 비밀번호와 은행 비밀번호 확인 일치 여부

		function bankPwChange() {
			var bankPw1 = $("#bankPw1").val();
			var bankPw2 = $("#bankPw2").val();
			if ((bankPw1.length != 0 && bankPw2.length != 0)
					&& (bankPw1 == bankPw2)) {
			} else if (bankPw1.length == 0 || bankPw2.length == 0) {
				alert("계좌 비밀번호를 입력해주세요");
				return false;
			} else {
				alert("계좌 비밀번호가 일치하지 않습니다. 다시 입력하세요");
				return false;
			}
			return true;

		}
		new pinpad({
			ref : {
				el : '.pin1'
			},
			immediate : false,
			maxLength : 4,
			close : '<i class="far fa-times-circle"></i>',
			desc : 'ACCOUNT PASSWORD UPDATE',
			passcode : true,
			letterReplace : {
				'del' : '<i class="fas fa-times delete"></i>',
				'done' : '<i class="fas fa-check done"></i>',
			}
		});
		new pinpad({
			ref : {
				el : '.pin2'
			},
			immediate : false,
			maxLength : 4,
			close : '<i class="far fa-times-circle"></i>',
			desc : 'ACCOUNT PASSWORD UPDATE',
			passcode : true,
			letterReplace : {
				'del' : '<i class="fas fa-times delete"></i>',
				'done' : '<i class="fas fa-check done"></i>',
			}
		});
	</script>
</body>
</html>