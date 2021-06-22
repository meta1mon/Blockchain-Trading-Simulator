$(function(){
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
				console.log("check 됐다: " + $("input[name=mailing]").val());
			} else{
				$("input[name=mailing]").val('N');
				console.log("check 안됐다: " + $("input[name=mailing]").val());
				
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
	
	// 회원가입
	$("#insert").on("click", function() {
		console.log("회원가입버튼누름");
		var dataquery = $("#frmJoin").serialize();
		// console.log("dataquery: " + dataquery);
		console.log("이메일: " + checkER + "\n이메일 중복 확인: " + checkED + "\n닉네임: " + checkNN + "\n닉네임 중복 확인: " + checkND + "\n비밀번호: " + checkPR + "\n비밀번호 확인: " + checkPCR + "\n비밀번호 일치: " + checkPE + "\n성인 확인: " + checkBday + "\n연락처 양식: " + checkPN)
		if(checkER && checkED && checkND && checkNN && checkPR && checkPCR && checkPE && checkBday && checkPN){
			
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
			$(window).scrollTop(0);
		}
	});
});