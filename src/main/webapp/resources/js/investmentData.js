$(function() {
	var checkpw = false;
	coinname(); // 숫자를 이름으로 변경
	chart();
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
					// var cy = $("#hidden").val();
					// $("#cybcash").val(cy);
					checkpw = true;
					wblist();
					wslist();
					blist();
					slist();
					acnt();
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
		var b = $("#cnt_b").val()*1;
		var now = $("#cybcash").val();
		sum = a * b;
		var tsum = (sum).toFixed(0);
		$("#totalprice").val(tsum);
		$("#updateprice").val(now - tsum);
		
		var csum = 0;
		var c = $("#coincount").val()*1;
		console.log(c);
		csum  = c + b;	
		console.log(csum);
		$("#updatecoin").val(csum);
	});
	$("#cnt_s").keyup(function() { // 합계 구하기 매도
		var sum = 0;
		var a = $("#price_s").val();
		var b = $("#cnt_s").val();
		var now = $("#cybcash").val();
		sum = a * b;
		var tsum = (sum).toFixed(0);
		$("#totalprice").val(tsum);
		$("#updateprice").val(now + tsum);
		
		var csum = 0;
		var c = $("#coincount").val();
		csum  = c - b;	
		$("#updatecoin").val(csum);

	});
	// ///////////////////////////////////////////////////////////////////////////////////////
	$("#sold").on(
			// 미체결 매도 추가하기
			"click",
			function() {
				if (confirm("매도 주문을 체결하시겠습니까 ?")) {
					if (checkpw == false) {
						alert("계좌비밀번호를 입력해주세요");
					} else {
						var ch = $("#totalprice").val();
						if (ch < 5000) {
							alert("최소주문금액이 작습니다.");
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
									alert("ws실패" + "error code : "
											+ request.status + "\n"
											+ "message : "
											+ request.responseText + "\n"
											+ "error : " + errorData);
								}
							});
						}
					}
				} else {
					alert("매도주문이 취소 되었습니다.");
				}
			});

	$("#bought").on(
			// 매수 버든 wait bought insert 미체결
			"click",
			function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
				if (confirm("매도 주문을 체결하시겠습니까 ?")) {
					if (checkpw == false) {
						alert("계좌비밀번호를 입력해주세요");
					} else {
						var ch = $("#totalprice").val();
						if (ch < 5000) {
							alert("최소주문금액이 작습니다.");
						} else {
							var price = $("#updateprice").val();
							if (price < 0) {
								alert("보유현금을 확인해주세요");
							} else {

								var dataList = $("#frm22").serialize();
								$
										.ajax({
											url : "wbInsert",
											type : "post",
											data : dataList,
											dataType : "json",
											success : function(data) {
												up();
												wblist();

											},
											error : function(request, status,
													errorData) {
												alert("실패" + "error code : "
														+ request.status + "\n"
														+ "message : "
														+ request.responseText
														+ "\n" + "error : "
														+ errorData);
											}
										});
							}
						}
					}
				} else {
					alert("매수주문이 취소 되었습니다.");
				}
			});

	var timer1 = setInterval(function() { // 1초마다 함수 돌림 ()
		alltable();
		orderbook();
		if (checkpw == true) {
			wblist();
			wslist();
			blist();
			slist();
			acnt();
			coinacnt();
		}

	}, 1000);

});

