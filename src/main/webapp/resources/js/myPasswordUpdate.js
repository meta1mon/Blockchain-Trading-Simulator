// 탭메뉴 jQuery
$('.tablinks').click(function() {

	for (var i = 0; i < $('.tabcontent').length; i++) {
		$('.tabcontent').hide();
	}

	$(".tabcontent").eq($(this).index()).show();

});

$(function() {
	$(".tabcontent").eq(0).show(); // 보유코인 목록 탭 기본값 : show()
});


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
//		console.log("일치");
	} else {
		$(".pwCh").text("비밀번호가 일치하지 않습니다.");
		$(".pwCh").css("color", "red");
//		console.log("일치X");
		flag1 = false;
	}
//	console.log(flag1 + "일치 여부" + pass1 + "/" + pass2);
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
			$(".pwReg")
					.text("8~15자의 영어 대 소문자, 숫자와 특수문자(!@#$%^&*)만 사용할 수 있습니다.");
			$(".pwReg").css("color", "red");
			flag2 = false;
		}
//		console.log(flag2 + "양식 여부" + password);
	}
};
$("#pw").on("keyup", pwReg);

function passChange() {
//	console.log(flag1 + "/" + flag2);
//	console.log(flag1 && flag2);
	if(confirm('비밀번호를 변경하시겠습니까?')){
		if (flag1 && flag2) {
			alert(" 비밀번호가 정상적으로 변경되었습니다.");
			alert("다시 로그인하여 이용해주세요!");
			return true;
		}
		alert("양식에 맞는 비밀번호를 입력해주세요!");
		return false;
	}
	return false;
};


// 계좌 비밀번호 확인
var checkpw = false;

$("#checkBtn").click(function() { // 계좌 비밀번호
	var acntList = $("#frmPin").serialize();
	$.ajax({
		url : "/bts/bankpw",
		type : "post",
		data : acntList,
		success : function(data) {
			if (data == 1) {
				$(".bankPwChNow").html("계좌 비밀번호가 확인 되었습니다.");
				$(".bankPwChNow").css("color", "blue");
				checkpw = true;
			} else {
				alert("계좌 비밀번호를 확인해 주세요 ");
				$(".bankPwChNow").html("계좌 비밀번호를 확인해 주세요.");
				$(".bankPwChNow").css("color", "red");
				checkpw = false;
			}
		}
	})

});




// 은행 비밀번호와 은행 비밀번호 확인 일치 여부
function bankPwChange() {
	var bankPw1 = $("#bankPw1").val();
	var bankPw2 = $("#bankPw2").val();
	if (bankPw1.length == 0) {
		$(".bankPwCh1").html("계좌 비밀번호를 입력해주세요.");
		$(".bankPwChCh1").html("&nbsp;");
		return false;
	} else if (bankPw2.length == 0) {
		$(".bankPwCh1").html("&nbsp;");
		$(".bankPwChCh1").html("계좌 비밀번호 확인을 입력해주세요.");
		return false;
	} else if (bankPw1.length != 0 && bankPw2.length != 0 && bankPw1 != bankPw2) {
		$(".bankPwCh1").html("&nbsp;");
		$(".bankPwChCh1").html("계좌 비밀번호가 일치하지 않습니다.");
		return false;
	} else if (bankPw1.length != 0 && bankPw2.length != 0 && bankPw1 == bankPw2) {
		$(".bankPwCh1").html("&nbsp;");
		$(".bankPwChCh1").html("&nbsp;");
		if(!checkpw) {
			$(".bankPwCh1").html("현재 계좌 비밀번호를 확인해주세요.");
			$(".bankPwChCh1").html("&nbsp;");
		} else {
			alert("계좌 비밀번호가 정상적으로 변경되었습니다. ");
			alert("다시 로그인하여 이용해주세요! ");
			return true;
		}
		return false;
	}

	/*
	 * if ((bankPw1.length != 0 && bankPw2.length != 0) && (bankPw1 == bankPw2)) {
	 * $(".bankPwCh").html("&nbsp;"); } else if (bankPw1.length == 0 ||
	 * bankPw2.length == 0) { return false; } else { $(".bankPwCh").html("계좌
	 * 비밀번호가 일치하지 않습니다."); return false; } $(".bankPwCh").html("&nbsp;"); return
	 * true;
	 */

}
new pinpad({
	ref : {
		el : '.pin0'
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
