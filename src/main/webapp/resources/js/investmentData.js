$(function() {
	var checkpw = false;
	coinname(); // 숫자를 이름으로 변경
	chart();
	$("#check_cnt").click(function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
		var dataList4 = $("#frm22").serialize();
		console.log("여기~!!@!@!!");
		$.ajax({
			url : "coincount",
			type : "post",
			data : dataList4,
			dataType : "json",
			success : function(data) {
				console.log(data);
			},
			error : function(request, status, errorData) {
				alert("ws실패" + "error code : " + request.status
						+ "\n" + "message : "
						+ request.responseText + "\n" + "error : "
						+ errorData);
			}
		});
	});
	$("#check2").click(function() { // 계좌 비밀번호

		var acntList = $("#frm11").serialize();
		var html3 = "";
		$.ajax({
			url : "bankpw",
			type : "post",
			data : acntList,
			success : function(data) {
				if (data == 1) {
					html3 += "<a style='color: green;'>성공</a>"
					var cy = $("#hidden").val();
					$("#cybcash").val(cy + "원");
					checkpw = true;
					wblist();
					wslist();
					blist();
					slist();

				} else {
					checkpw = false;
					alert("계좌 비밀번호를 확인해 주세요 ");
					html3 += "<a style='color: red;'>오류</a>"
				}
				$("#su").html(html3);
			}
		})

	});
	$("#sold_b").click(function() {// 매도 활성화

		$("#sold_b").css("background", "blue");
		$("#bought_b").css("background", "white");
		$("#cnt_b").hide();
		$("#price_b").hide();
		$("#bought").hide();
		$("#cnt_s").show();
		$("#price_s").show();
		$("#sold").show();
	});
	$("#bought_b").click(function() {// 매수 활성화

		$("#bought_b").css("background", "red");
		$("#sold_b").css("background", "white");
		$("#cnt_s").hide();
		$("#price_s").hide();
		$("#sold").hide();
		$("#cnt_b").show();
		$("#price_b").show();
		$("#bought").show();
	});

	$("#cnt_b").keyup(function() { // 합계 구하기 매수
		var sum = 0;
		var a = $("#price_b").val();
		var b = $("#cnt_b").val();
		sum = a * b;
		$("#totalprice").val(sum);
	});
	$("#cnt_s").keyup(function() { // 합계 구하기 매도
		var sum = 0;
		var a = $("#price_s").val();
		var b = $("#cnt_s").val();
		sum = a * b;
		$("#totalprice").val(sum);
	});
	// ///////////////////////////////////////////////////////////////////////////////////////
	$("#sold").on(
			// 미체결 매도 추가하기
			"click",
			function() {
				if (checkpw == false) {
					alert("계좌비밀번호를 입력해주세요");
				} else {
					var dataList = $("#frm22").serialize();
					$.ajax({
						url : "wsInsert",
						type : "post",
						data : dataList,
						dataType : "json",
						success : function(data) {
							wslist();
						},
						error : function(request, status, errorData) {
							alert("ws실패" + "error code : " + request.status
									+ "\n" + "message : "
									+ request.responseText + "\n" + "error : "
									+ errorData);
						}
					});
				}
			});

	$("#bought").on(
			// 매수 버든 wait bought insert 미체결
			"click",
			function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
				if (checkpw == false) {
					alert("계좌비밀번호를 입력해주세요");
				} else {
					var dataList = $("#frm22").serialize();
					$.ajax({
						url : "wbInsert",
						type : "post",
						data : dataList,
						dataType : "json",
						success : function(data) {
							wblist();

						},
						error : function(request, status, errorData) {
							alert("실패" + "error code : " + request.status
									+ "\n" + "message : "
									+ request.responseText + "\n" + "error : "
									+ errorData);
						}
					});
				}
			});

	/*
	 * $("#select_coin") // 매수 & 매도 체결로 갈경루 코인계좌에 조회 .on( "click", function() { //
	 * 컨트롤러로 부터 리스트를 받아서 출력한다 var dataList = $("#frm22").serialize(); $ .ajax({
	 * url : "coinacntlists", type : "POST", data : dataList, dataType : "json",
	 * 
	 * success : function(json) {
	 * 
	 * var html1 = "<form id='frm23'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>계좌번호</td></tr>";
	 * 
	 * if (json.length > 0) { $ .each( json, function( entryIndex, entry) {
	 * html1 += "<tr><td>" + entry.cano + "</td>" + "<td>" + entry.coin + "</td>" + "<td>" +
	 * entry.buycnt + "</td>" + "<td>" + entry.buyprice + "</td>" + "<td>" +
	 * entry.acntno + "</td>" + "<td><button class='del'
	 * onclick=\"removeCoinAcnt(" + entry.cano + ")\">X</button></td></tr>";
	 * }); html1 += "</table></form>" } else { html1 = "<div>내용이없습니다</div>"; }
	 * 
	 * $("#aj_b").html(html1); }
	 * 
	 * }); });
	 */
	/*
	 * $("#select_acnt") // 자신의 현재 자산 확인 acnt .on( "click", function() { //
	 * 컨트롤러로 부터 리스트를 받아서 출력한다 var dataList = $("#frm22").serialize(); $ .ajax({
	 * url : "acntlists", type : "POST", data : dataList, dataType : "json",
	 * 
	 * success : function(json) {
	 * 
	 * var html1 = "<form id='frm23'><table class='table table-striped' ><tr><td>계좌번호</td><td>계좌보유금액</td><td>이메일</td></tr>";
	 * 
	 * if (json.length > 0) { $.each(json, function(entryIndex, entry) { html1 += "<tr><td>" +
	 * entry.acntno + "</td>" + "<td>" + entry.cybcash + "</td>" + "<td>" +
	 * entry.email + "</td></tr>"; }); html1 += "</table></form>" } else {
	 * html1 = "<div>내용이없습니다</div>"; }
	 * 
	 * $("#aj_b").html(html1); }
	 * 
	 * }); });
	 * 
	 * 
	 */
	var timer1 = setInterval(function() { // 1초마다 함수 돌림 ()
		console.log("1초");
		alltable();
		orderbook();

	}, 1000);

});

