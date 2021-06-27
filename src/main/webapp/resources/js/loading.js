$(function() {
	var alltimer = setInterval(function() { // 1초마다 함수 돌림 ()
		waittable();
	}, 1000);
	var allcoinList;
	var allpriceList;
	function waittable() {
	/*	allcoinList = ${waitblist }
		console.log(allcoinList)
		allpriceList = ${waitresult }
	*/	

		$.ajax({
					url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
					type : "get",
					cache : false,
					datatype : "json",
					success : function(data) {
						for (var i = 0; i < allcoinList.length; i++) {
							nowprices[i] = [ data['data'][allcoinList[i]]['closing_price'] * 1 ]
							// [140, 240]
						}
						
					}
		
		
		
				});
	};
	
	function compare() {
		for(var i =0; i < coinList.length; i++) {
			
			if(priceList[0][i] == display[0]) {
				//미체결 삭제   ?  글번호는  어찌 가지고 오는가 ?
				//체결 인설트   미체결정보를 보내줘야함 
				// 코인인계좌에 insert OR update
				// 계좌에서  update 
			}
		}
	}
	
});
