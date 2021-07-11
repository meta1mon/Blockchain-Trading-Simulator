//현재 시각 및 날짜
$(function(){
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

	// home 버튼
	var homeEff = function(){
		if($(".back").attr("src") == "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiIGNsYXNzPSIiPjxnPjxwYXRoIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgZD0ibTQ5OC4xOTUzMTIgMjIyLjY5NTMxMmMtLjAxMTcxOC0uMDExNzE4LS4wMjM0MzctLjAyMzQzNy0uMDM1MTU2LS4wMzUxNTZsLTIwOC44NTU0NjgtMjA4Ljg0NzY1NmMtOC45MDIzNDQtOC45MDYyNS0yMC43MzgyODItMTMuODEyNS0zMy4zMjgxMjYtMTMuODEyNS0xMi41ODk4NDMgMC0yNC40MjU3ODEgNC45MDIzNDQtMzMuMzMyMDMxIDEzLjgwODU5NGwtMjA4Ljc0NjA5MyAyMDguNzQyMTg3Yy0uMDcwMzEzLjA3MDMxMy0uMTQwNjI2LjE0NDUzMS0uMjEwOTM4LjIxNDg0NC0xOC4yODEyNSAxOC4zODY3MTktMTguMjUgNDguMjE4NzUuMDg5ODQ0IDY2LjU1ODU5NCA4LjM3ODkwNiA4LjM4MjgxMiAxOS40NDUzMTIgMTMuMjM4MjgxIDMxLjI3NzM0NCAxMy43NDYwOTMuNDgwNDY4LjA0Njg3Ni45NjQ4NDMuMDcwMzEzIDEuNDUzMTI0LjA3MDMxM2g4LjMyNDIxOXYxNTMuNjk5MjE5YzAgMzAuNDE0MDYyIDI0Ljc0NjA5NCA1NS4xNjAxNTYgNTUuMTY3OTY5IDU1LjE2MDE1Nmg4MS43MTA5MzhjOC4yODEyNSAwIDE1LTYuNzE0ODQ0IDE1LTE1di0xMjAuNWMwLTEzLjg3ODkwNiAxMS4yODkwNjItMjUuMTY3OTY5IDI1LjE2Nzk2OC0yNS4xNjc5NjloNDguMTk1MzEzYzEzLjg3ODkwNiAwIDI1LjE2Nzk2OSAxMS4yODkwNjMgMjUuMTY3OTY5IDI1LjE2Nzk2OXYxMjAuNWMwIDguMjg1MTU2IDYuNzE0ODQzIDE1IDE1IDE1aDgxLjcxMDkzN2MzMC40MjE4NzUgMCA1NS4xNjc5NjktMjQuNzQ2MDk0IDU1LjE2Nzk2OS01NS4xNjAxNTZ2LTE1My42OTkyMTloNy43MTg3NWMxMi41ODU5MzcgMCAyNC40MjE4NzUtNC45MDIzNDQgMzMuMzMyMDMxLTEzLjgwODU5NCAxOC4zNTkzNzUtMTguMzcxMDkzIDE4LjM2NzE4Ny00OC4yNTM5MDYuMDIzNDM3LTY2LjYzNjcxOXptMCAwIiBmaWxsPSIjOGM2NmM4IiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIiBjbGFzcz0iIj48L3BhdGg+PC9nPjwvc3ZnPg=="){
		$(".back").attr("src", "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMSA1MTEuOTk5IiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA1MTIgNTEyIiB4bWw6c3BhY2U9InByZXNlcnZlIj48Zz48cGF0aCB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIGQ9Im00OTguNjk5MjE5IDIyMi42OTUzMTJjLS4wMTU2MjUtLjAxMTcxOC0uMDI3MzQ0LS4wMjczNDMtLjAzOTA2My0uMDM5MDYybC0yMDguODU1NDY4LTIwOC44NDc2NTZjLTguOTAyMzQ0LTguOTA2MjUtMjAuNzM4MjgyLTEzLjgwODU5NC0zMy4zMjgxMjYtMTMuODA4NTk0LTEyLjU4OTg0MyAwLTI0LjQyNTc4MSA0LjkwMjM0NC0zMy4zMzIwMzEgMTMuODA4NTk0bC0yMDguNzQ2MDkzIDIwOC43NDIxODdjLS4wNzAzMTMuMDcwMzEzLS4xNDQ1MzIuMTQ0NTMxLS4yMTA5MzguMjE0ODQ0LTE4LjI4MTI1IDE4LjM4NjcxOS0xOC4yNSA0OC4yMTg3NS4wODk4NDQgNjYuNTU4NTk0IDguMzc4OTA2IDguMzgyODEyIDE5LjQ0MTQwNiAxMy4yMzQzNzUgMzEuMjczNDM3IDEzLjc0NjA5My40ODQzNzUuMDQ2ODc2Ljk2ODc1LjA3MDMxMyAxLjQ1NzAzMS4wNzAzMTNoOC4zMjAzMTN2MTUzLjY5NTMxM2MwIDMwLjQxNzk2OCAyNC43NSA1NS4xNjQwNjIgNTUuMTY3OTY5IDU1LjE2NDA2Mmg4MS43MTA5MzdjOC4yODUxNTcgMCAxNS02LjcxODc1IDE1LTE1di0xMjAuNWMwLTEzLjg3ODkwNiAxMS4yOTI5NjktMjUuMTY3OTY5IDI1LjE3MTg3NS0yNS4xNjc5NjloNDguMTk1MzEzYzEzLjg3ODkwNiAwIDI1LjE2Nzk2OSAxMS4yODkwNjMgMjUuMTY3OTY5IDI1LjE2Nzk2OXYxMjAuNWMwIDguMjgxMjUgNi43MTQ4NDMgMTUgMTUgMTVoODEuNzEwOTM3YzMwLjQyMTg3NSAwIDU1LjE2Nzk2OS0yNC43NDYwOTQgNTUuMTY3OTY5LTU1LjE2NDA2MnYtMTUzLjY5NTMxM2g3LjcxODc1YzEyLjU4NTkzNyAwIDI0LjQyMTg3NS00LjkwMjM0NCAzMy4zMzIwMzEtMTMuODEyNSAxOC4zNTkzNzUtMTguMzY3MTg3IDE4LjM2NzE4Ny00OC4yNTM5MDYuMDI3MzQ0LTY2LjYzMjgxM3ptLTIxLjI0MjE4OCA0NS40MjE4NzZjLTMuMjM4MjgxIDMuMjM4MjgxLTcuNTQyOTY5IDUuMDIzNDM3LTEyLjExNzE4NyA1LjAyMzQzN2gtMjIuNzE4NzVjLTguMjg1MTU2IDAtMTUgNi43MTQ4NDQtMTUgMTV2MTY4LjY5NTMxM2MwIDEzLjg3NS0xMS4yODkwNjMgMjUuMTY0MDYyLTI1LjE2Nzk2OSAyNS4xNjQwNjJoLTY2LjcxMDkzN3YtMTA1LjVjMC0zMC40MTc5NjktMjQuNzQ2MDk0LTU1LjE2Nzk2OS01NS4xNjc5NjktNTUuMTY3OTY5aC00OC4xOTUzMTNjLTMwLjQyMTg3NSAwLTU1LjE3MTg3NSAyNC43NS01NS4xNzE4NzUgNTUuMTY3OTY5djEwNS41aC02Ni43MTA5MzdjLTEzLjg3NSAwLTI1LjE2Nzk2OS0xMS4yODkwNjItMjUuMTY3OTY5LTI1LjE2NDA2MnYtMTY4LjY5NTMxM2MwLTguMjg1MTU2LTYuNzE0ODQ0LTE1LTE1LTE1aC0yMi4zMjgxMjVjLS4yMzQzNzUtLjAxNTYyNS0uNDY0ODQ0LS4wMjczNDQtLjcwMzEyNS0uMDMxMjUtNC40Njg3NS0uMDc4MTI1LTguNjYwMTU2LTEuODUxNTYzLTExLjgwMDc4MS00Ljk5NjA5NC02LjY3OTY4OC02LjY3OTY4Ny02LjY3OTY4OC0xNy41NTA3ODEgMC0yNC4yMzQzNzUuMDAzOTA2IDAgLjAwMzkwNi0uMDAzOTA2LjAwNzgxMi0uMDA3ODEybC4wMTE3MTktLjAxMTcxOSAyMDguODQ3NjU2LTIwOC44Mzk4NDRjMy4yMzQzNzUtMy4yMzgyODEgNy41MzUxNTctNS4wMTk1MzEgMTIuMTEzMjgxLTUuMDE5NTMxIDQuNTc0MjE5IDAgOC44NzUgMS43ODEyNSAxMi4xMTMyODIgNS4wMTk1MzFsMjA4LjgwMDc4MSAyMDguNzk2ODc1Yy4wMzEyNS4wMzEyNS4wNjY0MDYuMDYyNS4wOTc2NTYuMDkzNzUgNi42NDQ1MzEgNi42OTE0MDYgNi42MzI4MTMgMTcuNTM5MDYzLS4wMzEyNSAyNC4yMDcwMzJ6bTAgMCIgZmlsbD0iIzhjNjZjOCIgZGF0YS1vcmlnaW5hbD0iIzAwMDAwMCIgc3R5bGU9IiI+PC9wYXRoPjwvZz48L3N2Zz4=");
		} else {
			$(".back").attr("src", "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHhtbG5zOnN2Z2pzPSJodHRwOi8vc3ZnanMuY29tL3N2Z2pzIiB3aWR0aD0iNTEyIiBoZWlnaHQ9IjUxMiIgeD0iMCIgeT0iMCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDUxMiA1MTIiIHhtbDpzcGFjZT0icHJlc2VydmUiIGNsYXNzPSIiPjxnPjxwYXRoIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgZD0ibTQ5OC4xOTUzMTIgMjIyLjY5NTMxMmMtLjAxMTcxOC0uMDExNzE4LS4wMjM0MzctLjAyMzQzNy0uMDM1MTU2LS4wMzUxNTZsLTIwOC44NTU0NjgtMjA4Ljg0NzY1NmMtOC45MDIzNDQtOC45MDYyNS0yMC43MzgyODItMTMuODEyNS0zMy4zMjgxMjYtMTMuODEyNS0xMi41ODk4NDMgMC0yNC40MjU3ODEgNC45MDIzNDQtMzMuMzMyMDMxIDEzLjgwODU5NGwtMjA4Ljc0NjA5MyAyMDguNzQyMTg3Yy0uMDcwMzEzLjA3MDMxMy0uMTQwNjI2LjE0NDUzMS0uMjEwOTM4LjIxNDg0NC0xOC4yODEyNSAxOC4zODY3MTktMTguMjUgNDguMjE4NzUuMDg5ODQ0IDY2LjU1ODU5NCA4LjM3ODkwNiA4LjM4MjgxMiAxOS40NDUzMTIgMTMuMjM4MjgxIDMxLjI3NzM0NCAxMy43NDYwOTMuNDgwNDY4LjA0Njg3Ni45NjQ4NDMuMDcwMzEzIDEuNDUzMTI0LjA3MDMxM2g4LjMyNDIxOXYxNTMuNjk5MjE5YzAgMzAuNDE0MDYyIDI0Ljc0NjA5NCA1NS4xNjAxNTYgNTUuMTY3OTY5IDU1LjE2MDE1Nmg4MS43MTA5MzhjOC4yODEyNSAwIDE1LTYuNzE0ODQ0IDE1LTE1di0xMjAuNWMwLTEzLjg3ODkwNiAxMS4yODkwNjItMjUuMTY3OTY5IDI1LjE2Nzk2OC0yNS4xNjc5NjloNDguMTk1MzEzYzEzLjg3ODkwNiAwIDI1LjE2Nzk2OSAxMS4yODkwNjMgMjUuMTY3OTY5IDI1LjE2Nzk2OXYxMjAuNWMwIDguMjg1MTU2IDYuNzE0ODQzIDE1IDE1IDE1aDgxLjcxMDkzN2MzMC40MjE4NzUgMCA1NS4xNjc5NjktMjQuNzQ2MDk0IDU1LjE2Nzk2OS01NS4xNjAxNTZ2LTE1My42OTkyMTloNy43MTg3NWMxMi41ODU5MzcgMCAyNC40MjE4NzUtNC45MDIzNDQgMzMuMzMyMDMxLTEzLjgwODU5NCAxOC4zNTkzNzUtMTguMzcxMDkzIDE4LjM2NzE4Ny00OC4yNTM5MDYuMDIzNDM3LTY2LjYzNjcxOXptMCAwIiBmaWxsPSIjOGM2NmM4IiBkYXRhLW9yaWdpbmFsPSIjMDAwMDAwIiBzdHlsZT0iIiBjbGFzcz0iIj48L3BhdGg+PC9nPjwvc3ZnPg==");
		}
	}
	
	$(".back").on("mouseover", homeEff);
	$(".back").on("mouseleave", homeEff);
	
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

// 회원정보 페이지에서 약관 동의 눌렀을 때
$(function(){
	$(".agreement").on("click", function(){
		if($(".insertInfo").css("display", "block")){
			$(".insertInfo").css("display", "none");
			$(".terms").css("display", "block");
			$(".step1").removeClass("fas fa-check-circle"); //빈체크 추가
			$(".step1").addClass("far fa-check-circle"); //빈체크 제거
		}
	})
})

// 다음 버튼
$(function() {
	$(".insertInfo").css("display", "none");
	$("#bdlabel").css("color", "transparent");
	$("#next").on("click", function() {
		if ($(".req:checked").length == 2) {
			$(".insertInfo").css("display", "block"); //insertInfo표시
			$(".terms").css("display", "none"); //약관 동의 안보이게
			$(".step1").removeClass("far fa-check-circle"); //빈체크 제거
			$(".step1").addClass("fas fa-check-circle"); //빈체크 추가
			if($("input[name=mailing]").is(":checked")){
				$("input[name=mailing]").val(SYSDATE);
			} else{
				$("input[name=mailing]").val('N');
				
			};
			$(window).scrollTop(0);
		} else {
			alert("필수 항목에 동의해주세요.")
		}
	})
})
	
	//mainpage로 이동
	$(".back").on("click", function(){
		location.href="mainpage";
	})
	
	// 이메일, 닉네임 중복 체크
	var checkED = false;
	var emailDupe = function(){
		$.ajax({
			url: "emailcheck",
			type: "post",
			global: false,
			dataType: "json",
			data: {"email" : $("#email").val()},
			success: function(data){
				if(data == 1){
					$(".emailCh").text("이미 사용 중인 이메일입니다.");
					checkED = false;
				} else {
					checkED = true;
				}
			}
		})
	}
	$("#email").on("keyup", emailDupe);

	var checkND = false;
	var nickDupe = function(){
		$.ajax({
			url: "nickcheck",
			type: "post",
			global: false,
			dataType: "json",
			data: {"nickname" : $("#nickname").val()},
			success: function(data){
				if(data == 1){
					$(".nickCh").text("이미 사용 중인 닉네임입니다.");
					checkND = false;
				} else {
					checkND = true;
				}
			}
		})
	}
	$("#nickname").on("keyup", nickDupe);


	// 입력, 형식 체크
		var checkER = false;
		var emailReg = function() {
			var email = $("input[name=email]").val()
			var reg = /^[A-Za-z0-9]([-_.]?[0-9a-zA-Z])+@[A-Za-z0-9]+\.[A-Za-z0-9]+$/g;
			if (email.length != 0) {
				if (email.match(reg) == null) {
					$(".emailReg").text("영어 대 소문자, 숫자와 특수문자(-_.@)만 사용할 수 있습니다.");
				} else {
					$(".emailReg").html("&nbsp;");
					checkER = true;
				}
			} else {
				$(".emailReg").html("&nbsp;");
				$(".emailICh").text("필수 입력 항목입니다.");
				
			}
		};
		var checkNN = false;
		var nicknameReg = function() {

			var nickname = $("input[name=nickname]").val()
			var reg = /^[가-힣A-Za-z0-9]{2,8}$/g;
			if (nickname.length != 0) {
				if (nickname.match(reg) != null) {
					 if (nickname.includes('관리자') || nickname.includes('운영자')){
							$(".nickReg").text("관리자또는 운영자가 포함된 닉네임은 사용하실 수 없습니다.");
					} else {
							$(".nickReg").html("&nbsp;");
							checkNN = true;
					}
				}else {
						$(".nickReg").text("2~8자의 한글, 영어 대 소문자, 숫자만 사용할 수 있습니다.");
				}
			} else {
				$(".nickReg").text("필수 입력 항목입니다.");
				
			}
		};
		
		var checkPR = false;
		var pwReg = function() {
			var password = $("input[name=pw]").val()
			var reg = /^[A-Za-z0-9!@#$%^&*]{8,15}$/g;
			if (password.length != 0) {
				if (password.match(reg) != null) {
					$(".pwReg").html("&nbsp;");
					checkPR = true;
				} else {
					$(".pwReg").text(
							"8~15자의 영어 대 소문자, 숫자와 특수문자(!@#$%^&*)만 사용할 수 있습니다.");
				}
			} else {
				$(".pwReg").html("&nbsp;");
				$(".pwICh").text("필수 입력 항목입니다.");
			}
		};
		
		var checkPCR = false;
		var pwChReg = function() {
			var password1 = $("input[name=pw]").val()
			var password2 = $("input[name=pwCh]").val()
			var reg = /^[A-Za-z0-9!@#$%^&*]{8,15}$/g;
			if (password2.length != 0 && password2.match(reg) != null) {
				$(".pwCh").html("&nbsp;");
				checkPCR = true;
			} else if (password2.length != 0 && password2.match(reg) == null) {
				$(".pwCh")
						.text("8~15자의 영어 대 소문자, 숫자와 특수문자(!@#$%^&*)만 사용할 수 있습니다.");
			} else {
				$(".pwCh").text("필수 입력 항목입니다.");
			}
		};
		
		var checkPN = true;
		var phoneReg = function(){
			var phone = $("#phone").val()
			var reg = /^01([0|1|6|7|8|9]?)+([0-9]{3,4})+([0-9]{4})$/;
			if(phone.length != 0 && phone.match(reg) == null){
				checkPN = false;
				$(".phoneReg").text("휴대폰 번호 양식이 맞지 않습니다.")
			} else {
				checkPN = true;
				$(".phoneReg").html("&nbsp;")
			}
		}
		
		var checkPE = false;
		var passEqual = function() {
			var pass1 = $("input[name=pw]").val();
			var pass2 = $("input[name=pwCh]").val();
				if (pass1 == pass2) {
					$(".pwCh").text("비밀번호가 일치합니다.");
					$(".pwCh").css("color", "blue");
					checkPE=true;
				} else {
					$(".pwCh").text("비밀번호가 일치하지 않습니다.");
					$(".pwCh").css("color", "red");
				}
		};
		
		var checkBday = false;
		var isAdult = function(){
			var bDay = $("#birthdate").val(); //input date의 값
			console.log(bDay);
			var dateSplit = bDay.split("-"); //input date의 값을 -로 쪼갠거야
			var bYear = dateSplit[0]; //input date 첫조각 연도
			var bMonth = dateSplit[1]; //input date 두번째조각 월
			var bDate = dateSplit[2]; //input date 마지막조각 일
			var yMod = year - bYear;
			var mMod = month - bMonth;
			var dMod = date - bDate;
			if (bDay != null && bDay != "" && bDay != undefined) {
				if (yMod < 19) {
					checkBday = false;
					$("#bdlabel").css("color", "red");
				} else if (yMod > 19) {
					checkBday = true;
					$("#bdlabel").css("color", "transparent");
				} else {
					if (mMod < 0) {
						checkBday = false;
						$("#bdlabel").css("color", "red");
					} else if (mMod > 0) {
						checkBday = true;
						$("#bdlabel").css("color", "red");
					} else {
						if(dMod => 0){
							checkBday = true;
							$("#bdlabel").css("color", "transparent");
						} else {
							checkBday = false;
							$("#bdlabel").css("color", "red");
						}
					};
				};
			} else {
				checkBday = true;
				$("#bdlabel").css("color", "transparent");
			};
		};
		$(function(){
		$("#birthdate").attr("max", year+"-12-31");
		});
		
		//이벤트 등록
		$("#birthdate").on("change", isAdult);
		$("#pw").on("keyup", pwReg);
		$("#pwCh").on("keyup", pwChReg);
		$("#pwCh").on("keyup", passEqual);
		$("#email").on("keyup", emailReg);
		$("#nickname").on("keyup", nicknameReg);
		$("#phone").on("keyup", phoneReg);
	
	// 회원가입
	$("#insert").on("click", function() {
		var dataquery = $("#frmJoin").serialize();
		if(checkER && checkED && checkND && checkNN && checkPR && checkPCR && checkPE && checkBday && checkPN){
			$.ajax({
				url : "signupmember",
				type : "POST",
				data : dataquery,
				async : true,
				success : function(data) {
					location.href = "authwait"
				},
				error : function(request, status, error) {
					alert("회원가입 과정에서 오류가 발생하였습니다.")
				}
			})
		} else {
			alert("입력 항목을 다시 확인해주세요.")
			$(window).scrollTop(0);
		}
	});
});