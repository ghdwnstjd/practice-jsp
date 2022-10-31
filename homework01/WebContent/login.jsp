<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>로그인</h1>
<form action="loginOk.jsp" name="joinForm">
	<div>
	   <label>
	      아이디 <input type="text" name="userId" placeholder="5자 이상으로 작성해주세요.">
	   </label>
   </div>
   <div>
	   <label>
	      비밀번호 <input type="password" name="userPassword">
	   </label>
	</div>
   <input type="button" value="완료" onclick="send()">
</form>
<script>
function send(){
    var form = document.joinForm;
    //console.log(form.userPassword.value); 
    //console.log(form.userId.value.length); 
    
    if(!form.userId.value || form.userId.value.length < 5){
       alert("아이디를 확인해주세요.");
       return;
	    if(!form.userPassword.value){
	    	alert("비밀번호를 확인해주세요.");
	    	return;
	    }
    }
    
    form.submit();
 }

</script>
</body>
</html>