<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
</head>
<body>
<!-- method 형식이 post이면 반드시 기재해줘야함 -->
   <form action="oper" method="post">
      <input type="text" name="input" placeholder="수식을 입력해주세요.">
      <input type="submit" value="결과 확인">
   </form>
</body>
</html>