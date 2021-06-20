$(function() {
	coinname();
	chart();
	var timer1 = setInterval(function() {
		console.log("1초");
		alltable();
		// orderbook();

	}, 1000);

});

var coinList = null;
var changecoin = "BTC"; // default

function chart() {

	new TradingView.widget({
		"width" : 980,
		"height" : 610,
		"symbol" : "BITHUMB:" + changecoin + "KRW",
		"interval" : "5",
		"timezone" : "Asia/Seoul",
		"theme" : "light",
		"style" : "1",
		"locale" : "kr",
		"toolbar_bg" : "#f1f3f6",
		"enable_publishing" : true,
		"withdateranges" : true,
		"allow_symbol_change" : true,
		"container_id" : "tradingview_3fe73"
	});
}

function toname(name){
	  document.getElementById("coin").value = name;
};

function changename(listNum) {
	var checkstring = typeof(listNum);
	
	if (checkstring=='number') {
		changecoin = coinList[listNum];
		console.log("changename함수");

	} else {
		changecoin = listNum;
		console.log(listNum);
	

	}
	console.log(changecoin);
	toname(changecoin);
	chart();
};

function coinname() {
	console.log("coin name함수")

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

function alltable() {
	console.log("table함수 들어옴");
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
					$("#searchcoin").on('keyup', function() {
						// change keyup paste
						console.log("입력받은 search값 " + search);
					});
					if (search == "") {
						console.log("search 아무것도 안입력했음");

						for (var i = 0; i < coinList.length; i++) {
							display[i] = [
									data['data'][coinList[i]]['closing_price'] * 1,
									data['data'][coinList[i]]['fluctate_rate_24H'] * 1,
									data['data'][coinList[i]]['acc_trade_value_24H'] * 1 ]
						}
						html = "<table class='table table-striped' id='cointable' ><tr><td>코인명</td><td>현재가</td><td>등락률(24H)</td><td>거래대금</td></tr>";
						for (var i = 0; i < coinList.length; i++) {
							thisCoin = i;
							// console.log(coinList[i] + "의 정보는 다음과 같다" +
							// display[i]);
							html += "<tr><td><a href=# onclick='changename("
									+ thisCoin + ");'>" + coinList[i]
									+ "</a></td><td>" + display[i][0]
									+ "</td><td>" + display[i][1] + "%"
									+ "</td><td>" + display[i][2]
									+ "</td></tr>";

						}
						html += "</table>"
						$("#cointable_div").html(html);
					} else {
						console.log(search + "검색한 서치값");
						var onechange = "";

						onedisplay[0] = [
								data['data'][search]['closing_price'] * 1,
								data['data'][search]['fluctate_rate_24H'] * 1,
								data['data'][search]['acc_trade_value_24H'] * 1 ]
						html = "<table class='table table-striped' ><tr><td>코인명</td><td>현재가</td><td>등락률(24H)</td><td>거래대금</td></tr>";

						html += "<tr><td><a href=# onclick='changename(\""+search+"\");'>" + search + "</a></td><td>" + onedisplay[0][0]
								+ "</td><td>" + onedisplay[0][1] + "%"	
								+ "</td><td>" + onedisplay[0][2] + "</td></tr>";

						html += "</table>"
						$("#cointable_div").html(html);
					}

				}
			});
};

// function orderbook() {
// console.log("orderbook함수");
// var orderdisplay = new Array();
//
// $.ajax({
// url :
// 'https://cors-anywhere.herokuapp.com/https://api.bithumb.com/public/orderbook/BTC_KRW',
// crossOrigin : true,
// type : "get",
// cache : false,
// datatype : "json",
// success : function(data) {
// console.log(data);
// var a = data['data']['bids'].length - 1; // 길이 알아옴
// for (var i = 0; i < a; i++) {
// orderdisplay[i] = [ data['data']['bids'][i]['price']*1,
// data['data']['bids'][i]['quantity']*1]
// console.log(orderdisplay[i]);
// }
// }
// });
// };
