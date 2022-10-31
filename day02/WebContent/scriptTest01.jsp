<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트 태그 예제1</title>
</head>
<body>
<!-- 선언할 때 느낌표, 값은 =, javascript처럼 쓰려면 아무것도 없이 -->
	<h2>Scripting Tag</h2>
	<%!
		int count=3;
	
		String makeItBeLower(String data){
			return data.toLowerCase();
		}
	%>
	
	<% 
		for(int i =0; i<count;i++){
	%>
		<h3>Java Server Pages <%=i+1%> </h3>
	
	<%}%>
	
	<hr>
	<h3><%=makeItBeLower("Hello World") %></h3>
</body>
</html>