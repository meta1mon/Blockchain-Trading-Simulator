$(function() {
	coinname();

	var timer1 = setInterval(function() {
		console.log("1초");
		 alltable();
		
	}, 1000)

});

var coinList = null;
var changecoin = "BTC"; // default


function changename(listNum) {
	console.log("changename함수");
	changecoin = coinList[listNum];
	console.log(changecoin);
	
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
	var html = "";
	var thisCoin = null;
	$
			.ajax({
				url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
				type : "get",
				cache : false,
				datatype : "json",
				success : function(data) {
					for (var i = 0; i < coinList.length; i++) {
						display[i] = [
								data['data'][coinList[i]]['closing_price'] * 1,
								data['data'][coinList[i]]['fluctate_rate_24H'] * 1,
								data['data'][coinList[i]]['acc_trade_value_24H'] * 1 ]
					}
					html = "<table class='table table-striped' ><tr><td>코인명</td><td>현재가</td><td>등락률(24H)</td><td>거래대금</td></tr>";
					for (var i = 0; i < coinList.length; i++) {
						thisCoin = i;
						console.log(coinList[i] + "의 정보는 다음과 같다" + display[i]);
						html += "<tr><td><a href=# onclick='changename(" + thisCoin + ");'>"
								+ coinList[i] + "</a></td><td>" + display[i][0]
								+ "</td><td>" + display[i][1] + "</td><td>"
								+ display[i][2] + "</td></tr>";

					}
					html += "</table>"
					$("#cointable_div").html(html);

				}
			});
};
