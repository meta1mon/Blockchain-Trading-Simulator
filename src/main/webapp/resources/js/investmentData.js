$(function() {
	var bnum = 1; // 차트 종류
	var checkpw = false; // 2차 비밀번호 변수
	coinname(); // 숫자를 이름으로 변경
	chart(); // 차트 변수

	$("#check2").click(function() { // 계좌 비밀번호
		var acntList = $("#frm11").serialize();
		var checkhtml = "";
		$.ajax({
			url : "bankpw",
			type : "post",
			data : acntList,
			success : function(data) {
				if (data == 1) {
					checkhtml += "<a style='color: green;'>성공</a>"
					checkpw = true;
					wblist();
					wslist();
					blist();
					slist();
					acnt();

					$("#icon").css("display", "block");
				} else {
					checkpw = false;
					alert("계좌 비밀번호를 확인해 주세요 ");
					checkhtml += "<a style='color: red;'>오류</a>"
				}
				$("#su").html(checkhtml);
			}
		})

	});

	// ///////////////////////////////// CSS
	$("#sold_b").click(function() {// 매도 활성화 css
		$("#sold_b").css("color", "white");
		$("#sold_b").css("background", "#4387f9");
		$("#sold_b").css("border", "0px");

		$("#bought_b").css("color", "black");
		$("#bought_b").css("background", "white");
		$("#bought_b").css("border", "2px black solid");
		
		$("#cnt_b").hide();
		$("#price_b").hide();
		$("#bought").hide();
		$("#cnt_s").show();
		$("#price_s").show();
		$("#sold").show();
	});
	$("#bought_b").click(function() {// 매수 활성화 css
		$("#bought_b").css("color", "white");
		$("#bought_b").css("background", "#f75467");
		$("#bought_b").css("border", "0px");
		
		$("#sold_b").css("color", "black");
		$("#sold_b").css("background", "white");
		$("#sold_b").css("border", "2px black solid");
		
		$("#cnt_s").hide();
		$("#price_s").hide();
		$("#sold").hide();
		$("#cnt_b").show();
		$("#price_b").show();
		$("#bought").show();
	});
	// ///////////////// 총합계산 ///////////////////////////
	$("#cnt_b").blur(function() { // 합계 구하기 매수
		var sum = 0;
		var a = $("#price_b").val();
		var b = $("#cnt_b").val() * 1;
		var now = $("#cybcash").val();
		sum = a * b;
		var tsum = (sum).toFixed(0);
		$("#totalprice").val(tsum);
		$("#updateprice").val(now - tsum);

		var csum = 0;
		var c = $("#coincount").val() * 1;
		csum = c + b;
		console.log(csum);
		console.log(csum);
		console.log(csum);
		$("#updatecoin").val(csum);
	});
	$("#cnt_s").blur(function() { // 합계 구하기 매도
		var sum1 = 0;
		var a1 = $("#price_s").val();
		var b1 = $("#cnt_s").val() * 1;
		var now1 = $("#cybcash").val() * 1;
		sum1 = a1 * b1;
		var tsum1 = (sum1).toFixed(0);
		$("#totalprice").val(tsum1);
		$("#updateprice").val(now1 * 1 + tsum1 * 1);

		var csum1 = 0;
		var c1 = $("#coincount").val() * 1;
		csum1 = c1 - b1;
		$("#updatecoin").val(csum1);

	});
	$("#price_b").blur(function() { // 합계 구하기 매수
		var sum = 0;
		var a = $("#price_b").val();
		var b = $("#cnt_b").val() * 1;
		var now = $("#cybcash").val();
		sum = a * b;
		var tsum = (sum).toFixed(0);
		$("#totalprice").val(tsum);
		$("#updateprice").val(now - tsum);

		var csum = 0;
		var c = $("#coincount").val() * 1;
		csum = c + b;
		console.log(csum);
		console.log(csum);
		console.log(csum);
		$("#updatecoin").val(csum);
	});
	$("#price_s").blur(function() { // 합계 구하기 매도
		var sum1 = 0;
		var a1 = $("#price_s").val();
		var b1 = $("#cnt_s").val() * 1;
		var now1 = $("#cybcash").val() * 1;
		sum1 = a1 * b1;
		var tsum1 = (sum1).toFixed(0);
		$("#totalprice").val(tsum1);
		$("#updateprice").val(now1 * 1 + tsum1 * 1);

		var csum1 = 0;
		var c1 = $("#coincount").val() * 1;
		csum1 = c1 - b1;
		$("#updatecoin").val(csum1);

	});
	// /////////////////////////////////////////////////////////////////////////////////////
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
							var coin = $("#updatecoin").val();
							if (coin < 0) {
								alert("보유코인을 확인해주세요");
							} else {
								var dataList = $("#frm22").serialize();
								$
										.ajax({
											url : "wsInsert",
											type : "post",
											data : dataList,
											dataType : "json",
											success : function(data) {
												coinacntupdate();
												wslist();
												$("#price_b").val("");
												$("#price_s").val("");
												$("#cnt_b").val("");
												$("#cnt_s").val("");
												$("#totalprice").val("");
											},
											error : function(request, status,
													errorData) {
												alert("wsInsert"
														+ "error code : "
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
					alert("매도주문이 취소 되었습니다.");
				}
			});

	$("#bought").on(
			// 매수 버든 wait bought insert 미체결
			"click",
			function() { // 컨트롤러로 부터 리스트를 받아서 출력한다
				if (confirm("매수 주문을 체결하시겠습니까 ?")) {
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
												$("#price_b").val("");
												$("#price_s").val("");
												$("#cnt_b").val("");
												$("#cnt_s").val("");
												$("#totalprice").val("");

											},
											error : function(request, status,
													errorData) {
												alert("wbInsert"
														+ "error code : "
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
		qwer(bnum);
		orderbook();
		if (checkpw == true) {
			wblist();
			wslist();
			blist();
			slist();
			acnt();
			coinacnt();
			bcnt();
			scnt();
		}

	}, 3000);

});
// /////////// 함수 정의 부분 ///////////////////////
// 전역변수
var orderbookarrbid = new Array();
var orderbookarrask = new Array();
var titdisplay = new Array();
var coinList = null; // 전체 리스트
var changecoin = "BTC"; // default
var ch_title = "BTC";
var display = new Array();
var displays = new Array();
var html = "";
var subtitle = "";
var bnum = 2; // 차트 종류

// ////////// 차트 정렬 기준 ///////////////
function qwer(bnum) {
	if (bnum == 1) { // price down
		display.sort(function(a, b) {
			return a[0] - b[0];
		});
	} else if (bnum == 2) { // price up
		display.sort(function(a, b) {
			return b[0] - a[0];
		});
	} else if (bnum == 3) { // fr down
		display.sort(function(a, b) {
			return a[1] - b[1];
		});
	} else if (bnum == 4) { // fr up
		display.sort(function(a, b) {
			return b[1] - a[1];
		});
	} else if (bnum == 5) { // at down
		display.sort(function(a, b) {
			return a[2] - b[2];
		});
	} else if (bnum == 6) { // at up
		display.sort(function(a, b) {
			return b[2] - a[2];
		});
	}

}
function click1() {
	bnum = 2;
}
function click2() {
	bnum = 1;
}
function click3() {
	bnum = 4;
}
function click4() {
	bnum = 3;
}
function click5() {
	bnum = 6;
}
function click6() {

	bnum = 5;
}
// //////////////// 전체 코인 시세 표 /////////////
function alltable() {

	var onedisplay = new Array();

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
							var a = Object.keys(data['data']);
							var b = a[i];
							display[i] = [
									data['data'][b]['closing_price'] * 1,
									data['data'][b]['fluctate_rate_24H'] * 1,
									data['data'][b]['acc_trade_value_24H'] * 1,
									b ]
						}
						qwer(bnum);
						titdisplay[0] = [
								data['data'][ch_title]['closing_price'] * 1,
								data['data'][ch_title]['fluctate_rate_24H'] * 1,
								data['data'][ch_title]['acc_trade_value_24H'] * 1,
								data['data'][ch_title]['min_price'] * 1,
								data['data'][ch_title]['max_price'] * 1 ]
						html = "<table class='table table-striped' id='cointable'><tr><th style='position: sticky; top: 0px'>코인명</th><th style='position: sticky; top: 0px'>현재가</th><th style='position: sticky; top: 0px'>등락률(24H)</th><th style=' position: sticky; top: 0px;'>거래대금</th></tr>";
						// 위 코드에서 첫번째 tr 뒤에 있던 건데 빼도 괜찮음? <th style='position: sticky; top: 0px'>코인명</th>
						title = "<table class='table table-striped' id='tit'>";
						// 위 코드 뒤에 붙어있던건데 땠음<tr><th style='position: sticky; top: 0px'>코인명</th></tr>
						//TODO
						subtitle = "<td style='position: sticky; top: 0px'>현재가 </td>";
						for (var i = 0; i < coinList.length - 1; i++) {
							thisCoin = i;
							html += "<tr><td><a href=# onclick='changename(\""
									+ display[i][3]
									+ "\");'>"
									+ display[i][3]
									+ "</a></td><td>"
									+ display[i][0]
									+ "</td><td><span class='change_c'>"
									+ display[i][1]
									+ "</span><span class='change_cp'>%</span></td><td>"
									+ display[i][2] + "</td></tr>";

						}
						title += "<td style='text-align : center; vertical-align: middle; width : 255px;'><h1>"
								+ ch_title
								+ "</h1></td><td style='text-align : center;  width : 167px;'><h2>현재가</h2><a class='t_cha'style='text-align : center;'>"
								+ titdisplay[0][0]
								+ "</a></td><td style='text-align : center; width : 208px;'><h2>전일대비</h2><a class='t_cha'style='text-align : center;'>"
								+ titdisplay[0][1]
								+ "%</a></td><td style='text-align : center; width : 150px;'><h2>저가</h2><a class='t_ch' style='color : blue;text-align : center;'>"
								+ titdisplay[0][3]
								+ "</a></td><td style='text-align : center; width : 167px;'><h2>고가</h2><a class='t_ch' style='color : red;text-align : center;'>"
								+ titdisplay[0][4] + "</a></td></tr>"

						html += "</table>"
						title += "</table>"
						subtitle +="<td>"+ titdisplay[0][0] +"</td>"
						$("#cointable_div").html(html);
						$("#title").html(title);
						$("#now_price").html(subtitle);

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
						if (titdisplay[0][1] > 0) {
							$(".t_cha").css('color', 'red');
						} else {
							$(".t_cha").css('color', 'blue');

						}

					} else {
						var onechange = "";

						onedisplay[0] = [
								data['data'][search]['closing_price'] * 1,
								data['data'][search]['fluctate_rate_24H'] * 1,
								data['data'][search]['acc_trade_value_24H'] * 1 ]
						titdisplay[0] = [
								data['data'][ch_title]['closing_price'] * 1,
								data['data'][ch_title]['fluctate_rate_24H'] * 1,
								data['data'][ch_title]['acc_trade_value_24H'] * 1,
								data['data'][ch_title]['min_price'] * 1,
								data['data'][ch_title]['max_price'] * 1 ]
						title = "<table class='table table-striped' id='tit'><tr>";

						html = "<table style='height : 146px; table-layout : fixed;' class='table table-striped' ><tr><td width= '78.08px !important'>코인명</td><td width= '91.36px !important'>현재가</td><td width= '78.77px !important'>등락률(24H)</td><td width= '164.31px !important'>거래대금</td></tr>";
						title += "<td style='text-align : center; vertical-align: middle; width : 255px;'><h1>"
								+ ch_title
								+ "</h1></td><td style='text-align : center; width : 167px;'><h2>현재가</h2><a class='t_cha'style='text-align : center;'>"
								+ titdisplay[0][0]
								+ "</a></td><td style='text-align : center; width : 208px;'><h2>전일대비</h2><a class='t_cha'style='text-align : center;'>"
								+ titdisplay[0][1]
								+ "%</a></td><td style='text-align : center; width : 150px;'><h2>저가</h2><a class='t_ch' style='color : blue;text-align : center;'>"
								+ titdisplay[0][3]
								+ "</a></td><td style='text-align : center; width : 167px;'><h2>고가</h2><a class='t_ch' style='color : red;text-align : center;'>"
								+ titdisplay[0][4] + "</a></td></tr>"

						html += "<tr><td><a href=# onclick='changename(\""
								+ search + "\");'>" + search + "</a></td><td>"
								+ onedisplay[0][0] + "</td><td id='perc'>"
								+ onedisplay[0][1] + "<a>%</a></td><td>"
								+ onedisplay[0][2] + "</td></tr>";
						title += "</table>"
						html += "</table>"
						$("#title").html(title);
						$("#cointable_div").html(html);
						if (titdisplay[0][1] > 0) {
							$(".t_cha").css('color', 'red');
						} else {
							$(".t_cha").css('color', 'blue');
						}
						if (onedisplay[0][1] > 0) {
							$("#perc").css('color', 'red');
						} else {
							$("#perc").css('color', 'blue');
						}
						$('.table-striped tbody tr:nth-of-type(odd)').css(
								'background-color', 'rgb(227,200,248, 0.0453)');
					}

				}

			});
};

