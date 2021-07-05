<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" type="image/x-icon" />
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/resources/css/member.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/pinpad.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/pinpad.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style>
#mpu {
	width: 65%;
	min-width: 1024px;
	text-align: center;
	height: 50%;
	padding: 20px;
	margin: 25px auto;
	background-color: #fff;
	border: 1.5px solid #E3C8F8;
	box-shadow: 1px 1px 3px rgb(90 90 90/ 35%);
}

#mpu table {
	margin: 0 auto;
	width: 500px;
}

form {
	padding: 20px;
}

form input {
	width: 100%;
}

.btn1 {
	width: 300px;
}

.alert {
	height: 18px !important;
}

.star{
	color: red;
}
</style>
</head>
<body>
	<div id="wrapper">
		<jsp:include page="myNav.jsp"></jsp:include>
		<div id="mpu">
			<h1 class="title">비밀번호 변경</h1>
			<form action="${pageContext.request.contextPath}/mypage/passChange"
				method="post" style="border-bottom: 1px solid black;">
				<table>
					<tr>
						<td>비밀번호<span class="star">*</span></td>
						<td><input type="password" name="pw" id="pw"
							placeholder="비밀번호를 입력해주세요."></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert pwReg">&nbsp;</p></td>
					</tr>
					<tr>
						<td>비밀번호 확인<span class="star">*</span></td>
						<td><input type="password" name="pwCh" id="pwCh"
							placeholder="비밀번호를 다시 한 번 입력해주세요."></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert pwCh">&nbsp;</p></td>
					</tr>
				</table>
				<button type="submit" id="changePw" onclick="return passChange();" class="btn1">비밀번호 수정</button>
			</form>
			<br>
			<h1 class="title">계좌 비밀번호 변경</h1>
			<form action="${pageContext.request.contextPath}/mypage/bankPwChange"
				method="post">
				<table>
					<tr>
						<th>계좌 비밀번호<span class="star">*</span></th>
						<td colspan="2"><input type="password" name="bankPw" id="bankPw1" class="pin1" placeholder="계좌 비밀번호를 입력해주세요"></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert bankPwCh">&nbsp;</p></td>
					</tr>
					<tr>
						<th>계좌 비밀번호 확인<span class="star">*</span></th>
						<td colspan="2"><input type="password" id="bankPw2" class="pin2" placeholder="계좌 비밀번호를 입력해주세요."></td>
					</tr>
					<tr>
						<td colspan="2"><p class="alert bankPwChCh">&nbsp;</p></td>
					</tr>
				</table>
				<button type="submit" onclick="return bankPwChange();" class="btn1">계좌
					비밀번호 수정</button>
			</form>
		</div>
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
			if (flag1 && flag2) {
				alert("변경 성공!");
				return true;
			}
			;
			alert("변경 실패!");
			return false;
		};
	</script>
	<script>
		// 은행 비밀번호와 은행 비밀번호 확인 일치 여부
		function bankPwChange() {
			var bankPw1 = $("#bankPw1").val();
			var bankPw2 = $("#bankPw2").val();
			if(bankPw1.length == 0) {
				$(".bankPwCh").html("계좌 비밀번호를 입력해주세요.");
				$(".bankPwChCh").html("&nbsp;");
				return false;
			} else if(bankPw2.length == 0) {
				$(".bankPwCh").html("&nbsp;");
				$(".bankPwChCh").html("계좌 비밀번호 확인을 입력해주세요.");
				return false;
			} else if(bankPw1.length != 0 && bankPw2.length != 0 && bankPw1 != bankPw2) {
				$(".bankPwCh").html("&nbsp;");
				$(".bankPwChCh").html("계좌 비밀번호가 일치하지 않습니다.");
				return false;
			} else if(bankPw1.length != 0 && bankPw2.length != 0 && bankPw1 == bankPw2){
				$(".bankPwCh").html("&nbsp;");
				$(".bankPwChCh").html("&nbsp;");
				return true;
			}
			
			/* if ((bankPw1.length != 0 && bankPw2.length != 0)
					&& (bankPw1 == bankPw2)) {
				$(".bankPwCh").html("&nbsp;");
			} else if (bankPw1.length == 0 || bankPw2.length == 0) {
				return false;
			} else {
				$(".bankPwCh").html("계좌 비밀번호가 일치하지 않습니다.");
				return false;
			}
			$(".bankPwCh").html("&nbsp;");
			return true; */

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