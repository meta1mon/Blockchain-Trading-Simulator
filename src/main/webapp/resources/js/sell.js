$(function() {
   var alltimer = setInterval(function() { // 1초마다 함수 돌림 ()
      loadValues1();
   }, 3000);

   // 실시간 가격 받을 것
   var nowprices = [];
   // 사는 코인 이름 가져오기
   var sellCoinArr = [];
   // 사는 코인 객체 리스트 가져오기
   var sellPriceArr = [];
   // 사는 코인 계좌 리스트 가져오기
   var sellAcntArr = [];
   // 사는 코인 수량 리스트 가져오기
   var sellCntArr = [];
   function loadValues1() {
      // 미체결 매수 코인 종류 불러오기
      $.ajax({
         url : 'sellLoad1',
         type : "get",
         cache : false,
         datatype : "json",
         success : function(data) {
            for (var i = 0; i < data.length; i++) {
               sellCoinArr[i] = data[i];
            }
            loadValues2();
         }
      });
   }
   function loadValues2() {
      //  미체결 매수 내역 중, 가격만 불러오기
      $.ajax({
         url : 'sellLoad2',
         type : "get",
         cache : false,
         datatype : "json",
         success : function(data) {
            sellPriceArr = new Array(sellCoinArr.length);
            sellAcntArr = new Array(sellCoinArr.length)
            for (var i = 0; i < sellPriceArr.length; i++) {
               sellPriceArr[i] = new Array();
               sellAcntArr[i] = new Array();
               sellCntArr[i] = new Array();
               for (var j = 0; j < data.length; j++) {
                  if (sellCoinArr[i] == data[j].coin) {
                     var rawData = data[j].sellprice;
                     if (rawData >= 1000) {
                        sellPriceArr[i][j] = Math.floor(rawData);
                     } else {
                        sellPriceArr[i][j] = rawData;
                     }
                     sellAcntArr[i][j] = data[j].acntno;
                     sellCntArr[i][j] = data[j].sellcnt;
                  }

               }
            }
            livePrice();
         }
      });
   }
   // 빗썸에서 실시간 가격 받아오기
   function livePrice() {
      $
            .ajax({
               url : 'https://api.bithumb.com/public/ticker/ALL_KRW',
               type : "get",
               cache : false,
               datatype : "json",
               success : function(data) {
                  for (var i = 0; i < sellCoinArr.length; i++) {
                     nowprices[i] = [ data['data'][sellCoinArr[i]]['closing_price'] * 1 ]
                  }
                  comparePrice();
               }
            });
   }

   // 미체결 매수 내역과 빗썸의 가격을 비교
   function comparePrice() {
      for (var i = 0; i < sellPriceArr.length; i++) { // 코인 종류만큼 돌린다
         for (var j = 0; j < sellPriceArr[i].length; j++) { // 해당 코인에 대한 가격 수만큼 돌린다   
            if (nowprices[i] >= sellPriceArr[i][j]) {
               console.log(sellCoinArr[i] + "코인이 " + sellPriceArr[i][j]
                     + " 가격으로 판매됨");
               $.ajax({
                  url : "sold",
                  type : "post",
                  data : {
                     "sellCoin" : sellCoinArr[i],
                     "sellPrice" : sellPriceArr[i][j],
                     "sellAcntno" : sellAcntArr[i][j],
                     "sellCnt" : sellCntArr[i][j]
                  },
                  success : function(data) {
                     if (data > 0) {
                        console.log("구매 성공");
                     } else {
                        console.log("구매 실패");

                     }
                  }
               });
            }
         }
      }
   }
});