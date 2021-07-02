function coinValue() {

	$.ajax({
		url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
		type : "get",
		cache : false,
		datatype : "json",
		success : function(data) {
			for (var i = 0; i < $('.coinName').length; i++) {
				var coinName = $('.coinName').eq(i).html();
				var coinCount = $('.coinCount').eq(i).html();
				
				var coinValue = parseInt(data['data'][coinName]['closing_price']*coinCount);
//				console.log("coinValue: "+coinValue);
//				console.log("type of coinValue: "+typeof(coinValue));
				
				var nCoinValue = coinValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
//				console.log("nCoinValue: "+nCoinValue);
				
				$('.coinValue').eq(i).html(nCoinValue+"&nbsp;원");
				
				var buyAvg = parseInt($('.buyAvg').eq(i).val());
				
//				console.log("buyAvg: "+buyAvg);
//				console.log("type of buyAvg: "+typeof(buyAvg));
//				console.log("type of coinValue: "+typeof(coinValue));
//				console.log("coinValue-buyAvg: "+(coinValue-buyAvg));
				var coinProfit = coinValue-buyAvg;
				var coinProfitPcnt = (coinValue/buyAvg-1)*100;		
				var nCoinProfit = coinProfit.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$('.coinProfit').eq(i).html(coinProfitPcnt.toFixed(2)+"&nbsp;%<br>"+nCoinProfit+"&nbsp;원");
				
				
			}
		}
	});
};

coinValue();