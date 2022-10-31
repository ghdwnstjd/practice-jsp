<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<!-- post 형식이며 클릭 시 joinOk.jsp로 넘어간다. joinOk.jsp로 넘어갔다는 것은 회원가입이 완료되어 DB에 저장을 하게 된다는 것을 의미한다. -->
   <form action="joinOk.jsp" name="joinForm" method="post">
      <label>
         아이디 <input type="text" name="userId" placeholder="5자 이상으로 작성해주세요.">
         <input type="button" value="중복검사" onclick="send()">
      </label>
      <p id="result">
      </p>
      <input type="submit" value="완료">
   </form>
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
//	check는 플래그로 사용된다.
   let check = true;
// userId 입력창에 focus가 가게되면 check가 자동으로 true가 되어 중복검사를 무조건 다시 진행하도록 한다.
   $("input[name='userId']").on("focus", function(){
      check = true;
   });
   
   $("input[type='submit']").on("click", function(e){
	   /* e.preventDefault()는 기본 이벤트 발생을 막는 메서드
	   	submit의 경우 클릭 시 창이 다시 시작되는데, 이를 막으면서 submit이 작동은 되게 해준다.
	   */
      e.preventDefault();
      if(check){
         alert("아이디 중복검사를 진행해주세요.");
         return;
      }
      joinForm.submit();
   });

   function send(){
      var $value = $("input[name='userId']").val();
      
      if(!$value || $value.length < 5){
         alert("아이디를 확인해주세요.");
         return;
      }
      
      /* ajax는 파라미터로 전달한다. */
      $.ajax({
         url: "checkId_ajax.jsp", //checkId_ajax.jsp 파일을 실행한다. 출력값은 true또는 false이다.
         type: "get",
         data: "userId=" + $value,
         contentType: "application/x-www-form-urlencoded",
         dataType: "text",
         success: function(result){
            result = result.trim();
            if(JSON.parse(result)){ //"true", "false"라는 문자열을 가져오기 때문에 boolean 타입으로 변경하면서 JSON에서 Object로 파싱이 필요하다.
               $("p#result").text("중복된 아이디입니다.");
               check = true; //여기서 flag를 true로 바꿔줬기 때문에 아이디 중복검사를 다시 하도록 만들 수 있다.
            }else{
               $("p#result").text("사용가능한 아이디입니다.");
               check = false;
            }
         },
         error: function(xhr, status, error){
            console.log(error);
         }
      });
      
   }
</script>
</html>