var coinList = null; // 전체 리스트
var changecoin = "BTC"; // default

function alltable() { // 전체코인 시세 표
	var display = new Array();
	var onedisplay = new Array();

	var html = "";
	var thisCoin = null;
	$
			.ajax({
				url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
				type : "get",
				cache : false,
				datatype : "json",
				success : function(data) {
					var search = $("#searchcoin").val().toString();
					search = search.toUpperCase();
					if (search == "") {
						for (var i = 0; i < (coinList.length) - 1; i++) {
							display[i] = [
									data['data'][coinList[i]]['closing_price'] * 1,
									data['data'][coinList[i]]['fluctate_rate_24H'] * 1,
									data['data'][coinList[i]]['acc_trade_value_24H'] * 1 ]
						}
						html = "<table class='table table-striped' id='cointable' ><tr><td>코인명</td><td>현재가</td><td>등락률(24H)</td><td>거래대금</td></tr>";
						for (var i = 0; i < coinList.length - 1; i++) {
							thisCoin = i;
							html += "<tr><td><a href=# onclick='changename("
									+ thisCoin
									+ ");'>"
									+ coinList[i]
									+ "</a></td><td>"
									+ display[i][0]
									+ "</td><td><span class='change_c'>"
									+ display[i][1]
									+ "</span><span class='change_cp'>%</span></td><td>"
									+ display[i][2] + "</td></tr>";

						}

						html += "</table>"
						$("#cointable_div").html(html);

						for (var i = 0; i < coinList.length - 1; i++) {
							var num = $(".change_c").eq(i);
							var percent = $(".change_cp").eq(i);
							if (num.text() * 1 > 0) {
								num.css('color', 'red');
								percent.css('color', 'red');
							} else if (num.text() * 1 == 0) {
								num.css('color', 'black');
								percent.css('color', 'black');
							} else {
								num.css('color', 'blue');
								percent.css('color', 'blue');
							}
						}

						$('.table-striped tbody tr:nth-of-type(odd)').css(
								'background-color', 'rgb(227,200,248, 0.0453)');
					} else {
						console.log(search + "검색한 서치값");
						var onechange = "";

						onedisplay[0] = [
								data['data'][search]['closing_price'] * 1,
								data['data'][search]['fluctate_rate_24H'] * 1,
								data['data'][search]['acc_trade_value_24H'] * 1 ]
						html = "<table class='table table-striped' ><tr><td>코인명</td><td>현재가</td><td>등락률(24H)</td><td>거래대금</td></tr>";

						html += "<tr><td><a href=# onclick='changename(\""
								+ search + "\");'>" + search + "</a></td><td>"
								+ onedisplay[0][0] + "</td><td>"
								+ onedisplay[0][1] + "%" + "</td><td>"
								+ onedisplay[0][2] + "</td></tr>";

						html += "</table>"
						$("#cointable_div").html(html);
						$('.table-striped tbody tr:nth-of-type(odd)').css(
								'background-color', 'rgb(227,200,248, 0.0453)');
					}

				}
			});
};
function slist() { // 컨트롤러로 부터 리스트를 받아서 출력한다
	var dataList = $("#frm22").serialize();

	$
			.ajax({
				url : "ajslists",
				type : "POST",
				data : dataList,
				dataType : "json",

				success : function(json) {

					var html1 = "<form id='frm23'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td></tr>";

					if (json.length > 0) {
						$.each(json, function(entryIndex, entry) {
							html1 += "<tr><td>" + entry.usno + "</td>" + "<td>"
									+ entry.coin + "</td>" + "<td>"
									+ entry.sellcnt + "</td>" + "<td>"
									+ entry.sellprice + "</td>" + "<td>"
									+ entry.sdate + "</td>" + "<td>"
									+ entry.acntno + "</td></tr>";
						});
						html1 += "</table></form>"
					} else {
						html1 = "<div>내용이없습니다</div>";
					}

					$("#aj_s").html(html1);

				}

			});
}

