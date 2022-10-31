<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ajax 테스트 - GET</title>
</head>
<body>
	<h1 id="result"></h1>
	<button onclick="send()"> 데이터 가져오기</button>
</body>
<script>
	function send(){
		var xhr = new XMLHttpRequest();
		//xhr.open("GET", "data.jsp"); //GET 방식으로 data.jsp파일의 바디를 사용하겠다는 것을 의미
		xhr.open("POST", "data.jsp");
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); // POST 에서는 send로 받을 타입을 설정해주어야 함
		xhr.send("msg1=반갑습니다&msg2=어서오세요"); //send가 요청임
		
		// 상태가 변경될 때마다 이 함수를 실행한다는 것을 의미
		xhr.onreadystatechange = function(){
			// 현재 상태가 DONE(요청한 데이터의 처리가 완료되어 응답할 준비가 완료됨)이 되었을 때 실행하겠다는 것을 의미
			// readyState: 현재 준비가 완료되었는가, status: 서버의 문서 상태 
			// status가 200이라는 것은 완료되었다는 것을 의미(404 : 서버에 문서가 존재하지 않음)
			if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
				document.getElementById("result").innerHTML = xhr.responseText; //data.jsp파일의 바디에 작성된 내용
			}
		}
	}
</script>
</html>