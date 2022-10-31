<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 두번째 실습</title>
</head>
<body>
<!-- 
   1단부터 100단까지 중 사용자에게 입력받은 단수로 구구단 출력하기
   입력받은 값이 정수인지 아닌지 판단, 값을 입력했는지 안했는지 판단.
   다른 페이지 이동 없이 현재 페이지에서만 기능 구현
   자바스크립트 사용가능
   구구단 출력은 JSTL로 구현
   입력은 form태그로 입력받는다.
 -->
      <form name='gugudan'>
         <input type="text" name="dan">
         <button type="button" onclick="send()">결과</button>
      </form>
      <c:if test="${not empty param.dan}">
         <c:choose>
            <c:when test="${param.dan > 0 and param.dan < 101}">
               <c:forEach var="i" begin="1" end="9">
                  <c:out value="${param.dan} * ${i} = ${param.dan * i}"/><br>
               </c:forEach>
            </c:when>
            <c:otherwise>
               <h3>1~100단까지만 가능합니다.</h3>
            </c:otherwise>
         </c:choose>
      </c:if>
</body>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
   $("input[name='dan']").keypress(function(e){
      // 입력 태그에서 엔터를 치면
      if(e.keyCode == 13){
         //유효성 검사 진행 후 submit() 진행
         send();
         //엔터 이벤트(submit)은 무조건 막아준다.
         e.preventDefault();
      }
   });
   
   function send(){
      var value = $("input[name='dan']").val();
      
      var check = value % 1 == 0;
      
      if(!check || !value){
         alert("다시 시도하세요.");
         return;
      }
      
      $("input[name='dan']").val(parseInt(value));
      gugudan.submit();
   }
</script>
</html>