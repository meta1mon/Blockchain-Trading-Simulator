$(function() {
	var alltimer = setInterval(function() { // 1초마다 함수 돌림 ()
		coinValue();
	}, 1000);
});

function coinValue() {

	$
			.ajax({
				url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
				type : "get",
				cache : false,
				datatype : "json",
				success : function(data) {
					var totalcoin = 0;
					for (var i = 0; i < $('.coinName').length; i++) {
						var coinName = $('.coinName').eq(i).html();
						var coinCount = $('.nCoincnt').eq(i).val();
						var coinValue = parseInt(data['data'][coinName]['closing_price']
								* coinCount);
						var nCoinValue = coinValue.toString().replace(
								/\B(?=(\d{3})+(?!\d))/g, ","); // 세자리수 콤마

						$('.coinValue').eq(i).html(nCoinValue + "&nbsp;원");
						var buyAvg = parseInt($('.buyAvg').eq(i).val());

						var coinProfit = coinValue - buyAvg;
						var coinProfitPcnt = ((coinValue / buyAvg) - 1) * 100;
						var nCoinProfit = coinProfit.toString().replace(
								/\B(?=(\d{3})+(?!\d))/g, ","); // 세자리수 콤마

						$('.coinProfit').eq(i).html(
								coinProfitPcnt.toFixed(2) + "&nbsp;%<br>"
										+ nCoinProfit + "&nbsp;원");
						if (coinProfitPcnt > 0) {
							$('.coinProfit')
									.eq(i)
									.html(
											"<p style='color:red;'>"
													+ coinProfitPcnt.toFixed(2)
													+ "&nbsp;%</p><p style='color:red;'>"
													+ nCoinProfit
													+ "&nbsp;원</p>");
						} else if (coinProfitPcnt < 0) {
							$('.coinProfit')
									.eq(i)
									.html(
											"<p style='color:blue;'>"
													+ coinProfitPcnt.toFixed(2)
													+ "&nbsp;%</p><p style='color:blue;'>"
													+ nCoinProfit
													+ "&nbsp;원</p>");
						} else {
							$('.coinProfit').eq(i).html(
									"<p>" + coinProfitPcnt.toFixed(2)
											+ "&nbsp;%</p><p>" + nCoinProfit
											+ "&nbsp;원</p>");
						}

						totalcoin += coinValue;

					}
					$('#totalcoin').html(
							totalcoin.toString().replace(
									/\B(?=(\d{3})+(?!\d))/g, ","));
					var totalAssets = parseInt($("#cash").val()) + totalcoin;
					$('#totalAssets').html(
							totalAssets.toString().replace(
									/\B(?=(\d{3})+(?!\d))/g, ","));

				}
			});

};

