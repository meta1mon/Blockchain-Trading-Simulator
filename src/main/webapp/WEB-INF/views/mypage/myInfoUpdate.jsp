<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <form action="#" method="post">
        <table>
            <tr>
                <td>닉네임</td>
            <td><input type="text" value="파란너구리"></td>
        </tr>
        <tr>
            <td>생년월일</td>
            <td><input type="text" value="010203"></td>
        </tr>
        <tr>
            <td>성별</td>
            <td><input type="radio" checked> 남자 <input type="radio"> 여자 </td>
        </tr>
        <tr>
            <td>휴대폰</td>
            <td><input type="text" value="01021535554"></td>
        </tr>
        <tr>
            <td colspan="2"><input type="checkbox">각종 소식 수신 및 이벤트 참여에 동의합니다</td>
        </tr>
    </table>
    
    <button type="submit">수정</button>
    <button type="button">뒤로 가기</button>
</form>
</body>
</html>