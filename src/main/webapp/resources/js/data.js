$(function() {
	coinname();
	var timer1 = setInterval(function() {
		console.log("1초");
		table();

		chart();
	}, 1000)

});

var coinList = null;
var changecoin = "BTC"; // default

function changename(listNum) {
	console.log("changename함수");
	var coinList2 = [ 'BTC', 'ETH', 'DOGE', 'LTC', 'XRP', 'ETC', 'ADA', 'TRX',
			'SXP', 'STRAX' ];
	changecoin = coinList2[listNum];

};

function coinname() {
	console.log("coinname함수")

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

function table() {
	console.log("table함수 들어옴");
	var coinList = [ 'BTC', 'ETH', 'DOGE', 'LTC', 'XRP', 'ETC', 'ADA', 'TRX',
			'SXP', 'STRAX' ];
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
						html += "<tr><td><a href=# onclick='changename("
								+ thisCoin + ");'>" + coinList[i]
								+ "</a></td><td>" + display[i][0] + "</td><td><span class='change_c'>"
								+ display[i][1] + "</span><span class='change_cp'>%</span></td><td>"
								+ display[i][2] + "</td></tr>";

					}
					html += "</table>"
					$("#cointable_div").html(html);
					$('.table-striped tbody tr:nth-of-type(odd)').css('background-color', 'rgb(227,200,248, 0.0453)');
					for (var i = 0; i < coinList.length ; i++) {
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
				}
			});
};

function chart() {
	console.log("aaa함수 들어옴")
	$.ajax({
		url : 'https://api.bithumb.com/public/candlestick/' + changecoin
				+ '_KRW/1h',
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

			// var now = new Date().getTime();
			// const curr = new Date();
			// const utc = curr.getTime() + (curr.getTimezoneOffset() * 60 *
			// 1000);
			// const KR_TIME_DIFF = 9 * 60 * 60 * 1000;
			// const kr_curr = new Date(utc + (KR_TIME_DIFF));
			// var aaa = data['data'][0][0]; // 형변환
			// var aaa1 = data['data'][0][1]; // 형변환
			// console.log(now);
			// console.log(kr_curr);
			// console.log(kr_curr.getTime());
			// console.log(aaa1);
			// console.log(aaa);
			// console.log(aaa1);

			function drawChart() {
				console.log("drawChart 안에서의 abc 값 : " + abc);
				var data = google.visualization.arrayToDataTable([
						[ '1H', changecoin + '_KRW' ], [ '7시간전', abc7 ],
						[ '6시간전', abc6 ], [ '5시간전', abc5 ], [ '4시간전', abc4 ],
						[ '3시간전', abc3 ], [ '2시간전', abc2 ], [ '1시간전', abc1 ],
						[ '현재', abc ] ]);

				var options = {
					title : 'Blockchain Trading Simulator'
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