function blist() { // 컨트롤러로 부터 리스트를 받아서 출력한다
	var dataList = $("#frm22").serialize();

	$
			.ajax({
				url : "ajblists",
				type : "POST",
				data : dataList,
				dataType : "json",

				success : function(json) {

					var html1 = "<form id='frm23'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td></tr>";

					if (json.length > 0) {
						$.each(json, function(entryIndex, entry) {
							html1 += "<tr><td>" + entry.ubno + "</td>" + "<td>"
									+ entry.coin + "</td>" + "<td>"
									+ entry.buycnt + "</td>" + "<td>"
									+ entry.buyprice + "</td>" + "<td>"
									+ entry.bdate + "</td>" + "<td>"
									+ entry.acntno + "</td></tr>";
						});
						html1 += "</table></form>"
					} else {
						html1 = "<div>내용이없습니다</div>";
					}

					$("#aj_b").html(html1);

				}

			});
}
function wblist() { // 미체결 매수 ajax함수
	var dataList = $("#frm22").serialize();

	$
			.ajax({
				url : "ajwblists",
				type : "POST",
				data : dataList,
				dataType : "json",

				success : function(json) {

					var html1 = "<span>미채결 매수주문내역</span><form id='frm23'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td></tr>";
					if (json.length > 0) {
						$
								.each(
										json,
										function(entryIndex, entry) {
											html1 += "<tr><td>"
													+ entry.ubno
													+ "</td>"
													+ "<td>"
													+ entry.coin
													+ "</td>"
													+ "<td>"
													+ entry.buycnt
													+ "</td>"
													+ "<td>"
													+ entry.buyprice
													+ "</td>"
													+ "<td>"
													+ entry.wbdate
													+ "</td>"
													+ "<td>"
													+ entry.acntno
													+ "</td>"

													+ "<td><button type='button' class='del' onclick=\"removeWaitBought("
													+ entry.ubno
													+ ")\">X</button><input type='hidden' name='wbno' value='"
													+ entry.ubno
													+ "'></input></td></tr>";
										});
						html1 += "</table></form>"
					} else {
						html1 = "<div>내용이없습니다</div>";
					}

					$("#aj_wb").html(html1);

				}

			});
}
function wslist() { // 미체결 매도 내용 함수
	var dataList = $("#frm22").serialize();

	$
			.ajax({
				url : "ajwslists",
				type : "POST",
				data : dataList,
				dataType : "json",

				success : function(json) {

					var html1 = "<br><span>미채결 매도주문내역</span><form id='frm23'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td></tr>";

					if (json.length > 0) {
						$
								.each(
										json,
										function(entryIndex, entry) {
											html1 += "<tr><td>"
													+ entry.usno
													+ "</td>"
													+ "<td>"
													+ entry.coin
													+ "</td>"
													+ "<td>"
													+ entry.sellcnt
													+ "</td>"
													+ "<td>"
													+ entry.sellprice
													+ "</td>"
													+ "<td>"
													+ entry.wsdate
													+ "</td>"
													+ "<td>"
													+ entry.acntno
													+ "</td>"

													+ "<td><button type='button' class='del' onclick=\"removeWaitSold("
													+ entry.usno
													+ ")\">X</button></td></tr>";
										});
						html1 += "</table></form>"
					} else {
						html1 = "<div>내용이없습니다</div>";
					}

					$("#aj_ws").html(html1);

				}

			});
}
function chart() { // 차트

	new TradingView.widget({
		"width" : 600,
		"height" : 490,
		"symbol" : "BITHUMB:" + changecoin + "KRW",
		"interval" : "5",
		"timezone" : "Asia/Seoul",
		"theme" : "light",
		"style" : "1",
		"locale" : "kr",
		"toolbar_bg" : "rgb(227,200,248, 0.14)",
		"enable_publishing" : true,
		"withdateranges" : true,
		"allow_symbol_change" : true,
		"container_id" : "tradingview_3fe73"
	});

}