// //////////////////// update 환산 하는 부분 ///////////////////////////////
function returncoinfn(tc) { // 매도 취소시 코인 반환 update 문
	$.ajax({
		url : "coinacntupdate",
		type : "post",
		data : {
			"acntno" : $("#acntno").val(),
			"buycnt" : tc,
			"coin" : $("#coin").val()
		},
		success : function(data) {
		},
		error : function(request, status, errorData) {
			alert("coinacntupdate" + "error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n" + "error : "
					+ errorData);
		}
	});
}
// 매수 & 매도 실행시 돈계산 부분
function up() {
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
			alert("coinupdate" + "error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n" + "error : "
					+ errorData);
		}
	});
}
// 코인계산 부분
function coinacntupdate() {
	$.ajax({
		url : "coinacntupdate",
		type : "post",
		data : {
			"acntno" : $("#acntno").val(),
			"buycnt" : $("#updatecoin").val(),
			"coin" : $("#coin").val()
		},
		success : function(data) {

		},
		error : function(request, status, errorData) {
			alert("coinacntupdate" + "error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n" + "error : "
					+ errorData);
		}
	});
}
// coin 돈계산 부분
function upcoin() {
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
			alert("coinacntupdate" + "error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n" + "error : "
					+ errorData);
		}
	});
}
// ///////////////////////// 계좌 조회 부분 /////////////////////////
function coinacnt() { // 모의투자 접속시 컨트롤러로 부터 보유코인 리스트를 받아서 출력한다 (실시간)
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
			alert("coincount" + "error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n" + "error : "
					+ errorData);
		}
	});
}
function acnt() { // acnt select list 계좌 금액 체크

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
// //////////////////////////////// 체결 & 미체결 list

function slist() { // 컨트롤러로 부터 리스트를 받아서 출력한다
	var dataList = $("#frm22").serialize();

	$
			.ajax({
				url : "ajslists",
				type : "POST",
				data : dataList,
				dataType : "json",

				success : function(json) {

					var html1 = "<br><span style='font-size:20px;'>채결 <span style='color:#4387f9; font-size:20px;'>매도</span> 주문내역</span><form id='frm24'><table class='table' style='text-align:center;'><tr style='border: 2px solid #efefef; background-color:#efefef;'><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매도가격</td><td>매도날짜</td><td>계좌번호</td></tr>";

					if (json.length > 0) {
						$.each(json, function(entryIndex, entry) {
							html1 += "<tr style='border: 2px solid #efefef;'><td>" + entry.usno + "</td>" + "<td>"
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

					var html1 = "<span style='font-size:20px;'>채결  <span style='color:#f75467;font-size:20px;'>매수</span> 주문내역</span><form id='frm23'><table class='table' style='text-align:center;'><tr style='border: 2px solid #efefef;background-color:#efefef;'><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td></tr>";

					if (json.length > 0) {
						$.each(json, function(entryIndex, entry) {
							html1 += "<tr style='border: 2px solid #efefef;'><td>" + entry.ubno + "</td>" + "<td>"
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
function wblist() { // 미체결 매수 list함수
	var dataList = $("#frm22").serialize();

	$
			.ajax({
				url : "ajwblists",
				type : "POST",
				data : dataList,
				dataType : "json",

				success : function(json) {

					var html1 = "<span style='font-size:20px;'>미체결 <span style='color:#f75467;font-size:20px;'>매수</span> 주문내역</span><form id='frm20'><table class='table' style='text-align:center;'><tr style='border-bottom: 2px solid #efefef; background-color:#efefef;'><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매수가격</td><td>매수날짜</td><td>계좌번호</td><td>주문취소</td></tr>";
					if (json.length > 0) {
						$
								.each(
										json,
										function(entryIndex, entry) {
											html1 += "<tr style='border: 2px solid #efefef;'><td>"
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

													+ "<td><a class='del'  style='cursor: pointer;' onclick=\"removeWaitBought("
													+ entry.ubno
													+ ", "
													+ entry.buycnt
													+ ", "
													+ entry.buyprice
													+ ")\">취소</a></td></tr>";
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

					var html1 = "<br><span style='font-size:20px;'>미체결 <span style='color:#4387f9;font-size:20px;'>매도</span> 주문내역</span><form id='frm29'><table class='table'  style='text-align:center;'><tr style='border: 2px solid #efefef; background-color:#efefef;'><td>접수번호</td><td>코인종류</td><td>코인개수</td><td>매도가격</td><td>매도날짜</td><td>계좌번호</td><td>주문취소</td></tr>";

					if (json.length > 0) {
						$
								.each(
										json,
										function(entryIndex, entry) {
											html1 += "<tr style='border: 2px solid #efefef;'><td>"
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

													+ "<td><a class='del' style='cursor: pointer;' onclick=\"removeWaitSold("
													+ entry.usno
													+ ", "
													+ entry.sellcnt
													+ ")\">취소</a></td></tr>";
										});
						html1 += "</table></form>"
					} else {
						html1 = "<div>내용이없습니다</div>";
					}

					$("#aj_ws").html(html1);

				}

			});
}
// //////////////////// 개수 확인 /////////////////////////

function bcnt() {
	var dataList = $("#frm22").serialize();
	var fisrt = 0;
	var second = $("#s_bcnt").val();
	$.ajax({
		url : "bcnt",
		type : "POST",
		data : dataList,
		dataType : "json",

		success : function(data) {
			second = $("#s_bcnt").val();
			first = data;
			$("#s_bcnt").val(first);

			if (second != 0 && second != first) {
				var audio = document.getElementById("boughtmusic");
				audio.play();
				$('.popup').animate({
					right : '0px',

				}, 1000, function() {
					$(this).animate({
						right : '-400px',
					}, 3000);
				});
			}

		}

	});
}

function scnt() {
	var dataList = $("#frm22").serialize();
	var fisrt = 0;
	var second = $("#s_scnt").val();
	$.ajax({
		url : "scnt",
		type : "POST",
		data : dataList,
		dataType : "json",

		success : function(data) {
			second = $("#s_scnt").val();
			first = data;
			$("#s_scnt").val(first);

			if (second != 0 && second != first) {
				var audio = document.getElementById("soldmusic");
				audio.play();
				$('.popup1').animate({
					right : '0px',
				}, 1000, function() {
					$(this).animate({
						right : '-400px',
					}, 3000);
				});
			}

		}

	});
}

// ///////////////////////////////////////////////////////////////////////////////////////
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
	if (confirm("매수 주문을 취소하시겠습니까?")) {
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

function removeWaitSold(usno, sellcnt) {
	if (confirm("매도 주문을 취소하시겠습니까?")) {
		$.ajax({
			url : "wsdelete",
			type : "post",
			data : {
				"usno" : usno
			},
			success : function(data) { // 전달받은 data를 JSON 문자열 형태로 바꾼다
				if (data > 0) {
					alert("매도가 정상적으로 취소 되었습니다.");
					var returncoin = sellcnt * 1;
					var tc = sellcnt * 1 + $("#coincount").val() * 1;
					returncoinfn(tc);

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

// 매수취소 머니 환산하는 부분
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
			alert("coinupdate" + "error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n" + "error : "
					+ errorData);
		}
	});
}

// 매수 매도 버튼
function buyp(a) {
	// x(수량) = 현금 * % / 코인가격

	var ca = $("#cybcash").val();

	var pa = a * 1;

	var pr = $("#price_b").val();
	var sum = ca * pa / pr;
	var sumc = Math.floor(sum);
	$("#cnt_b").val(sumc);
	$("#cnt_b").focus();
	$("#price_b").focus();
	// 수량 = 코인수 * %
	var buypcoin = $("#coincount").val();
	var sumcc = buypcoin * a;
	var sumccc = Math.floor(sumcc);
	$("#cnt_s").val(sumccc);
	$("#cnt_s").focus();
	$("#price_s").focus();
}
// 호가창에서 가격 클릭시 입력하는 함수
function ob_p(num) {
	$("#price_b").val(num);
	$("#price_b").focus();
	$("#price_s").val(num);
	$("#price_s").focus();
}
// 호가창 받아오는 함수
function orderbook() {

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
					html6 = "<table id='orderbook_t' class='table table-striped' style='text-align : center;'><tr><th style=' position: sticky; top: 0px;  background: #f8f9fa;'>호가</th><th  style=' position: sticky; top: 0px;  background: #f8f9fa;'>"
							
							+ "수량</th></tr>";
					for (var i = 14; i >= 0; i--) {
						html6 += "<tr><td><a href='#'  style='color : black !important;' onclick='ob_p("
								+ orderbookarrask[i][0]
								+ ");'>"
								+ orderbookarrask[i][0]
								+ "</a>원</td><td>"
								+ orderbookarrask[i][1] + "개" + "</td></tr>";

					}
					for (var i = 0; i < 15; i++) {
						html6 += "<tr><td><a href='#'  style='color : black !important;' onclick='ob_p("
								+ orderbookarrbid[i][0]
								+ ");'>"
								+ orderbookarrbid[i][0]
								+ "</a>원</td><td>"
								+ orderbookarrbid[i][1] + "개" + "</td></tr>";

					}
					html6 += "</table>"
					$("#aaaaa").html(html6);
				},
			
			});
};

