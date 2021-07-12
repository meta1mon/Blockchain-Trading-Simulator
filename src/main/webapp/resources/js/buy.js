   $(function() {
      var alltimer = setInterval(function() { // 1초마다 함수 돌림 ()
         loadValues1();
      }, 3000);

      // 실시간 가격 받을 것
      var nowprices = [];
      // 사는 코인 이름 가져오기
      var buyCoinArr = [];
      // 사는 코인 객체 리스트 가져오기
      var buyPriceArr = [];
      function loadValues1() {
         // 미체결 매수 코인 종류 불러오기
         $.ajax({
            url : 'buyLoad1',
            type : "get",
            cache : false,
            datatype : "json",
            success : function(data) {
               for (var i = 0; i < data.length; i++) {
                  buyCoinArr[i] = data[i];
               }
               loadValues2();
            }
         });
      }
      function loadValues2() {
         //  미체결 매수 내역 중, 가격만 불러오기
         $.ajax({
            url : 'buyLoad2',
            type : "get",
            cache : false,
            datatype : "json",
            success : function(data) {
               buyPriceArr = new Array(buyCoinArr.length);
               for (var i = 0; i < buyPriceArr.length; i++) {
                  buyPriceArr[i] = new Array();
                  for (var j = 0; j < data.length; j++) {
                     if (buyCoinArr[i] == data[j].coin) {
                        var rawData = data[j].buyprice;
                        if (rawData >= 1000) {
                           buyPriceArr[i][j] = Math.floor(rawData);
                        } else {
                           buyPriceArr[i][j] = rawData;
                        }
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
                     for (var i = 0; i < buyCoinArr.length; i++) {
                        nowprices[i] = [ data['data'][buyCoinArr[i]]['closing_price'] * 1 ]
                     }
                     comparePrice();
                  }
               });
      }

      // 미체결 매수 내역과 빗썸의 가격을 비교
      function comparePrice() {
         for (var i = 0; i < buyPriceArr.length; i++) { // 코인 종류만큼 돌린다
            for (var j = 0; j < buyPriceArr[i].length; j++) { // 해당 코인에 대한 가격 수만큼 돌린다   
               if (nowprices[i] <= buyPriceArr[i][j]) {
                  console.log(buyCoinArr[i] + "코인이 " + buyPriceArr[i][j]
                        + " 가격으로 구매됨");
                  $.ajax({
                     url : "bought",
                     type : "post",
                     data : {
                        "buyCoin" : buyCoinArr[i],
                        "buyPrice" : buyPriceArr[i][j]
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