var coinList = null; // 전체 리스트
var changecoin = "BTC"; // default
var ch_title = "BTC";
function alltable() { // 전체코인 시세 표
	var display = new Array();
	var titdisplay = new Array();
	var onedisplay = new Array();

	var html = "";
	var title = "";
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
						titdisplay[0] = [
								data['data'][ch_title]['closing_price'] * 1,
								data['data'][ch_title]['fluctate_rate_24H'] * 1,
								data['data'][ch_title]['acc_trade_value_24H'] * 1,
								data['data'][ch_title]['min_price'] * 1,
								data['data'][ch_title]['max_price'] * 1 ]
						html = "<table class='table table-striped' id='cointable' ><tr><td>코인명</td><td>현재가</td><td>등락률(24H)</td><td>거래대금</td></tr>";
						title = "<table class='table table-striped' id='tit'><tr>";
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
						title += "<td>" + ch_title + "</td><td>현재가:"
								+ titdisplay[0][0] + "</td><td>전일대비:"
								+ titdisplay[0][1] + "</td><td>저가:"
								+ titdisplay[0][3] + "</td><td>고가:"
								+ titdisplay[0][4] + "</td></tr>"

						html += "</table>"
						title += "</table>"
						$("#cointable_div").html(html);
						$("#title").html(title);

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
						var onechange = "";

						onedisplay[0] = [
								data['data'][search]['closing_price'] * 1,
								data['data'][search]['fluctate_rate_24H'] * 1,
								data['data'][search]['acc_trade_value_24H'] * 1 ]
						html = "<table style='height : 146px; table-layout : fixed;' class='table table-striped' ><tr><td width= '78.08px !important'>코인명</td><td width= '91.36px !important'>현재가</td><td width= '78.77px !important'>등락률(24H)</td><td width= '164.31px !important'>거래대금</td></tr>";

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
function coinacnt() { // 컨트롤러로 부터 리스트를 받아서 출력한다
	var dataList4 = $("#frm22").serialize();
	$.ajax({
		url : "coincount",
		type : "post",
		data : dataList4,
		dataType : "json",
		success : function(data) {
			if (data == null) {
				$("#coincount").val(0);

			} else {
				$("#coincount").val(data.buycnt);

			}
		},
		error : function(request, status, errorData) {
			alert("ws실패" + "error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n" + "error : "
					+ errorData);
		}
	});
}
function up() { // acnt 돈계산 부분
	$.ajax({
		url : "coinupdate",
		type : "post",
		data : {
			"acntno" : $("#acntno").val(),
			"cybcash" : $("#updateprice").val()
		},
		success : function(data) {
		},
		error : function(request, status, errorData) {
			alert("ws실패" + "error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n" + "error : "
					+ errorData);
		}
	});
}
function upcoin() { // coin 돈계산 부분
	$.ajax({
		url : "coinacntupdate",
		type : "post",
		data : {
			"acntno" : $("#acntno").val(),
			"coin" : $("#coin").val(),
			"buycnt" : $("#updatecoin").val()
		},
		success : function(data) {
		},
		error : function(request, status, errorData) {
			alert("ws실패" + "error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n" + "error : "
					+ errorData);
		}
	});
}
function acnt() { // acnt 돈계산 부분

	$.ajax({
		url : "acntlists",
		type : "post",
		dataType : "json",
		data : {
			"acntno" : $("#acntno").val()
		},
		success : function(data) {

			$("#cybcash").val(data.cybcash);
		},
		error : function(request, status, errorData) {
			alert("ws실패" + "error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n" + "error : "
					+ errorData);
		}
	});
}

function slist() { // 컨트롤러로 부터 리스트를 받아서 출력한다
	var dataList = $("#frm22").serialize();

	$
			.ajax({
				url : "ajslists",
				type : "POST",
				data : dataList,
				dataType : "json",

				success : function(json) {

					var html1 = "<br><span>채결 매도주문내역</span><form id='frm24'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매도가격</td><td>매도날짜</td><td>계좌번호</td></tr>";

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

					var html1 = "<span>채결 매수주문내역</span><form id='frm23'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td></tr>";

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

function wslist() { // 미체결 매도 내용 함수
	var dataList = $("#frm22").serialize();

	$
			.ajax({
				url : "ajwslists",
				type : "POST",
				data : dataList,
				dataType : "json",

				success : function(json) {

					var html1 = "<br><span>미채결 매도주문내역</span><form id='frm29'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매도가격</td><td>매도날짜</td><td>계좌번호</td><td>주문취소</td></tr>";

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
		"height" : "650",
		"width" : "850",
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
		ch_title = coinList[listNum];
	} else {
		changecoin = listNum;
		ch_title = listNum;

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

		}
	});
};
function removeWaitBought(ubno, buycnt, buyprice) {
	if (confirm("매수를 취하시려면 예를 누르시고 매수를 취소하지 않으시려면 아니오를 눌러주세요")) {
		$.ajax({
			url : "wbdelete",
			type : "post",
			data : {
				"ubno" : ubno
			},
			success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
				if (data > 0) {
					alert("매수가 정상적으로 취소 되었습니다.");
					var returnprice = buycnt * buyprice;
					var cc = returnprice + $("#cybcash").val() * 1;
					returnup(cc);

				} else {
					alert("BTS : 문의요망");
				}

			},
			error : function(request, status, errorData) {
				alert("실패" + "error code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData);
			}
		});
	} else {
		alert("주문취소가 취소되었습니다.");
	}

}

function removeWaitSold(usno) {
	if (confirm("매도를 취하시려면 예를 누르시고 매도를 취소하지 않으시려면 아니오를 눌러주세요")) {
		$.ajax({
			url : "wsdelete",
			type : "post",
			data : {
				"usno" : usno
			},
			success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
				if (data > 0) {
					alert("매도가 정상적으로 취소 되었습니다.");
					wslist();
				} else {
					alert("실패");
				}

			},
			error : function(request, status, errorData) {
				alert("실패" + "error code : " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData);
			}
		});
	} else {
		alert("주문취소가 취소되었습니다.");
	}

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

					var html1 = "<span>미채결 매수주문내역</span><form id='frm20'><table class='table table-striped' ><tr><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td><td>주문취소</td></tr>";
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
													+ ", "
													+ entry.buycnt
													+ ", "
													+ entry.buyprice
													+ ")\">X</button></td></tr>";
										});
						html1 += "</table></form>"
					} else {
						html1 = "<div>내용이없습니다</div>";
					}

					$("#aj_wb").html(html1);

				}

			});
}
function returnup(price) {
	$.ajax({
		url : "coinupdate",
		type : "post",
		data : {
			"acntno" : $("#acntno").val(),
			"cybcash" : price
		},
		success : function(data) {
		},
		error : function(request, status, errorData) {
			alert("ws실패" + "error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n" + "error : "
					+ errorData);
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

function orderbook() {
	var orderbookarrbid = new Array();
	var orderbookarrask = new Array();
	var a = $("#coin").val();
	var html6 = "";
	$
			.ajax({
				url : 'https://api.upbit.com/v1/orderbook?markets=KRW-' + a,
				type : "get",
				cache : false,
				datatype : "json",
				success : function(data) {
					for (var i = 0; i < 15; i++) {
						orderbookarrbid[i] = [
								data[0]['orderbook_units'][i]['bid_price'] * 1,
								data[0]['orderbook_units'][i]['bid_size'] * 1 ]
					}
					for (var i = 0; i < 15; i++) {
						orderbookarrask[i] = [
								data[0]['orderbook_units'][i]['ask_price'] * 1,
								data[0]['orderbook_units'][i]['ask_size'] * 1 ]
					}
					html6 = "<table id='orderbook_t' class='table table-striped' ><tr><td>현재가</td><td>수량</td></tr>";
					for (var i = 14; i >= 0; i--) {
						html6 += "<tr style='background: rgba(255,51,0,0.5) !important;'><td><a >"
								+ orderbookarrask[i][0]
								+ "<a/a></td><td>"
								+ orderbookarrask[i][1] + "개" + "</td></tr>";

					}
					html6 += "<tr><td>구분좀하자 </td></tr>";
					for (var i = 0; i < 15; i++) {
						html6 += "<tr  style='background: rgba(33,150,243, 0.5) !important;'><td>"
								+ orderbookarrbid[i][0] + "</td><td>"
								+ orderbookarrbid[i][1] + "개" + "</td></tr>";

					}
					html6 += "</table>"
					$("#aaaaa").html(html6);
				}
			});
};

