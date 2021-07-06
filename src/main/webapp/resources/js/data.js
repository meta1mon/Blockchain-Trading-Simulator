$(function() {
	coinname();
	var timer1 = setInterval(function() {
		table();

		chart();
	}, 1000)

});

var coinList = null;
var changecoin = "BTC"; // default

function changename(listNum) {
	var coinList2 = [ 'BTC', 'ETH', 'DOGE', 'LTC', 'XRP', 'ETC', 'ADA', 'TRX',
			'SXP', 'STRAX' ];
	changecoin = coinList2[listNum];

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

function table() {
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

	

			function drawChart() {
				var data = google.visualization.arrayToDataTable([
						[ '1H', changecoin ], [ '7시간전', abc7 ],
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