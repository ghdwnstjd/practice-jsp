<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String check = request.getParameter("check");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<!-- 로그인 페이지 구현 -->
<!-- 아이디만 입력받아서 검사 -->
   <section>
      <input type="hidden" value=<%=check%> name="check">
      <form action="loginOk.jsp" method="post">
         <label>
            아이디 <input type="text" name="userId">
         </label>
         <button>로그인</button>
      </form>
   </section>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
   var check = $("input[name='check']").val();
   if(check != "null" && check != null){
      alert("아이디 또는 비밀번호를 다시 확인해주세요.");
   }
</script>
</html>