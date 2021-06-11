$(function() {
	coinname();

	var timer1 = setInterval(function() {
		console.log("1초");
	//	alltable();
		table();
		chart();
	}, 1000)


});

var coinList = null;
function coinname() {
	console.log("coin name함수 들어옴")

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
	console.log("alltable함수 들어옴");
	var display = new Array();
	$.ajax({
		url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
		type : "get",
		cache : false,
		datatype : "json",
		success : function(data) {
			var html = "";
			for (var i = 0; i < coinList.length; i++) {
				display[i] = [ data['data'][coinList[i]]['closing_price'] * 1,
						data['data'][coinList[i]]['fluctate_rate_24H'] * 1,
						data['data'][coinList[i]]['acc_trade_value_24H'] * 1 ]
			}
			for (var i = 0; i < coinList.length; i++) {
				console.log(coinList[i] + "의 정보는 다음과 같다" + display[i]);
				html += "<li>"+display[i]+"&nbsp;&nbsp;<span style='color:red;'></span></li>";
				$("#cointable_div").html(html);
				console.log(html);
			}

		}
	});
};
function table() {
	console.log("table함수 들어옴");
	var coinList = ['BTC','ETH', 'DOGE','LTC','XRP']
	var display = new Array();
	var html = "";
	$.ajax({
		url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
		type : "get",
		cache : false,
		datatype : "json",
		success : function(data) {
			for (var i = 0; i < coinList.length; i++) {
				display[i] = [ data['data'][coinList[i]]['closing_price'] * 1,
					data['data'][coinList[i]]['fluctate_rate_24H'] * 1,
					data['data'][coinList[i]]['acc_trade_value_24H'] * 1 ]
			}
			html = "<table class='table table-striped' ><tr><td>코인명</td><td>현재가</td><td>등락률</td><td>거래대금</td></tr>";
			for (var i = 0; i < coinList.length; i++) {
				console.log(coinList[i] + "의 정보는 다음과 같다" + display[i]);
				html += "<tr><td>"+coinList[i]+"</td><td>"+display[i][0]+"</td><td>"+display[i][1]+"</td><td>"+display[i][2]+"</td></tr>";
				
			}
			html += "</table>" 
			$("#cointable_div").html(html);
			
		}
	});
};

function chart() {
	console.log("aaa함수 들어옴")
	$.ajax({
		url : 'https://api.bithumb.com/public/candlestick/BTC_KRW/1h',
		type : "get",
		cache : false,
		datatype : "json",
		success : function(data) {
			var a = data['data'].length - 1; // 길이 알아옴
			var abc = data['data'][a][2] * 1; // 형변환
			var abc1 = data['data'][a - 1][2] * 1; // 형변환
			var abc2 = data['data'][a - 2][2] * 1; // 형변환
			var abc3 = data['data'][a - 3][2] * 1; // 형변환
			var abc4 = data['data'][a - 4][2] * 1; // 형변환
			var abc5 = data['data'][a - 5][2] * 1; // 형변환
			var abc6 = data['data'][a - 6][2] * 1; // 형변환
			var abc7 = data['data'][a - 7][2] * 1; // 형변환

			function drawChart() {
				console.log("drawChart 안에서의 abc 값 : " + abc);
				var data = google.visualization.arrayToDataTable([
						[ '1H', 'BTC_KRW' ], [ '7시간전', abc7 ],
						[ '6시간전', abc6 ], [ '5시간전', abc5 ], [ '4시간전', abc4 ],
						[ '3시간전', abc3 ], [ '2시간전', abc2 ], [ '1시간전', abc1 ],
						[ '현재', abc ] ]);

				var options = {
					title : 'BitCoin Trading Simulator'
				};

				var chart = new google.visualization.LineChart(document
						.getElementById('chart_div'));
				chart.draw(data, options);
			}

			google.load("visualization", "1", {
				packages : [ "corechart" ]
			});
			google.setOnLoadCallback(drawChart);

		}
	});
};