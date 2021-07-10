$(function() {
	$(".tabcontent").eq(0).show(); // 보유코인 목록 탭 기본값 : show()
	$('.tablinks').eq(0).addClass('tablinksActive');

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
						var coinValue = parseInt(data['data'][coinName]['closing_price']* coinCount); //평가금액 raw
						var nCoinValue = coinValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 평가금액 세자리 수 콤마 표시
						
						$('.coinValue').eq(i).html(nCoinValue + "&nbsp;원");
						var buyAvg = parseInt($('.buyAvg').eq(i).val());

						var coinProfit = coinValue - buyAvg;
						var nCoinProfit = coinProfit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","); // 세자리수 콤마
						
//						console.log((i+1)+"번째 "+"매수금액raw: "+$('.buyAvg').eq(i).val());
//						console.log((i+1)+"번째 "+"매수금액 parseInt: "+buyAvg);
//						console.log((i+1)+"번째 "+"매수금액 BigInt: "+BigInt($('.buyAvg').eq(i).val()));
//						console.log((i+1)+"번째 "+"평가금액raw: "+coinValue);
						
						var coinProfitPcnt = ((coinValue/buyAvg) - 1) * 100;
						if(coinProfitPcnt > 0) {
							$('.coinProfit').eq(i).html("<p style='color:red;'>" + coinProfitPcnt.toFixed(2) + "&nbsp;%</p><p style='color:red;'>"+ nCoinProfit + "&nbsp;원</p>");
						} else if(coinProfitPcnt < 0) {
							$('.coinProfit').eq(i).html("<p style='color:blue;'>" + coinProfitPcnt.toFixed(2) + "&nbsp;%</p><p style='color:blue;'>"+ nCoinProfit + "&nbsp;원</p>");
						} else {
							$('.coinProfit').eq(i).html("<p>" + coinProfitPcnt.toFixed(2) + "&nbsp;%</p><p>"+ nCoinProfit + "&nbsp;원</p>");
						}
						
						totalcoin += coinValue;

					}
//					console.log("totalcoin: "+ totalcoin);
					$('#totalcoin').html(totalcoin.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
//					console.log("cash: "+$("#cash").val());
					var totalAssets = parseInt($("#cash").val())+totalcoin;
//					console.log("totalAssets: "+totalAssets);
					$('#totalAssets').html(totalAssets.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
				}
			});
};

$('.tablinks').click(function() {

	for (var i = 0; i < $('.tabcontent').length; i++) {
		$('.tabcontent').hide();
		if($('.tablinks').hasClass("tablinksActive")) {
			$('.tablinks').removeClass('tablinksActive');
		}
	}

	$(".tabcontent").eq($(this).index()).show();
	$(this).addClass('tablinksActive');

});

var bExpandBool = Boolean(false);

$('#bExpand').click(function() {
//	console.log("show 클릭됨!");
	if(bExpandBool == false) {
		$('.blist').show();
		bExpandBool= true;
		$('#bExpand').val("접기");
	} else if(bExpandBool == true) {
		$('.blist').hide();
		bExpandBool= false;
		$('#bExpand').val("더 보기");
	}
});

var sExpandBool = Boolean(false);

$('#sExpand').click(function() {
//	console.log("show 클릭됨!");
	if(sExpandBool == false) {
		$('.slist').show();
		sExpandBool= true;
		$('#sExpand').val("접기");
	} else if(sExpandBool == true) {
		$('.slist').hide();
		sExpandBool= false;
		$('#sExpand').val("더 보기");
	}
});


var wbExpandBool = Boolean(false);

$('#wbExpand').click(function() {
//	console.log("show 클릭됨!");
	if(wbExpandBool == false) {
		$('.wblist').show();
		wbExpandBool= true;
		$('#wbExpand').val("접기");
	} else if(wbExpandBool == true) {
		$('.wblist').hide();
		wbExpandBool= false;
		$('#wbExpand').val("더 보기");
	}
});

var wsExpandBool = Boolean(false);

$('#wsExpand').click(function() {
//	console.log("show 클릭됨!");
	if(wsExpandBool == false) {
		$('.wslist').show();
		wsExpandBool= true;
		$('#wsExpand').val("접기");
	} else if(wsExpandBool == true) {
		$('.wslist').hide();
		wsExpandBool= false;
		$('#wsExpand').val("더 보기");
	}
});


var cExpandBool = Boolean(false);

$('#cExpand').click(function() {
//	console.log("show 클릭됨!");
	if(cExpandBool == false) {
		$('.cashlist').show();
		cExpandBool= true;
		$('#cExpand').val("접기");
	} else if(cExpandBool == true) {
		$('.cashlist').hide();
		cExpandBool= false;
		$('#cExpand').val("더 보기");
	}
});
