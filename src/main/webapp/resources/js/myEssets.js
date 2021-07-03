$(function() {
	var alltimer = setInterval(function() { // 1초마다 함수 돌림 ()
		coinValue();
	}, 1000);
});

function coinValue() {

	$(".tabcontent").eq(0).show(); // 보유코인 목록 탭 기본값 : show()

	$
			.ajax({
				url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
				type : "get",
				cache : false,
				datatype : "json",
				success : function(data) {
					for (var i = 0; i < $('.coinName').length; i++) {
						var coinName = $('.coinName').eq(i).html();
						var coinCount = $('.nCoincnt').eq(i).val();
						var coinValue = parseInt(data['data'][coinName]['closing_price']
								* coinCount);
						var nCoinValue = coinValue.toString().replace(
								/\B(?=(\d{3})+(?!\d))/g, ","); // 세자리수
						// 마다
						// 콤마
						// 표시하는
						// 정규식

						$('.coinValue').eq(i).html(nCoinValue + "&nbsp;원");
						var buyAvg = parseInt($('.buyAvg').eq(i).val());

						var coinProfit = coinValue - buyAvg;
						var coinProfitPcnt = (coinValue / buyAvg - 1) * 100;
						var nCoinProfit = coinProfit.toString().replace(
								/\B(?=(\d{3})+(?!\d))/g, ","); // 세자리수
						// 마다
						// 콤마
						// 표시하는
						// 정규식
						$('.coinProfit').eq(i).html(
								coinProfitPcnt.toFixed(2) + "&nbsp;%<br>"
										+ nCoinProfit + "&nbsp;원");

					}
				}
			});
};

$('.tablinks').click(function() {

	for (var i = 0; i < $('.tabcontent').length; i++) {
		$('.tabcontent').hide();
	}

	$(".tabcontent").eq($(this).index()).show();

});
