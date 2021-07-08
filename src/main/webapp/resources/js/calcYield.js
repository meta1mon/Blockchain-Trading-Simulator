	// 누적 수익률
	$(function() {

		// 현재 시점의 코인 보유정보(coinAcnt)를 가져옴, buycnt != 0
		var esset = [];
		// 현재 시점의 코인 가격정보(빗썸 api)를 가져옴
		var nowprices = [];
		// 보유 중인 코인 이름만 unique로 가져옴, buycnt != 0
		var haveCoin = [];
		// buycnt != 0인 계좌번호를 unique로 담음		
		var acntNoArr = new Array();
		// 위의 계좌번호 배열을 전달할 방법을 못찾아서, String으로 += 해서 ctrl로 던짐
		var acntNoStr = "";
		// 코인별 평가금을 담음
		var appraisalArr = [];
		// 계좌별 총 코인 평가금을 담음
		var perCoinValue = [];

		var alltimer = setInterval(function() { // 1초마다 함수 돌림 ()
			getTime();
		}, 1000);

		// 시간 판단 함수
		function getTime() {
			var now = new Date();
			var day = now.getDay(); // 요일 : 0(일) 1(월) ~~
			var date = now.getDate(); // 일 : 1 ~
			var hour = now.getHours(); // 시 : 0 ~ 23
			var minute = now.getMinutes(); // 분 0 ~ 59
			var second = now.getSeconds(); // 초 0 ~ 59
			console.log(now);

			// 랭킹 카테고리 :  0 - 누적, 1 - 데일리, 2 - 위클리, 3 - 먼슬리
			// 누적 : 1시간, 정각

			if (minute == 0 && second == 0) {
				liveEsset(0);
				console.log("누적, 정각, 1시간 단위!");
			}

			// 하루 단위(오전 9시 기준)
			if (hour == 9 && minute == 0 && second == 0) {
				liveEsset(1);
				console.log("Daily, 오전 9시, 1일 단위!");
			}

			// 주 단위(월 9시 기준)
			if (day == 1 && hour == 9 && minute == 0 && second == 0) {
				liveEsset(2);
				console.log("Weekly, 월요일 9시, 1주 단위!");
			}

			// 월 단위(1일 9시 기준)
			if (date == 1 && hour == 9 && minute == 0 && second == 0) {
				liveEsset(3);
				console.log("Monthly, 1일 9시, 1월 단위!");
			}

		}
		// 자산 불러오기
		function liveEsset(c1) {
			console.log("111111111111전달값");
			console.log(c1);
			$.ajax({
				url : 'calc',
				type : "post",
				cache : false,
				datatype : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						esset[i] = data[i];
					}
					loadCoin(c1);
				}
			});
		}

		// 코인 이름 distinct로 받아오기(보유량이 0이면 안가져옴)
		function loadCoin(c2) {
			console.log("2222222222222전달값");
			console.log(c2);
			$.ajax({
				url : 'coinLoad',
				type : "post",
				cache : false,
				datatype : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						haveCoin[i] = data[i];
					}
					loadCoin2(c2);
				}
			});
		}

		//  코인계좌의 계좌번호 유니크하게 가져오기
		function loadCoin2(c3) {
			console.log("33333333333333전달값");
			console.log(c3);
			$.ajax({
				url : 'coinLoad2',
				type : "post",
				cache : false,
				datatype : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						acntNoArr[i] = data[i];
						acntNoStr += data[i] + ",";
					}

					livePrice(c3);

				}
			});

		}

		// 실시간 코인 가격 불러오기
		function livePrice(c4) {
			console.log("4444444444444444전달값");
			console.log(c4);
			$
					.ajax({
						url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
						type : "get",
						cache : false,
						datatype : "json",
						success : function(data) {
							for (var i = 0; i < haveCoin.length; i++) {
								nowprices[i] = [ data['data'][haveCoin[i]]['closing_price'] * 1 ]
							}
							calcPrice(c4);
						}
					});
		}

		// 이 페이지로 들어왔을 때(수익률 계산함수 호출되었을 때) 당시의 총 자산(평가금+현금) 계산
		function calcPrice(c5) {
			console.log("55555555555555555전달값");
			console.log(c5);
			for (var i = 0; i < esset.length; i++) {
				for (var j = 0; j < haveCoin.length; j++) {
					if (esset[i].coin == haveCoin[j]) {
						perCoinValue[i] = esset[i].buycnt * nowprices[j];
					}
				}
			}

			for (var i = 0; i < acntNoArr.length; i++) {
				var sum = 0;
				for (var j = 0; j < esset.length; j++) {
					if (acntNoArr[i] == esset[j].acntno) {
						sum += perCoinValue[j];
					}
				}
				appraisalArr[i] = sum;
			}

			// 코인 보유 중인 회원의 랭킹 처리
			for (var i = 0; i < acntNoArr.length; i++) {
				console.log(acntNoArr[i]);
				console.log(appraisalArr[i]);
				$.ajax({
					url : 'updateRank',
					type : "post",
					cache : false,
					data : {
						"acntno" : acntNoArr[i],
						"appraisal" : appraisalArr[i],
						"criteria" : c5
					},
					success : function(data) {
						if (data > 0) {
							console.log("코인 보유자 랭크 반영 성공");
						} else {
							console.log("코인 보유자 랭크 반영 실패");
						}
					}
				});
			}

			// 코인 하나도 안갖고 있는 회원의 랭킹 처리
			$.ajax({
				url : 'noCoinRank',
				type : "post",
				data : {
					"criteria" : c5
				},
				success : function(data) {
					if (data > 0) {
						console.log("코인미보유자 랭킹 처리 성공");
					} else {
						console.log("코인미보유자 랭킹 처리 실패");
					}
				}
			});

		}

	});