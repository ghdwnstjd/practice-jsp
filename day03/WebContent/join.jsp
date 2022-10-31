<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
   <form action="joinOk.jsp" name="joinForm">
      <label>
         아이디 <input type="text" name="userId" placeholder="5자 이상으로 작성해주세요.">
      </label>
      <input type="button" value="완료" onclick="send()">
   </form>
</body>
<script>
   function send(){
      var form = document.joinForm;
      //console.log(form.userId.value); 
      //console.log(form.userId.value.length); 
      
      if(!form.userId.value || form.userId.value.length < 5){
         alert("아이디를 확인해주세요.");
         return;
      }
      
      form.submit();
   }
</script>
</html>