function toname(name) {
	document.getElementById("coin").value = name;
};

function changename(listNum) {
	var checkstring = typeof (listNum);

	if (checkstring == 'number') {
		changecoin = coinList[listNum];

	} else {
		changecoin = listNum;

	}
	toname(changecoin);
	chart();
};

function coinname() {

	$.ajax({
		url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
		type : "get",
		cache : false,
		datatype : "json",
		success : function(data) {
			coinList = Object.keys(data['data']);
			console.log(coinList);

		}
	});
};
function removeWaitBought(ubno) { // 미체결 매수 삭제
	$.ajax({
		url : "wbdelete",
		type : "post",
		data : {
			"ubno" : ubno
		},
		success : function(data) {

		},
		error : function(request, status, errorData) {
			alert("실패" + "error code : " + request.status + "\n" + "message : "
					+ request.responseText + "\n" + "error : " + errorData);
		}
	});
}
function removeBought(ubno) { // 체결 매수 삭제
	$.ajax({
		url : "bdelete",
		type : "post",
		data : {
			"ubno" : ubno
		},
		success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
		},
		error : function(request, status, errorData) {
			alert("실패" + "error code : " + request.status + "\n" + "message : "
					+ request.responseText + "\n" + "error : " + errorData);
		}
	});
}
function removeWaitSold(usno) { // 미체결 매도 삭제
	$.ajax({
		url : "wsdelete",
		type : "post",
		data : {
			"usno" : usno
		},
		success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다

		},
		error : function(request, status, errorData) {
			alert("실패" + "error code : " + request.status + "\n" + "message : "
					+ request.responseText + "\n" + "error : " + errorData);
		}
	});
}
function removeSold(usno) { // 체결 매도 삭제
	$.ajax({
		url : "sdelete",
		type : "post",
		data : {
			"usno" : usno
		},
		success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다

		},
		error : function(request, status, errorData) {
			alert("실패" + "error code : " + request.status + "\n" + "message : "
					+ request.responseText + "\n" + "error : " + errorData);
		}
	});
}
function orderbook() {
	var orderbookarrbid = new Array();
	var orderbookarrask = new Array();
	var a = $("#coin").val();
	var html6 = "";
	console.log(a);
	$
			.ajax({
				url : 'https://api.upbit.com/v1/orderbook?markets=KRW-' + a,
				type : "get",
				cache : false,
				datatype : "json",
				success : function(data) {
					for (var i = 0; i < 5; i++) {
						orderbookarrbid[i] = [
								data[0]['orderbook_units'][i]['bid_price'] * 1,
								data[0]['orderbook_units'][i]['bid_size'] * 1 ]
					}
					for (var i = 0; i < 5; i++) {
						orderbookarrask[i] = [
								data[0]['orderbook_units'][i]['ask_price'] * 1,
								data[0]['orderbook_units'][i]['ask_size'] * 1 ]
					}
					html6 = "<table class='table table-striped' ><tr><td>현재가</td><td>수량</td></tr>";
					for (var i = 4; i >= 0; i--) {
						html6 += "<tr style='background: red; opacity: 0.3;'><td>"
								+ orderbookarrask[i][0]
								+ "</td><td>"
								+ orderbookarrask[i][1] + "개" + "</td></tr>";

					}
					html6 += "<tr><td>구분좀하자 </td></tr>";
					for (var i = 0; i < 5; i++) {
						html6 += "<tr  style='background: blue;'><td>"
								+ orderbookarrbid[i][0] + "</td><td>"
								+ orderbookarrbid[i][1] + "개" + "</td></tr>";

					}
					html6 += "</table>"
					$("#aaaaa").html(html6);
				}
			});
};

