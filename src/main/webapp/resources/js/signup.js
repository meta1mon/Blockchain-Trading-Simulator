$(function(){
// 약관동의 체크박스
$("#checkAll").on("click", function() {
	if ($("#checkAll").is(":checked")) {
		$(".termCheck").prop("checked", true);
	} else {
		$(".termCheck").prop("checked", false);
	}
});

$(".termCheck").on("click", function() {
	if ($("input[id$=Agr]:checked").length == 3) {
		$("#checkAll").prop("checked", true);
	} else {
		$("#checkAll").prop("checked", false);
	}

})

$(function(){
	$(".agreement").on("click", function(){
		if($(".insertInfo").css("display", "block")){
			$(".insertInfo").css("display", "none");
			$(".terms").css("display", "block");
		}
	})
})

// 다음 버튼
var SYSDATE = new Date();
var year = SYSDATE.getFullYear();
var month = (SYSDATE.getMonth()+1);
var date = SYSDATE.getDate();
var hour = SYSDATE.getHours();
var min = SYSDATE.getMinutes();
var sec = SYSDATE.getSeconds();

if(month < 10){
	month = "0"+month;
}
if(date < 10){
	date = "0"+date;
}
if(hour < 10){
	hour = "0"+hour;
}
if(min < 10){
	min = "0"+min;
}
if(sec < 10){
	sec = "0"+sec;
}

SYSDATE = year+"-"+month+"-"+date+" "+hour+":"+min+":"+sec;
$(function() {
	$(".insertInfo").css("display", "none");
	$("#next").on("click", function() {
		if ($(".req:checked").length == 2) {
			$(".insertInfo").css("display", "block"); //insertInfo표시
			$(".terms").css("display", "none"); //약관 동의 안보이게
			$(".step1").removeClass("far fa-check-circle"); //빈체크 제거
			$(".step1").addClass("fas fa-check-circle"); //빈체크 추가
			if($("input[name=mailing]").is(":checked")){
				$("input[name=mailing]").val(SYSDATE);
				console.log("check 됐다: " + $("input[name=mailing]").val());
			} else{
				$("input[name=mailing]").val('N');
				console.log("check 안됐다: " + $("input[name=mailing]").val());
				
			};
			$(window).scrollTop(0);
		} else {
			alert("필수 항목에 동의해주세요.")
		}
		console.log($("input[name=mailing]").val());
	})
})

// 입력, 형식 체크
	var check1 = false;
	var emailReg = function() {
		var email = $("input[name=email]").val()
		var reg = /^[A-Za-z0-9]([-_.]?[0-9a-zA-Z])+@[A-Za-z0-9]+\.[A-Za-z0-9]+$/g;
		if (email.length != 0) {
			if (email.match(reg) == null) {
				$(".emailReg").text("영어 대 소문자, 숫자와 특수문자(-_.@)만 사용할 수 있습니다.");
				$(".emailReg").css("color", "red");
				console.log("이메일 양식X");
			} else {
				$(".emailReg").html("&nbsp;");
				console.log("이메일 양식O");
				check1 = true;
			}
		} else {
			$(".emailReg").text("필수 입력 항목입니다.");
			console.log("이메일 입력X");
			
		}
	};
	var check2 = false;
	var nicknameReg = function() {

		var nickname = $("input[name=nickname]").val()
		var reg = /^[가-힣A-Za-z0-9]{1,8}$/g;
		if (nickname.length != 0) {
			if (nickname.match(reg) != null) {
				$(".nickReg").html("&nbsp;");
				console.log("닉네임 양식O");
				check2 = true;
			} else {
				$(".nickReg").text("2~8자의 한글, 영어 대 소문자, 숫자만 사용할 수 있습니다.");
				$(".nickReg").css("color", "red");
				console.log("닉네임 양식X");
			}
		} else {
			$(".nickReg").text("필수 입력 항목입니다.");
			$(".nickReg").css("color", "red");
			console.log("닉네임 입력X");
			
		}
	};
	
	var check3 = false;
	var pwReg = function() {
		var password = $("input[name=pw]").val()
		var reg = /^[A-Za-z0-9!@#$%^&*]{8,15}$/g;
		if (password.length != 0) {
			if (password.match(reg) != null) {
				$(".pwReg").html("&nbsp;");
				console.log("비밀번호 양식O");
				check3 = true;
			} else {
				$(".pwReg").text(
						"8~15자의 영어 대 소문자, 숫자와 특수문자(!@#$%^&*)만 사용할 수 있습니다.");
				$(".pwReg").css("color", "red");
				console.log("비밀번호 양식X");
			}
		} else {
			$(".pwReg").text("필수 입력 항목입니다.");
			console.log("비밀번호 입력X");
		}
	};
	
	var check4 = false;
	var pwChReg = function() {
		var password1 = $("input[name=pw]").val()
		var password2 = $("input[name=pwCh]").val()
		var reg = /^[A-Za-z0-9!@#$%^&*]{8,15}$/g;
		if (password2.length != 0 && password2.match(reg) != null) {
			$(".pwCh").html("&nbsp;");
			console.log("비밀번호 확인 입력O")
			check4 = true;
		} else if (password2.length != 0 && password2.match(reg) == null) {
			$(".pwCh")
					.text("8~15자의 영어 대 소문자, 숫자와 특수문자(!@#$%^&*)만 사용할 수 있습니다.");
			$(".pwCh").css("color", "red");
			console.log("비밀번호 확인 양식X");
		} else {
			$(".pwCh").text("필수 입력 항목입니다.");
			console.log("비밀번호 확인 입력X");
		}
	};
	
	var check5 = false;
	var passEqual = function() {
		var pass1 = $("input[name=pw]").val();
		var pass2 = $("input[name=pwCh]").val();
			if (pass1 == pass2) {
				$(".pwCh").text("비밀번호가 일치합니다.");
				$(".pwCh").css("color", "blue");
				console.log("일치");
				check5=true;
			} else {
				$(".pwCh").text("비밀번호가 일치하지 않습니다.");
				$(".pwCh").css("color", "red");
				console.log("일치X");
			}
	};
	
	$("#pwCh").on("keyup", pwChReg);
	$("#pwCh").on("keyup", passEqual);

//	$("input[name=pwCh]").on("keyup", passEqual);

//	var phoneReg = function() {
//		var phone = $("input[name=phone]").val()
//		var reg = /^01(?:0|1|[6-9])*(?:\d{3}|\d{4})*\d{4}$/;
//		if (phone.length != 0) {
//			if (phone.match(reg) != null) {
//				$(".phoneReg").text("");
//			} else {
//				$(".phoneReg").text("01로 시작하는 숫자만 사용할 수 있습니다.");
//				$(".phoneReg").css("color", "red");
//				return false;
//			}
//		} else {
//		$(".phoneReg").text("");
//		return true;
//		} 
//	};

	$("#email").on("keyup", emailReg);
	$("#nickname").on("keyup", nicknameReg);
	$("#pw").on("keyup", pwReg);
//	$("#pwCh").on("keyup", pwReg);
//	$("#phone").on("keyup", phoneReg);
//
//	var regCheck = function() {
//		if (!emailReg || !nicknameReg || !pwReg) {
//			return false;
//		}
//	};
//	
//
//		var check = function() {
//			if (passEqual && regCheck && required) {
//				console.log("전부 통과!")
//				flag = true;
//			} else {
//				console.log("입력X");
//				flag = false;
//			}
//		}
//		var reqCheck = $(".reqInfo").each(function(){
//		if($(".reqInfo").val() != null && $(".reqInfo").val() != ""){
//			console.log("필수 확인 입력O");
//			console.log("값: " + $(".reqInfo").val())
//		} else {
//			console.log("필수 확인 입력X");
//		}
//	});
//	$("#insert").on("click", reqCheck);
//pinpad 생성
	new pinpad({
		ref : {
			el : '.pin1'
		},
		immediate : false,
		maxLength : 4,
		close: '<i class="far fa-times-circle"></i>',
		desc : 'ACCOUNT PASSWORD',
		passcode : true,
		letterReplace : {
			'del' : '<i class="fas fa-times delete"></i>',
			'done' : '<i class="fas fa-check done"></i>',
		}
	});

	// 회원가입
	$("#insert").on("click", function() {
		console.log("회원가입버튼누름");
		var dataquery = $("#frmJoin").serialize();
		// console.log("dataquery: " + dataquery);
		console.log("1: " + check1 + " 2: " + check2 + " 3: " + check3 + " 4: " + check4 + " 5: " + check5)
		if(check1 && check2 && check3 && check4 && check5){
			
			$.ajax({
				url : "signupmember",
				type : "POST",
				data : dataquery,
				async : true,
				success : function(data) {
					console.log("회원가입 성공!");
					location.href = "authwait"
				},
				error : function() {
					console.log("error: 회원가입 실패!");
				}
			})
		} else {
			alert("입력 항목을 다시 확인해주세요.")
		}
	});
});